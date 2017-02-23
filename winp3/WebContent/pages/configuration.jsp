<%@ page session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>

<head>

	<%@ include file="head.jsp" %>

	<title>Configuración de constantes</title>
	
</head>

<body>
	<%@ include file="navbar.jsp"%>
	<%@ include file="logout.jsp"%>

	<div class="container">
<<<<<<< HEAD
		<div class="">
=======
		<div class="jumbotron">
			<h1>Configuración de constantes</h1>
			<p>Área para la modificación de constantes</p>
>>>>>>> branch 'master' of https://github.com/geraldinems/winp3.git
			
			<div class="jumbotron">
				<h1>Configuración de constantes</h1>
				<p>Zona de configuración de constantes. </p>
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
			
		</div>
		<form:form class="form-horizontal" method="post" modelAttribute="configurationForm" action="${formActionUrl}">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<input type="hidden" name="id" value="${configurationForm.id}" />
			<div class="row">
				<fieldset>
					<legend>Parámetros generales</legend>
					<div class="col-sm-6 col-lg-4">
						<div class="form-group">
							<label for="inputEmail" class="col-md-4 control-label">IPC:</label>
							<div class="col-md-8 input-group">
								<input type="text" class="form-control" name="ipc"
									placeholder="" value="${configurationForm.ipc}"><span class="input-group-addon">&#37;</span>
							</div>
						</div>
					</div>
					<div class="col-sm-6 col-lg-4">
						<div class="form-group">
							<label for="inputPassword" class="col-md-4 control-label">Rentabilidad
								Estimada:</label>
							<div class="col-md-8 input-group">
								<input type="text" class="form-control"
									name="rentaEstimada" placeholder="" value="${configurationForm.rentaEstimada}"><span
									class="input-group-addon">&#37;</span>
							</div>
						</div>
					</div>
					<div class="col-sm-6 col-lg-4">
						<div class="form-group">
							<label for="inputLabel3" class="col-md-4 control-label">Tipo
								cotización Autónomos:</label>
							<div class="col-md-8 input-group">
								<input type="text" class="form-control" name="cotizacionAutonomos"
									placeholder="" value="${configurationForm.cotizacionAutonomos}"><span class="input-group-addon">&#37;</span>
							</div>
						</div>
					</div>
					<div class="col-sm-6 col-lg-4">
						<div class="form-group">
							<label for="inputLabel4" class="col-md-4 control-label">Edad
								Dependencia:</label>
							<div class="col-md-8 input-group">
								<input type="text" class="form-control" name="edadDependencia"
									placeholder="" value="${configurationForm.edadDependencia}"><span class="input-group-addon">años</span>
							</div>
						</div>
					</div>
					<div class="col-sm-6 col-lg-4">
						<div class="form-group">
							<label for="input5" class="col-md-4 control-label">Edad
								Renta Pias:</label>
							<div class="col-md-8 input-group">
								<input type="text" class="form-control" name="edadRenta"
									placeholder="" value="${configurationForm.edadRenta}"><span class="input-group-addon">años</span>
							</div>
						</div>
					</div>
				</fieldset>
				<fieldset>
					<legend>Coste de fallecimiento</legend>
					<div class="col-sm-6 col-lg-4">
						<div class="form-group">
							<label for="input5" class="col-md-4 control-label">Gastos
								de entierro:</label>
							<div class="col-md-8 input-group">
								<input type="text" class="form-control" name="gastosEntierro"
									placeholder="" value="${configurationForm.gastosEntierro}"><span class="input-group-addon">&#8364;</span>
							</div>
						</div>
					</div>
					<div class="col-sm-6 col-lg-4">
						<div class="form-group">
							<label for="input5" class="col-md-4 control-label">Costes
								de aceptación Herencia:</label>
							<div class="col-md-8 input-group">
								<input type="text" class="form-control" name="costesHerencia"
									placeholder="" value="${configurationForm.costesHerencia}"><span class="input-group-addon">&#8364;</span>
							</div>
						</div>
					</div>
				</fieldset>
				<fieldset>
					<legend>Coste de Incapacidad</legend>
				</fieldset>
				<div class="col-sm-6 col-lg-4">
					<div class="form-group">
						<label for="input6" class="col-md-4 control-label">Adaptación
							Vivienda:</label>
						<div class="col-md-8 input-group">
							<input type="text" class="form-control" name="adaptacionVivienda"
								placeholder="" value="${configurationForm.adaptacionVivienda}"><span class="input-group-addon">&#8364;</span>
						</div>
					</div>
				</div>
				<div class="col-sm-6 col-lg-4">
					<div class="form-group">
						<label for="input7" class="col-md-4 control-label">Adaptación
							Vehículo y otros:</label>
						<div class="col-md-8 input-group">
							<input type="text" class="form-control" name="adaptacionVehiculos"
								placeholder="" value="${configurationForm.adaptacionVehiculos}"><span class="input-group-addon">&#8364;</span>
						</div>
					</div>
				</div>
				<!-- /.row this actually does not appear to be needed with the form-horizontal -->
			</div>
			<hr>
			<div class="row">
				<div class="col-xs-4"></div>
				<div class="col-xs-4 alignCenter" >
					<button type="submit" class="btn btn-primary "> <span class="glyphicon glyphicon-floppy-disk"></span> Guardar</button>
				</div>
				<div class="col-xs-4"></div>
			</div>
		</form:form>

	</div>
	<!-- /.container -->
	
	<!-- Placed at the end of the document so the pages load faster -->
	<%@ include file="footer.jsp" %>
	<script type="text/javascript" src="<c:url value='/static/js/config.js' />"></script>
</body>
</html>