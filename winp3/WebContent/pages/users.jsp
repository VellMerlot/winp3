<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@page session="true"%>
<!DOCTYPE html>

<html>
	<head>
		<%@ include file="head.jsp" %>
		
    	<title>Gestión de Usuarios</title>
    
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
	      	
	      	<c:if test="${not empty message_error}">
				<div class="alert alert-dismissible alert-danger" id="updatedAlertError">
					<button type="button" class="close" data-dismiss="alert">&times;</button>
					<strong>¡Atención! </strong>${message_error}
				</div>
			</c:if>
			<c:if test="${not empty message_info}">
				<div class="alert alert-dismissible alert-success" id="updatedAlertOK">
					<button type="button" class="close" data-dismiss="alert">&times;</button>
					<strong>OK! </strong>${message_info}
				</div>
			</c:if>
	      				
			
	      	<div class="row" style="padding-top: 2%; text-align: right;">
	      		<div class="col-md-12">
	      	<form name="form" action="<c:url value='/web/pages/users/new' />" method="get">
		        	<button type="submit" class="btn btn-primary">Nuevo usuario</button>
		        </form>	
	      	</div>
	      	</div>
			<div class="row" style="padding-top: 2%;">
				
				<div class="col-md-12">
		          <table class="table table-striped table-hover" id="tabla">
		            <thead>
		              <tr>
		              	<th></th>
		              	<th>Nombre de usuario</th>
						<th>Nombre</th>
						<th>Apellido</th>
						<th>Email</th>
						<th>Estado</th>
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
		</div>
				
		
	    
	    <!-- Placed at the end of the document so the pages load faster -->
	    <%@ include file="footer.jsp" %>
		<script type="text/javascript" src="<c:url value='/static/js/users.js' />"></script>
				
	</body>
</html>