<nav class="navbar navbar-inverse navbar-static-top">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar3">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#"><img src="<c:url value='/static/img/logo-winp3.png' />" alt="WinP3">
      </a>
    </div>
    <div id="navbar3" class="navbar-collapse collapse">
      <ul class="nav navbar-nav navbar-right">
        <li class="active"><a href="<c:url value='/web/pages' />"><span class="glyphicon glyphicon-home"></span>  Inicio</a></li>
        <li><a href="http://limolike.es/#primary">Sobre Winp3</a></li>
        <li><a href="http://limolike.es/#pg-1813-3">Contacto</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Menú <span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="<c:url value='/web/pages/simulator' />"><span class="glyphicon glyphicon-star"></span> Simulador</a></li>
            <li class="divider"></li>
            <sec:authorize access="hasRole('ADMIN')">
	            <li class="dropdown-header">Administración</li>
	            <li><a href="<c:url value='/web/pages/configuration' />"><span class="glyphicon glyphicon-cog"></span> Configuración</a></li>
	            <li><a href="<c:url value='/web/pages/users' />"><span class="glyphicon glyphicon-user"></span> Gestión de usuarios</a></li>
	            <li class="divider"></li>
            </sec:authorize>
            <li><a href="javascript:logout()"><span class="glyphicon glyphicon-off"></span> Logout</a></li>
          </ul>
        </li>
      </ul>
    </div>
    <!--/.nav-collapse -->
  </div>
  <!--/.container-fluid -->
</nav>