<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
  uri="http://www.springframework.org/security/tags"%>
<script src="https://kit.fontawesome.com/1e0a299eba.js"></script>
<spring:url value="/CasaDeShow/cadastrar" var="casasDeShow"></spring:url>
<spring:url value="/evento/cadastrar" var="eventos"></spring:url>
<spring:url value="/usuario/pefil" var="perfil"></spring:url>
<spring:url value="/usuario/login" var="login"></spring:url>
<spring:url value="/logout" var="logout"></spring:url>
<spring:url value="/" var="home"></spring:url>
<spring:url value="/CasaDeShow" var="casaDeShow"></spring:url>
<spring:url value="/usuario/pedidos" var="pedidos"></spring:url>
<spring:url value="/usuario/perfil" var="perfil"></spring:url>
<nav class="navbar navbar-expand-lg navbar-light bg-light"
  style="box-shadow: 0px 1px 10px grey;">
  <div class="container">
    <a class="navbar-brand text-primary" href="${home}"><strong>LetsGo!</strong></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse"
      data-target="#navbarSupportedContent"
      aria-controls="navbarSupportedContent" aria-expanded="false"
      aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav mr-auto">
        <li class="nav-item"><a class="nav-link"
          href="${home}">Eventos</a></li>
        <li class="nav-item"><a class="nav-link"
          href="${casaDeShow}">Casas De Show</a></li>
      </ul>
      <sec:authorize access="!isAuthenticated()">
        <ul class="navbar-nav my-2 my-lg-0">
          <li class="nav-item"><a class="nav-link text-primary"
            href="${login}"> Login <i class="fas fa-sign-in-alt"></i></a></li>
        </ul>
      </sec:authorize>
      <sec:authorize access="isAuthenticated()">
        <ul class="navbar-nav my-2 my-lg-0">
          <li class="nav-item dropdown"><a
            class="nav-link dropdown-toggle" href="" id="navbarDropdown"
            role="button" data-toggle="dropdown" aria-haspopup="true"
            aria-expanded="false"> <sec:authentication
                property="principal.username" /> <i class="fas fa-user"></i></a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
              <sec:authorize access="hasRole('organizador')">
                <a class="dropdown-item" href="${casasDeShow}"><i class="fas fa-home"></i> minhas
                  casas de show</a>
                <a class="dropdown-item" href="${eventos}"><i class="fas fa-glass-cheers"></i> meus
                  eventos</a>
              </sec:authorize>
              <sec:authorize access="hasRole('cliente')">
                <a class="dropdown-item" href="${pedidos}"><i class="fas fa-ticket-alt"></i> meus
                  eventos</a>
              </sec:authorize>
              <a class="dropdown-item" href="${perfil}"><i class="fas fa-address-card"></i> editar
                perfil</a>
              <div class="dropdown-divider"></div>
              <a class="dropdown-item" href="${logout}"><i class="fas fa-sign-out-alt"></i> sair</a>
            </div></li>
        </ul>
      </sec:authorize>
    </div>
  </div>
</nav>