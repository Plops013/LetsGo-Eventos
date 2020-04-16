package com.qintess.letsgo.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;


@Entity
public class ItemPedido {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@ManyToOne(optional = false)
	private Pedido pedido;
	@ManyToOne(optional = false)
	private Ingresso ingresso;
	@Column(nullable = false)
	private int quantidade;
	@Column(columnDefinition = "DECIMAL(10,2)")
	private double subTotal;
	
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
	public Ingresso getIngresso() {
		return ingresso;
	}
	public void setIngresso(Ingresso ingresso) {
		this.ingresso = ingresso;
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
		calculaSubTotal();
	}
	public void calculaSubTotal() {
		this.subTotal = (this.ingresso.getEvento().getPreco() * this.quantidade);
	}
}
