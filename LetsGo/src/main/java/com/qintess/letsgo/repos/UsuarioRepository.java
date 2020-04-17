package com.qintess.letsgo.repos;

import org.springframework.data.jpa.repository.JpaRepository;

import com.qintess.letsgo.models.Usuario;

public interface UsuarioRepository extends JpaRepository<Usuario, Integer>{

	public Usuario findByEmail(String email);
	
}
