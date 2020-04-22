package com.qintess.letsgo.controllers;

import java.io.IOException;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
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
import com.qintess.letsgo.services.CasaDeShowService;
import com.qintess.letsgo.services.UsuarioService;

@Controller
@RequestMapping("/CasaDeShow")
public class CasaDeShowController {

	@Autowired
	CasaDeShowService casaDeShowService;
	@Autowired
	UsuarioService usuarioService;
	
	@RequestMapping("/{id}")
	public ModelAndView show(@PathVariable(name="id") int id, CasaDeShow casaDeShow) {
		ModelAndView mv = new ModelAndView("/CasaDeShow/index");
		casaDeShow = casaDeShowService.buscarPorId(id);
		mv.addObject(casaDeShow);
		return mv;
	}
	
	@RequestMapping("/cadastrar")
	public ModelAndView cadastrar(Model model, CasaDeShow casaDeShow) {
		ModelAndView mv = new ModelAndView("/CasaDeShow/cadastrar");
		List<CasaDeShow> casasDeShow = casaDeShowService.buscarTodos();
		model.addAttribute("casasDeShow", casasDeShow);
		return mv;
	}
	
	@RequestMapping("/salvar")
	public ModelAndView salvar(Model model,
							   @Valid CasaDeShow casaDeShow,
							   BindingResult result,
							   @RequestParam(required = false, value="imagem") MultipartFile imagem) {
		ModelAndView mv = new ModelAndView("redirect:cadastrar");
		try {
			System.out.println(casaDeShow.getUsuario().getNome());
			if(result.hasErrors()) {
				return cadastrar(model, casaDeShow);
			} 
			if(imagem.getSize() > 0) {
			casaDeShow.setImagemCasaDeShow(imagem.getBytes());
			}
			if(casaDeShow.getId() == 0) {
				//Substituir aqui após fazer funcionar o security
				casaDeShow.setUsuario(usuarioService.buscaPorEmail("binhopecora@gmail.com"));
				casaDeShowService.insere(casaDeShow);
				model.addAttribute("mensagemSucesso", "Casa De Show Cadastrada Com Sucesso!");
			} else {
				casaDeShowService.insere(casaDeShow);
				model.addAttribute("mensagemSucesso", "Casa De Show Atualizada Com Sucesso");	
			}
			
		} catch (IOException e) {
			model.addAttribute("mensagemErro", e.getMessage());
			e.printStackTrace();
		}
		return mv;
	}
	
	@RequestMapping("/alterar/{id}")
	public ModelAndView alterar(@PathVariable(name="id") int id,Model model,CasaDeShow casaDeShow, RedirectAttributes redirectAttributes) {
		casaDeShow = casaDeShowService.buscarPorId(id);
		model.addAttribute("casaDeShow", casaDeShow);
		if(casaDeShow.getId() != 0) {
			return cadastrar(model, casaDeShow);
		} else {
			redirectAttributes.addAttribute("mensagemErro", "Erro ao atualizar, não existe Casa De Show com esse id");
			ModelAndView mv = new ModelAndView("redirect:cadastrar");
			return mv;
		}
	}
	
	
	@RequestMapping("/deletar/{id}")
	public String deletar( @PathVariable(name="id") int id,RedirectAttributes redirectAttributes) {
		try {
			casaDeShowService.deleta(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		redirectAttributes.addFlashAttribute("mensagemExclusão", "Produto Excluido! ");
		return "redirect:/CasaDeShow/cadastrar";
	}
	
}
