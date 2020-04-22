package com.qintess.letsgo.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.core.userdetails.User.UserBuilder;
import org.springframework.stereotype.Service;

import com.qintess.letsgo.models.Usuario;

@Service
public class UsuarioLoginService implements UserDetailsService {

	@Autowired
	private UsuarioService usuarioService;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		Usuario usuario = null;
		UserBuilder builder = null;
		try {
			usuario = usuarioService.buscaPorEmail(username);
			if(usuario != null) {
				builder = User.withUsername(username);
				builder.password(usuario.getSenha());
				String papel = usuario.getPapel().getNome();
				builder.roles(papel);
				}
		} catch (Exception e) {
			throw new UsernameNotFoundException("Usu�rio n�o encontrado!");
		}
		return builder.build();
	}

}