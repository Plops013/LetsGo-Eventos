<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<spring:url value="/usuario/cadastrar" var="cadastrar"></spring:url>
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
		<div class="form-group text-left py-0 my-0">
			<a href="${home}" class="text-left text-white">voltar</a>
		</div>
		<div class="card mb-4">
			<div class="card-body bg-light">
				<h1 class="text-center">Cadastro De Usuario</h1>
				<c:if test="${not empty mensagemErro}">
					<div id="divMensagem" class="alert alert-danger" role="alert">
						${mensagemErro}</div>
				</c:if>
				<c:if test="${not empty mensagemSucesso}">
					<div id="divMensagem" class="alert alert-success" role="alert">
						${mensagemSucesso}</div>
				</c:if>
				<form:form cssClass="" action="salva" modelAttribute="usuario">
					<form:hidden path="id" />
					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="nome">Nome</label>
							<form:input cssClass="form-control" path="nome" />
						</div>
						<div class="form-group col-md-6">
							<label for="sobrenome">Sobrenome</label>
							<form:input cssClass="form-control" path="sobrenome" />
						</div>
					</div>
					<div class="form-group">
						<label for="sobrenome">Email</label>
						<form:input cssClass="form-control" path="email" />
					</div>
					<div class="form-group">
						<label for="sobrenome">Telefone</label>
						<form:input cssClass="form-control col-md-6" path="telefone" />
					</div>
					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="senha">Senha</label>
							<form:input cssClass="form-control" path="senha" type="password" />
						</div>
						<div class="form-group col-md-6">
							<label for="confirmaSenha">Confirme sua Senha</label> <input
								class="form-control" type="password" id="confirmaSenha" />
						</div>
					</div>
					<p class="text-center">Escolha se você:</p>
					<div class="form group mx-auto text-center">
						<div class="custom-control custom-radio custom-control-inline">
							<input type="radio" id="customRadioInline1"
								name="radioPapel" value="cliente" checked class="custom-control-input">
							<label class="custom-control-label" for="customRadioInline1">Quero
								ir em Eventos</label>
						</div>
						<div class="custom-control custom-radio custom-control-inline">
							<input type="radio" id="customRadioInline2"
								name="radioPapel" value="organizador" class="custom-control-input">
							<label class="custom-control-label" for="customRadioInline2">Eu
								organizo Eventos</label>
						</div>
					</div>
					<div class="form-group">
						<div class="custom-control custom-checkbox text-center">
							<input class="form-check-input custom-control-input"
								id="checkBoxTermos" name="checkBoxTermos" type="checkbox">
							<label for="checkBoxTermos" class="custom-control-label"
								for="gridCheck"> Concordo com <a href="#modalTermos"
								data-toggle="modal" data-target="#modalTermos">termos de
									uso.</a>
							</label>
						</div>
					</div>
					<div class="mx-auto text-center">
						<button type="submit" class="btn btn-success">Cadastrar-se</button>
						<button type="reset" class="btn btn-danger">Limpar
							Formulario</button>
					</div>
				</form:form>
			</div>
		</div>
	</div>
	<div id="modalTermos" class="modal fade" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-scrollable">
			<div class="modal-content">
				<div class="modal-header">
					<h3>Termos de Uso</h3>
					<button type="button" class="close font-weight-light"
						data-dismiss="modal" aria-hidden="true">×</button>
				</div>
				<div class="modal-body">
					<jsp:include page="${request.contextPath}/usuario/termos"></jsp:include>
				</div>
				<div class="modal-footer">
					<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>