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
  
  <title>Configuración de constantes</title>
</head> 

<body>
  	<%@ include file="navbar.jsp" %>
  	<%@ include file="logout.jsp" %>
  	
  	<div class="container">
		<h1>Configuración de constantes</h1>
		
		<br>
		<form class="form-horizontal">
		  <fieldset>
		    <legend>Parámetros generales</legend>
		    <div class="form-group">
		      <label for="inputEmail" class="col-lg-2 control-label">IPC</label>
		      <div class="col-lg-10 input-group">
		      <span class="input-group-addon">&#37;</span>
		        <input type="text" class="form-control" id="inputEmail" placeholder="...">
		      </div>
		    </div>
		    <div class="form-group">
		      <label for="inputPassword" class="col-lg-2 control-label">Rentabilidad Estimada</label>
		     <div class="col-lg-10 input-group">
		      <span class="input-group-addon">&#37;</span>
		        <input type="text" class="form-control" id="inputEmail" placeholder="...">
		      </div>
		    </div>
		     <div class="form-group">
		      <label for="inputPassword" class="col-lg-2 control-label">Tipo de cotización Autónomos</label>
		     <div class="col-lg-10 input-group">
		      <span class="input-group-addon">&#37;</span>
		        <input type="text" class="form-control" id="inputEmail" placeholder="...">
		      </div>
		    </div>
		     <div class="form-group">
		      <label for="inputPassword" class="col-lg-2 control-label">Edad Dependencia</label>
		     <div class="col-lg-10 input-group">
		      <span class="input-group-addon">años</span>
		        <input type="text" class="form-control" id="inputEmail" placeholder="...">
		      </div>
		    </div>
		     <div class="form-group">
		      <label for="inputPassword" class="col-lg-2 control-label">Edad Renta Pias</label>
		     <div class="col-lg-10 input-group">
		      <span class="input-group-addon">años</span>
		        <input type="text" class="form-control" id="inputEmail" placeholder="...">
		      </div>
		    </div>
		    </fieldset>
		     <fieldset>
		    <legend>Coste de fallecimiento</legend>
		     <div class="form-group">
		      <label for="inputPassword" class="col-lg-2 control-label">Gastos de entierro</label>
		     <div class="col-lg-10 input-group">
		     <span class="input-group-addon">&#8364;</span>
		        <input type="text" class="form-control" id="inputEmail" placeholder="...">
		      </div>
		    </div>
		     <div class="form-group">
		      <label for="inputPassword" class="col-lg-2 control-label">Costes de aceptación Herencia</label>
		     <div class="col-lg-10 input-group">
		     <span class="input-group-addon">&#8364;</span>
		        <input type="text" class="form-control" id="inputEmail" placeholder="...">
		      </div>
		    </div>
		    </fieldset>
		     <fieldset>
		    <legend>Coste de Incapacidad</legend>
		     <div class="form-group">
		      <label for="inputPassword" class="col-lg-2 control-label">Adaptación Vivienda</label>
		     <div class="col-lg-10 input-group">
		      <span class="input-group-addon">&#8364;</span>
		        <input type="text" class="form-control" id="inputEmail" placeholder="...">
		        
		      </div>
		    </div>
		     <div class="form-group">
		      <label for="inputPassword" class="col-lg-2 control-label">Adaptación Vehículo y otros</label>
		     <div class="col-lg-10 input-group">
		     <span class="input-group-addon">&#8364;</span>
		        <input type="text" class="form-control" id="inputEmail" placeholder="...">
		      </div>
		    </div>
		  </fieldset>
		  
		  <div class="col-lg-8">
        <button type="reset" class="btn btn-default">Cancel</button>
        <button type="submit" class="btn btn-primary">Submit</button>
      </div>
      

<div class="form-group">
  <label class="control-label">Input addons</label>
  <div class="input-group">
    <span class="input-group-addon">$</span>
    <input type="text" class="form-control">
    <span class="input-group-btn">
      <button class="btn btn-default" type="button">Button</button>
    </span>
  </div>
</div>
		</form>
		
		<div class="btn-group btn-group-justified">
			<a href="#" class="btn btn-primary">Guardar</a>
		</div>
	</div>
	
	
<div class="container-fluid">
  <div class="text-center">
    <h1>Bootstrap forms</h1>
  </div>
  <form class="form-horizontal" role="form">
    <div class="row">
      <div class="col-sm-6 col-lg-4">
        <div class="form-group">
          <label for="inputEmail" class="col-md-4 control-label">Email:</label>
          <div class="col-md-8 input-group">
            <input type="email" class="form-control" id="inputEmail" placeholder="Email">
            <span class="input-group-addon">años</span>
          </div>
        </div>
      </div>
      <div class="col-sm-6 col-lg-4">
        <div class="form-group">
          <label for="inputPassword" class="col-md-4 control-label">Password:</label>
          <div class="col-md-8">
            <input type="password" class="form-control" id="inputPassword" placeholder="Password">
          </div>
        </div>
      </div>
      <div class="col-sm-6 col-lg-4">
        <div class="form-group">
          <label for="inputLabel3" class="col-md-4 control-label">Label 3:</label>
          <div class="col-md-8">
            <input type="text" class="form-control" id="inputLabel3" placeholder="Label 3">
          </div>
        </div>
      </div>
      <div class="col-sm-6 col-lg-4">
        <div class="form-group">
          <label for="inputLabel4" class="col-md-4 control-label">Label 4:</label>
          <div class="col-md-8">
            <input type="text" class="form-control" id="inputLabel4" placeholder="Label 4">
          </div>
        </div>
      </div>
      <div class="col-sm-6 col-lg-4">
        <div class="form-group">
          <label for="input5" class="col-md-4 control-label">1234567890:</label>
          <div class="col-md-8">
            <input type="text" class="form-control" id="input5" placeholder="input 5">
          </div>
        </div>
      </div>
      <div class="col-sm-6 col-lg-4">
        <div class="form-group">
          <label for="input6" class="col-md-4 control-label">123456789012:</label>
          <div class="col-md-8">
            <input type="text" class="form-control" id="input6" placeholder="input 6">
          </div>
        </div>
      </div>
      <div class="col-sm-6 col-lg-4">
        <div class="form-group">
          <label for="input7" class="col-md-4 control-label">12345678901234:</label>
          <div class="col-md-8">
            <input type="text" class="form-control" id="input7" placeholder="input 7">
          </div>
        </div>
      </div>
      <div class="col-sm-6 col-lg-4">
        <div class="form-group">
          <label for="input8" class="col-md-4 control-label">1234567890123456:</label>
          <div class="col-md-8">
            <input type="text" class="form-control" id="input8" placeholder="input 8">
          </div>
        </div>
      </div>
      <div class="col-sm-6 col-lg-4">
        <div class="form-group">
          <label for="input9" class="col-md-4 control-label">123456789012345678:</label>
          <div class="col-md-8">
            <input type="text" class="form-control" id="input9" placeholder="input 9">
          </div>
        </div>
      </div>
      <div class="col-sm-6 col-lg-4">
        <div class="form-group">
          <label for="input10" class="col-md-4 control-label">12345678901234567890:</label>
          <div class="col-md-8">
            <input type="text" class="form-control" id="input10" placeholder="input 10">
          </div>
        </div>
      </div>
    </div><!-- /.row this actually does not appear to be needed with the form-horizontal -->
  </form>
</div><!-- /.container -->
</body>
</html>