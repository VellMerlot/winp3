<%@ page session="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>

<head>
  <%@ include file="head.jsp" %>

  <link rel="stylesheet" href="<c:url value='/static/css/jquery.wizard.css' />">
  
  
  <title>Simulador</title>
</head> 

<body>
	<%@ include file="navbar.jsp" %>
  	<%@ include file="logout.jsp" %>
  	
  	<div class="container">
		<div class="jumbotron">
			<h1>WinP3</h1>
			<p>Cargar una simulación previamente realizada</p>
			
			<c:if test="${not empty message_info}">
				<div class="alert alert-dismissible alert-success" id="updatedAlertOK">
					<button type="button" class="close" data-dismiss="alert">&times;</button>
					<strong>OK!</strong> Se han guardado las configuración de constantes correctamente.
				</div>
			</c:if>
			<c:if test="${not empty message_error}">
				<div class="alert alert-dismissible alert-danger" id="updatedAlertError">
					<button type="button" class="close" data-dismiss="alert">&times;</button>
					<strong>¡Atención!</strong> Ha ocurrido un error al guardar la configuración de constantes.
				</div>
			</c:if>
			
		</div>
		
		<div id="simActions">
			<div class="row" style="padding-top: 2%; text-align: right;">
  				<div class="col-md-12">	
					<div id="upload"></div>
  				</div>
  			</div>
		</div>
    </div><!--/.container-->
	
	<%@ include file="footer.jsp" %>
	<script type="text/javascript" src="<c:url value='/static/js/mfupload.js' />"></script>
	<script type="text/javascript" src="<c:url value='/static/js/simulator.load.js' />"></script>
</body>
</html>