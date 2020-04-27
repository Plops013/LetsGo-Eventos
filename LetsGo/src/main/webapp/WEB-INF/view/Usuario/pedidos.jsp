<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<spring:url value="/CasaDeShow/" var="casaDeShow"></spring:url>
<link href="/css/bootstrap.min.css" rel="stylesheet" />
<link href="/css/style.css" rel="stylesheet" />
<script src="https://kit.fontawesome.com/1e0a299eba.js"></script>
<script type="text/javascript" src="/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/js/popper.min.js"></script>
<script type="text/javascript" src="/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
</head>
<body>
  <jsp:include page="${request.contextPath}/nav"></jsp:include>
  <div class="container mx-auto text-center mt-4">
    <div class="row px-1">
      <div class="card col-lg-12 mb-3">
        <h2 class="text-center my-3 text-primary">Meus Pedidos</h2>
        <c:forEach var="pedido" items="${pedidos}">

          <div class="card collapse bg-dark my-3 py-3 px-3"
            id='pedido${pedido.id}'>
            <h3 class="text-center text-light">ID Pedido:
              #${pedido.id}</h3>
            <h5 class="text-center my-0 py-0 text-light">${pedido.item.ingressos[0].evento.nome}</h5>
            <p class="my-0 py-0 text-light">Data Compra:
              ${pedido.dataString}</p>
            <p class="my-0 py-0 text-light">Data:
              ${pedido.item.ingressos[0].evento.dataString}</p>
            <p class="my-0 py-0 text-light">Quantidade de ingressos:
              ${pedido.item.quantidade}</p>
          <p class="my-0 py-0 text-light">Local:
             <a href="${casaDeShow}${pedido.item.ingressos[0].evento.casaDeShow.id}"> ${pedido.item.ingressos[0].evento.casaDeShow.nome}</a></p>
            <div class="row mt-2 justify-content-md-center">
              <c:forEach var="ingresso" items="${pedido.item.ingressos}">
                <div class="col-md-3 px-4">
                  <div class="card border-info">
                    <p class="mt-2 mb-0 py-0 text-primary">
                      <i class="fas fa-ticket-alt"></i>
                    </p>
                    <hr class="my-2 py-0" />
                    <p class="my-0 py-0">#E${ingresso.evento.id}I${ingresso.id}</p>
                    <p class="my-0 py-0">${ingresso.evento.nome}</p>
                    <p class="my-0 py-0">${ingresso.evento.dataInicioString}</p>
                    <p class="my-0 py-0">R$: ${ingresso.evento.preco }</p>
                  </div>
                </div>
              </c:forEach>
            </div>

          </div>
        </c:forEach>

        <table class="table table-striped">
          <thead>
            <tr>
              <th scope="col">#</th>
              <th scope="col">Nome Evento</th>
              <th scope="col">Data Compra</th>
              <th scope="col">Quantidade Ingressos</th>
              <th scope="col">Total</th>
              <th scope="col">Opções</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach var="pedido" items="${pedidos}">
              <tr>
                <th scope="row">${pedido.id}</th>
                <td>${pedido.item.ingressos[0].evento.nome}</td>
                <td>${pedido.dataString}</td>
                <td>${pedido.item.quantidade}</td>
                <td>${pedido.total }</td>
                <td><a data-toggle="collapse"
                  href='#pedido${pedido.id}' role="button"
                  aria-expanded="false"
                  aria-controls='#pedido${pedido.id}'> <i
                    onclick="trocaIcone(${pedido.id})" class="fas fa-plus-square"
                    id="icone${pedido.id}"></i></a></td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
      </div>
    </div>
  </div>
  <script>
    function trocaIcone(id){
    var idIcon = "#icone" + id;
    if($(idIcon).hasClass("fa-plus-square")){
    	$(idIcon).removeClass("fa-plus-square");
    	$(idIcon).removeClass("text-primary");
    	$(idIcon).addClass("fa-minus-square");
    	$(idIcon).addClass("text-danger");
    } else {
    	$(idIcon).addClass("fa-plus-square");
    	$(idIcon).addClass("text-primary");
    	$(idIcon).removeClass("fa-minus-square");
    	$(idIcon).removeClass("text-danger");
    }
    }
    
  </script>
</body>
</html>