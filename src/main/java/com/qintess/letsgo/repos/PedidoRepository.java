package com.qintess.letsgo.repos;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.qintess.letsgo.models.Pedido;
import com.qintess.letsgo.models.Usuario;

public interface PedidoRepository extends JpaRepository<Pedido, Integer> {

	public List<Pedido> findByUsuario(Usuario usuario);
	
}
