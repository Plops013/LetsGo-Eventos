<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<spring:url value="/evento/comprar" var="comprar"></spring:url>
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
        <ol class="carousel-indicators">
          <li data-target="#carouselExampleIndicators" data-slide-to="0"
            class="active"></li>
          <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
          <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
          <div class="carousel-item active">
            <img
              src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSFqt5GAaWDgBqaDbUc31KSvXHbzE8beo-WpO5tuXWbPPShcoRI&usqp=CAU"
              class="carimg d-block w-100" alt="...">
          </div>
          <div class="carousel-item">
            <img
              src="https://www.startagro.agr.br/wp-content/uploads/2017/07/cana-de-acucar-800x400.jpg"
              class="carimg d-block w-100" alt="...">
          </div>
          <div class="carousel-item">
            <img
              src="https://www.paradoxzero.com/wp-content/uploads/2013/03/landscape-6-800x4001.jpg"
              class="carimg d-block w-100" alt="...">
          </div>
        </div>
        <a class="carousel-control-prev"
          href="#carouselExampleIndicators" role="button"
          data-slide="prev"> <span
          class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="sr-only">Próxima</span>
        </a> <a class="carousel-control-next"
          href="#carouselExampleIndicators" role="button"
          data-slide="next"> <span
          class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="sr-only">Anterior</span>
        </a>
      </div>
      <h1 class="display-4 text-center mt-3">Titulo do Seu Evento</h1>
      <h4 class="ml-4">Descrição:</h4>
      <h5 class="text-justify mx-4 bg-light px-2 font-weight-light ">Lorem
        ipsum dolor sit amet, consectetur adipiscing elit. Quisque magna
        ex, egestas id interdum at, placerat a mauris. Phasellus et
        felis eu dolor ornare blandit vitae a mi. Proin sit amet
        ultrices dolor. Quisque et interdum tellus. Morbi massa est,
        hendrerit eget dui vitae, vehicula pellentesque justo.
        Vestibulum sagittis mi et fringilla pulvinar. Curabitur eu
        tincidunt velit. Quisque faucibus magna vitae neque consequat
        dignissim vitae nec purus. Quisque in magna vitae tellus congue
        ullamcorper. Quisque pharetra id leo quis vehicula. Mauris
        faucibus quis nisi dignissim volutpat. Etiam eget nisl
        fermentum, iaculis lorem a, imperdiet urna. Nullam vel lacus a
        mi cursus vehicula. Etiam arcu velit, ultrices non vehicula
        vitae, egestas viverra sapien. Ut luctus sapien non mollis
        dictum. Vivamus malesuada enim eu erat tincidunt auctor.
        Phasellus facilisis sapien quis risus mattis egestas. Etiam
        cursus nisl ac cursus egestas. Proin eu velit orci. Donec sit
        amet pellentesque est. Vestibulum lacus ex, sollicitudin et
        ultricies id, posuere ac enim. Nunc vel imperdiet purus, a
        lobortis mauris. Mauris luctus viverra libero, sodales egestas
        diam facilisis sit amet. Praesent volutpat arcu vitae ligula
        eleifend convallis. Aliquam bibendum nunc faucibus augue
        consectetur commodo. Mauris vitae tincidunt massa. Donec nec
        efficitur massa, a aliquam felis. Praesent dapibus vehicula
        ipsum at vehicula. Phasellus imperdiet nunc nec mattis molestie.
        Integer eu molestie dui, eu euismod velit. Donec vitae sem mi.
        Ut luctus lorem ac metus dictum, in convallis sapien egestas.
        Integer eget libero erat. Duis imperdiet diam nisl, et finibus
        velit posuere ut. Phasellus sollicitudin, libero nec semper
        aliquet, nulla risus tincidunt velit, sit amet congue mauris
        tellus sed leo. Nullam dapibus mattis ex quis sollicitudin.
        Nulla tempus consectetur ipsum nec pulvinar. Ut quam dolor,
        viverra ac ultrices id, pellentesque id neque. Aenean consequat
        suscipit lorem, sed ullamcorper nunc tincidunt sed. Mauris ac
        sollicitudin libero. Vestibulum in sodales metus. Mauris ipsum
        lectus, auctor id lobortis et, scelerisque</h5>
      <h4 class="ml-4">Data:</h4>
      <h5 class="text-justify mx-4 bg-light px-2 font-weight-light">
        18/04/2020 ás 20:00 ~ 18/04/2020 ás 23:00</h5>
      <h4 class="ml-4">Endereço:</h4>
      <h5 class="text-justify mx-4 bg-light px-2 font-weight-light">
        Avenida Paulista, 833, São Paulo - SP</h5>
      <h4 class="ml-4">Sobre o Espaço:</h4>
      <h5 class="text-justify mx-4 bg-light px-2 font-weight-light">
        Boulevard Hall (/casadeshow/show)</h5>
      <h4 class="ml-4">Valor Unitario:</h4>
      <h5
        class="text-justify text-success mx-4  px-2 font-weight-normal py-1">
        <span style="font-size: 1.2em">R$:50,00</span>
      </h5>
      <h4 class="ml-4">Ingressos Disponíveis:</h4>
      <h5
        class="text-justify text-success mx-4  px-2 font-weight-normal py-1">
        Restam: <span style="font-size: 1.2em">2500</span> Unidades
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