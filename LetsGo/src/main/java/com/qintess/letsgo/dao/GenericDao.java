package com.qintess.letsgo.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Repository
@EnableTransactionManagement
public class GenericDao {

    @Autowired
    private EntityManager entityManager;

    private Session getSession() {
        return entityManager.unwrap(Session.class);
    }

	@Transactional
	public <T> void salva(T entidade) {
		Session session = this.getSession();
		session.save(entidade);
	}

	@Transactional
	public <T> void altera(T entidade) {
		Session session = this.getSession();
		session.merge(entidade);
	}

	@Transactional
	public <T> void deleta(T entidade) {
		Session session = this.getSession();
		session.remove(entidade);
	}

	@SuppressWarnings("unchecked")
	@Transactional
	public <T> List<T> buscaTodos(Class<T> nomeClasse) {
		Session session = this.getSession();
		return session.createQuery("from " + nomeClasse.getName()).getResultList();
	}

	@Transactional
	public <T> T buscaPorId(Class<T> nomeClasse, int id) {
		Session session = this.getSession();
		return session.get(nomeClasse, id);
	}

}
