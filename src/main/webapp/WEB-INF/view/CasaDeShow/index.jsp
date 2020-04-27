<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Casa De Show -</title>
<spring:url value="/CasaDeShow/" var="casaDeShowIndex"></spring:url>
<link href="/css/bootstrap.min.css" rel="stylesheet" />
<link href="/css/style.css" rel="stylesheet" />
<script type="text/javascript" src="/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
</head>
<body>
  <jsp:include page="${request.contextPath}/nav"></jsp:include>
  <div class="container mt-3">
    <div class="row px-1">
      <c:forEach var="casaDeShow" items="${casasDeShow }">
        <div class="card mb-3 col-lg-12">
          <div class="row no-gutters">
            <div class="col-md-2">
              <img
                src="data:image/jpge;base64,${casaDeShow.imagemEncoded}"
                class="card-img" alt="Foto da casa de show">
            </div>
            <div class="col-md-8">
              <div class="card-body">
                <h5 class="card-title"><a href="${casaDeShowIndex}${casaDeShow.id}">${casaDeShow.nome}</a></h5>
                <p class="card-text my-0 py-0">Endereço:
                  ${casaDeShow.endereco}, ${casaDeShow.numero} -
                  ${casaDeShow.cidade} - ${casaDeShow.estado}</p>
                <p class="my-0 py-0">Capacidade:
                  ${casaDeShow.capacidade }</p>
                <p class="card-text">
                  <c:if test="${not empty casaDeShow.eventos}">
                    <small class="text-muted">Eventos disponiveis: <c:forEach var="evento" items="${casaDeShow.eventos}">${evento.nome}, </c:forEach></small>
                  </c:if>
                  <c:if test="${empty casaDeShow.eventos}">
                      <small class="text-danger">Essa casa nao tem eventos disponiveis</small>
                  </c:if>
                </p>
              </div>
            </div>
          </div>
        </div>
      </c:forEach>
    </div>
  </div>
</body>
</html>