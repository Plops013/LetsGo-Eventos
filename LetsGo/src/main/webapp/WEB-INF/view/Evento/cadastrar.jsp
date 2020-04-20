<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<spring:url value="/" var="home"></spring:url>
<link href="/css/bootstrap.min.css" rel="stylesheet" />
<link href="/css/style.css" rel="stylesheet" />
<script type="text/javascript" src="/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/js/popper.min.js"></script>
<script type="text/javascript" src="/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
</head>
<body>
  <jsp:include page="${request.contextPath}/nav"></jsp:include>
  <div class="container mt-4 col-md-12">
    <div class="form-group text-left py-0 my-0">
      <a href="${home}" class="text-left text-white">voltar</a>
    </div>
    <div class="card mb-4">
      <div class="card-body bg-light">
        <h1 class="text-center" id="evento">Cadastre Seu Evento</h1>
        <div class="text-center mx-auto py-3">
          <div class="collapse show multi-collapse" id="collapseButton">
            <a class="text-white btn btn-primary py-1" type="button"
              data-toggle="collapse" data-target=".multi-collapse"
              role="button" aria-expanded="false"
              aria-controls="collapseForm collapseButton"> Abrir
              Formulario </a>
          </div>
          <div class="collapse multi-collapse" id="collapseButton">
            <a class="text-white btn btn-primary py-1" type="button"
              data-toggle="collapse" data-target=".multi-collapse"
              role="button" aria-expanded="false"
              aria-controls="collapseForm collapseButton"> Fechar
              Formulario </a>
          </div>
        </div>
        <div class="collapse multi-collapse" id="collapseForm">

          <c:if test="${not empty mensagemErro}">
            <div id="divMensagem" class="alert alert-danger"
              role="alert">${mensagemErro}</div>
          </c:if>
          <c:if test="${not empty mensagemSucesso}">
            <div id="divMensagem" class="alert alert-success"
              role="alert">${mensagemSucesso}</div>
          </c:if>
          <form:form action="salva" modelAttribute="evento"
            enctype="multipart/form-data">
            <form:hidden path="id" />
            <div class="form-row">
              <div class="form-group col-md-12">
                <label for="nome">Nome</label>
                <form:input cssClass="form-control" path="nome"
                  cssErrorClass="form-control is-invalid" />
                <div class="invalid-feedback">
                  <form:errors path="nome" cssClass="error" />
                </div>
              </div>
            </div>
            <div class="form-row">
              <div class="form-group  col-md-12">
                <label for="descricao">Descrição:</label>
                <form:textarea cssClass="form-control" path="descricao"
                  cssErrorClass="form-control is-invalid" />
                <div class="invalid-feedback">
                  <form:errors path="descricao" cssClass="error" />
                </div>
              </div>
            </div>
            <div class="form-row">
              <div class="form-group col-md-4">
                <label for="preco">Valor do ingresso</label>
                <form:input cssClass="form-control" path="preco"
                  cssErrorClass="form-control is-invalid" />
                <div class="invalid-feedback">
                  <form:errors path="preco" cssClass="error" />
                </div>
              </div>
              <div class="form-group col-md-4">
                <label for="quantidadeIngressos">Quantidade de
                  Ingressos</label>
                <form:input cssClass="form-control"
                  path="quantidadeIngressos"
                  cssErrorClass="form-control is-invalid" />
                <div class="invalid-feedback">
                  <form:errors path="quantidadeIngressos"
                    cssClass="error" />
                </div>
              </div>
              <div class="form-group col-md-4">
                <label for="casaDeShow">Casa de Show:</label> <select
                  class="custom-select" required>
                  <c:forEach items="${usuario.casasDeShow}"
                    var="casaDeShow">
                    <option value="">${casaDeShow}</option>
                  </c:forEach>
                </select>
              </div>
            </div>
            <div class="form-row">
              <div class="form-group col-md-6">
                <label for="senha">Data Inicio</label>
                <form:input cssClass="form-control" path="dataInicio"
                  type="date" cssErrorClass="form-control is-invalid" />
                <div class="invalid-feedback">
                  <form:errors path="dataInicio" cssClass="error" />
                </div>
              </div>
              <div class="form-group col-md-6">
                <label for="confirmaSenha">Data Fim</label>
                <form:input cssClass="form-control" path="dataFim"
                  type="date" cssErrorClass="form-control is-invalid" />
                <div class="invalid-feedback">
                  <form:errors path="dataFim" cssClass="error" />
                </div>
              </div>
            </div>
            <div class="form-row px-1">
              <label>Escolha uma foto para seu evento <span
                class="small text-muted">( sua foto deve ter o
                  tamanho de 800 x 400, e no maximo 10Mb)</span>
              </label>
              <div class="form-group col-md-12 ">
                <input type="file" name="imagem" class="form-control"
                  id="customFile"> <label
                  class="custom-file-label" for="customFile">Escolha
                  seu arquivo...</label>
              </div>
            </div>
            <c:if test="${evento.id ne 0}">
              <div class="form-row ">
                <div class="offset-sm-2 col-sm-6">
                  <img class="rounded h-auto w-50" alt=""
                    src="data:image/jpge;base64,${imagem64}">
                </div>
              </div>
            </c:if>
            <div class="mx-auto text-center">
              <button type="submit" class="btn btn-success">Cadastrar
                Evento</button>
            </div>
            <img>
          </form:form>
        </div>
      </div>
    </div>
    <div class="card mb-4">
      <div class="card-body">
        <table class="table table-hover table-sm">
          <thead class="thead-dark">
            <tr>
              <th scope="col">ID</th>
              <th scope="col">Nome</th>
              <th scope="col">Casa De Show</th>
              <th scope="col">Data Inicio</th>
              <th scope="col">Data Fim</th>
              <th scope="col">Valor Ingresso</th>
              <th scope="col">Quantidade Ingressos</th>
              <th scope="col">Ingressos Vendidos</th>
              <th class="text-center" scope="col" colspan="2">Alterações</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <th scope="row">1</th>
              <td>Rock in Rio</td>
              <td>Rio de janeiro</td>
              <td>23/10/2020 ás 18:00</td>
              <td>27/10/2020 ás 03:00</td>
              <td>R$: 580,00</td>
              <td>36.000</td>
              <td>2.000</td>
              <td class="pr-0"><a class="btn btn-warning mr-0">Alterar</a></td>
              <td class="pl-0"><a class="btn btn-danger ml-0">Deletar</a></td>
            </tr>
          </tbody>
        </table>
      </div>

    </div>
  </div>

  <div class="modal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">Instruções para Imagem</h5>
          <button type="button" class="close" data-dismiss="modal"
            aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <ul>
            <li>Sua imagem deve ter o tamanho exato de <strong>800px
                X 400px</strong></li>
            <li>Sua imagem deve ter no maximo 10MB</li>
          </ul>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary"
            data-dismiss="modal">Close</button>
          <button type="button" class="btn btn-primary">Save
            changes</button>
        </div>
      </div>
    </div>
  </div>
</body>
</html>