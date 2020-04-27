package com.qintess.letsgo.controllers;


import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.WebAuthenticationDetails;
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
import com.qintess.letsgo.services.PedidoService;
import com.qintess.letsgo.services.UsuarioService;

@Controller
@RequestMapping("/usuario")
public class UsuarioController {

	@Autowired
	UsuarioService usuarioService;
	@Autowired
	PapelService papelService;
	@Autowired
	PedidoService pedidoService;
	@Autowired
	private AuthenticationManager authenticationManager;

	@RequestMapping("/pedidos")
	public ModelAndView verPedidos() {
		ModelAndView mv = new ModelAndView("/Usuario/pedidos");
		Usuario usuario = usuarioService.buscaPorEmail(SecurityContextHolder.getContext().getAuthentication().getName());
		mv.addObject("pedidos", pedidoService.buscaPorUsuario(usuario));
		return mv;
	}
	
	@RequestMapping("/cadastrar")
	public ModelAndView cadastrar(Usuario usuario, Model model) {
		ModelAndView mv = new ModelAndView("/Usuario/cadastrar");
		return mv;
	}

	@RequestMapping("/login")
	public String login(Model model) {
		return "/Usuario/login";
	}
	
	@RequestMapping("/login-error")
	public String loginError(Model model, @RequestParam(required = false, value = "username") String email) {
		model.addAttribute("mensagemErro", "Usuario ou senha invalidos");
		return login(model);
	}
	
	@RequestMapping("/perfil")
	private ModelAndView perfil(Model model, Usuario usuario) {
		ModelAndView mv = new ModelAndView("/Usuario/meu_perfil");
		if(usuario.getNome() == null) {
			usuario = usuarioService.buscaPorEmail(SecurityContextHolder.getContext().getAuthentication().getName());
			usuario.setSenha("");
			model.addAttribute("usuario", usuario);
			return mv;
		} else {
			return mv;
		}
	}

	@RequestMapping("/alterar")
	public ModelAndView alterar(Model model, @Valid Usuario usuario, 
			BindingResult result, RedirectAttributes redirectAtt){
		ModelAndView mv = new ModelAndView("redirect:/usuario/perfil");
		if(result.hasErrors()) {
			return perfil(model, usuario);
		}
		try {
		PasswordEncoder passEncoder = new BCryptPasswordEncoder();
		String hashedPass = passEncoder.encode(usuario.getSenha());
		usuario.setSenha(hashedPass);
	    usuarioService.insere(usuario);
		} 
	    catch (Exception e) {
			model.addAttribute("mensagemErro", e.getMessage());
			return perfil(model, usuario);
		}
		redirectAtt.addFlashAttribute("mensagemSucesso", "Usuario alterado com sucesso!");
		return mv;
	}
	
	@RequestMapping("/salva")
	public ModelAndView salva(Model model, @Valid Usuario usuario, 
			BindingResult result, RedirectAttributes redirectAtt,
			@RequestParam(value = "checkBoxTermos", required = false) boolean checkBoxTermos,
			@RequestParam(value = "radioPapel") String nomePapel,
			HttpServletRequest req){

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
			String senhaOriginal = usuario.getSenha();
			PasswordEncoder passEncoder = new BCryptPasswordEncoder();
			String hashedPass = passEncoder.encode(usuario.getSenha());
			usuario.setSenha(hashedPass);
		    usuarioService.insere(usuario);
			
			UsernamePasswordAuthenticationToken authToken = new UsernamePasswordAuthenticationToken(usuario.getEmail(), senhaOriginal);
			authToken.setDetails(new WebAuthenticationDetails(req));
			Authentication authentication = authenticationManager.authenticate(authToken);
			SecurityContextHolder.getContext().setAuthentication(authentication);

		    redirectAtt.addFlashAttribute("mensagemSucesso", "Usuario cadastrado com sucesso!");

		} catch (Exception e) {
			e.printStackTrace();
			 redirectAtt.addFlashAttribute("mensagemErro", e.getMessage());
			 return mv;
		}
		return mv;
	}
}
