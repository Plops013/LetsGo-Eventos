<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<spring:url value="/" var="home"></spring:url>
<spring:url value="salva" var="salva"></spring:url>
<link href="/css/bootstrap.min.css" rel="stylesheet" />
<link href="/css/style.css" rel="stylesheet" />
<script type="text/javascript" src="/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/js/popper.min.js"></script>
<script type="text/javascript" src="/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
</head>
<body>
  <jsp:include page="${request.contextPath}/nav"></jsp:include>
  <div class="container mt-4">
    <div class="form-group text-left py-0 my-0">
      <a href="${home}" class="text-left text-white">voltar</a>
    </div>
    <div class="card mb-4">
      <div class="card-body bg-light">
        <h1 class="text-center" id="evento">Cadastro de Casa de
          Show</h1>
        <form:form modelAttribute="casaDeShow" action="/salva">
          <form:hidden path="id" />
          <div class="form-row">
            <div class="form-group col-lg-12">
              <label>Nome</label>
              <form:input cssClass="form-control"
                cssErrorClass="is-invalid" path="nome" />
            </div>
          </div>
          <div class="form-row">
            <div class="form-group col-lg-4">
              <label>Capacidade <span class="small text-primary">(
                  capacidade de pessoas )</span></label>
              <form:input cssClass="form-control col-sm-12"
                path="capacidade" />
            </div>
            <div class="form-group col-lg-6">
              <label>CEP <span class="small text-primary">(
                  sistema de prenchimento automatico, digite apenas o
                  cep e o numero)</span></label> <input class="form-control col-sm-4"
                type="text" id="cep" />
            </div>
          </div>
          <div class="form-row">
            <div class="form-group col-lg-4">
              <fieldset disabled>
                <label>Rua</label>
                <form:input cssClass="form-control"
                  cssErrorClass="is-invalid" path="endereco" />
              </fieldset>
            </div>
            <div class="form-group col-lg-2">
              <label>Numero</label> <input class="form-control"
                type="text" id="numero" />
            </div>
            <div class="form-group col-lg-3">
              <fieldset disabled>
                <label>Cidade</label>
                <form:input cssClass="form-control"
                  cssErrorClass="is-invalid" path="cidade" />
              </fieldset>
            </div>
            <div class="form-group col-lg-3">
              <fieldset disabled>
                <label>Estado</label>
                <form:input cssClass="form-control"
                  cssErrorClass="is-invalid" path="estado" />
              </fieldset>
            </div>
          </div>
          <div class="form-row  justify-content-md-center">
            <div class="col-lg-6">
              <button class="btn btn-success btn-block" type="submit">Cadastrar</button>
            </div>
          </div>
        </form:form>
      </div>
    </div>
    <div class="card">
      <div class="card-body">
        <table class="table table-hover table-sm">
          <thead class="thead-dark">
            <tr>
              <th scope="col">ID</th>
              <th scope="col">Nome</th>
              <th scope="col">Capacidade</th>
              <th scope="col">Endereco</th>
              <th scope="col">Numero</th>
              <th scope="col">Cidade</th>
              <th scope="col">Estado</th>
              <th class="text-center" scope="col" colspan="2">Alterações</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <th scope="row">1</th>
              <td>Boulevard</td>
              <td>5000</td>
              <td>Rua Catarina Maria</td>
              <td>33</td>
              <td>Santo André</td>
              <td>São Paulo</td>
              <td class="pr-0"><a class="btn btn-warning mr-0">Alterar</a></td>
              <td class="pl-0"><a class="btn btn-danger ml-0">Deletar</a></td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  </div>

  <script type="text/javascript">
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