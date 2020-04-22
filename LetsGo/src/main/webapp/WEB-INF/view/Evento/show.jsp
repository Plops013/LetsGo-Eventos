<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<spring:url value="/evento/comprar" var="comprar"></spring:url>
<spring:url value="/CasaDeShow/" var="casaDeShow"></spring:url>
<spring:url value="/" var="home"></spring:url>
<link href="/css/bootstrap.min.css" rel="stylesheet" />
<link href="/css/style.css" rel="stylesheet" />
<script type="text/javascript" src="/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
</head>
<body>
  <jsp:include page="${request.contextPath}/nav"></jsp:include>
  <div class="container my-3">
    <div class="card">
      <div id="carouselExampleIndicators" class="carousel slide"
        data-ride="carousel">
        <div class="carousel-inner">
          <div class="carousel-item active">
            <img
              src="data:image/jpge;base64,${evento.imagemEncoded}"
              class="carimg d-block w-100" alt="...">
          </div>
        </div>
      </div>
      <h1 class="display-4 text-center mt-3">${evento.nome}</h1>
      <h4 class="ml-4">Descrição:</h4>
      <h5 class="text-justify mx-4 bg-light px-2 font-weight-light ">${evento.descricao}</h5>
      <h4 class="ml-4">Data:</h4>
      <h5 class="text-justify mx-4 bg-light px-2 font-weight-light">
       ${evento.dataString}</h5>
      <h4 class="ml-4">Endereço:</h4>
      <h5 class="text-justify mx-4 bg-light px-2 font-weight-light">
        ${evento.casaDeShow.endereco}, ${evento.casaDeShow.numero}, ${evento.casaDeShow.cidade} - ${evento.casaDeShow.estado}</h5>
      <h4 class="ml-4">Sobre o Espaço:</h4>
      <h5 class="text-justify mx-4 bg-light px-2 font-weight-light">
        <a href="${casaDeShow}${evento.casaDeShow.id}">${evento.casaDeShow.nome}</a></h5>
      <h4 class="ml-4">Valor Unitario:</h4>
      <h5
        class="text-justify text-success mx-4  px-2 font-weight-normal py-1">
        <c:if test="${evento.preco == 0}">
        <span style="font-size: 1.2em">Entrada Franca </span>
        </c:if>
        <c:if test="${evento.preco ne 0}">
        <span style="font-size: 1.2em">R$:${evento.preco}</span>
        </c:if>
      </h5>
      <h4 class="ml-4">Ingressos Disponíveis:</h4>
      <h5
        class="text-justify text-success mx-4  px-2 font-weight-normal py-1">
        Restam: <span style="font-size: 1.2em">${evento.quantidadeIngressos }</span> Unidades
      </h5>
      <!--  
			<div class="row mx-3">
				<div class="col-lg-6">
					<a href="#" class="my-4 btn btn-outline-primary btn-block py-3">
						<img src="/assets/icons/mail.svg" class="my-auto text-primary"
						alt="..."> Fale com o organizador
					</a>
				</div>
				<div class="col-lg-6">
				-->
      <a href="${comprar}"
        class="my-4 mx-4 btn btn-outline-success py-3"> <img
        src="/assets/icons/shopping-cart.svg"> Comprar Ingresso
      </a>
    </div>
  </div>
</body>
</html>