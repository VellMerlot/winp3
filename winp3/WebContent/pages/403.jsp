<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
  <link rel="stylesheet" href="<c:url value='/static/css/bootstrap-yeti.min.css' />">
  <link rel="stylesheet" href="<c:url value='/static/css/main.css' />">
  
  <script src="<c:url value='/static/js/jquery.min.js' />"></script>
  <script src="<c:url value='/static/js/bootstrap.min.js' />"></script>
  <script src="<c:url value='/static/js/home.js' />"></script>
  
  
  <title>HTTP Status 403 - Acceso denegado</title>
</head> 
<body>	
  	<%@ include file="navbar.jsp" %>
  	<%@ include file="logout.jsp" %>
  	
  	
  	<div class="container">
  	<h1>HTTP Status 403 - Acceso denegado</h1>
 
	<c:choose>
		<c:when test="${empty username}">
		<div class="panel panel-warning">
		  <div class="panel-heading">
		    <h3 class="panel-title">¡Atención!</h3>
		  </div>
		  <div class="panel-body">
		   <p>¡No tienes permisos para acceder a esta página!</p>
		  </div>
		</div>
		</c:when>
		<c:otherwise>
		<div class="panel panel-warning">
		  <div class="panel-heading">
		    <h3 class="panel-title">¡Atención!</h3>
		  </div>
		  <div class="panel-body">
		   <p>Usuario: ${username} ¡No tienes permisos para acceder a esta página!</p>
		  </div>
		</div>
		</c:otherwise>
	</c:choose>
 
 	<a href="<c:url value='/' />">Inicio</a>
 	
 	</div>
</body>
</html>