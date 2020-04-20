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
						<div id="divMensagem" class="alert alert-danger" role="alert">
							${mensagemErro}</div>
					</c:if>
					<c:if test="${not empty mensagemSucesso}">
						<div id="divMensagem" class="alert alert-success" role="alert">
							${mensagemSucesso}</div>
					</c:if>
					<form:form action="alterar" modelAttribute="usuario">
						<h4 class="text-center">
							<kbd class="text-capitalize">${usuario.papel.nome}</kbd>
						</h4>
						<form:hidden path="id" />
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
								<fieldset disabled>
									<form:input type="email" cssClass="form-control-plaintext"
										path="email" cssErrorClass="form-control is-invalid" />
								</fieldset>
								<div class="invalid-feedback">
									<form:errors path="email" cssClass="error" />
								</div>
							</div>
							<div class="form-group col-md-6">
								<label for="sobrenome">Telefone</label>
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
								<form:input cssClass="form-control" path="senha" type="password"
									cssErrorClass="form-control is-invalid" />
								<div class="invalid-feedback">
									<form:errors path="senha" cssClass="error" />
								</div>
							</div>
							<div class="form-group col-md-6">
								<label for="confirmaSenha">Confirme sua Senha</label> <input
									class="form-control" type="password" id="confirmaSenha" />
							</div>
						</div>
						<div class="mx-auto mt-3 text-center">
							<button type="submit" class="btn btn-success">Salvar
								Alterações</button>
							<a href="${home}" class="btn btn-primary">Retornar ao inicio</a>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>