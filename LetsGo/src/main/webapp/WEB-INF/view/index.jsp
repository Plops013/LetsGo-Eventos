
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Casa De Show - </title>
<spring:url value="/evento/" var="eventoIndex"></spring:url>
<link href="css/bootstrap.min.css" rel="stylesheet" />
<link href="css/style.css" rel="stylesheet" />
<script type="text/javascript" src="/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
</head>
<body>
	<jsp:include page="${request.contextPath}/nav"></jsp:include>
	<div class="container mt-3">
		<div class="row">
      <c:forEach var="evento" items="${eventos}">
			<div class="col-lg-4 mb-3">
				<div class="card">
					<img class="card-img-top w-100" 
                        style="height: 180px"
						src="data:image/jpge;base64,${evento.imagemEncoded}"
						alt="imagemEvento">
					<div class="text-center card-body py-1">
						<h5 class="card-title pt-2 pb-0 mb-1">${evento.nome}</h5>
						<a href="${eventoIndex}${evento.id}" class="mb-1 stretched-link">mais detalhes...</a>
					</div>
					<div class="card-footer text-muted pt-0">
					<p class="text-center my-0">${evento.dataString }</p>
					<p class="text-center my-0">Ingressos Disponíveis: <span class="text-success">${evento.quantidadeIngressos}</span></p>
					</div>
				</div>
			</div>
      </c:forEach>
		</div>
	</div>
</body>
</html>