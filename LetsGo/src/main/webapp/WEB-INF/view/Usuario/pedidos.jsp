<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
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
        <div class="card collapse bg-dark my-3 py-3 px-3" id="pedidoId">
        <h3 class="text-center text-light">ID Pedido: #1</h3>
          <h5 class="text-center my-0 py-0 text-light">Nome do Evento</h5>
          <p class="my-0 py-0 text-light">Data: 18/04/2021 22:00 ~ 19/04/2021
            22:00</p>
          <p class="my-0 py-0 text-light">Quantidade de ingressos: 4</p>
          <div class="row mt-2 justify-content-md-center">
            <div class="col-md-3 px-4">
              <div class="card border-info">
                <p class="mt-2 mb-0 py-0 text-primary"><i class="fas fa-ticket-alt"></i></p>
                <hr class="my-2 py-0"/>
                <p class="my-0 py-0">#E47I1 s</p>
                <p class="my-0 py-0">Rock In Rio</p>
                <p class="my-0 py-0">Data: 20/04/2020 22:00</p>
                <p class="my-0 py-0">R$: 20,00</p>
              </div>
            </div>
          </div>
        </div>
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
            <tr>
              <th scope="row">1</th>
              <td>Major</td>
              <td>18/04/2020</td>
              <td>4</td>
              <td>193,99</td>

              <td><a data-toggle="collapse" href="#pedidoId"
                role="button" aria-expanded="false"
                aria-controls="pedidoId"><i class="fas fa-plus-square"></i></a></td>
            </tr>
            <tr>
              <th scope="row">2</th>
              <td>Jacob</td>
              <td>Thornton</td>
              <td>@fat</td>
              <td>@fat</td>
              <td>@fat</td>
            </tr>
            <tr>
              <th scope="row">3</th>
              <td>Larry</td>
              <td>the Bird</td>
              <td>@twitter</td>
              <td>@fat</td>
              <td>@fat</td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</body>
</html>