package com.qintess.letsgo.models;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Transient;

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
	@OneToOne(cascade = CascadeType.ALL,fetch = FetchType.EAGER, mappedBy = "pedido")
	private ItemPedido item;
	@Transient
	private String dataString;
	
	public String getDataString() {
		try {
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yy HH:mm");
			String inicioFormatado = dataCompra.format(formatter);
			String retorno = inicioFormatado;
			return retorno;
		} catch(Exception e) {
			e.printStackTrace();
			return "erro na conversão da data";
		}
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
	public ItemPedido getItem() {
		return item;
	}
	public void setItem(ItemPedido item) {
		this.item = item;
	}
}
