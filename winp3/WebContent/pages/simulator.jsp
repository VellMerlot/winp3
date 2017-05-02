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
  	<link rel="stylesheet" type="text/css" href="<c:url value='/static/css/imprimir.css' />" media='print'>
  
  
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
					<strong>OK!</strong> Se han guardado la simulación correctamente.
				</div>
			</c:if>
			<c:if test="${not empty message_error}">
				<div class="alert alert-dismissible alert-danger" id="updatedAlertError">
					<button type="button" class="close" data-dismiss="alert">&times;</button>
					<strong>¡Atención!</strong> Ha ocurrido un error al guardar la simulación.
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
		
		<form data-toggle="validator" id="form" name="form" action="${formActionOutcome}" method="post" class="${showForm}">
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
					<div data-step="1" id="divStep1">
					  <div class="row" id="step1">
							<fieldset id="titularForm">
								<legend>Cuestionario Titular</legend>
									<div class="form-group">
										<label for="inputEmail" class="col-lg-2 control-label">Nombre:</label>
										<div class="col-lg-4 input-group">
											<input required data-error="Campo obligatorio" type="text" class="form-control" name="nombre" placeholder="" value="">
										</div>
									</div>
									<div class="form-group">
										<label for="inputPassword" class="col-lg-2 control-label">Sexo:</label>
										<div class="col-lg-4 input-group">
											<label class="radio-inline"><input required type="radio" name="sexoTitular">Hombre</label>
											<label class="radio-inline"><input type="radio" name="sexoTitular">Mujer</label>
										</div>
									</div>
									<div class="form-group">
										<label for="inputLabel3" class="col-lg-2 control-label">Fecha de Nacimiento:</label>
										<div class="col-lg-4 input-group">
											<div class='input-group date' id='datetimepicker1'>
							                    <input required data-error="Campo obligatorio" type='text' class="form-control datepicker" id="fechaNacimientoTitular" onChange='calculaEdad(fechaNacimientoTitular,edadTitular)'/>
							                    <span class="input-group-addon">
							                        <span class="glyphicon glyphicon-calendar"></span>
							                    </span>
											</div>
										</div>
									</div>
									<div class="form-group">
										<label for="inputLabel4" class="col-lg-2 control-label">¿Tiene cónyuge?</label>
										<div class="col-lg-4 input-group">
											<label class="radio-inline"><input required type="radio" name="tieneConyuge" onclick="javascript:showConyugeForm(true);">Sí</label>
											<label class="radio-inline"><input type="radio" name="tieneConyuge" onclick="javascript:showConyugeForm(false);">No</label>
										</div>
									</div>
									<div class="form-group">
										<label for="input5" class="col-lg-2 control-label">Número de hijos:</label>
										<div class="col-lg-4 input-group">
											<input required data-error="Campo obligatorio" type="text" class="form-control numberTxt" name="numeroHijos"
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
											<input required data-error="Campo obligatorio" type="text" class="form-control" name="nombre" id="edadTitular" readonly placeholder="" value="">
										</div>
									</div>
							</fieldset>
							<fieldset id="conyugeForm">
								<legend>Cuestionario Cónyuge</legend>
									<div class="form-group">
										<label for="inputEmail" class="col-lg-2 control-label">Nombre:</label>
										<div class="col-lg-4 input-group">
											<input required data-error="Campo obligatorio" type="text" class="form-control" name="nombre" placeholder="" value="">
										</div>
									</div>
									<div class="form-group">
										<label for="inputPassword" class="col-lg-2 control-label">Sexo:</label>
										<div class="col-lg-4 input-group">
											<label class="radio-inline"><input required type="radio" name="sexoConyuge">Hombre</label>
											<label class="radio-inline"><input type="radio" name="sexoConyuge">Mujer</label>
										</div>
									</div>
									<div class="form-group">
										<label for="inputLabel3" class="col-lg-2 control-label">Fecha de Nacimiento:</label>
										<div class="col-lg-4 input-group">
											<div class='input-group date' id='datetimepicker2'>
							                    <input required data-error="Campo obligatorio" type='text' class="form-control datepicker" id="fechaNacimientoConyuge" onChange='calculaEdad(fechaNacimientoConyuge,edadConyuge)'/>
							                    <span class="input-group-addon">
							                        <span class="glyphicon glyphicon-calendar"></span>
							                    </span>
											</div>
										</div>
									</div>
									<div class="form-group">
										<label for="inputEmail" class="col-lg-2 control-label">Edad:</label>
										<div class="col-lg-4 input-group">
											<input type="text" class="form-control" name="nombre" id="edadConyuge" readonly placeholder="" value="">
										</div>
									</div>
							</fieldset>
							<!-- /.row this actually does not appear to be needed with the form-horizontal -->
						</div>
					</div>
<<<<<<< HEAD
					<div data-step="2" id="divStep2">
