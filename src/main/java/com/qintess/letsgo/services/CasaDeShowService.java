package com.qintess.letsgo.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qintess.letsgo.models.CasaDeShow;
import com.qintess.letsgo.models.Usuario;
import com.qintess.letsgo.repos.CasaDeShowRepository;

@Service
public class CasaDeShowService{

	@Autowired
	CasaDeShowRepository casaDeShowRepository;
	
	public void insere(CasaDeShow casaDeShow) {
		casaDeShowRepository.save(casaDeShow);
	}
	
	public List<CasaDeShow> buscarTodos() {
		return casaDeShowRepository.findAll();
	}
	
	public void deleta(Integer id) {
		casaDeShowRepository.deleteById(id);
	}
	
	public List<CasaDeShow> buscaPorUsuario(Usuario usuario){
		return casaDeShowRepository.findByUsuario(usuario);
	}
	
	public CasaDeShow buscarPorId(Integer id) {
		return casaDeShowRepository.findById(id).orElse(new CasaDeShow());
	}
	
}
