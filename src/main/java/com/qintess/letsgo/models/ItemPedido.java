package com.qintess.letsgo.models;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;


@Entity
public class ItemPedido {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@OneToOne(optional = false)
	private Pedido pedido;
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "itemPedido")
	private List<Ingresso> ingressos = new ArrayList<>();
	@Column(nullable = false)
	private int quantidade;
	@Column(columnDefinition = "DECIMAL(10,2)")
	private double subTotal;
	
	//Cria ingressos
	public void geraIngressos(Evento evento, int quantidade) {
		for (int i = 1; i <= this.quantidade; i++) {
			Ingresso ingresso = new Ingresso();
			ingresso.setEvento(evento);
			ingresso.setItemPedido(this);
			this.ingressos.add(ingresso);
		}
	}
	
	public List<Ingresso> getIngressos() {
		return ingressos;
	}
	public void setIngressos(List<Ingresso> ingressos) {
		this.ingressos = ingressos;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Pedido getPedido() {
		return pedido;
	}
	public void setPedido(Pedido pedido) {
		this.pedido = pedido;
	}
	
	public int getQuantidade() {
		return quantidade;
	}
	public void setQuantidade(int quantidade) {
		this.quantidade = quantidade;
	}
	public double getSubTotal() {
		return subTotal;
	}
	//Lembrar de conferir isso aqui depois
	public void setSubTotal(double subTotal) {
		this.subTotal = subTotal;
	}
}
