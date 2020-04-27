<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Casa De Show -</title>
<spring:url value="/evento/" var="eventoIndex"></spring:url>
<link href="css/bootstrap.min.css" rel="stylesheet" />
<link href="css/style.css" rel="stylesheet" />
<script type="text/javascript" src="/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
</head>
<body>
  <jsp:include page="${request.contextPath}/nav"></jsp:include>
  <div class="bannerimage pt-2">
  <h1 class="text-white text-center mb-0" style="font-size: 6rem">LetsGo!</h1>
  <h4 class="text-light text-center">Aqui você encontra os melhores Eventos</h4>
  </div>
  <div class="container mt-3">
    <div class="row px-1">
      <c:if test="${not empty eventos}">
        <c:forEach var="evento" items="${eventos}">
          <div class="col-lg-4 mb-3 px-2">
            <div class="card border-dark">
              <img class="card-img-top img-fluid w-100" style="height: 180px"
                src="data:image/jpge;base64,${evento.imagemEncoded}"
                alt="imagemEvento">
              <div class="text-center card-body py-1">
                <h5 class="card-title pt-2 pb-0 mb-1">
                  <a href="${eventoIndex}${evento.id}">${evento.nome}</a>
                </h5>
                <hr class="my-2"/>
                <p class="text-center my-0">
                  <c:if test="${evento.quantidadeIngressos > 0}">Ingressos Disponíveis: <span class="text-success"><i class="fas fa-ticket-alt"></i> ${evento.quantidadeIngressos}</span></c:if>
                  <c:if test="${evento.quantidadeIngressos <= 0}"><span class="text-danger">Ingressos: <i class="fas fa-ticket-alt"></i> ${evento.quantidadeIngressos}</span></c:if>  
                </p>
                <p class="text-center my-0"><i class="fas fa-map-marked-alt"></i> ${evento.casaDeShow.cidade}
                  - ${evento.casaDeShow.estado}</p>
                <p class="text-center my-0"><i class="far fa-calendar-alt"></i> ${evento.dataString }</p>

              </div>

            </div>
          </div>
        </c:forEach>
      </c:if>
      <c:if test="${empty eventos}">
        <div class="text-center mx-auto">
          <h3 class="text-center text-danger my-5">Não há eventos
            disponiveis no momento, volte novamente mais tarde!</h3>
        </div>
      </c:if>
    </div>
  </div>

</body>
</html>