=======
<<<<<<< HEAD
					<div data-step="2" id="divStep2" class="printable">
=======
<<<<<<< HEAD
					<div data-step="2" id="divStep2" class="printable">
=======
					<div data-step="2">
>>>>>>> branch 'master' of https://github.com/geraldinems/winp3.git
>>>>>>> branch 'master' of https://github.com/geraldinems/winp3.git
>>>>>>> branch 'master' of https://github.com/geraldinems/winp3.git
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
							<fieldset class="conyugeForm">
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
							<fieldset class="conyugeForm">
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
							<fieldset class="conyugeForm">
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
									<label for="ingresosTitular" class="col-lg-4 control-label">Ingresos</label>
									<div class="col-lg-6 input-group">
										<input type="text" class="form-control" id="ingresosTitular"
											name="ingresosTitular" placeholder="" value="">
									</div>
								</div>
								<div class="form-group">
									<label for="periodicidadTitular" class="col-lg-4 control-label">Periodicidad</label>
									<div class="col-lg-6 input-group">
										<input type="text" class="form-control" id="periodicidadTitular"
											name="periodicidadTitular" placeholder="" value="">
									</div>
								</div>
								<div class="form-group">
									<label for="retencionTitular" class="col-lg-4 control-label">Retención</label>
									<div class="col-lg-6 input-group">
										<input type="text" class="form-control" id="retencionTitular"
											name="retencionTitular" placeholder="" value="">
									</div>
								</div>
							</fieldset>
							<fieldset>
								<legend>Ingresos distintos al trabajo (Cónyuge)</legend>
								<div class="form-group">
									<label for="ingresosConyuge" class="col-lg-4 control-label">Ingresos</label>
									<div class="col-lg-6 input-group">
										<input type="text" class="form-control" id="ingresosConyuge"
											name="ingresosConyuge" placeholder="" value="">
									</div>
								</div>
								<div class="form-group">
									<label for="periodicidadConyuge" class="col-lg-4 control-label">Periodicidad</label>
									<div class="col-lg-6 input-group">
										<input type="text" class="form-control" id="periodicidadConyuge"
											name="periodicidadConyuge" placeholder="" value="">
									</div>
								</div>
								<div class="form-group">
									<label for="retencionConyuge" class="col-lg-4 control-label">Retención</label>
									<div class="col-lg-6 input-group">
										<input type="text" class="form-control" id="retencionConyuge"
											name="retencionConyuge" placeholder="" value="">
									</div>
								</div>
							</fieldset>
							<fieldset>
								<legend>Gastos </legend>
								<div class="form-group">
<<<<<<< HEAD
									<label for="ahorroTitular" class="col-lg-4 control-label">Capacidad Mensual Ahorro (Titular)</label>
=======
									<label for="ahorroTitular" class="col-lg-4 control-label">Capacidad Mensual Ahorro</label>
>>>>>>> branch 'master' of https://github.com/geraldinems/winp3.git
									<div class="col-lg-6 input-group">
										<input type="text" class="form-control" id="ahorroTitular"
											name="ahorroTitular" placeholder="" value="">
									</div>
								</div>
<<<<<<< HEAD
=======
							</fieldset>
							<fieldset class="conyugeForm">
								<legend>Gastos (Conyuge)</legend>
>>>>>>> branch 'master' of https://github.com/geraldinems/winp3.git
								<div class="form-group">
<<<<<<< HEAD
									<label for="ahorroConyuge" class="col-lg-4 control-label">Capacidad Mensual Ahorro (Conyuge)</label>
=======
									<label for="ahorroConyuge" class="col-lg-4 control-label">Capacidad Mensual Ahorro</label>
>>>>>>> branch 'master' of https://github.com/geraldinems/winp3.git
									<div class="col-lg-6 input-group">
										<input type="text" class="form-control" id="ahorroConyuge"
											name="ahorroConyuge" placeholder="" value="">
									</div>
								</div>
							</fieldset>
							<fieldset>
								<legend>Deudas pendientes</legend>
								<div class="form-group">
<<<<<<< HEAD
									<label for="ahorroTitular" class="col-lg-4 control-label">Capacidad Mensual Ahorro (Titular)</label>
									<div class="col-lg-6 input-group">
										<input type="text" class="form-control" id="ahorroTitular"
											name="ahorroTitular" placeholder="" value="">
