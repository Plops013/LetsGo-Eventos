package com.qintess.letsgo.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.qintess.letsgo.services.EventoService;

@Controller
public class IndexController {

	@Autowired
	EventoService eventoService;
	
	@RequestMapping("")
	public String index(Model model) {
		model.addAttribute("eventos", eventoService.buscarTodos());
		return "index";
	}

	@RequestMapping("/nav")
	public String nav() {
		return "/fragments/nav";
	}
	
	//Aqui fica o texto dos termos de uso.
	@RequestMapping("/usuario/termos")
	public String termos() {
		return "Usuario/termos_de_uso";
	}
	
}
