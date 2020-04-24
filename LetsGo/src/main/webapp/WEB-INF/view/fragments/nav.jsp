<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
  uri="http://www.springframework.org/security/tags"%>
<spring:url value="/CasaDeShow/cadastrar" var="casasDeShow"></spring:url>
<spring:url value="/evento/cadastrar" var="eventos"></spring:url>
<spring:url value="/usuario/pefil" var="perfil"></spring:url>
<spring:url value="/usuario/login" var="login"></spring:url>
<spring:url value="/logout" var="logout"></spring:url>
<spring:url value="/" var="home"></spring:url>
<spring:url value="/CasaDeShow" var="casaDeShow"></spring:url>
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
            href="${login}">Login</a></li>
        </ul>
      </sec:authorize>
      <sec:authorize access="isAuthenticated()">
        <ul class="navbar-nav my-2 my-lg-0">
          <li class="nav-item dropdown"><a
            class="nav-link dropdown-toggle" href="" id="navbarDropdown"
            role="button" data-toggle="dropdown" aria-haspopup="true"
            aria-expanded="false"> <sec:authentication
                property="principal.username" /> <img
              src="/assets/icons/user.svg"></a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
              <sec:authorize access="hasRole('organizador')">
                <a class="dropdown-item" href="${casasDeShow}">Minhas
                  casas de show</a>
                <a class="dropdown-item" href="${eventos}">Meus
                  eventos</a>
              </sec:authorize>
              <sec:authorize access="hasRole('cliente')">
                <a class="dropdown-item" href="${perfil}">Meus
                  eventos</a>
              </sec:authorize>
              <a class="dropdown-item" href="${perfil}">Editar
                perfil</a>
              <div class="dropdown-divider"></div>
              <a class="dropdown-item" href="${logout}">Sair</a>
            </div></li>
        </ul>
      </sec:authorize>
    </div>
  </div>
</nav>