=======
									<label for="hipotecaTitular" class="col-lg-4 control-label">Hipoteca</label>
									<div class="col-lg-6 input-group">
										<input type="text" class="form-control" id="hipotecaTitular"
											name="hipotecaTitular" placeholder="" value="">
									</div>
								</div>
								<div class="form-group">
									<label for="deuda2Titular" class="col-lg-4 control-label">Deuda 2</label>
									<div class="col-lg-6 input-group">
										<input type="text" class="form-control" id="deuda2Titular"
											name="deuda2Titular" placeholder="" value="">
									</div>
								</div>
								<div class="form-group">
									<label for="deuda3Titular" class="col-lg-4 control-label">Deuda 3</label>
									<div class="col-lg-6 input-group">
										<input type="text" class="form-control" id="deuda3Titular"
											name="deuda3Titular" placeholder="" value="">
									</div>
								</div>
							</fieldset>
							<fieldset class="conyugeForm">
								<legend>Deudas pendientes (Conyuge)</legend>
								<div class="form-group">
									<label for="hipotecaConyuge" class="col-lg-4 control-label">Hipoteca</label>
									<div class="col-lg-6 input-group">
										<input type="text" class="form-control" id="hipotecaConyuge"
											name="hipotecaConyuge" placeholder="" value="">
									</div>
								</div>
								<div class="form-group">
									<label for="deuda2Conyuge" class="col-lg-4 control-label">Deuda 2</label>
									<div class="col-lg-6 input-group">
										<input type="text" class="form-control" id="deuda2Conyuge"
											name="deuda2Conyuge" placeholder="" value="">
									</div>
								</div>
								<div class="form-group">
									<label for="deuda3Conyuge" class="col-lg-4 control-label">Deuda 3</label>
									<div class="col-lg-6 input-group">
										<input type="text" class="form-control" id="deuda3Conyuge"
											name="deuda3Conyuge" placeholder="" value="">
>>>>>>> branch 'master' of https://github.com/geraldinems/winp3.git
									</div>
								</div>
<<<<<<< HEAD
=======
							</fieldset>
							<fieldset>
								<legend>Activos (Ahorro e inversión):</legend>
>>>>>>> branch 'master' of https://github.com/geraldinems/winp3.git
								<div class="form-group">
<<<<<<< HEAD
									<label for="deuda1Titular" class="col-lg-4 control-label">Deuda 1 (Titular)</label>
									<div class="col-lg-6 input-group">
										<input type="text" class="form-control" id="deuda1Titular"
											name="deuda1Titular" placeholder="" value="">
									</div>
								</div>
								<div class="form-group">
									<label for="deuda2Titular" class="col-lg-4 control-label">Deuda 2 (Titular)</label>
									<div class="col-lg-6 input-group">
										<input type="text" class="form-control" id="deuda2Titular"
											name="deuda2Titular" placeholder="" value="">
									</div>
								</div>
								<div class="form-group">
									<label for="ahorroConyuge" class="col-lg-4 control-label">Capacidad Mensual Ahorro (Conyuge)</label>
									<div class="col-lg-6 input-group">
										<input type="text" class="form-control" id="ahorroConyuge"
											name="ahorroConyuge" placeholder="" value="">
									</div>
								</div>
								<div class="form-group">
									<label for="deuda1Conyuge" class="col-lg-4 control-label">Deuda 1 (Conyuge)</label>
									<div class="col-lg-6 input-group">
										<input type="text" class="form-control" id="deuda1Conyuge"
											name="deuda1Conyuge" placeholder="" value="">
									</div>
								</div>
								<div class="form-group">
									<label for="deuda2Conyuge" class="col-lg-4 control-label">Deuda 2 (Conyuge)</label>
									<div class="col-lg-6 input-group">
										<input type="text" class="form-control" id="deuda2Conyuge"
											name="deuda2Conyuge" placeholder="" value="">
									</div>
								</div>
							</fieldset>
							<fieldset>
								<legend>Activos</legend>
							</fieldset>
							<fieldset>
								<legend>Activos (Ahorro e inversión):</legend>
								<div class="form-group">
