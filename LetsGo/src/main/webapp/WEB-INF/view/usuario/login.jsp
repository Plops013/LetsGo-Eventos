
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
<link href="css/bootstrap.min.css" rel="stylesheet" />
<link href="css/style.css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="bootstrap.min.js"></script>
<meta charset="UTF-8">
</head>
<body>
	<jsp:include page="${request.contextPath}/nav"></jsp:include>
	<div class="container mt-5 pt-5">
		<div class="row justify-content-md-center mt-2">
			<div class="col-8 mx-auto">
				<div class="form-group text-left py-0 my-0">
					<a href="${home}" class="text-left text-white">voltar</a>
				</div>
				<div class="card pt-4">
					<div class="card-body pt-0">
						<h1 class="text-center text-dark display-4">Login</h1>
						<form:form class="form" role="form" action="${loga}"
							modelAttribute="usuario">
							<div class="form-group">
								<input id="username" name="username" placeholder="Email"
									class="form-control form-control-sm" type="text" required>
							</div>
							<div class="form-group">
								<input id="password" name="password" placeholder="Senha"
									class="form-control form-control-sm" type="text" required>
							</div>
							<div class="form-group">
								<button type="submit" class="btn btn-success btn-block">Login</button>
							</div>
							<div class="form-group text-center">
								<small><a href="${cadastrar}" class="text-primary"><strong>Cadastrar-se</strong></a></small>
							</div>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>