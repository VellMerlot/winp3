<%@ page session="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>

<head>
  <%@ include file="head.jsp" %>

	<link rel="stylesheet" href="<c:url value='/static/css/jquery-ui.css' />">
  	<link rel="stylesheet" href="<c:url value='/static/css/jquery.wizard.css' />">
  
  
  <title>Simulador</title>
</head> 

<body>
	<%@ include file="navbar.jsp" %>
  	<%@ include file="logout.jsp" %>
  	
  	
  	
  	<div class="container">
		
	 	<div class="jumbotron">
			<h1>WinP3</h1>
			<c:if test="${actionType == 'load'}">
				<p>Cargar una simulación</p>
			</c:if>
			<c:if test="${actionType == 'new'}">
				<p>Realizar una simulación</p>
			</c:if>
			
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
		
		<c:if test="${actionType == 'load'}">
			<div id="simActions">
				<div class="row" style="padding-top: 2%; text-align: right;">
	  				<div class="col-md-12">	
						<div id="upload"></div>
	  				</div>
	  			</div>
			</div>
		</c:if>
		
		<c:set var="showForm" value="hidden"/>
		<c:if test="${actionType == 'new'}">
			<c:set var="showForm" value=""/>
		</c:if>
		
		<form id="form" name="form" action="${formActionOutcome}" method="post" class="${showForm}">
	    	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	    	
	    	<input type="hidden" name="id" value="1" />
	    	<input type="hidden" name="name" value="Form_simulator" />
	    	
			<div data-wizard-init>
		  		<ul class="steps">
					<li data-step="1">Toma de Datos Personal</li>
					<li data-step="2">Toma de Datos Económicos</li>
					<li data-step="3">Visionado de Resultados</li>
		  		</ul>
				  <div class="steps-content well bs-component">
					<div data-step="1">
					  <div class="row" id="step1">
							<fieldset id="titularForm">
								<legend>Cuestionario Titular</legend>
									<div class="form-group">
										<label for="inputEmail" class="col-lg-2 control-label">Nombre:</label>
										<div class="col-lg-4 input-group">
											<input type="text" class="form-control" name="nombre" placeholder="" value="">
										</div>
									</div>
									<div class="form-group">
										<label for="inputPassword" class="col-lg-2 control-label">Sexo:</label>
										<div class="col-lg-4 input-group">
											<label class="radio-inline"><input type="radio" name="sexoTitular">Hombre</label>
											<label class="radio-inline"><input type="radio" name="sexoTitular">Mujer</label>
										</div>
									</div>
									<div class="form-group">
										<label for="inputLabel3" class="col-lg-2 control-label">Fecha de Nacimiento:</label>
										<div class="col-lg-4 input-group">
											<div class='input-group date' id='datetimepicker1'>
							                    <input type='text' class="form-control datepicker" id="fechaNacimientoTitular"/>
							                    <span class="input-group-addon">
							                        <span class="glyphicon glyphicon-calendar"></span>
							                    </span>
											</div>
										</div>
									</div>
									<div class="form-group">
										<label for="inputLabel4" class="col-lg-2 control-label">¿Tiene cónyuge?</label>
										<div class="col-lg-4 input-group">
											<label class="radio-inline"><input type="radio" name="tieneConyuge" onclick="javascript:showConyugeForm(true);">Si</label>
											<label class="radio-inline"><input type="radio" name="tieneConyuge" onclick="javascript:showConyugeForm(false);">No</label>
										</div>
									</div>
									<div class="form-group">
										<label for="input5" class="col-lg-2 control-label">Número de hijos:</label>
										<div class="col-lg-4 input-group">
											<input type="text" class="form-control numberTxt" name="numeroHijos"
												placeholder="" value="" onchange="mostrarHijosForms(this);">
										</div>
									</div>
									<div class="form-group">
					                    <label for="role" class="col-lg-2 control-label">Comunidad de Residencia:</label>
					                    <div class="col-lg-6 input-group">
											<select class="form-control" id="sel1">
												<option>Andalucía</option>
												<option>Aragón</option>
												<option>Asturias</option>
												<option>Baleares</option>
												<option>Canarias</option>
												<option>Cantabria</option>
												<option>Castilla y León</option>
												<option>Castilla-La Mancha</option>
												<option>Cataluña</option>
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
									<div class="form-group">
										<label for="inputEmail" class="col-lg-2 control-label">Edad:</label>
										<div class="col-lg-4 input-group">
											<input type="text" class="form-control" name="nombre" id="edadTitular" readonly
												placeholder="" value="">
										</div>
									</div>
							</fieldset>
							<fieldset id="conyugeForm">
								<legend>Cuestionario Cónyuge</legend>
									<div class="form-group">
										<label for="inputEmail" class="col-lg-2 control-label">Nombre:</label>
										<div class="col-lg-4 input-group">
											<input type="text" class="form-control" name="nombre"
												placeholder="" value="">
										</div>
									</div>
									<div class="form-group">
										<label for="inputPassword" class="col-lg-2 control-label">Sexo:</label>
										<div class="col-lg-4 input-group">
											<label class="radio-inline"><input type="radio" name="sexoConyuge">Hombre</label>
											<label class="radio-inline"><input type="radio" name="sexoConyuge">Mujer</label>
										</div>
									</div>
									<div class="form-group">
										<label for="inputLabel3" class="col-lg-2 control-label">Fecha de Nacimiento:</label>
										<div class="col-lg-4 input-group">
											<div class='input-group date' id='datetimepicker2'>
							                    <input type='text' class="form-controldatepicker" id="fechaNacimientoConyuge"/>
							                    <span class="input-group-addon">
							                        <span class="glyphicon glyphicon-calendar"></span>
							                    </span>
											</div>
										</div>
									</div>
									<div class="form-group">
										<label for="inputEmail" class="col-lg-2 control-label">Edad:</label>
										<div class="col-lg-4 input-group">
											<input type="text" class="form-control" name="nombre" id="edadConyuge" readonly
												placeholder="" value="">
										</div>
									</div>
							</fieldset>
							<!-- /.row this actually does not appear to be needed with the form-horizontal -->
						</div>
					</div>
					<div data-step="2">
					   <div class="row">
							<fieldset>
								<legend>Situación Seguridad Social (Titular)</legend>
									<div class="form-group">
										<label for="inputEmail" class="col-lg-4 control-label">Régimen de la seguridad Social:</label>
										<div class="col-lg-6 input-group">
											<select class="form-control" id="sel1">
											  	<option>Autónomo</option>
												<option>Regimen General</option>
												<option>Ambos</option>
												<option>Ninguno</option>
											</select>
										</div>
									</div>
									<div class="form-group">
										<label for="inputPassword" class="col-lg-4 control-label">Tiempo cotizado en la Seguridad Social hasta hoy (Régimen General):</label>
										<div class="col-lg-6 input-group">
											<input type="text" class="form-control" name="edadRenta"
												placeholder="" value=""><span class="input-group-addon">años</span>
												<input type="text" class="form-control" name="edadRenta"
												placeholder="" value=""><span class="input-group-addon">meses</span>
										</div>
									</div>
									<div class="form-group">
										<label for="inputPassword" class="col-lg-4 control-label">Tiempo cotizado en la Seguridad Social hasta hoy (Régimen Autónomo, no simultáneo RG):</label>
										<div class="col-lg-6 input-group">
											<input type="text" class="form-control" name="edadRenta"
												placeholder="" value=""><span class="input-group-addon">años</span>
												<input type="text" class="form-control" name="edadRenta"
												placeholder="" value=""><span class="input-group-addon">meses</span>
										</div>
									</div>
							</fieldset>
							<fieldset>
								<legend>Situación Seguridad Social (Cónyuge)</legend>
									<div class="form-group">
										<label for="inputEmail" class="col-lg-4 control-label">Régimen de la seguridad Social:</label>
										<div class="col-lg-6 input-group">
											<select class="form-control" id="sel1">
											  	<option>Autónomo</option>
												<option>Regimen General</option>
												<option>Ambos</option>
												<option>Ninguno</option>
											</select>
										</div>
									</div>
									<div class="form-group">
										<label for="inputPassword" class="col-lg-4 control-label">Tiempo cotizado en la Seguridad Social hasta hoy (Régimen General):</label>
										<div class="col-lg-6 input-group">
											<input type="text" class="form-control" name="edadRenta"
												placeholder="" value=""><span class="input-group-addon">años</span>
												<input type="text" class="form-control" name="edadRenta"
												placeholder="" value=""><span class="input-group-addon">meses</span>
										</div>
									</div>
									<div class="form-group">
										<label for="inputPassword" class="col-lg-4 control-label">Tiempo cotizado en la Seguridad Social hasta hoy (Régimen Autónomo, no simultáneo RG):</label>
										<div class="col-lg-6 input-group">
											<input type="text" class="form-control" name="edadRenta"
												placeholder="" value=""><span class="input-group-addon">años</span>
												<input type="text" class="form-control" name="edadRenta"
												placeholder="" value=""><span class="input-group-addon">meses</span>
										</div>
									</div>
							</fieldset>
							<!-- /.row this actually does not appear to be needed with the form-horizontal -->
						</div>
						 <div  class="well bs-component">
							<fieldset>
								<legend>Autónomos (Titular)</legend>
									<div class="form-group">
										<label for="inputEmail" class="col-lg-4 control-label">Cuota mensual:</label>
										<div class="col-lg-6 input-group">
											<input type="text" class="form-control" name="edadRenta"
												placeholder="" value="${configurationForm.edadRenta}">
										</div>
									</div>
									<div class="form-group">
										<label for="inputPassword" class="col-lg-4 control-label">Ingreso Bruto Mensual:</label>
										<div class="col-lg-6 input-group">
											<input type="text" class="form-control" name="edadRenta"
												placeholder="" value="${configurationForm.edadRenta}">
										</div>
									</div>
									<div class="form-group">
										<label for="inputPassword" class="col-lg-4 control-label">Retención por IRPF:</label>
										<div class="col-lg-6 input-group">
											<input type="text" class="form-control" name="edadRenta"
												placeholder="15%" value="${configurationForm.edadRenta}">
										</div>
									</div>
									<div class="form-group">
										<label for="inputPassword" class="col-lg-4 control-label">Neto Mensual (Media):</label>
										<div class="col-lg-6 input-group">
											<input type="text" class="form-control" name="edadRenta"
												placeholder="" value="${configurationForm.edadRenta}" readonly>
										</div>
									</div>
									<div class="form-group">
										<label for="inputPassword" class="col-lg-4 control-label">Base de Cotización:</label>
										<div class="col-lg-6 input-group">
											<input type="text" class="form-control" name="edadRenta"
												placeholder="" value="${configurationForm.edadRenta}" readonly>
										</div>
									</div>
							</fieldset>
							<fieldset>
								<legend>Autónomos (Cónyuge)</legend>
									<div class="form-group">
										<label for="inputEmail" class="col-lg-4 control-label">Cuota mensual:</label>
										<div class="col-lg-6 input-group">
											<input type="text" class="form-control" name="edadRenta"
												placeholder="" value="${configurationForm.edadRenta}">
										</div>
									</div>
									<div class="form-group">
										<label for="inputPassword" class="col-lg-4 control-label">Ingreso Bruto Mensual:</label>
										<div class="col-lg-6 input-group">
											<input type="text" class="form-control" name="edadRenta"
												placeholder="" value="${configurationForm.edadRenta}">
										</div>
									</div>
									<div class="form-group">
										<label for="inputPassword" class="col-lg-4 control-label">Retención por IRPF:</label>
										<div class="col-lg-6 input-group">
											<input type="text" class="form-control" name="edadRenta"
												placeholder="15%" value="${configurationForm.edadRenta}">
										</div>
									</div>
									<div class="form-group">
										<label for="inputPassword" class="col-lg-4 control-label">Neto Mensual (Media):</label>
										<div class="col-lg-6 input-group">
											<input type="text" class="form-control" name="edadRenta"
												placeholder="" value="${configurationForm.edadRenta}" readonly>
										</div>
									</div>
									<div class="form-group">
										<label for="inputPassword" class="col-lg-4 control-label">Base de Cotización:</label>
										<div class="col-lg-6 input-group">
											<input type="text" class="form-control" name="edadRenta"
												placeholder="" value="${configurationForm.edadRenta}" readonly>
										</div>
									</div>
							</fieldset>
							<fieldset>
								<legend>Régimen General (Titular)</legend>
								<div class="form-group">
									<label for="netoMesOrdinarioTitular" class="col-lg-4 control-label">Neto mes ordinario:</label>
									<div class="col-lg-6 input-group">
											<input type="text" class="form-control" id="netoMesOrdinarioTitular"
												name="netoMesOrdinarioTitular" placeholder="" value=""
												required>
									</div>
								</div>
								<div class="form-group">
									<label for="pagaExtraTitular" class="col-lg-4 control-label">Paga extra:</label>
									<div class="col-lg-6 input-group">
											<input type="text" class="form-control" id="pagaExtraTitular"
												name="pagaExtraTitular" placeholder="" value=""
												required>
									</div>
								</div>
								<div class="form-group">
									<label for="numPagaExtraTitular" class="col-lg-4 control-label">Número de paga(s) extra:</label>
									<div class="col-lg-6 input-group">
											<input type="text" class="form-control" id="numPagaExtraTitular"
												name="numPagaExtraTitular" placeholder="" value=""
												required>
									</div>
								</div>
								<div class="form-group">
									<label for="retencionTitular" class="col-lg-4 control-label">Retención:</label>
									<div class="col-lg-6 input-group">
										<input type="text" class="form-control" id="retencionTitular" name="retencionTitular"
											placeholder="" value="" >
									</div>
								</div>
							</fieldset>
							<fieldset>
								<legend>Régimen General (Cónyuge)</legend>
								<div class="form-group">
									<label for="netoMesOrdinarioConyuge" class="col-lg-4 control-label">Neto mes ordinario:</label>
									<div class="col-lg-6 input-group">
											<input type="text" class="form-control" id="netoMesOrdinarioConyuge"
												name="netoMesOrdinarioConyuge" placeholder="" value=""
												required>
									</div>
								</div>
								<div class="form-group">
									<label for="pagaExtraConyuge" class="col-lg-4 control-label">Paga extra:</label>
									<div class="col-lg-6 input-group">
											<input type="text" class="form-control" id="pagaExtraConyuge"
												name="pagaExtraConyuge" placeholder="" value=""
												required>
									</div>
								</div>
								<div class="form-group">
									<label for="numPagaExtraConyuge" class="col-lg-4 control-label">Número de paga(s) extra:</label>
									<div class="col-lg-6 input-group">
											<input type="text" class="form-control" id="numPagaExtraConyuge"
												name="numPagaExtraConyuge" placeholder="" value=""
												required>
									</div>
								</div>
								<div class="form-group">
									<label for="retencionConyuge" class="col-lg-4 control-label">Retención:</label>
									<div class="col-lg-6 input-group">
										<input type="text" class="form-control" id="retencionConyuge" name="retencionConyuge"
											placeholder="" value="" >
									</div>
								</div>
							</fieldset>
							<fieldset>
								<legend>Ingresos distintos al trabajo (Titular)</legend>
								<div class="form-group">
									<label for="ingresosTitular" class="col-lg-2 control-label">Ingresos</label>
									<div class="col-lg-10 input-group">
										<input type="text" class="form-control" id="ingresosTitular"
											name="ingresosTitular" placeholder="" value="">
									</div>
								</div>
								<div class="form-group">
									<label for="periodicidadTitular" class="col-lg-2 control-label">Periodicidad</label>
									<div class="col-lg-10 input-group">
										<input type="text" class="form-control" id="periodicidadTitular"
											name="periodicidadTitular" placeholder="" value="">
									</div>
								</div>
								<div class="form-group">
									<label for="retencionTitular" class="col-lg-2 control-label">Retención</label>
									<div class="col-lg-10 input-group">
										<input type="text" class="form-control" id="retencionTitular"
											name="retencionTitular" placeholder="" value="">
									</div>
								</div>
							</fieldset>
							<fieldset>
								<legend>Ingresos distintos al trabajo (Cónyuge)</legend>
								<div class="form-group">
									<label for="ingresosConyuge" class="col-lg-2 control-label">Ingresos</label>
									<div class="col-lg-10 input-group">
										<input type="text" class="form-control" id="ingresosConyuge"
											name="ingresosConyuge" placeholder="" value="">
									</div>
								</div>
								<div class="form-group">
									<label for="periodicidadConyuge" class="col-lg-2 control-label">Periodicidad</label>
									<div class="col-lg-10 input-group">
										<input type="text" class="form-control" id="periodicidadConyuge"
											name="periodicidadConyuge" placeholder="" value="">
									</div>
								</div>
								<div class="form-group">
									<label for="retencionConyuge" class="col-lg-2 control-label">Retención</label>
									<div class="col-lg-10 input-group">
										<input type="text" class="form-control" id="retencionConyuge"
											name="retencionConyuge" placeholder="" value="">
									</div>
								</div>
							</fieldset>
							<fieldset>
								<legend>Gastos (Titular)</legend>
								<div class="form-group">
									<label for="ahorroTitular" class="col-lg-2 control-label">Capacidad Mensual Ahorro</label>
									<div class="col-lg-10 input-group">
										<input type="text" class="form-control" id="ahorroTitular"
											name="ahorroTitular" placeholder="" value="">
									</div>
								</div>
							</fieldset>
							<fieldset>
								<legend>Gastos (Conyuge)</legend>
								<div class="form-group">
									<label for="ahorroConyuge" class="col-lg-2 control-label">Capacidad Mensual Ahorro</label>
									<div class="col-lg-10 input-group">
										<input type="text" class="form-control" id="ahorroConyuge"
											name="ahorroConyuge" placeholder="" value="">
									</div>
								</div>
							</fieldset>
							<fieldset>
								<legend>Deudas pendientes (Titular)</legend>
								<div class="form-group">
									<label for="ahorroTitular" class="col-lg-2 control-label">Capacidad Mensual Ahorro</label>
									<div class="col-lg-10 input-group">
										<input type="text" class="form-control" id="ahorroTitular"
											name="ahorroTitular" placeholder="" value="">
									</div>
								</div>
							</fieldset>
							<fieldset>
								<legend>Deudas pendientes (Conyuge)</legend>
								<div class="form-group">
									<label for="ahorroConyuge" class="col-lg-2 control-label">Capacidad Mensual Ahorro</label>
									<div class="col-lg-10 input-group">
										<input type="text" class="form-control" id="ahorroConyuge"
											name="ahorroConyuge" placeholder="" value="">
									</div>
								</div>
							</fieldset>
							<!-- /.row this actually does not appear to be needed with the form-horizontal -->
						</div>
					</div>
					<div data-step="3">
					  <div class="row">
							<fieldset>
								<legend>En construcción</legend>
								<div class="col-sm-6 col-lg-4">
								
								
									<div id="canvas-holder">

										<canvas id="chart-area" width="300" height="300"></canvas>
										<canvas id="chart-area2" width="300" height="300"></canvas>
									</div>
								
								
								</div>
							</fieldset>
						</div>
					</div>
					
				</div>
			</div>
		</form>		
    </div><!--/.container-->
	
	<%@ include file="footer.jsp" %>
	<script type="text/javascript" src="<c:url value='/static/js/jquery-ui.js' />"></script>
	<script type="text/javascript" src="<c:url value='/static/js/jquery.wizard.js' />"></script>
	<script type="text/javascript" src="<c:url value='/static/js/mfupload.js' />"></script>
	<script type="text/javascript" src="<c:url value='/static/js/Chart.min.js' />"></script>
	<script type="text/javascript" src="<c:url value='/static/js/simulator.js' />"></script>
</body>
</html>