=======
>>>>>>> branch 'master' of https://github.com/geraldinems/winp3.git
									<table class="table table-bordered">
										<tr>
											<td>A quién afecta</td>
											<td>Tipo</td>
											<td>Capital Hoy</td>
											<td>Capital a la Jubilación</td>
											<td>Prima o aportación mensual</td>
											<td>Derechos Consolidados 31/12/2006</td>
										</tr>
										<tr>
											<td>
												<select class="form-control" id="afecta1">
												  	<option>Titular</option>
													<option>Cónyuge</option>
													<option>Ambos</option>
												</select>
											</td>
											<td>
												<select class="form-control" id="tipoActivo1">
												  	<option>Plan de Pensiones</option>
													<option>PPA</option>
													<option>PIAS</option>
													<option>Seguro de Ahorro</option>
													<option>Unit Linked</option>
													<option>Fondos de Inversión</option>
												</select>
											</td>
											<td>
												<div class="input-group">
													<input type="text" class="form-control" id="capitalHoy1"
														name="capitalHoy1" placeholder="" value="">
												</div>
											</td>
											<td>
												<div class="input-group">
													<input type="text" class="form-control" id="capitalJubilacion1"
														name="capitalJubilacion1" placeholder="" value="">
												</div>
											</td>
											<td>
												<div class="input-group">
													<input type="text" class="form-control" id="primaMensual1"
														name="primaMensual1" placeholder="" value="">
												</div>
											</td>
											<td>
												<div class="input-group">
													<input type="text" class="form-control" id="derechos1"
														name="derechos1" placeholder="" value="">
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<select class="form-control" id="afecta2">
												  	<option>Titular</option>
													<option>Cónyuge</option>
													<option>Ambos</option>
												</select>
											</td>
											<td>
												<select class="form-control" id="tipoActivo2">
												  	<option>Plan de Pensiones</option>
													<option>PPA</option>
													<option>PIAS</option>
													<option>Seguro de Ahorro</option>
													<option>Unit Linked</option>
													<option>Fondos de Inversión</option>
												</select>
											</td>
											<td>
												<div class="input-group">
													<input type="text" class="form-control" id="capitalHoy2"
														name="capitalHoy2" placeholder="" value="">
												</div>
											</td>
											<td>
												<div class="input-group">
													<input type="text" class="form-control" id="capitalJubilacion2"
														name="capitalJubilacion2" placeholder="" value="">
												</div>
											</td>
											<td>
												<div class="input-group">
													<input type="text" class="form-control" id="primaMensual2"
														name="primaMensual2" placeholder="" value="">
												</div>
											</td>
											<td>
												<div class="input-group">
													<input type="text" class="form-control" id="derechos2"
														name="derechos2" placeholder="" value="">
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<select class="form-control" id="afecta3">
												  	<option>Titular</option>
													<option>Cónyuge</option>
													<option>Ambos</option>
												</select>
											</td>
											<td>
												<select class="form-control" id="tipoActivo3">
												  	<option>Plan de Pensiones</option>
													<option>PPA</option>
													<option>PIAS</option>
													<option>Seguro de Ahorro</option>
													<option>Unit Linked</option>
													<option>Fondos de Inversión</option>
												</select>
											</td>
											<td>
												<div class="input-group">
													<input type="text" class="form-control" id="capitalHoy3"
														name="capitalHoy3" placeholder="" value="">
												</div>
											</td>
											<td>
												<div class="input-group">
													<input type="text" class="form-control" id="capitalJubilacion3"
														name="capitalJubilacion3" placeholder="" value="">
												</div>
											</td>
											<td>
												<div class="input-group">
													<input type="text" class="form-control" id="primaMensual3"
														name="primaMensual3" placeholder="" value="">
												</div>
											</td>
											<td>
												<div class="input-group">
													<input type="text" class="form-control" id="derechos3"
														name="derechos3" placeholder="" value="">
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<select class="form-control" id="afecta4">
												  	<option>Titular</option>
													<option>Cónyuge</option>
													<option>Ambos</option>
												</select>
											</td>
											<td>
												<select class="form-control" id="tipoActivo4">
												  	<option>Plan de Pensiones</option>
													<option>PPA</option>
													<option>PIAS</option>
													<option>Seguro de Ahorro</option>
													<option>Unit Linked</option>
													<option>Fondos de Inversión</option>
												</select>
											</td>
											<td>
												<div class="input-group">
													<input type="text" class="form-control" id="capitalHoy4"
														name="capitalHoy4" placeholder="" value="">
												</div>
											</td>
											<td>
												<div class="input-group">
													<input type="text" class="form-control" id="capitalJubilacion4"
														name="capitalJubilacion4" placeholder="" value="">
												</div>
											</td>
											<td>
												<div class="input-group">
													<input type="text" class="form-control" id="primaMensual4"
														name="primaMensual4" placeholder="" value="">
												</div>
											</td>
											<td>
												<div class="input-group">
													<input type="text" class="form-control" id="derechos4"
														name="derechos4" placeholder="" value="">
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<select class="form-control" id="afecta5">
												  	<option>Titular</option>
													<option>Cónyuge</option>
													<option>Ambos</option>
												</select>
											</td>
											<td>
												<select class="form-control" id="tipoActivo5">
												  	<option>Plan de Pensiones</option>
													<option>PPA</option>
													<option>PIAS</option>
													<option>Seguro de Ahorro</option>
													<option>Unit Linked</option>
													<option>Fondos de Inversión</option>
												</select>
											</td>
											<td>
												<div class="input-group">
													<input type="text" class="form-control" id="capitalHoy5"
														name="capitalHoy5" placeholder="" value="">
												</div>
											</td>
											<td>
												<div class="input-group">
													<input type="text" class="form-control" id="capitalJubilacion5"
														name="capitalJubilacion5" placeholder="" value="">
												</div>
											</td>
											<td>
												<div class="input-group">
													<input type="text" class="form-control" id="primaMensual5"
														name="primaMensual5" placeholder="" value="">
												</div>
											</td>
											<td>
												<div class="input-group">
													<input type="text" class="form-control" id="derechos5"
														name="derechos5" placeholder="" value="">
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<select class="form-control" id="afecta6">
												  	<option>Titular</option>
													<option>Cónyuge</option>
													<option>Ambos</option>
												</select>
											</td>
											<td>
												<select class="form-control" id="tipoActivo6">
												  	<option>Plan de Pensiones</option>
													<option>PPA</option>
													<option>PIAS</option>
													<option>Seguro de Ahorro</option>
													<option>Unit Linked</option>
													<option>Fondos de Inversión</option>
												</select>
											</td>
											<td>
												<div class="input-group">
													<input type="text" class="form-control" id="capitalHoy6"
														name="capitalHoy6" placeholder="" value="">
												</div>
											</td>
											<td>
												<div class="input-group">
													<input type="text" class="form-control" id="capitalJubilacion6"
														name="capitalJubilacion6" placeholder="" value="">
												</div>
											</td>
											<td>
												<div class="input-group">
													<input type="text" class="form-control" id="primaMensual6"
														name="primaMensual6" placeholder="" value="">
												</div>
											</td>
											<td>
												<div class="input-group">
													<input type="text" class="form-control" id="derechos6"
														name="derechos6" placeholder="" value="">
												</div>
											</td>
										</tr>
									</table>
								</div>
							</fieldset>
							<fieldset>
								<legend>Activos (Seguros de Vida Contratados):</legend>
								<div class="form-group">
									<table class="table table-bordered">
										<tr>
											<td>Asegurado</td>
											<td>Fallecimiento</td>
											<td>IPA</td>
											<td>IPT</td>
											<td>Prima anual</td>
										</tr>
										<tr>
											<td>
												<select class="form-control" id="asegurado1">
												  	<option>Titular</option>
													<option>Cónyuge</option>
												</select>
											</td>
											<td>
												<div class="input-group">
													<input type="text" class="form-control" id="fallecimiento1"
														name="fallecimiento1" placeholder="" value="">
												</div>
											</td>
											<td>
												<div class="input-group">
													<input type="text" class="form-control" id="ipa1"
														name="ipa1" placeholder="" value="">
												</div>
											</td>
											<td>
												<div class="input-group">
													<input type="text" class="form-control" id="ipt1"
														name="ipt1" placeholder="" value="">
												</div>
											</td>
											<td>
												<div class="input-group">
													<input type="text" class="form-control" id="primaAnual1"
														name="primaAnual1" placeholder="" value="">
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<select class="form-control" id="asegurado2">
												  	<option>Titular</option>
													<option>Cónyuge</option>
												</select>
											</td>
											<td>
												<div class="input-group">
													<input type="text" class="form-control" id="fallecimiento2"
														name="fallecimiento2" placeholder="" value="">
												</div>
											</td>
											<td>
												<div class="input-group">
													<input type="text" class="form-control" id="ipa2"
														name="ipa2" placeholder="" value="">
												</div>
											</td>
											<td>
												<div class="input-group">
													<input type="text" class="form-control" id="ipt2"
														name="ipt2" placeholder="" value="">
												</div>
											</td>
											<td>
												<div class="input-group">
													<input type="text" class="form-control" id="primaAnual2"
														name="primaAnual2" placeholder="" value="">
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<select class="form-control" id="asegurado3">
												  	<option>Titular</option>
													<option>Cónyuge</option>
												</select>
											</td>
											<td>
												<div class="input-group">
													<input type="text" class="form-control" id="fallecimiento3"
														name="fallecimiento3" placeholder="" value="">
												</div>
											</td>
											<td>
												<div class="input-group">
													<input type="text" class="form-control" id="ipa3"
														name="ipa3" placeholder="" value="">
												</div>
											</td>
											<td>
												<div class="input-group">
													<input type="text" class="form-control" id="ipt3"
														name="ipt3" placeholder="" value="">
												</div>
											</td>
											<td>
												<div class="input-group">
													<input type="text" class="form-control" id="primaAnual3"
														name="primaAnual3" placeholder="" value="">
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<select class="form-control" id="asegurado4">
												  	<option>Titular</option>
													<option>Cónyuge</option>
												</select>
											</td>
											<td>
												<div class="input-group">
													<input type="text" class="form-control" id="fallecimiento4"
														name="fallecimiento4" placeholder="" value="">
												</div>
											</td>
											<td>
												<div class="input-group">
													<input type="text" class="form-control" id="ipa4"
														name="ipa4" placeholder="" value="">
												</div>
											</td>
											<td>
												<div class="input-group">
													<input type="text" class="form-control" id="ipt4"
														name="ipt4" placeholder="" value="">
												</div>
											</td>
											<td>
												<div class="input-group">
													<input type="text" class="form-control" id="primaAnual4"
														name="primaAnual4" placeholder="" value="">
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<select class="form-control" id="asegurado5">
												  	<option>Titular</option>
													<option>Cónyuge</option>
												</select>
											</td>
											<td>
												<div class="input-group">
													<input type="text" class="form-control" id="fallecimiento5"
														name="fallecimiento5" placeholder="" value="">
												</div>
											</td>
											<td>
												<div class="input-group">
													<input type="text" class="form-control" id="ipa5"
														name="ipa5" placeholder="" value="">
												</div>
											</td>
											<td>
												<div class="input-group">
													<input type="text" class="form-control" id="ipt5"
														name="ipt5" placeholder="" value="">
												</div>
											</td>
											<td>
												<div class="input-group">
													<input type="text" class="form-control" id="primaAnual5"
														name="primaAnual5" placeholder="" value="">
												</div>
											</td>
										</tr>
									</table>
								</div>
							</fieldset>
							<fieldset>
								<legend>Activos (Ahorro e inversión):</legend>
								<div class="form-group">
									<table class="table table-bordered">
										<tr>
											<td>A quién afecta</td>
											<td>Tipo</td>
											<td>Capital Hoy</td>
											<td>Capital a la Jubilación</td>
											<td>Prima o aportación mensual</td>
											<td>Derechos Consolidados 31/12/2006</td>
										</tr>
										<tr>
											<td>
												<select class="form-control" id="afecta1">
												  	<option>Titular</option>
													<option>Cónyuge</option>
													<option>Ambos</option>
												</select>
											</td>
											<td>
												<select class="form-control" id="tipoActivo1">
												  	<option>Plan de Pensiones</option>
													<option>PPA</option>
													<option>PIAS</option>
													<option>Seguro de Ahorro</option>
													<option>Unit Linked</option>
													<option>Fondos de Inversión</option>
												</select>
											</td>
											<td>
												<div class="input-group">
													<input type="text" class="form-control" id="capitalHoy1"
														name="capitalHoy1" placeholder="" value="">
												</div>
											</td>
											<td>
												<div class="input-group">
													<input type="text" class="form-control" id="capitalJubilacion1"
														name="capitalJubilacion1" placeholder="" value="">
												</div>
											</td>
											<td>
												<div class="input-group">
													<input type="text" class="form-control" id="primaMensual1"
														name="primaMensual1" placeholder="" value="">
												</div>
											</td>
											<td>
												<div class="input-group">
													<input type="text" class="form-control" id="derechos1"
														name="derechos1" placeholder="" value="">
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<select class="form-control" id="afecta2">
												  	<option>Titular</option>
													<option>Cónyuge</option>
													<option>Ambos</option>
												</select>
											</td>
											<td>
												<select class="form-control" id="tipoActivo2">
												  	<option>Plan de Pensiones</option>
													<option>PPA</option>
													<option>PIAS</option>
													<option>Seguro de Ahorro</option>
													<option>Unit Linked</option>
													<option>Fondos de Inversión</option>
												</select>
											</td>
											<td>
												<div class="input-group">
													<input type="text" class="form-control" id="capitalHoy2"
														name="capitalHoy2" placeholder="" value="">
												</div>
											</td>
											<td>
												<div class="input-group">
													<input type="text" class="form-control" id="capitalJubilacion2"
														name="capitalJubilacion2" placeholder="" value="">
												</div>
											</td>
											<td>
												<div class="input-group">
													<input type="text" class="form-control" id="primaMensual2"
														name="primaMensual2" placeholder="" value="">
												</div>
											</td>
											<td>
												<div class="input-group">
													<input type="text" class="form-control" id="derechos2"
														name="derechos2" placeholder="" value="">
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<select class="form-control" id="afecta3">
												  	<option>Titular</option>
													<option>Cónyuge</option>
													<option>Ambos</option>
												</select>
											</td>
											<td>
												<select class="form-control" id="tipoActivo3">
												  	<option>Plan de Pensiones</option>
													<option>PPA</option>
													<option>PIAS</option>
													<option>Seguro de Ahorro</option>
													<option>Unit Linked</option>
													<option>Fondos de Inversión</option>
												</select>
											</td>
											<td>
												<div class="input-group">
													<input type="text" class="form-control" id="capitalHoy3"
														name="capitalHoy3" placeholder="" value="">
												</div>
											</td>
											<td>
												<div class="input-group">
													<input type="text" class="form-control" id="capitalJubilacion3"
														name="capitalJubilacion3" placeholder="" value="">
												</div>
											</td>
											<td>
												<div class="input-group">
													<input type="text" class="form-control" id="primaMensual3"
														name="primaMensual3" placeholder="" value="">
												</div>
											</td>
											<td>
												<div class="input-group">
													<input type="text" class="form-control" id="derechos3"
														name="derechos3" placeholder="" value="">
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<select class="form-control" id="afecta4">
												  	<option>Titular</option>
													<option>Cónyuge</option>
													<option>Ambos</option>
												</select>
											</td>
											<td>
												<select class="form-control" id="tipoActivo4">
												  	<option>Plan de Pensiones</option>
													<option>PPA</option>
													<option>PIAS</option>
													<option>Seguro de Ahorro</option>
													<option>Unit Linked</option>
													<option>Fondos de Inversión</option>
												</select>
											</td>
											<td>
												<div class="input-group">
													<input type="text" class="form-control" id="capitalHoy4"
														name="capitalHoy4" placeholder="" value="">
												</div>
											</td>
											<td>
												<div class="input-group">
													<input type="text" class="form-control" id="capitalJubilacion4"
														name="capitalJubilacion4" placeholder="" value="">
												</div>
											</td>
											<td>
												<div class="input-group">
													<input type="text" class="form-control" id="primaMensual4"
														name="primaMensual4" placeholder="" value="">
												</div>
											</td>
											<td>
												<div class="input-group">
													<input type="text" class="form-control" id="derechos4"
														name="derechos4" placeholder="" value="">
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<select class="form-control" id="afecta5">
												  	<option>Titular</option>
													<option>Cónyuge</option>
													<option>Ambos</option>
												</select>
											</td>
											<td>
												<select class="form-control" id="tipoActivo5">
												  	<option>Plan de Pensiones</option>
													<option>PPA</option>
													<option>PIAS</option>
													<option>Seguro de Ahorro</option>
													<option>Unit Linked</option>
													<option>Fondos de Inversión</option>
												</select>
											</td>
											<td>
												<div class="input-group">
													<input type="text" class="form-control" id="capitalHoy5"
														name="capitalHoy5" placeholder="" value="">
												</div>
											</td>
											<td>
												<div class="input-group">
													<input type="text" class="form-control" id="capitalJubilacion5"
														name="capitalJubilacion5" placeholder="" value="">
												</div>
											</td>
											<td>
												<div class="input-group">
													<input type="text" class="form-control" id="primaMensual5"
														name="primaMensual5" placeholder="" value="">
												</div>
											</td>
											<td>
												<div class="input-group">
													<input type="text" class="form-control" id="derechos5"
														name="derechos5" placeholder="" value="">
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<select class="form-control" id="afecta6">
												  	<option>Titular</option>
													<option>Cónyuge</option>
													<option>Ambos</option>
												</select>
											</td>
											<td>
												<select class="form-control" id="tipoActivo6">
												  	<option>Plan de Pensiones</option>
													<option>PPA</option>
													<option>PIAS</option>
													<option>Seguro de Ahorro</option>
													<option>Unit Linked</option>
													<option>Fondos de Inversión</option>
												</select>
											</td>
											<td>
												<div class="input-group">
													<input type="text" class="form-control" id="capitalHoy6"
														name="capitalHoy6" placeholder="" value="">
												</div>
											</td>
											<td>
												<div class="input-group">
													<input type="text" class="form-control" id="capitalJubilacion6"
														name="capitalJubilacion6" placeholder="" value="">
												</div>
											</td>
											<td>
												<div class="input-group">
													<input type="text" class="form-control" id="primaMensual6"
														name="primaMensual6" placeholder="" value="">
												</div>
											</td>
											<td>
												<div class="input-group">
													<input type="text" class="form-control" id="derechos6"
														name="derechos6" placeholder="" value="">
												</div>
											</td>
										</tr>
									</table>
								</div>
							</fieldset>
							<fieldset>
								<legend>Activos (Seguros de Vida Contratados):</legend>
								<div class="form-group">
									<table class="table table-bordered">
										<tr>
											<td>Asegurado</td>
											<td>Fallecimiento</td>
											<td>IPA</td>
											<td>IPT</td>
											<td>Prima anual</td>
										</tr>
										<tr>
											<td>
												<select class="form-control" id="asegurado1">
												  	<option>Titular</option>
													<option>Cónyuge</option>
												</select>
											</td>
											<td>
												<div class="input-group">
													<input type="text" class="form-control" id="fallecimiento1"
														name="fallecimiento1" placeholder="" value="">
												</div>
											</td>
											<td>
												<div class="input-group">
													<input type="text" class="form-control" id="ipa1"
														name="ipa1" placeholder="" value="">
												</div>
											</td>
											<td>
												<div class="input-group">
													<input type="text" class="form-control" id="ipt1"
														name="ipt1" placeholder="" value="">
												</div>
											</td>
											<td>
												<div class="input-group">
													<input type="text" class="form-control" id="primaAnual1"
														name="primaAnual1" placeholder="" value="">
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<select class="form-control" id="asegurado2">
												  	<option>Titular</option>
													<option>Cónyuge</option>
												</select>
											</td>
											<td>
												<div class="input-group">
													<input type="text" class="form-control" id="fallecimiento2"
														name="fallecimiento2" placeholder="" value="">
												</div>
											</td>
											<td>
												<div class="input-group">
													<input type="text" class="form-control" id="ipa2"
														name="ipa2" placeholder="" value="">
												</div>
											</td>
											<td>
												<div class="input-group">
													<input type="text" class="form-control" id="ipt2"
														name="ipt2" placeholder="" value="">
												</div>
											</td>
											<td>
												<div class="input-group">
													<input type="text" class="form-control" id="primaAnual2"
														name="primaAnual2" placeholder="" value="">
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<select class="form-control" id="asegurado3">
												  	<option>Titular</option>
													<option>Cónyuge</option>
												</select>
											</td>
											<td>
												<div class="input-group">
													<input type="text" class="form-control" id="fallecimiento3"
														name="fallecimiento3" placeholder="" value="">
												</div>
											</td>
											<td>
												<div class="input-group">
													<input type="text" class="form-control" id="ipa3"
														name="ipa3" placeholder="" value="">
												</div>
											</td>
											<td>
												<div class="input-group">
													<input type="text" class="form-control" id="ipt3"
														name="ipt3" placeholder="" value="">
												</div>
											</td>
											<td>
												<div class="input-group">
													<input type="text" class="form-control" id="primaAnual3"
														name="primaAnual3" placeholder="" value="">
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<select class="form-control" id="asegurado4">
												  	<option>Titular</option>
													<option>Cónyuge</option>
												</select>
											</td>
											<td>
												<div class="input-group">
													<input type="text" class="form-control" id="fallecimiento4"
														name="fallecimiento4" placeholder="" value="">
												</div>
											</td>
											<td>
												<div class="input-group">
													<input type="text" class="form-control" id="ipa4"
														name="ipa4" placeholder="" value="">
												</div>
											</td>
											<td>
												<div class="input-group">
													<input type="text" class="form-control" id="ipt4"
														name="ipt4" placeholder="" value="">
												</div>
											</td>
											<td>
												<div class="input-group">
													<input type="text" class="form-control" id="primaAnual4"
														name="primaAnual4" placeholder="" value="">
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<select class="form-control" id="asegurado5">
												  	<option>Titular</option>
													<option>Cónyuge</option>
												</select>
											</td>
											<td>
												<div class="input-group">
													<input type="text" class="form-control" id="fallecimiento5"
														name="fallecimiento5" placeholder="" value="">
												</div>
											</td>
											<td>
												<div class="input-group">
													<input type="text" class="form-control" id="ipa5"
														name="ipa5" placeholder="" value="">
												</div>
											</td>
											<td>
												<div class="input-group">
													<input type="text" class="form-control" id="ipt5"
														name="ipt5" placeholder="" value="">
												</div>
											</td>
											<td>
												<div class="input-group">
													<input type="text" class="form-control" id="primaAnual5"
														name="primaAnual5" placeholder="" value="">
												</div>
											</td>
										</tr>
									</table>
								</div>
							</fieldset>
							<!-- /.row this actually does not appear to be needed with the form-horizontal -->
						</div>
					</div>
