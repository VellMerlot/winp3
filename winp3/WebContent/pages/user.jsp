<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@page session="true"%>
<!DOCTYPE html>

<html>
	<head>
	    <meta charset="UTF-8">
	    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="description" content="">
		<meta name="author" content="">
		<link rel="icon" href="<c:url value='/img/favicon.ico' />">
	
    	<title>Gestión de Usuarios</title>

	 	<!-- Bootstrap core CSS -->
    	<link href="<c:url value='/static/css/bootstrap.min.css'/>" rel="stylesheet">
	    
	    <!-- Custom styles for this template -->
    	<link rel="stylesheet" href="<c:url value='/static/css/bootstrap-yeti.min.css' />">
    	<link rel="stylesheet" href="<c:url value='/static/css/main.css' />">
    
    	<script src="<c:url value='/static/js/home.js' />"></script>
	</head>

  <body> 
  
  	<%@ include file="navbar.jsp" %>
  	<%@ include file="logout.jsp" %>
  	
	<div class="container">

			<div class="jumbotron">
				<h1>Gestión de usuarios</h1>
				<p>Alta, baja y modificación de usuarios registrados</p>
			</div>
		
			<div class="page-header">
	        	<h1>Listado de usuarios</h1>
	      	</div>
	      	
			<div class="row" style="padding-top: 5%;">
				<div class="col-md-12">
		          <table class="table table-striped table-hover" id="tabla">
		            <thead>
		              <tr>
		              	<th>Nombre de usuario</th>
						<th>Nombre</th>
						<th>Apellido</th>
						<th>Email</th>
						<th>Estado</th>
						<th>Rol</th>
						<th>Acciones</th>
		              </tr>
		            </thead>
		            <tbody>		             
		            </tbody>
		          </table>
		        </div>				
			</div>
			<!--/row-->
			<hr>
			<footer>
			<p>footer.label.copyright</p>
			</footer>
		</div>
				
		
	    
	    <!-- Placed at the end of the document so the pages load faster -->
		<script type="text/javascript" src="<c:url value='/static/js/jquery.min.js' />"></script>
		<script type="text/javascript" src="<c:url value='/static/js/bootstrap.min.js' />"></script>
		<script type="text/javascript" src="<c:url value='/static/js/user.js' />"></script>
				
	</body>
</html>