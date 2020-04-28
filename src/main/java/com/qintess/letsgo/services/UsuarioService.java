package com.qintess.letsgo.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
//import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.qintess.letsgo.models.Evento;
import com.qintess.letsgo.models.Pedido;
import com.qintess.letsgo.models.Usuario;
import com.qintess.letsgo.repos.UsuarioRepository;

@Service
public class UsuarioService {

	@Autowired
	private UsuarioRepository usuarioRepos;
	@Autowired
	private PedidoService pedidoService;
	
	public void insere(Usuario usuario) {
		usuarioRepos.save(usuario);
	}
	
	public Usuario buscaPorEmail(String email) {
		return usuarioRepos.findByEmail(email);
	}
	
	public List<Usuario> buscarTodos(){
		return usuarioRepos.findAll();
	}
	
	public int ingressoCompradoPorUsuario(Evento evento, Usuario usuario) {
		int quantidadeJaComprados = 0;
		List<Pedido> pedidosUsuario = pedidoService.buscaPorUsuario(usuario);
		
		for (Pedido pedido : pedidosUsuario) {
			Evento eventoDoPedido = pedido.getItem().getIngressos().get(0).getEvento();
			
			if(eventoDoPedido.equals(evento)) {
				quantidadeJaComprados += pedido.getItem().getQuantidade();
			}
		}
	
		System.out.println(quantidadeJaComprados);
		return quantidadeJaComprados;
	}
}
