package com.qintess.letsgo.models;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Pedido {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@ManyToOne(optional = false)
	private Usuario usuario;
	@Column(columnDefinition = "DECIMAL(10,2)")
	private Double total = 0D;
	@Column(nullable = false)
	private LocalDateTime dataCompra;
	@OneToMany(fetch = FetchType.EAGER, mappedBy = "pedido")
	private List<ItemPedido> items = new ArrayList<>();
	
	public void addItem(ItemPedido item) {
		this.items.add(item);
		this.total += item.getSubTotal();
	}
	
	public void removeItem(ItemPedido item) {
		this.items.remove(item);
		this.total -= item.getSubTotal();
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Usuario getUsuario() {
		return usuario;
	}
	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}
	public Double getTotal() {
		return total;
	}
	public void setTotal(Double total) {
		this.total = total;
	}
	public LocalDateTime getDataCompra() {
		return dataCompra;
	}
	public void setDataCompra(LocalDateTime dataCompra) {
		this.dataCompra = dataCompra;
	}
}
