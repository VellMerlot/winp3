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
		  
		  <div class="col-lg-10 col-lg-offset-2">
        <button type="reset" class="btn btn-default">Cancel</button>
        <button type="submit" class="btn btn-primary">Submit</button>
      </div>
      
      <div class="form-group">
  <label class="control-label" for="focusedInput">Focused input</label>
  <input class="form-control" id="focusedInput" type="text" value="This is focused...">
</div>

<div class="form-group">
  <label class="control-label" for="disabledInput">Disabled input</label>
  <input class="form-control" id="disabledInput" type="text" placeholder="Disabled input here..." disabled="">
</div>

<div class="form-group has-warning">
  <label class="control-label" for="inputWarning">Input warning</label>
  <input type="text" class="form-control" id="inputWarning">
</div>

<div class="form-group has-error">
  <label class="control-label" for="inputError">Input error</label>
  <input type="text" class="form-control" id="inputError">
</div>

<div class="form-group has-success">
  <label class="control-label" for="inputSuccess">Input success</label>
  <input type="text" class="form-control" id="inputSuccess">
</div>

<div class="form-group">
  <label class="control-label" for="inputLarge">Large input</label>
  <input class="form-control input-lg" type="text" id="inputLarge">
</div>

<div class="form-group">
  <label class="control-label" for="inputDefault">Default input</label>
  <input type="text" class="form-control" id="inputDefault">
</div>

<div class="form-group">
  <label class="control-label" for="inputSmall">Small input</label>
  <input class="form-control input-sm" type="text" id="inputSmall">
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
</body>
</html>