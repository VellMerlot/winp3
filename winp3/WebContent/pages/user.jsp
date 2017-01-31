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
    
	</head>

  <body>
  
  <nav class="navbar navbar-inverse navbar-static-top">
    <div class="container">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar3">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="#"><img src="../static/img/logo-winp3.png" alt="WinP3">
        </a>
      </div>
      <div id="navbar3" class="navbar-collapse collapse">
        <ul class="nav navbar-nav navbar-right">
          <li class="active"><a href="#">Home</a></li>
          <li><a href="#">About</a></li>
          <li><a href="#">Contact</a></li>
          <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Dropdown <span class="caret"></span></a>
            <ul class="dropdown-menu" role="menu">
              <li><a href="#">Action</a></li>
              <li><a href="#">Another action</a></li>
              <li><a href="#">Something else here</a></li>
              <li class="divider"></li>
              <li class="dropdown-header">Nav header</li>
              <li><a href="#">Separated link</a></li>
              <li><a href="#">One more separated link</a></li>
            </ul>
          </li>
        </ul>
      </div>
      <!--/.nav-collapse -->
    </div>
    <!--/.container-fluid -->
  </nav>
  
	<div class="container">
	
		<c:url value="/web/j_spring_security_logout" var="logoutUrl" />
		<form action="${logoutUrl}" method="post" id="logoutForm">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		</form>
    	      	    

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