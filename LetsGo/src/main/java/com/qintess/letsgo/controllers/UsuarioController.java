package com.qintess.letsgo.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.qintess.letsgo.models.Papel;
import com.qintess.letsgo.models.Usuario;
import com.qintess.letsgo.services.PapelService;
import com.qintess.letsgo.services.UsuarioService;

@Controller
@RequestMapping("/usuario")
public class UsuarioController {
	
	@Autowired
	UsuarioService usuarioService;
	@Autowired
	PapelService papelService;

	@RequestMapping("/cadastrar")
	public ModelAndView cadastrar(Usuario usuario, Model model) {
		ModelAndView mv = new ModelAndView("/usuario/cadastrar");
		return mv;
	}

	@RequestMapping("/perfil")
	private ModelAndView meuPerfil(Model model, Usuario usuario) {
		usuario.setPapel(papelService.buscarPorNome("cliente"));
		ModelAndView mv = new ModelAndView("/usuario/meu_perfil");
		return mv;
	}
	
	@RequestMapping("/salva")
	public ModelAndView salva(Model model, @Valid Usuario usuario, 
			BindingResult result, RedirectAttributes redirectAtt, HttpServletRequest req,
			@RequestParam(value = "checkBoxTermos", required = false) boolean checkBoxValue,
			@RequestParam(value = "radioPapel") String nomePapel){
		
		ModelAndView mv = new ModelAndView("redirect:/usuario/cadastrar");
		try {
			//Verifica Se o Usuario Concorda com os Termos
			if(!checkBoxValue) {
				model.addAttribute("mensagemErro", "Você deve concordar com os termos de uso");
				return cadastrar(usuario, model);
			} 
			if(usuario.getEmail() == "") {
				model.addAttribute("mensagemErro", "Seu email não pode ser nulo");
				return cadastrar(usuario, model);
			}
			if(result.hasErrors()) {
				System.out.println(result.getErrorCount());
				System.out.println(result);
				return cadastrar(usuario, model);
			}
			//Verifica o Papel Do Usuario
			Papel papelUsuario = papelService.buscarPorNome(nomePapel);
			usuario.setPapel(papelUsuario);
			
			usuarioService.insere(usuario);
			//Captura qualquer possivel erro
		} catch (Exception e) {
			model.addAttribute("usuario", usuario);
			model.addAttribute("mensagemErro", e.getMessage());
		}
		redirectAtt.addFlashAttribute("mensagemSucesso", "Usuario cadastrado com sucesso!");
		return mv;
	}
}
