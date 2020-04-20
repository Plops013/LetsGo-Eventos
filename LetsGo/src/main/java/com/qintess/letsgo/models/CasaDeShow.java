package com.qintess.letsgo.models;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.validation.constraints.NotEmpty;

import org.hibernate.validator.constraints.Length;

@Entity
public class CasaDeShow {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column(nullable = false, length = 60) @Length(max = 60) @NotEmpty
	private String nome;
	@Column(nullable = false, length = 100) @Length(max = 100) @NotEmpty
	private String endereco;
	@Column(nullable = false, length = 45) @Length(max = 45) @NotEmpty
	private String cidade;
	@Column(nullable = false) @Length(max = 2) @NotEmpty
	public String estado;
	@Column(nullable = false) @NotEmpty
	private int capacidade;
	@ManyToOne(optional = false)
	private Usuario usuario;
	@OneToMany(mappedBy = "casaDeShow", fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	private List<Evento> eventos = new ArrayList<>();
	
	public void addEvento(Evento evento) {
		eventos.add(evento);
	}
	
	public void removeEvento(Evento evento) throws Exception {
		if(evento.getQuantidadeIngressos() == evento.getQuantidadeIngressosInicial()) {
			eventos.remove(evento);
		} else {
			throw new Exception("Não é permitido excluir evento que tenham ingressos vendidos");
		}
	}
	
	public List<Evento> getEventos() {
		return eventos;
	}
	public void setEventos(List<Evento> eventos) {
		this.eventos = eventos;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getEndereco() {
		return endereco;
	}
	public void setEndereco(String endereco) {
		this.endereco = endereco;
	}
	public String getCidade() {
		return cidade;
	}
	public void setCidade(String cidade) {
		this.cidade = cidade;
	}
	public int getCapacidade() {
		return capacidade;
	}
	public void setCapacidade(int capacidade) {
		this.capacidade = capacidade;
	}
	public Usuario getUsuario() {
		return usuario;
	}
	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}
	
}
