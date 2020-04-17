package com.qintess.letsgo.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/evento")
public class EventoController {

	@RequestMapping("/")
	public String show() {
		return "/evento/show";
	}
	
	@RequestMapping("/comprar")
	public String comprar() {
		return "/evento/comprar";
	}
	
}
