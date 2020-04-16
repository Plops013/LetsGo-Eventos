package com.qintess.letsgo.controller;

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
	
}
