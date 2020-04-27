<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<spring:url value="/" var="home"></spring:url>
<spring:url value="/CasaDeShow/salvar" var="salvar"></spring:url>
<spring:url value="/CasaDeShow/cadastrar" var="cancelar"></spring:url>
<spring:url value="/CasaDeShow/" var="show"></spring:url>
<spring:url value="/CasaDeShow/deletar/" var="deletar"></spring:url>
<spring:url value="/CasaDeShow/alterar/" var="alterar"></spring:url>
<link href="/css/bootstrap.min.css" rel="stylesheet" />
<link href="/css/style.css" rel="stylesheet" />
<script type="text/javascript" src="/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/js/popper.min.js"></script>
<script type="text/javascript" src="/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
</head>
<body>
  <jsp:include page="${request.contextPath}/nav"></jsp:include>
  <div class="container my-4">
    <div class="form-group text-left py-0 my-0">
      <a href="${home}" class="text-left text-white">voltar</a>
    </div>
    <div class="card mb-4">
      <div class="card-body bg-light">
        <h1 class="text-center" id="evento">Cadastro de Casa de
          Show</h1>
        <form:form modelAttribute="casaDeShow" action="${salvar}"
          enctype="multipart/form-data" method="POST">
          <c:if test="${not empty mensagemErro}">
            <div id="divMensagem" class="alert alert-danger"
              role="alert">${mensagemErro}</div>
          </c:if>
          <c:if test="${not empty mensagemSucesso}">
            <div id="divMensagem" class="alert alert-success"
              role="alert">${mensagemSucesso}</div>
          </c:if>
          <form:hidden path="id" />
          <c:if test="${not empty casaDeShow.usuario}">
            <form:hidden path="usuario" />
          </c:if>
          <form:hidden path="imagemCasaDeShow" />
          <div class="form-row">
            <div class="form-group col-lg-12">
              <label>Nome</label>
              <form:input cssClass="form-control"
                cssErrorClass="form-control is-invalid" path="nome" />
              <div class="invalid-feedback">
                <form:errors path="nome" cssClass="error" />
              </div>
            </div>
          </div>
          <div class="form-row">
            <div class="form-group col-lg-4">
              <label>Capacidade</label>
              <form:input cssClass="form-control col-sm-12"
                cssErrorClass="form-control is-invalid"
                path="capacidade" />
              <div class="invalid-feedback">
                <form:errors path="capacidade" cssClass="error" />
              </div>
            </div>
            <div class="form-group col-lg-6">
              <label>CEP <span class="small text-primary">(
                  sistema de prenchimento automatico, digite apenas o
                  cep e o numero)</span></label> <input class="form-control col-sm-4"
                type="text" id="cep" name="cep"
                value="${casaDeShow.cep}" />
            </div>
          </div>
          <div class="form-row">
            <div class="form-group col-lg-4">
              <label>Rua</label>
              <form:input cssClass="form-control"
                cssErrorClass="form-control is-invalid" path="endereco"
                readonly="true" />
              <div class="invalid-feedback">
                <form:errors path="endereco" cssClass="error" />
              </div>
            </div>
            <div class="form-group col-lg-2">
              <label>Numero</label>
              <form:input path="numero" cssClass="form-control"
                cssErrorClass="form-control is-invalid" />
              <div class="invalid-feedback">
                <form:errors path="numero" cssClass="error" />
              </div>
            </div>
            <div class="form-group col-lg-3">
              <label>Cidade</label>
              <form:input cssClass="form-control"
                cssErrorClass="form-control is-invalid" path="cidade"
                readonly="true" />
              <div class="invalid-feedback">
                <form:errors path="cidade" cssClass="error" />
              </div>
            </div>
            <div class="form-group col-lg-3">
              <label>Estado</label>
              <form:input cssClass="form-control"
                cssErrorClass="form-control is-invalid" path="estado"
                readonly="true" />
              <div class="invalid-feedback">
                <form:errors path="estado" cssClass="error" />
              </div>
            </div>
          </div>
          <div class="form-row mb-0">
            <label>Foto:</label>
            <div class="form-group col-lg-12">
              <input type="file" name="imagem" class="form-control"
                id="customFile" value="0"> <label
                class="custom-file-label" for="customFile">Escolha
                seu arquivo...</label>
            </div>
          </div>
          <div class="form-row mx-auto text-center">
            <div class="col-sm-12 mx-auto text-center">
              <img class="rounded h-auto text-center mx-auto w-30 my-1"
                id="imagemAlterar" alt=""
                style="width: 400px; height: 400px"
                src="data:image/jpge;base64,${casaDeShow.id ne 0? casaDeShow.imagemEncoded: ''}" />
            </div>
          </div>
          <div class="form-row mx-auto justify-content-md-center">
            <div class="col-lg-12 mx-auto text-center">
              <button class="btn btn-success" type="submit">${casaDeShow.id == 0 ? 'Cadastrar' : 'Alterar'}</button>
              <c:if test="${casaDeShow.id ne 0}">
                <a href="${cancelar}" class="btn btn-danger">Cancelar</a>
              </c:if>
            </div>
          </div>
        </form:form>
      </div>
    </div>
    <div class="card">
      <div class="card-body">
        <c:if test="${not empty mensagemExclusão}">
          <div id="divMensagem" class="alert alert-success" role="alert">${mensagemExclusão}</div>
        </c:if>
        <div class="table-responsive rounded">
          <table class="table table-hover table-sm">
            <thead class="thead-dark">
              <tr>
                <th scope="col">Nome</th>
                <th scope="col">Capacidade</th>
                <th scope="col">CEP</th>
                <th scope="col">Endereco</th>
                <th scope="col">Numero</th>
                <th scope="col">Cidade</th>
                <th scope="col">Estado</th>
                <th scope="col">Foto</th>
                <th class="text-center" scope="col" colspan="2">Alterações</th>
              </tr>
            </thead>
            <tbody>
              <c:forEach var="casaDeShowItem" items="${casasDeShow}">
                <tr>
                  <td><a href="${show}${casaDeShowItem.id}">${casaDeShowItem.nome}</a></td>
                  <td>${casaDeShowItem.capacidade}</td>
                  <td>${casaDeShowItem.cep}</td>
                  <td>${casaDeShowItem.endereco}</td>
                  <td>${casaDeShowItem.numero}</td>
                  <td>${casaDeShowItem.cidade}</td>
                  <td>${casaDeShowItem.estado}</td>
                  <td><img class="rounded h-auto mx-auto w-30 my-1"
                    alt="" style="width: 30px; height: 30px"
                    src="data:image/jpge;base64,${casaDeShowItem.imagemEncoded}" /></td>
                  <td class="pr-0"><a
                    class="py-0 btn btn-warning text-white"
                    href="${alterar}${casaDeShowItem.id}">Alterar</a></td>
                  <td class="pl-0"><a class="py-0 btn btn-danger"
                    href="${deletar}${casaDeShowItem.id}"
                    onclick="return confirm('Deseja realmente deletar a Casa De Show: ${casaDeShowItem.nome} ?')">Deletar</a></td>
                </tr>
              </c:forEach>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>

  <script type="text/javascript">
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
			$(document)
					.ready(
							function() {
								function limpa_formulário_cep() {
									// Limpa valores do formulário de cep.
									$("#endereco").val("");
									$("#cidade").val("");
									$("#estado").val("");
								}

								//Quando o campo cep perde o foco.
								$("#cep")
										.blur(
												function() {
													//Nova variável "cep" somente com dígitos.
													var cep = $(this).val()
															.replace(/\D/g, '');
													//Verifica se campo cep possui valor informado.
													if (cep != "") {
														//Expressão regular para validar o CEP.
														var validacep = /^[0-9]{8}$/;
														//Valida o formato do CEP.
														if (validacep.test(cep)) {
															//Preenche os campos com "..." enquanto consulta webservice.
															$("#endereco").val(
																	"");
															$("#cidade")
																	.val("");
															$("#estado")
																	.val("");
															//Consulta o webservice viacep.com.br/
															$
																	.getJSON(
																			"https://viacep.com.br/ws/"
																					+ cep
																					+ "/json/?callback=?",
																			function(
																					dados) {
																				if (!("erro" in dados)) {
																					//Atualiza os campos com os valores da consulta.
																					$(
																							"#endereco")
																							.val(
																									dados.logradouro);
																					$(
																							"#cidade")
																							.val(
																									dados.localidade);
																					$(
																							"#estado")
																							.val(
																									dados.uf);
																				} //end if.
																				else {
																					//CEP pesquisado não foi encontrado.
																					limpa_formulário_cep();
																					alert("CEP não encontrado.");
																				}
																			});
														} //end if.
														else {
															//cep é inválido.
															limpa_formulário_cep();
															alert("Formato de CEP inválido.");
														}
													} //end if.
													else {
														//cep sem valor, limpa formulário.
														limpa_formulário_cep();
													}
												});
							});
		</script>
</body>
</html>