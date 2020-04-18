package com.qintess.letsgo.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {

	@RequestMapping("")
	public String index() {
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
