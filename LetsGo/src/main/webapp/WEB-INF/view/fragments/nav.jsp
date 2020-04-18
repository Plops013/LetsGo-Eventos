<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<spring:url value="/login" var="login"></spring:url>
<spring:url value="/" var="home"></spring:url>
<spring:url value="/usuario/perfil" var="perfil"></spring:url>
<nav class="navbar navbar-expand-lg navbar-light bg-light"  style="box-shadow: 0px 1px 10px grey;">
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
			<!--  	<li class="nav-item active"><a class="nav-link" href="#">Home
						<span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item"><a class="nav-link" href="#">Link</a></li>
				<li class="nav-item"><a class="nav-link disabled" href="#">Disabled</a>
				</li> -->
			</ul>
			<c:if test="${not empty logado}">
			<ul class="navbar-nav my-2 my-lg-0">
				<li class="nav-item"><a class="nav-link text-primary"
					href="${login}">Login</a></li>
			</ul>
			</c:if>
			<c:if test="${empty logado}">
				<ul class="navbar-nav my-2 my-lg-0">
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> Meu Perfil </a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="#">Meus Eventos</a> <a
								class="dropdown-item" href="${perfil}">Editar Perfil</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="#">Sair</a>
						</div>
						</li>
				</ul>
			</c:if>
		</div>
	</div>
</nav>