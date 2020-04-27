package com.qintess.letsgo.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qintess.letsgo.models.Papel;
import com.qintess.letsgo.repos.PapelRepository;

@Service
public class PapelService {

	@Autowired
	PapelRepository papelRepository;
	
	public Papel buscarPorNome(String nome) {
		return papelRepository.findByNome(nome);
	}
	
}
