<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<spring:url value="/" var="home"></spring:url>
<spring:url value="./cadastrar" var="voltar"></spring:url>
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
      <a href="${voltar}" class="text-left text-white">voltar</a>
    </div>
    <div class="card">
      <div class="card-body">
        <h5>Codigo do erro: ${erroCodigo}</h5>
        <p>Erro: ${erroMensagem}</p>
      </div>
    </div>
  </div>

</body>
</html>