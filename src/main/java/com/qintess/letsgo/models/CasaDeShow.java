package com.qintess.letsgo.models;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Base64;
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
import javax.persistence.Transient;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;

@Entity
public class CasaDeShow {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column(nullable = false, length = 60) @Length(max = 60, message = "Tamanho maximo permitido de 60 caracteres") 
	@NotEmpty(message = "Nome é obrigatório")
	private String nome;
	@Column(nullable = false, length = 100)
	@Length(max = 8, message = "Tamanho maximo do cep deve se 8 digitos. Não coloque traços")
	@NotEmpty(message = "CEP é obrigatório")
	private String cep;
	@Column(nullable = false, length = 100) @Length(max = 100) 
	@NotEmpty(message = "Endereço é obrigatório")
	private String endereco;
	@Column(nullable = false, length = 45) @Length(max = 45) 
	@NotEmpty(message = "Numero é obrigatório")
	private String numero;
	@Column(nullable = false, length = 45) @Length(max = 45) 
	@NotEmpty(message = "Cidade é obrigatória")
	private String cidade;
	@Column(nullable = false) 
	@Length(max = 2, message = "Tipo de estado invalido, use apenas siglas.") 
	@NotEmpty(message = "Estado é obrigatório")
	public String estado;
	@Column(nullable = false) @Min(value = 50, message = "Sua casa de show deve comportar ao menos 50 pessoas")
	@NotNull(message = "Capacidade é obrigatório")
	private int capacidade;
	private byte[] imagemCasaDeShow;
	@Transient
	private String imagemEncoded;
	@ManyToOne(optional = false)
	private Usuario usuario;
	@OneToMany(mappedBy = "casaDeShow", fetch = FetchType.EAGER, cascade = CascadeType.REMOVE)
	private List<Evento> eventos = new ArrayList<>();
	
	public String getImagemEncoded() {
		try {
			String base64Encoded;
			byte[] encodeBase64 = Base64.getEncoder().encode(this.imagemCasaDeShow);
			base64Encoded = new String(encodeBase64, "UTF-8");
			this.imagemEncoded = base64Encoded;
			return imagemEncoded;
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public String getCep() {
		return cep;
	}



	public void setCep(String cep) {
		this.cep = cep;
	}



	public String getNumero() {
		return numero;
	}



	public void setNumero(String numero) {
		this.numero = numero;
	}



	public void setImagemEncoded(String imagemEncoded) {
		this.imagemEncoded = imagemEncoded;
	}
	
	public byte[] getImagemCasaDeShow() {
		return imagemCasaDeShow;
	}

	public void setImagemCasaDeShow(byte[] imagemCasaDeShow) {
		this.imagemCasaDeShow = imagemCasaDeShow;
	}

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
