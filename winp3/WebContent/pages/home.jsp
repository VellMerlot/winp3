<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>

<%@ include file="head.jsp"%>

<title>Inicio</title>

<style type="text/css">
html {
  position: relative;
  min-height: 100%;
}
body {
  /* Margin bottom by footer height */
  margin-bottom: 60px;
}
.footer {
	position: absolute;
	bottom: 0;
	width: 100%;
	/* Set the fixed height of the footer here */
	height: 60px;
	background-color: #f5f5f5;
}
</style>
</head>
<body>
	<%@ include file="navbar.jsp"%>
	<%@ include file="logout.jsp"%>

	<div class="container">
		<div class="jumbotron">
			<h1>Simulador</h1>
			<p>This is a simple hero unit, a simple jumbotron-style component
				for calling extra attention to featured content or information.</p>
			<p>
				<a class="btn btn-primary btn-lg">Comenzar simulación</a>
			</p>
		</div>
		<sec:authorize access="hasRole('ADMIN')">
			<div class="jumbotron">
				<h1>Configuración</h1>
				<p>This is a simple hero unit, a simple jumbotron-style
					component for calling extra attention to featured content or
					information.</p>
				<p>
					<a href="<c:url value='/web/pages/configuration' />"
						class="btn btn-primary btn-lg">Learn more</a>
				</p>
			</div>
			<div class="jumbotron">
				<h1>Gestión de usuario</h1>
				<p>This is a simple hero unit, a simple jumbotron-style
					component for calling extra attention to featured content or
					information.</p>
				<p>
					<a href="<c:url value='/web/pages/users' />"
						class="btn btn-primary btn-lg">Learn more</a>
				</p>
			</div>
		</sec:authorize>
		
	</div>
	
	<%@ include file="footer.jsp"%>
</body>
</html>