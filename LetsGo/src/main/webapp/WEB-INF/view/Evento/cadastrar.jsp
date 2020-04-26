<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<spring:url value="/" var="home"></spring:url>
<spring:url value="/CasaDeShow/" var="casaDeShowIndex"></spring:url>
<spring:url value="/evento/salvar" var="salvar"></spring:url>
<spring:url value="/evento/deletar/" var="deletar"></spring:url>
<spring:url value="/evento/alterar/" var="alterar"></spring:url>
<spring:url value="/evento/" var="eventoShow"></spring:url>
<spring:url value="/evento/cadastrar" var="cancelar"></spring:url>
<link href="/css/bootstrap.min.css" rel="stylesheet" />
<link href="/css/style.css" rel="stylesheet" />
<script type="text/javascript" src="/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/js/popper.min.js"></script>
<script type="text/javascript" src="/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
</head>
<body>
  <jsp:include page="${request.contextPath}/nav"></jsp:include>
  <div class="container mx-auto text-center mt-4">
    <div
      class="collapse multi-collapse justify-content-end col-lg-12 pr-0 mr-0"
      id="collapseButton">
      <a class="btn btn-light py-1 " type="button"
        data-toggle="collapse" data-target=".multi-collapse"
        role="button" aria-expanded="false"
        aria-controls="collapseForm collapseButton"> Abrir
        Formulario </a>
    </div>
    <div class="collapse show multi-collapse col-lg-12 pr-0 mr-0"
      id="collapseButton">
      <a class="btn btn-light py-1" type="button" data-toggle="collapse"
        data-target=".multi-collapse" role="button"
        aria-expanded="false"
        aria-controls="collapseForm collapseButton"> Fechar
        Formulario </a>
    </div>
    <div class="form-group text-left py-0 my-0">
      <a href="${home}" class="text-left text-white">voltar</a>
    </div>
    <div class="text-center justify-content-center mx-auto">
      <div class="card collapse show multi-collapse mb-4"
        id="collapseForm">
        <div class="card-body">
          <h1 class="text-center dislay-4" id="evento">Cadastre Seu
            Evento</h1>
        </div>
        <c:if test="${not empty mensagemErro}">
          <div id="divMensagem" class="alert alert-danger" role="alert">${mensagemErro}</div>
        </c:if>
        <c:if test="${not empty mensagemSucesso}">
          <div id="divMensagem" class="alert alert-success" role="alert">${mensagemSucesso}</div>
        </c:if>
        <form:form action="${salvar}" cssClass="px-3" 
          modelAttribute="evento" enctype="multipart/form-data">
          <form:hidden path="id" />
          <form:hidden path="imagemEvento" />
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
              <label for="quantidadeIngressosInicial">Quantidade
                de Ingressos</label>
              <form:input cssClass="form-control"
                path="quantidadeIngressosInicial"
                cssErrorClass="form-control is-invalid" />
              <div class="invalid-feedback">
                <form:errors path="quantidadeIngressosInicial"
                  cssClass="error" />
              </div>
            </div>
            <div class="form-group col-md-4">
              <label for="casaDeShow">Casa de Show:</label> <select
                class="custom-select" name="casaDeShow" id="casaDeShow"
                required>
                <c:forEach var="casaDeShow" items="${casasDeShow}">
                  <option value="${casaDeShow.id}"
                    ${casaDeShow.id == evento.casaDeShow.id? 'selected': ''}>${casaDeShow.nome}</option>
                </c:forEach>
              </select>
            </div>
          </div>
          <div class="form-row">
            <div class="form-group col-md-6">
              <label for="senha">Data Inicio</label>
              <form:input cssClass="form-control" path="dataInicio"
                type="datetime-local" max="9999-12-31T23:59"
                cssErrorClass="form-control is-invalid" />
              <div class="invalid-feedback">
                <form:errors path="dataInicio" cssClass="error" />
              </div>
            </div>
            <div class="form-group col-md-6">
              <label for="confirmaSenha">Data Fim</label>
              <form:input cssClass="form-control" path="dataFim"
                type="datetime-local" max="9999-12-31T23:59"
                cssErrorClass="form-control is-invalid" />
              <div class="invalid-feedback">
                <form:errors path="dataFim" cssClass="error" />
              </div>
            </div>
          </div>
          <div class="form-row px-1">
            <label>Escolha uma foto para seu evento <span
              class="small text-primary">( sua foto deve ter o
                tamanho de 800 x 400, e no maximo 10Mb)</span>
            </label>
            <div class="form-group col-md-12 ">
              <input type="file" name="imagem" class="form-control"
                id="customFile"> <label
                class="custom-file-label" for="customFile">Escolha
                seu arquivo...</label>
            </div>
          </div>
          <c:if test="${evento.id == 0}">
            <div class="form-row">
              <div class="col-sm-12 mx-auto">
                <img class="rounded h-auto mx-auto w-30 my-1"
                  id="imagemAlterar" alt=""
                  style="width: 400px; height: 800px" src="" />
              </div>
            </div>
          </c:if>
          <div class="form-row">
            <div class="col-sm-12 mx-auto">
              <img class="rounded h-auto mx-auto w-30 my-1"
                id="imagemAlterar" alt=""
                style="width: 400px; height: 800px"
                src="data:image/jpge;base64,${evento.id ne 0? evento.imagemEncoded: ''}" />
            </div>
          </div>
          <div class="mx-auto text-center">
            <button type="submit" class="btn btn-success" onclick="trocaImagem()">${evento.id == 0? 'Cadastrar' : 'Alterar' }
              Evento</button>
            <c:if test="${evento.id ne 0}">
              <a href="${cancelar}" class="btn btn-danger">Cancelar</a>
            </c:if>
          </div>
          <img>
        </form:form>
      </div>
    </div>
    <div class="card mb-4">
      <div class="card-body">
        <h1 class="display-4 text-center">Seus Eventos</h1>
        <c:if test="${not empty mensagemExclusao}">
          <div id="divMensagem" class="alert alert-success" role="alert">${mensagemExclusao}</div>
        </c:if>
        <c:if test="${not empty mensagemExclusaoErro}">
          <div id="divMensagem" class="alert alert-danger" role="alert">${mensagemExclusaoErro}</div>
        </c:if>
        <c:if test="${empty eventos }">
          <h5 class="font-weight-ligh text-danger text-center">Não
            há eventos cadastrados</h5>
        </c:if>
        <c:if test="${not empty eventos}">
          <div class="table-responsive rounded">
            <table class="table table-hover  table-sm">
              <thead class="thead-dark">
                <tr>
                  <th scope="col">ID</th>
                  <th scope="col">Nome</th>
                  <th scope="col">Casa De Show</th>
                  <th scope="col">Inicio/Fim</th>
                  <th scope="col">Valor Un.</th>
                  <th scope="col">I. Total</th>
                  <th scope="col">I. Vendidos</th>
                  <th scope="col">Foto</th>
                  <th class="text-center" scope="col" colspan="2">Alterações</th>
                </tr>
              </thead>
              <tbody>
                <c:forEach var="eventoItem" items="${eventos}">
                  <tr>
                    <th scope="row">${eventoItem.id}</th>
                    <td><a href="${eventoShow}${eventoItem.id}">${eventoItem.nome}</a></td>
                    <td><a
                      href="${casaDeShowIndex}${eventoItem.casaDeShow.id}">${eventoItem.casaDeShow.nome}</a></td>
                    <td>${eventoItem.dataString}</td>
                    <td>${eventoItem.preco}</td>
                    <td>${eventoItem.quantidadeIngressosInicial }</td>
                    <td>${eventoItem.ingressosVendidos}</td>
                    <td><img
                      class="rounded h-auto mx-auto w-30 my-1" alt=""
                      style="width: 30px; height: 30px"
                      src="data:image/jpge;base64,${eventoItem.imagemEncoded}" />
                    </td>
                    <td class="pr-0"><a
                      class="btn btn-warning mr-1 py-0"
                      href="${alterar}${eventoItem.id}" >Alterar</a></td>
                    <td class="pl-0"><a
                      class="btn btn-danger ml-0 py-0"
                      onclick="return confirm('Deseja realmente deletar o Evento: ${eventoItem.nome} ?')"
                      href="${deletar}${eventoItem.id}">Deletar</a></td>
                  </tr>
                </c:forEach>
              </tbody>
            </table>
          </div>
        </c:if>
      </div>
    </div>
  </div>
  <script>
			function trocaImagem() {
				if (document.getElementById("customFile").value != 0)
					document.getElementById("imagemEvento").value = 0;
			};

  			var uploadfoto = document.getElementById('customFile');
  			var fotopreview = document.getElementById('imagemAlterar');
  
  			uploadfoto.addEventListener('change', function(e) {
  				showThumbnail(this.files);
  			});
  
  			function showThumbnail(files) {
  				if (files && files[0]) {
  					var reader = new FileReader();
  
  					reader.onload = function(e) {
  						fotopreview.src = e.target.result;
  					}
  
  					reader.readAsDataURL(files[0]);
  				}
  			}
		</script>
</body>
</html>