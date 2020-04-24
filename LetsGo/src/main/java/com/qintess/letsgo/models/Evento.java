package com.qintess.letsgo.models;

import java.io.UnsupportedEncodingException;
import java.text.DecimalFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Base64;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Transient;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
public class Evento {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column(nullable = false ,length = 70)
	@NotEmpty(message = "Nome é obrigatório") @Length(max = 70, message = "O nome deve conter no maximo 70 caracteres")
	private String nome;
	@Column(nullable = false, columnDefinition = "TEXT")
	@NotEmpty (message = "Descrição é obrigatório")
	private String descricao;
	@NotNull(message = "Data Inicio é obrigatório")
	@DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME)
	private LocalDateTime dataInicio;
	@NotNull(message = "Data Fim é obrigatório")
	@DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME)
	private LocalDateTime dataFim;
	@Column(nullable = false)
	private int quantidadeIngressos;
	@Column(nullable = false)
	@NotNull(message = "Quantidade de Ingressos é obrigatória")
	private int quantidadeIngressosInicial;	
	@Column(nullable = false, columnDefinition = "DECIMAL(10,2)")
	@NotNull
	private double preco;
	@ManyToOne
	private CasaDeShow casaDeShow;
	@Transient
	private String imagemEncoded;
	@Transient 
	private String dataString;
	@Transient
	private int IngressosVendidos;
	private byte[] imagemEvento;

	public int getIngressosVendidos() {
		return quantidadeIngressosInicial - quantidadeIngressos;
	}

	public void ingressosVendidos(int quantidade) {
		this.quantidadeIngressos -= quantidade;
	}
	
	public String getDataString() {
		try {
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yy HH:mm");
			String inicioFormatado = dataInicio.format(formatter);
			String fimFormatado = dataFim.format(formatter);
			String retorno = inicioFormatado + " ~ " + fimFormatado;
			return retorno;
		} catch(Exception e) {
			e.printStackTrace();
			return "erro na conversão da data";
		}
	}

	public String getImagemEncoded() {
		try {
			String base64Encoded;
			byte[] encodeBase64 = Base64.getEncoder().encode(this.imagemEvento);
			base64Encoded = new String(encodeBase64, "UTF-8");
			this.imagemEncoded = base64Encoded;
			return imagemEncoded;
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return null;
		}
	}
	public byte[] getImagemEvento() {
		return imagemEvento;
	}
	public void setImagemEvento(byte[] imagemEvento) {
		this.imagemEvento = imagemEvento;
	}
	public void setImagemEncoded(String imagemEncoded) {
		this.imagemEncoded = imagemEncoded;
	}
	public int getQuantidadeIngressosInicial() {
		return quantidadeIngressosInicial;
	}
	public void setQuantidadeIngressosInicial(int quantidadeIngressosInicial) {
		this.quantidadeIngressosInicial = quantidadeIngressosInicial;
	}
	public double getPreco() {
		return preco;
	}

	public String getPrecoFormat() {
		DecimalFormat df = new DecimalFormat("###0.00");
		return df.format(preco);
	}

	public void setPreco(double preco) {
		this.preco = preco;
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
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	public LocalDateTime getDataInicio() {
		return dataInicio;
	}
	public void setDataInicio(LocalDateTime dataInicio) {
		this.dataInicio = dataInicio;
	}
	public LocalDateTime getDataFim() {
		return dataFim;
	}
	public void setDataFim(LocalDateTime dataFim) {
		this.dataFim = dataFim;
	}
	public int getQuantidadeIngressos() {
		return quantidadeIngressos;
	}
	public void setQuantidadeIngressos(int quantidadeIngressos) {
		this.quantidadeIngressos = quantidadeIngressos;
	}
	public CasaDeShow getCasaDeShow() {
		return casaDeShow;
	}
	public void setCasaDeShow(CasaDeShow casaDeShow) {
		this.casaDeShow = casaDeShow;
	}

}
