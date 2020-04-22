package com.qintess.letsgo.controllers;

import javax.servlet.http.HttpServletRequest;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CustomErrorController implements ErrorController {

  @RequestMapping("/error")
  public ModelAndView handleError(HttpServletRequest request, Model model) {
	  ModelAndView mv = new ModelAndView("/Erro/erro");
      Integer statusCode = (Integer) request.getAttribute("javax.servlet.error.status_code");
      Exception exception = (Exception) request.getAttribute("javax.servlet.error.exception");
      model.addAttribute("erroCodigo", statusCode);
      if (statusCode == 404) {
    	   model.addAttribute("erroMensagem", "Ops! Pagina não encontrada!");
      } else {
    	   model.addAttribute("erroMensagem", exception==null? "N/A": exception.getMessage());
      }
      return mv;
  }

  @Override
  public String getErrorPath() {
      return "/error";
  }
}