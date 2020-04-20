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
		ModelAndView mv = new ModelAndView("/Usuario/cadastrar");
		return mv;
	}

	@RequestMapping("/perfil")
	private ModelAndView meuPerfil(Model model, Usuario usuario) {
		usuario.setPapel(papelService.buscarPorNome("cliente"));
		ModelAndView mv = new ModelAndView("/Usuario/meu_perfil");
		return mv;
	}

	@RequestMapping("/login")
	public String login() {
		return "/Usuario/login";
	}

	@RequestMapping("/salva")
	public ModelAndView salva(Model model, @Valid Usuario usuario, 
			BindingResult result, RedirectAttributes redirectAtt, HttpServletRequest req,
			@RequestParam(value = "checkBoxTermos", required = false) boolean checkBoxTermos,
			@RequestParam(value = "radioPapel") String nomePapel){

		ModelAndView mv = new ModelAndView("redirect:/usuario/cadastrar");
		try {
			if(!checkBoxTermos) {
				model.addAttribute("mensagemErro", "Você deve concordar com os termos de uso!");
				return cadastrar(usuario, model);
			} 
			if(result.hasErrors()) {
				return cadastrar(usuario, model);
			} 
			if(usuarioService.buscarTodos()
					.stream()
					.anyMatch(u -> u.getEmail().equals(usuario.getEmail()))) 
			{
				model.addAttribute("mensagemErro", "Email ja cadastrado!");
				return cadastrar(usuario, model);
			} 

			Papel papelUsuario = papelService.buscarPorNome(nomePapel);
			usuario.setPapel(papelUsuario);
			usuarioService.insere(usuario);

		} catch (Exception e) {
			e.printStackTrace();
		}
		redirectAtt.addFlashAttribute("mensagemSucesso", "Usuario cadastrado com sucesso!");
		return mv;
	}
}
