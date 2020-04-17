package com.qintess.letsgo.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
//import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.qintess.letsgo.models.Usuario;
import com.qintess.letsgo.repos.UsuarioRepository;

@Service
public class UsuarioService {

	@Autowired
	private UsuarioRepository usuarioRepos;
	
	public void insere(Usuario usuario) {
		usuarioRepos.save(usuario);
	}
	
	public Usuario buscaPorEmail(String email) {
		return usuarioRepos.findByEmail(email);
	}
	
	public List<Usuario> buscarTodos(){
		return usuarioRepos.findAll();
	}

}
