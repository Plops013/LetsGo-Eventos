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
	<div class="container my-3">
		<div class="card py-3 px-4">
			<form:form>
				<h1 class="text-center py-3 bg-light text-justify">Finalizar
					Compra</h1>
				<div class="row">
					<div class="col-sm-6">
						<h4>Evento:</h4>
						<h5 class="text-justify bg-light px-2 py-2 font-weight-light">Titulo
							do Evento</h5>
						<input id="idEvento" name="idEvento" value="${evento.id}"
							type="hidden" required readonly />
					</div>
					<div class="col-sm-6">
						<h4>Data do Evento:</h4>
						<h5 class="text-justify bg-light px-2 py-2 font-weight-light">Titulo
							do Evento</h5>
					</div>
					<div class="col-sm-6">
						<h4>Valor Do Ingresso Unitario:</h4>
						<h5 class="text-justify bg-light px-2 py-2 font-weight-light">R$:
							50,00</h5>
						<input id="valorUnitario" value="50.00" type="hidden" required
							readonly />
					</div>
					<div class="col-sm-6">
						<h4>Quantidade:</h4>
						<input class="form-control px-2" value="0" id="quantidade"
							type="number" max="4" required />
						<div class="invalid-feedback">Limite de 4 ingressos por
							pessoa.</div>
					</div>
					<div class="col-sm-12">
						<h3 class="text-center">Valor Total:</h3>
						<h4 class="text-justify text-center bg-light px-2 py-2"
							style="text-size: 1.3em">
							R$: <span id="total" class="text-success text-weight-bold">0,00</span>
						</h4>
					</div>
					<a href="${comprar}"
						class="my-4 mx-4 btn btn-block btn-outline-success py-3"> <img
						src="/assets/icons/shopping-cart.svg"> Comprar Ingresso
					</a>
				</div>
			</form:form>
		</div>
	</div>
	<script>
		$("#quantidade").blur(function() {
			if ($(this).val() > 4) {
				document.getElementById("quantidade").classList.add("is-invalid");
				$(this).val(4);
				setTimeout(invalidTime(), 3000);
			}
		});
		function invalidTime(){
		    return function(){
		    	document.getElementById("quantidade").classList.remove("is-invalid");
		    }
		}
		$("#quantidade").mouseleave(function() {
			if ($(this).val() > 4) {
				document.getElementById("quantidade").classList.add("is-invalid");
				$(this).val(4);
				setTimeout(invalidTime(), 3000);
			}
		});
		$("#quantidade").mouseleave(
				function() {
					$("#total").text(
							($(this).val() * $("#valorUnitario").val())
									.toFixed(2).replace(".", ","));
				});
		$("#quantidade").blur(
				function() {
					$("#total").text(
							($(this).val() * $("#valorUnitario").val())
									.toFixed(2).replace(".", ","));
				});
	</script>
</body>
</html>