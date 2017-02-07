<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
  <link rel="stylesheet" href="<c:url value='/static/css/bootstrap-yeti.min.css' />">
  <link rel="stylesheet" href="<c:url value='/static/css/agency.css' />">
  
  <script src="<c:url value='/static/js/jquery.min.js' />"></script>
  <script src="<c:url value='/static/js/bootstrap.min.js' />"></script>
  <script src="<c:url value='/static/js/login.js' />"></script>

</head>
<body>

<header>
    <div class="container">
        <div class="intro-text">
            <div class="intro-heading">Tu futuro.</div>
            <div class="intro-lead-in">Limolike y WinP3, protegen, no solo personas y patrimonios, sino también emociones y estilos de vida.</div>
            <a id="knowBtn" href="http://limolike.es/#primary" class="page-scroll btn btn-primary_main btn-lg" style="    font: 42px/1.1 "Raleway", sans-serif;">Quiero saber más</a>
            <a id="myBtn" href="#" class="page-scroll btn btn-primary_main btn-lg">Login</a>
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
          <form role="form" name='loginForm' action="<c:url value='/web/j_spring_security_check' />" method='POST'>
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

<footer>
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <span class="copyright">Todos los derechos reservados. 2017 © <a href="http://limolike.es/">Limolike S.L.</a></span>
                </div>
                <div class="col-md-4">
                </div>
                <div class="col-md-4">
                    <ul class="list-inline quicklinks">
                        <li><a href="#">Privacy Policy</a>
                        </li>
                        <li><a href="#">Terms of Use</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </footer>


</body>
</html>