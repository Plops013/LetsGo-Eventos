package com.qintess.letsgo.repos;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.qintess.letsgo.models.CasaDeShow;
import com.qintess.letsgo.models.Evento;

public interface EventoRepository extends JpaRepository<Evento, Integer>{

	public List<Evento> findByCasaDeShow(CasaDeShow casaDeShow);
	
	
}