<<<<<<< HEAD
					<div data-step="3" id="divStep3" class="printable">
=======
<<<<<<< HEAD
					<div data-step="3" id="divStep3" class="printable">
=======
<<<<<<< HEAD
					<div data-step="3" id="divStep3" class="printable">
=======
					<div data-step="3" class="printable">
>>>>>>> branch 'master' of https://github.com/geraldinems/winp3.git
>>>>>>> branch 'master' of https://github.com/geraldinems/winp3.git
>>>>>>> branch 'master' of https://github.com/geraldinems/winp3.git
						<div class="row">
							<fieldset>
<<<<<<< HEAD
=======
<<<<<<< HEAD
								<legend>En construcción</legend>
								<div class="col-sm-6 col-lg-4">					
									<div id="canvas-holder">
										<canvas id="chart-area" width="400" height="400"></canvas>
										<canvas id="chart-area2" width="400" height="400"></canvas>
									</div>				
=======
>>>>>>> branch 'master' of https://github.com/geraldinems/winp3.git
								<legend>Resultado Incapacidad Temporal (IT)</legend>
								<div class="form-group">
									<label for="inputEmail" class="col-lg-2 control-label">Edad:</label>
									<div class="col-lg-4 input-group">
										<input type="text" class="form-control" name="nombre" id="edadConyuge"
											placeholder="" value="">
									</div>
<<<<<<< HEAD
=======
>>>>>>> branch 'master' of https://github.com/geraldinems/winp3.git
>>>>>>> branch 'master' of https://github.com/geraldinems/winp3.git
								</div>
							</fieldset>
						</div>
						<div class="row">
							<div class="col-sm-6 col-lg-4">
								<div id="canvas-holder">
									<canvas id="chart-area" width="400" height="400"></canvas>
									<canvas id="chart-area2" width="400" height="400"></canvas>
								</div>
							</div>
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