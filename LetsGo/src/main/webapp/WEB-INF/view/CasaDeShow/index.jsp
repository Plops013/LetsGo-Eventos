<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<div class="container mt-4">
		<div class="card">
			<div class="card-body">
				<div class="row">
					<div class="col-lg-8 mb-3">
						<h1 class="display-4 text-center">Boulevard</h1>
						<hr />
						<h4 class="font-weight-light mt-5 pt-3 text-center">Endereço:
							Av. Pres. Kennedy, 3306 - Praia Grande - SP</h4>
						<h4 class="font-weight-light text-center">Capacidade: 5000</h4>
					</div>
					<div class="col-lg-4 mb-3 mx-auto px-auto">
						<img alt="placeholder" src="/assets/imgs/placeholder_img.png"
							class="d-block mx-auto img-thumbnail"
							style="width: 300px; height: 300px" />
					</div>
				</div>
				<div class="row mb-3">
					<div class="col-lg-12">
						<h1 class="font-weight-light">Eventos:</h1>
					</div>
				</div>
				<div class="row">
					<div class="col-md-2">
						<div class="card border-dark mb-3">
							<div class="card-body py-3">
								<img alt="placeholder" src="/assets/imgs/placeholder_img.png"
									class="d-block mx-auto img-thumbnail"
									style="width: 100px; height: 50px" />
								<p class="small pt-1 pb-0 my-0 text-center">Titulo do Evento</p>
								<p class="my-0 text-center	">
									<a href="#" class="btn btn-success btn-sm py-0 px-1">ver
										evento</a>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>