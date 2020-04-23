package com.qintess.letsgo.models;

import java.time.LocalDate;
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
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;

import org.hibernate.validator.constraints.Length;

@Entity
public class Usuario {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column(nullable = false, length = 50)
	@NotEmpty(message = "Nome é obrigatório")
	private String nome;
	@Column(nullable = false, length = 70)
	@NotEmpty(message = "Sobrenome é obrigatório")
	private String sobrenome;
	@NotEmpty(message = "Seu email nao pode ser nulo") @Email
	@Column(nullable = false, length = 100, unique = true)
	private String email = "";
	@Column(nullable = false, length = 15)
	private String telefone;
	@NotEmpty(message = "Campo senha é obrigatório")
	@Length(min = 6, message = "Sua senha deve conter entre 6 e 16 caracteres")
	@Column(nullable = false, length = 160)
	private String senha;
	@Column
	private LocalDate dataNascimento;
	@ManyToOne
	private Papel papel;
	@OneToMany(mappedBy = "usuario", cascade = {CascadeType.MERGE, CascadeType.PERSIST, CascadeType.REMOVE})
	private List<CasaDeShow> casasDeShow = new ArrayList<CasaDeShow>();
	
	public void addCasaDeShow(CasaDeShow casaDeShow) throws Exception {
		if(papel.getNome() == "organizador") {
		casasDeShow.add(casaDeShow);
		casaDeShow.setUsuario(this);
		} else {
			throw new Exception("Apenas organizadores podem criar casas de show");
		}
	}
	
	public void removeCasaDeShow(CasaDeShow casaDeShow) throws Exception {
		if(papel.getNome() == "organizador" && casaDeShow.getEventos().size() == 0) {
		casasDeShow.remove(casaDeShow);
		casaDeShow.setUsuario(this);
		} else {
			throw new Exception("Apenas organizadores podem criar casas de show");
		}
	}
	
	public Papel getPapel() {
		return papel;
	}

	public void setPapel(Papel papel) {
		this.papel = papel;
	}

	public List<CasaDeShow> getCasasDeShow() {
		return casasDeShow;
	}

	public void setCasasDeShow(List<CasaDeShow> casasDeShow) {
		this.casasDeShow = casasDeShow;
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
	public String getSobrenome() {
		return sobrenome;
	}
	public void setSobrenome(String sobrenome) {
		this.sobrenome = sobrenome;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTelefone() {
		return telefone;
	}
	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}
	public String getSenha() {
		return senha;
	}
	public void setSenha(String senha) {
		this.senha = senha;
	}
	
}
