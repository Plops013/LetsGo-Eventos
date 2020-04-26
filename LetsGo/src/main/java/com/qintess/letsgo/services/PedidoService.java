package com.qintess.letsgo.services;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qintess.letsgo.models.Evento;
import com.qintess.letsgo.models.ItemPedido;
import com.qintess.letsgo.models.Pedido;
import com.qintess.letsgo.models.Usuario;
import com.qintess.letsgo.repos.PedidoRepository;

@Service
public class PedidoService {
	
	@Autowired
	PedidoRepository pedidoRepository;
		
	@Autowired
	EventoService eventoService;
	
	public List<Pedido> buscaPorUsuario(Usuario usuario){
		return pedidoRepository.findByUsuario(usuario);
	}
	
	public void criaPedido(Usuario usuario, Evento evento, int quantidade) {
		Pedido pedido = new Pedido();
		pedido.setDataCompra(LocalDateTime.now());
		pedido.setUsuario(usuario);
		pedido.setTotal(evento.getPreco() * quantidade);
		
		ItemPedido itemPedido = new ItemPedido();
		itemPedido.setQuantidade(quantidade);
		itemPedido.setPedido(pedido);
		itemPedido.geraIngressos(evento, quantidade);
		itemPedido.setSubTotal(evento.getPreco() * quantidade);
		pedido.addItem(itemPedido);
		
		evento.ingressosVendidos(quantidade);
		
		eventoService.insere(evento);
		this.insere(pedido);
		
	}
	
	public void insere(Pedido pedido) {
		pedidoRepository.save(pedido);
	}
	
	
}
