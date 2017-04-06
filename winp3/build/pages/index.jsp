<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<%@ include file="head.jsp" %>
		
	 	<link rel="stylesheet" href="<c:url value='/static/css/agency.css' />">
	 	
	 	<title>WinP3</title>
	 	
	</head>
<body>

<header>
    <div class="container">
        <div class="intro-text">
            <div class="intro-heading">Tu futuro.</div>
            <div class="intro-lead-in">Limolike y WinP3, protegen, no solo personas y patrimonios, sino también emociones y estilos de vida.</div>
            <a id="knowBtn" href="http://limolike.es/#primary" class="page-scroll btn btn-primary_main" >Quiero saber más</a>
            <a id="myBtn" href="#" class="page-scroll btn btn-primary_main">Entrar</a>
        </div>
    </div>
</header>


<div class="container">
  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header" style="padding:35px 50px;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4><span class="glyphicon glyphicon-lock"></span> Entrar</h4>
        </div>
        <div class="modal-body" style="padding:40px 50px;">
          <form data-toggle="validator" role="form" name="loginForm" action="<c:url value='/web/j_spring_security_check' />" method='POST'>
          <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
          <input type="hidden" name="error" id="error" value="${error}" />
          
            <div class="form-group">
              <label for="username"><span class="glyphicon glyphicon-user"></span> Usuario</label>
              <input class="form-control" placeholder="username" name="username" type="text" required autofocus>
            </div>
            <div class="form-group">
              <label for="psw"><span class="glyphicon glyphicon-eye-open"></span> Contraseña</label>
              <input class="form-control" placeholder="password" name="password" type="password" required value="">
            </div>
              <button type="submit" class="btn btn-primary btn-block"><span class="glyphicon glyphicon-off"></span> Entrar</button>
          </form>
          <br>
          <div class="alert alert-dismissible alert-danger" id="error_msg"></div>
        </div>
        <div class="modal-footer">
        	<p class="text-info">Si olvidó su contraseña, contacte con un administrador.</p>       
        </div>
      </div>
      
    </div>
  </div> 
</div>

	<%@ include file="footer.jsp" %>
	<script src="<c:url value='/static/js/login.js' />"></script>
</body>
</html>