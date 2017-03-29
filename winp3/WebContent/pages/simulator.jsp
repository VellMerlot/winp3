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
  	
  	<script type="text/javascript">
        $(function () {
            $('#datetimepicker1').datetimepicker();
        });
    </script>
  	
  	<div class="container">
		
	 	<div class="jumbotron">
			<h1>WinP3</h1>
			<p>Realizar una simulaci�n</p>
			
			<c:if test="${not empty message_info}">
				<div class="alert alert-dismissible alert-success" id="updatedAlertOK">
					<button type="button" class="close" data-dismiss="alert">&times;</button>
					<strong>OK!</strong> Se han guardado las configuraci�n de constantes correctamente.
				</div>
			</c:if>
			<c:if test="${not empty message_error}">
				<div class="alert alert-dismissible alert-danger" id="updatedAlertError">
					<button type="button" class="close" data-dismiss="alert">&times;</button>
					<strong>�Atenci�n!</strong> Ha ocurrido un error al guardar la configuraci�n de constantes.
				</div>
			</c:if>
			
		</div>
		
		
		<form name="form">
	    	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	    	
	    	<input type="hidden" name="id" value="1" />
	    	<input type="hidden" name="name" value="Form_simulator" />
	    	
			<div data-wizard-init>
		  		<ul class="steps">
					<li data-step="1">Toma de Datos Personal</li>
					<li data-step="2">Toma de Datos Econ�micos</li>
					<li data-step="3">Visionado de Resultados</li>
		  		</ul>
				  <div class="steps-content">
					<div data-step="1">
					  <div class="row">
							<fieldset>
								<legend>Cuestionario Titular</legend>
								<div class="col-sm-6 col-lg-4">
									<div class="form-group">
										<label for="inputEmail" class="col-md-4 control-label">Nombre:</label>
										<div class="col-md-8 input-group">
											<input type="text" class="form-control" name="nombre"
												placeholder="" value="">
										</div>
									</div>
								</div>
								<div class="col-sm-6 col-lg-4">
									<div class="form-group">
										<label for="inputPassword" class="col-md-4 control-label">Sexo:</label>
										<div class="col-md-8 input-group">
											<label class="radio-inline"><input type="radio" name="optradio">Hombre</label>
											<label class="radio-inline"><input type="radio" name="optradio">Mujer</label>
										</div>
									</div>
								</div>
								<div class="col-sm-6 col-lg-4">
									<div class="form-group">
										<label for="inputLabel3" class="col-md-4 control-label">Fecha de Nacimiento:</label>
										<div class="col-md-8 input-group">
											<div class='input-group date' id='datetimepicker1'>
							                    <input type='text' class="form-control" />
							                    <span class="input-group-addon">
							                        <span class="glyphicon glyphicon-calendar"></span>
							                    </span>
											</div>
										</div>
									</div>
								</div>
								<div class="col-sm-6 col-lg-4">
									<div class="form-group">
										<label for="inputLabel4" class="col-md-4 control-label">�Tiene c�nyuge?</label>
										<div class="col-md-8 input-group">
											<label class="radio-inline"><input type="radio" name="optradio" onclick="tieneConyuge(1);">Si</label>
											<label class="radio-inline"><input type="radio" name="optradio" onclick="tieneConyuge(0);">No</label>
										</div>
									</div>
								</div>
								<div class="col-sm-6 col-lg-4">
									<div class="form-group">
										<label for="input5" class="col-md-4 control-label">N�mero de hijos:</label>
										<div class="col-md-8 input-group">
											<input type="text" class="form-control" name="edadRenta"
												placeholder="" value="${configurationForm.edadRenta}">
										</div>
									</div>
								</div>
								<div class="col-sm-6 col-lg-4">
									<div class="form-group">
										<label for="sel1">Comunidad de Residencia:</label>
										<select class="form-control" id="sel1">
										  	<option>Andaluc�a</option>
											<option>Arag�n</option>
											<option>Asturias</option>
											<option>Baleares</option>
											<option>Canarias</option>
											<option>Cantabria</option>
											<option>Castilla y Le�n</option>
											<option>Castilla-La Mancha</option>
											<option>Catalu�a</option>
											<option>Comunidad Valenciana</option>
											<option>Extremadura</option>
											<option>Galicia</option>
											<option>La Rioja</option>
											<option>Madrid</option>
											<option>Murcia</option>
											<option>Navarra</option>
											<option>Guipuzcoa</option>
											<option>Alava</option>
											<option>Vizcaya</option>
										</select>
									</div>
								</div>
								<div class="col-sm-6 col-lg-4">
									<div class="form-group">
										<label for="inputEmail" class="col-md-4 control-label">Edad:</label>
										<div class="col-md-8 input-group">
											<input type="text" class="form-control" name="nombre"
												placeholder="" value="">
										</div>
									</div>
								</div>
							</fieldset>
							<fieldset id="conyugeForm">
								<legend>Cuestionario C�nyuge</legend>
								<div class="col-sm-6 col-lg-4">
									<div class="form-group">
										<label for="inputEmail" class="col-md-4 control-label">Nombre:</label>
										<div class="col-md-8 input-group">
											<input type="text" class="form-control" name="nombre"
												placeholder="" value="">
										</div>
									</div>
								</div>
								<div class="col-sm-6 col-lg-4">
									<div class="form-group">
										<label for="inputPassword" class="col-md-4 control-label">Sexo:</label>
										<div class="col-md-8 input-group">
											<label class="radio-inline"><input type="radio" name="optradio">Hombre</label>
											<label class="radio-inline"><input type="radio" name="optradio">Mujer</label>
										</div>
									</div>
								</div>
								<div class="col-sm-6 col-lg-4">
									<div class="form-group">
										<label for="inputLabel3" class="col-md-4 control-label">Fecha de Nacimiento:</label>
										<div class="col-md-8 input-group">
											<div class='input-group date' id='datetimepicker1'>
							                    <input type='text' class="form-control" />
							                    <span class="input-group-addon">
							                        <span class="glyphicon glyphicon-calendar"></span>
							                    </span>
											</div>
										</div>
									</div>
								</div>
								<div class="col-sm-6 col-lg-4">
									<div class="form-group">
										<label for="inputEmail" class="col-md-4 control-label">Edad:</label>
										<div class="col-md-8 input-group">
											<input type="text" class="form-control" name="nombre"
												placeholder="" value="">
										</div>
									</div>
								</div>
							</fieldset>
							<!-- /.row this actually does not appear to be needed with the form-horizontal -->
						</div>
					</div>
					<div data-step="2">
					   <div class="row">
							<fieldset>
								<legend>Situaci�n Seguridad Social (Titular)</legend>
								<div class="col-sm-6 col-lg-4">
									<div class="form-group">
										<label for="inputEmail" class="col-md-4 control-label">R�gimen de la seguridad Social:</label>
										<div class="col-md-8 input-group">
											<select class="form-control" id="sel1">
											  	<option>Aut�nomo</option>
												<option>Regimen General</option>
												<option>Ambos</option>
												<option>Ninguno</option>
											</select>
										</div>
									</div>
								</div>
								<div class="col-sm-6 col-lg-4">
									<div class="form-group">
										<label for="inputPassword" class="col-md-4 control-label">Tiempo cotizado en la Seguridad Social hasta hoy (R�gimen General):</label>
										<div class="col-md-8 input-group">
											<input type="text" class="form-control" name="edadRenta"
												placeholder="" value="${configurationForm.edadRenta}">
										</div>
									</div>
								</div>
								<div class="col-sm-6 col-lg-4">
									<div class="form-group">
										<label for="inputPassword" class="col-md-4 control-label">Tiempo cotizado en la Seguridad Social hasta hoy (R�gimen Aut�nomo):</label>
										<div class="col-md-8 input-group">
											<input type="text" class="form-control" name="edadRenta"
												placeholder="" value="${configurationForm.edadRenta}">
										</div>
									</div>
								</div>
								<div class="col-sm-6 col-lg-4">
									<div class="form-group">
										<label for="inputPassword" class="col-md-4 control-label">Tiempo no simult�neo a RG:</label>
										<div class="col-md-8 input-group">
											<input type="text" class="form-control" name="edadRenta"
												placeholder="" value="${configurationForm.edadRenta}">
										</div>
									</div>
								</div>
							</fieldset>
							<fieldset>
								<legend>Situaci�n Seguridad Social (C�nyuge)</legend>
								<div class="col-sm-6 col-lg-4">
									<div class="form-group">
										<label for="inputEmail" class="col-md-4 control-label">R�gimen de la seguridad Social:</label>
										<div class="col-md-8 input-group">
											<select class="form-control" id="sel1">
											  	<option>Aut�nomo</option>
												<option>Regimen General</option>
												<option>Ambos</option>
												<option>Ninguno</option>
											</select>
										</div>
									</div>
								</div>
								<div class="col-sm-6 col-lg-4">
									<div class="form-group">
										<label for="inputPassword" class="col-md-4 control-label">Tiempo cotizado en la Seguridad Social hasta hoy (R�gimen General):</label>
										<div class="col-md-8 input-group">
											<input type="text" class="form-control" name="edadRenta"
												placeholder="" value="${configurationForm.edadRenta}">
										</div>
									</div>
								</div>
								<div class="col-sm-6 col-lg-4">
									<div class="form-group">
										<label for="inputPassword" class="col-md-4 control-label">Tiempo cotizado en la Seguridad Social hasta hoy (R�gimen Aut�nomo):</label>
										<div class="col-md-8 input-group">
											<input type="text" class="form-control" name="edadRenta"
												placeholder="" value="${configurationForm.edadRenta}">
										</div>
									</div>
								</div>
								<div class="col-sm-6 col-lg-4">
									<div class="form-group">
										<label for="inputPassword" class="col-md-4 control-label">Tiempo no simult�neo a RG:</label>
										<div class="col-md-8 input-group">
											<input type="text" class="form-control" name="edadRenta"
												placeholder="" value="${configurationForm.edadRenta}">
										</div>
									</div>
								</div>
							</fieldset>
							<!-- /.row this actually does not appear to be needed with the form-horizontal -->
						</div>
						 <div class="row">
							<fieldset>
								<legend>Aut�nomos (Titular)</legend>
								<div class="col-sm-6 col-lg-4">
									<div class="form-group">
										<label for="inputEmail" class="col-md-4 control-label">Cuota mensual:</label>
										<div class="col-md-8 input-group">
											<input type="text" class="form-control" name="edadRenta"
												placeholder="" value="${configurationForm.edadRenta}">
										</div>
									</div>
								</div>
								<div class="col-sm-6 col-lg-4">
									<div class="form-group">
										<label for="inputPassword" class="col-md-4 control-label">Ingreso Bruto Mensual:</label>
										<div class="col-md-8 input-group">
											<input type="text" class="form-control" name="edadRenta"
												placeholder="" value="${configurationForm.edadRenta}">
										</div>
									</div>
								</div>
								<div class="col-sm-6 col-lg-4">
									<div class="form-group">
										<label for="inputPassword" class="col-md-4 control-label">Retenci�n por IRPF:</label>
										<div class="col-md-8 input-group">
											<input type="text" class="form-control" name="edadRenta"
												placeholder="15%" value="${configurationForm.edadRenta}">
										</div>
									</div>
								</div>
								<div class="col-sm-6 col-lg-4">
									<div class="form-group">
										<label for="inputPassword" class="col-md-4 control-label">Neto Mensual (Media):</label>
										<div class="col-md-8 input-group">
											<input type="text" class="form-control" name="edadRenta"
												placeholder="" value="${configurationForm.edadRenta}">
										</div>
									</div>
								</div>
								<div class="col-sm-6 col-lg-4">
									<div class="form-group">
										<label for="inputPassword" class="col-md-4 control-label">Base de Cotizaci�n:</label>
										<div class="col-md-8 input-group">
											<input type="text" class="form-control" name="edadRenta"
												placeholder="" value="${configurationForm.edadRenta}">
										</div>
									</div>
								</div>
							</fieldset>
							<fieldset>
								<legend>Aut�nomos (C�nyuge)</legend>
								<div class="col-sm-6 col-lg-4">
									<div class="form-group">
										<label for="inputEmail" class="col-md-4 control-label">Cuota mensual:</label>
										<div class="col-md-8 input-group">
											<input type="text" class="form-control" name="edadRenta"
												placeholder="" value="${configurationForm.edadRenta}">
										</div>
									</div>
								</div>
								<div class="col-sm-6 col-lg-4">
									<div class="form-group">
										<label for="inputPassword" class="col-md-4 control-label">Ingreso Bruto Mensual:</label>
										<div class="col-md-8 input-group">
											<input type="text" class="form-control" name="edadRenta"
												placeholder="" value="${configurationForm.edadRenta}">
										</div>
									</div>
								</div>
								<div class="col-sm-6 col-lg-4">
									<div class="form-group">
										<label for="inputPassword" class="col-md-4 control-label">Retenci�n por IRPF:</label>
										<div class="col-md-8 input-group">
											<input type="text" class="form-control" name="edadRenta"
												placeholder="15%" value="${configurationForm.edadRenta}">
										</div>
									</div>
								</div>
								<div class="col-sm-6 col-lg-4">
									<div class="form-group">
										<label for="inputPassword" class="col-md-4 control-label">Neto Mensual (Media):</label>
										<div class="col-md-8 input-group">
											<input type="text" class="form-control" name="edadRenta"
												placeholder="" value="${configurationForm.edadRenta}">
										</div>
									</div>
								</div>
								<div class="col-sm-6 col-lg-4">
									<div class="form-group">
										<label for="inputPassword" class="col-md-4 control-label">Base de Cotizaci�n:</label>
										<div class="col-md-8 input-group">
											<input type="text" class="form-control" name="edadRenta"
												placeholder="" value="${configurationForm.edadRenta}">
										</div>
									</div>
								</div>
							</fieldset>
							<!-- /.row this actually does not appear to be needed with the form-horizontal -->
						</div>
					</div>
					<div data-step="3">
					  <div class="row">
							<fieldset>
								<legend>En construcci�n</legend>
								<div class="col-sm-6 col-lg-4">
								</div>
							</fieldset>
						</div>
					</div>
					
				</div>
			</div>
		</form>
    </div><!--/.container-->
	
	<%@ include file="footer.jsp" %>
	<script type="text/javascript" src="<c:url value='/static/js/jquery.wizard.js' />"></script>
	<script type="text/javascript" src="<c:url value='/static/js/mfupload.js' />"></script>
	<script type="text/javascript" src="<c:url value='/static/js/simulator.js' />"></script>
</body>
</html>