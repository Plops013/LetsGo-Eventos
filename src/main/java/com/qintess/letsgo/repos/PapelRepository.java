package com.qintess.letsgo.repos;

import org.springframework.data.jpa.repository.JpaRepository;

import com.qintess.letsgo.models.Papel;

public interface PapelRepository extends JpaRepository<Papel, Integer>{

	public Papel findByNome(String nome);
	
}
