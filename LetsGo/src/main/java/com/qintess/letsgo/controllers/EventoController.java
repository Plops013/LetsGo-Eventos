package com.qintess.letsgo.controllers;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.qintess.letsgo.models.CasaDeShow;
import com.qintess.letsgo.models.Evento;
import com.qintess.letsgo.models.Usuario;
import com.qintess.letsgo.services.CasaDeShowService;
import com.qintess.letsgo.services.EventoService;
import com.qintess.letsgo.services.PedidoService;
import com.qintess.letsgo.services.UsuarioService;

@Controller
@RequestMapping("/evento")
public class EventoController {

	@Autowired
	CasaDeShowService casaDeShowService;
	@Autowired
	UsuarioService usuarioService;
	@Autowired
	EventoService eventoService;
	@Autowired
	PedidoService pedidoService;
	
	@RequestMapping("/{id}")
	public ModelAndView show(@PathVariable(name = "id")int id,
						Evento evento) {
		ModelAndView mv = new ModelAndView("/Evento/show");
		evento = eventoService.buscarPorId(id);
		mv.addObject(evento);
		return mv;
	}
	
	@RequestMapping("/finalizar")
	public ModelAndView finalizar(
			@RequestParam(value = "idEvento") int idEvento,
			@RequestParam(value = "quantidade") int quantidade, Model model,
			RedirectAttributes redirectAttributes) {
		ModelAndView mv = new ModelAndView("redirec:/usuario/ingressos");
		Evento evento = eventoService.buscarPorId(idEvento);
		Usuario usuario = usuarioService.buscaPorEmail(SecurityContextHolder.getContext().getAuthentication().getName());
		if( quantidade > 4) {
			model.addAttribute("mensagemErro", "Não tente burlar nossos sistemas, a quantidade máxima são 4 ingressos por pessoa!!!");
			return comprar(idEvento, model);
		}	
		pedidoService.criaPedido(usuario, evento, quantidade);
		redirectAttributes.addFlashAttribute("mensagemSucesso", "Ingressos Comprados Com Sucesso!");
		return mv;
	}
	
	@RequestMapping("/comprar/{id}")
	public ModelAndView comprar(@PathVariable(name= "id") int id, Model model){
		ModelAndView mv = new ModelAndView("/Evento/comprar");
		Evento evento = eventoService.buscarPorId(id);
		model.addAttribute("evento", evento);
		return mv;
	}
	
	@RequestMapping("alterar/{id}")
	public ModelAndView alterar(@PathVariable(name = "id")int id,
								Evento evento,
								Model model) {
		evento = eventoService.buscarPorId(id);
		model.addAttribute("evento", evento);
		return cadastrar(evento, model);
	}
	
	@RequestMapping("deletar/{id}")
	public String deletar(@PathVariable(name = "id")int id,
						  RedirectAttributes redirectAttributes){
		try {
			eventoService.deleta(id);
			redirectAttributes.addFlashAttribute("mensagemExclusao", "Evento excluido! ");
		} catch (Exception e) {
			redirectAttributes.addFlashAttribute("mensagemExclusaoErro", "Ops! houve um erro ao excluir esse Evento.");
			e.printStackTrace();
		}
			return "redirect:/evento/cadastrar";
	}
	
	
	@RequestMapping("/comprar")
	public String comprar() {
		return "/Evento/comprar";
	}

	@RequestMapping("/cadastrar")
	public ModelAndView cadastrar(Evento evento, Model model) {
		ModelAndView mv = new ModelAndView("/Evento/cadastrar");
		mv.addObject("eventos", eventosPorUsuario());
		mv.addObject("casasDeShow", casaDeShowPorUsuario());
		return mv;
	}
	
	@RequestMapping("/salvar")
	public ModelAndView salvar(@Valid Evento evento, 
							   BindingResult result,
							   @RequestParam(required = true, value="imagem") MultipartFile imagem,
							   @RequestParam(required = true, value="casaDeShow") int id,
							   Model model) {
		CasaDeShow casaDeShowEvento = casaDeShowService.buscarPorId(id);
		if(evento.getDataInicio().isBefore(LocalDateTime.now())
			|| evento.getDataInicio().isAfter(evento.getDataFim())) {
			model.addAttribute("mensagemErro", "Por favor digite uma data valida");
			return cadastrar(evento, model);
		}
		if(evento.getQuantidadeIngressosInicial() > casaDeShowEvento.getCapacidade()) {
			//aqui caso capacidade seja menor que quantidade de ingressos
			model.addAttribute("mensagemErro", "Seu evento não pode exceder a capacidade da sua casa de show: " 
			+ casaDeShowEvento.getNome() + ", com capacidade maxima de: " + casaDeShowEvento.getCapacidade());
			return cadastrar(evento, model);
		}
		if(result.hasErrors()) {
			return cadastrar(evento, model);
		}
		try {
			if(imagem.getSize() > 0) {
			evento.setImagemEvento(imagem.getBytes());
			} else if(evento.getId() == 0) {
				model.addAttribute("mensagemErro", "Foto é obrigatório");
				return cadastrar(evento,model);
			}
			evento.setQuantidadeIngressos(evento.getQuantidadeIngressosInicial());
			evento.setCasaDeShow(casaDeShowEvento);
			eventoService.insere(evento);
			model.addAttribute("mensagemSucesso", "Evento Cadastrado Com Sucesso!");
			return new ModelAndView("redirect:/evento/cadastrar");
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("mensagemErro", e.getMessage() + " " + e.getCause());
			return cadastrar(evento, model);
		}
	}
	
	private List<CasaDeShow> casaDeShowPorUsuario(/*Usuario usuario*/) {
		Usuario usuario = new Usuario();
		usuario.setEmail(SecurityContextHolder.getContext().getAuthentication().getName());
		return casaDeShowService.buscaPorUsuario(usuarioService.buscaPorEmail(usuario.getEmail()));
	}
	
	private List<Evento> eventosPorUsuario(){
		List<Evento> eventosUsuario = new ArrayList<>();
		try {
			for (CasaDeShow casaDeShow : casaDeShowPorUsuario()) {
				eventosUsuario.addAll(eventoService.buscarPorCasaDeShow(casaDeShow));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return eventosUsuario;
	}
	
}
