package com.qintess.letsgo.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.qintess.letsgo.models.Evento;

@Controller
@RequestMapping("/evento")
public class EventoController {

	@RequestMapping("/")
	public String show() {
		return "/Evento/show";
	}

	@RequestMapping("/comprar")
	public String comprar() {
		return "/Evento/comprar";
	}

	@RequestMapping("/cadastrar")
	public String cadastrar(Model model) {
		model.addAttribute("evento", new Evento());
		return "/Evento/cadastrar";
	}

}
