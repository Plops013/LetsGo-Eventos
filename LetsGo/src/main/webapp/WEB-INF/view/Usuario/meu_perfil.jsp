<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<spring:url value="/usuario/alterar/" var="alterar"></spring:url>
<spring:url value="/" var="home"></spring:url>
<link href="/css/bootstrap.min.css" rel="stylesheet" />
<link href="/css/style.css" rel="stylesheet" />
<script type="text/javascript" src="/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
</head>
<body>
  <jsp:include page="${request.contextPath}/nav"></jsp:include>
  <div class="container mt-4">
    <div class="col-12 mx-auto">
      <div class="form-group text-left py-0 my-0">
        <a href="${home}" class="text-left text-white">voltar</a>
      </div>
      <div class="card pt-4">
        <div class="card-body pt-0">
          <h1 class="text-center">Meu Perfil</h1>
          <c:if test="${not empty mensagemErro}">
            <div id="divMensagem" class="alert alert-danger"
              role="alert">${mensagemErro}</div>
          </c:if>
          <c:if test="${not empty mensagemSucesso}">
            <div id="divMensagem" class="alert alert-success"
              role="alert">${mensagemSucesso}</div>
          </c:if>
          <form:form action="${alterar}" modelAttribute="usuario">
            <h4 class="text-center">
              <kbd class="text-capitalize">${usuario.papel.nome}</kbd>
            </h4>
            <form:hidden path="id" />
            <form:hidden path="papel" />
            <div class="form-row">
              <div class="form-group col-md-6">
                <label for="nome">Nome</label>
                <form:input cssClass="form-control" path="nome"
                  cssErrorClass="form-control is-invalid" />
                <div class="invalid-feedback">
                  <form:errors path="nome" cssClass="error" />
                </div>
              </div>
              <div class="form-group col-md-6">
                <label for="sobrenome">Sobrenome</label>
                <form:input cssClass="form-control" path="sobrenome"
                  cssErrorClass="form-control is-invalid" />
                <div class="invalid-feedback">
                  <form:errors path="sobrenome" cssClass="error" />
                </div>
              </div>
            </div>
            <div class="form-row">
              <div class="form-group col-md-6">
                <label for="sobrenome">Email</label>
                  <form:input type="email" readonly="true"
                    cssClass="form-control-plaintext" path="email"
                    cssErrorClass="form-control-plaintext is-invalid" />
                <div class="invalid-feedback">
                  <form:errors path="email" cssClass="error" />
                </div>
              </div>
              <div class="form-group col-md-6">
                <label for="telefone">Telefone</label>
                <form:input cssClass="form-control" path="telefone"
                  cssErrorClass="form-control is-invalid" />
                <div class="invalid-feedback">
                  <form:errors path="telefone" cssClass="error" />
                </div>
              </div>
            </div>
            <div class="form-row">
              <div class="form-group col-md-6">
                <label for="senha">Senha</label>
                <form:input cssClass="form-control" path="senha"
                  type="password" id="senhaInput"
                  cssErrorClass="form-control is-invalid" maxlength="16" />
                <div class="invalid-feedback">
                  <span id="senhaErro"></span>
                  <form:errors path="senha" cssClass="error" />
                </div>
              </div>
              <div class="form-group col-md-6">
                <label for="confirmaSenha">Confirme sua Senha</label> <input
                  class="form-control" value="" type="password" maxlength="16"
                  id="confirmaSenha" />
                <div class="invalid-feedback">
                  <span>As senhas nao batem.</span>
                </div>
              </div>
            </div>
            <div class="mx-auto mt-3 text-center">
              <button type="submit" class="btn btn-success">Salvar
                Alterações</button>
              <a href="${home}" class="btn btn-primary">Retornar ao
                inicio</a>
            </div>
          </form:form>
        </div>
      </div>
    </div>
  </div>
  <script type="text/javascript">
			var tamanhoMaxSenha = 16;
			var tamanhoMinSenha = 6;

			$("#confirmaSenha").blur(
					function() {
						var senha = $("#senhaInput").val();
						var confirmaSenha = $("#confirmaSenha").val();

						if (senha != confirmaSenha) {
							document.getElementById("confirmaSenha").classList
									.add("is-invalid");
							document.getElementById("submit").classList
									.add("btn-secondary");
							document.getElementById("submit").classList
									.remove("btn-success");
							$('#submit').prop('disabled', true);
						} else {
							document.getElementById("confirmaSenha").classList
									.remove("is-invalid");
							document.getElementById("submit").classList
									.remove("btn-secondary");
							document.getElementById("submit").classList
									.add("btn-success");
							$('#submit').prop('disabled', false);
						}
					});

			$("#senhaInput")
					.blur(
							function() {
								var tamanhoInputSenha = $("#senhaInput").val().length;
								console.log(tamanhoInputSenha);
								console.log("teste");
								if ((tamanhoInputSenha > 15)) {
									document.getElementById("senhaInput").classList
											.add("is-invalid");
									$("#senhaErro")
											.text(
													"Atenção! sua senha chegou ao tamanho maximo de 16 caracteres");
									setTimeout(invalidTime(), 5000);
								} else if (tamanhoInputSenha < 6) {
									document.getElementById("senhaInput").classList
											.add("is-invalid");
									$("#senhaErro")
											.text(
													"Sua senha deve ter no minimo 6 caracteres");

								} else {
									document.getElementById("senhaInput").classList
											.remove("is-invalid");
								}
							});

			$("#nome").blur(function() {

			});

			function invalidTime() {
				return function() {
					document.getElementById("senhaInput").classList
							.remove("is-invalid");
				}
			}
		</script>
</body>
</html>