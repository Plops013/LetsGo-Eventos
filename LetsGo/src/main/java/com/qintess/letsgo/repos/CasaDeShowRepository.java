package com.qintess.letsgo.repos;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.qintess.letsgo.models.CasaDeShow;
import com.qintess.letsgo.models.Usuario;

public interface CasaDeShowRepository extends JpaRepository<CasaDeShow, Integer>{
	
	public List<CasaDeShow> findByUsuario(Usuario usuario);

}
