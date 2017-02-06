<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>

<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
  <link rel="stylesheet" href="<c:url value='/static/css/bootstrap-yeti.min.css' />">
  <link rel="stylesheet" href="<c:url value='/static/css/main.css' />">
  
  <script src="<c:url value='/static/js/jquery.min.js' />"></script>
  <script src="<c:url value='/static/js/bootstrap.min.js' />"></script>
  <script src="<c:url value='/static/js/home.js' />"></script>
  
  <title>Inicio</title>
  
</head> 
<body>	
  	<%@ include file="navbar.jsp" %>
  	<%@ include file="logout.jsp" %>
  	
  	<div class="container">
		<div class="jumbotron">
		  <h1>Simulador</h1>
		  <p>This is a simple hero unit, a simple jumbotron-style component for calling extra attention to featured content or information.</p>
		  <p><a class="btn btn-primary btn-lg">Comenzar simulación</a></p>
		</div>
		<sec:authorize access="hasRole('ADMIN')">
			<div class="jumbotron">
			  <h1>Configuración</h1>
			  <p>This is a simple hero unit, a simple jumbotron-style component for calling extra attention to featured content or information.</p>
			  <p><a class="btn btn-primary btn-lg">Learn more</a></p>
			</div>
			<div class="jumbotron">
			  <h1>Gestión de usuario</h1>
			  <p>This is a simple hero unit, a simple jumbotron-style component for calling extra attention to featured content or information.</p>
			  <p><a class="btn btn-primary btn-lg">Learn more</a></p>
			</div>
		</sec:authorize>
  	</div>
</body>
</html>