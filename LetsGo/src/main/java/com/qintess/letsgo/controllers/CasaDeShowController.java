package com.qintess.letsgo.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.qintess.letsgo.models.CasaDeShow;

@Controller
@RequestMapping("/CasaDeShow")
public class CasaDeShowController {

	@RequestMapping("/")
	public String show() {
		return "/CasaDeShow/index";
	}
	
	@RequestMapping("/cadastrar")
	public String cadastrar(Model model) {
		model.addAttribute("casaDeShow", new CasaDeShow());
		return "/CasaDeShow/cadastrar";
	}
	
}
