package com.qintess.letsgo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.qintess.letsgo.model.Usuario;

@Controller
public class UsuarioController {

	@RequestMapping("/login")
	public String login() {
		return "/usuario/login";
	}

	@RequestMapping("/usuario/cadastrar")
	public String cadastrar(Model model) {
		model.addAttribute("usuario", new Usuario());
		return "/usuario/cadastrar";
	}
	
	@RequestMapping("/usuario/termos")
	public String termos() {
		return "usuario/termos_de_uso";
	}
}
