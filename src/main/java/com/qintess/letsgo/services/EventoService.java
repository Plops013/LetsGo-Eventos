package com.qintess.letsgo.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qintess.letsgo.models.CasaDeShow;
import com.qintess.letsgo.models.Evento;
import com.qintess.letsgo.repos.EventoRepository;

@Service
public class EventoService {

	@Autowired
	EventoRepository eventoRepository;
	
	public void insere(Evento evento) {
		eventoRepository.save(evento);
	}
	
	public void deleta(Integer id) {
		eventoRepository.deleteById(id);
	}
	
	public List<Evento> buscarPorCasaDeShow(CasaDeShow casaDeShow){
		return eventoRepository.findByCasaDeShow(casaDeShow);
	}
	
	public Evento buscarPorId(Integer id) {
		return eventoRepository.findById(id).orElse(new Evento());
	}
	
	public List<Evento> buscarTodos(){
		return eventoRepository.findAll();
	}
	
}
