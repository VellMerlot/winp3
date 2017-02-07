<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
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
		<div class="text-center">
			<h1>Configuración de constantes</h1>
		</div>
		<form class="form-horizontal" role="form">
			<div class="row">
				<fieldset>
					<legend>Parámetros generales</legend>
					<div class="col-sm-6 col-lg-4">
						<div class="form-group">
							<label for="inputEmail" class="col-md-4 control-label">IPC:</label>
							<div class="col-md-8 input-group">
								<input type="text" class="form-control" id="ipc"
									placeholder="" value=""><span class="input-group-addon">&#37;</span>
							</div>
						</div>
					</div>
					<div class="col-sm-6 col-lg-4">
						<div class="form-group">
							<label for="inputPassword" class="col-md-4 control-label">Rentabilidad
								Estimada:</label>
							<div class="col-md-8 input-group">
								<input type="password" class="form-control"
									id="rentaEstimada" placeholder=""><span
									class="input-group-addon">&#37;</span>
							</div>
						</div>
					</div>
					<div class="col-sm-6 col-lg-4">
						<div class="form-group">
							<label for="inputLabel3" class="col-md-4 control-label">Tipo
								cotización Autónomos:</label>
							<div class="col-md-8 input-group">
								<input type="text" class="form-control" id="cotizacionAutonomos"
									placeholder=""><span class="input-group-addon">&#37;</span>
							</div>
						</div>
					</div>
					<div class="col-sm-6 col-lg-4">
						<div class="form-group">
							<label for="inputLabel4" class="col-md-4 control-label">Edad
								Dependencia:</label>
							<div class="col-md-8 input-group">
								<input type="text" class="form-control" id="edadDependencia"
									placeholder=""><span class="input-group-addon">años</span>
							</div>
						</div>
					</div>
					<div class="col-sm-6 col-lg-4">
						<div class="form-group">
							<label for="input5" class="col-md-4 control-label">Edad
								Renta Pias:</label>
							<div class="col-md-8 input-group">
								<input type="text" class="form-control" id="edadRenta"
									placeholder=""><span class="input-group-addon">años</span>
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
								<input type="text" class="form-control" id="gastosEntierro"
									placeholder=""><span class="input-group-addon">&#8364;</span>
							</div>
						</div>
					</div>
					<div class="col-sm-6 col-lg-4">
						<div class="form-group">
							<label for="input5" class="col-md-4 control-label">Costes
								de aceptación Herencia:</label>
							<div class="col-md-8 input-group">
								<input type="text" class="form-control" id="costesHerencia"
									placeholder=""><span class="input-group-addon">&#8364;</span>
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
							<input type="text" class="form-control" id="adaptacionVivienda"
								placeholder=""><span class="input-group-addon">&#8364;</span>
						</div>
					</div>
				</div>
				<div class="col-sm-6 col-lg-4">
					<div class="form-group">
						<label for="input7" class="col-md-4 control-label">Adaptación
							Vehículo y otros:</label>
						<div class="col-md-8 input-group">
							<input type="text" class="form-control" id="adaptacionVehiculos"
								placeholder=""><span class="input-group-addon">&#8364;</span>
						</div>
					</div>
				</div>
				<!-- /.row this actually does not appear to be needed with the form-horizontal -->
			</div>
			<div class="row">
				<div class="col-xs-4"></div>
				<div class="col-xs-4 alignCenter" >
					<a href="#" class="btn btn-primary "> <span class="glyphicon glyphicon-floppy-disk"></span> Guardar</a>
				</div>
				<div class="col-xs-4"></div>
			</div>
		</form>

	</div>
	</form>
	</div>
	<!-- /.container -->
	
	<!-- Placed at the end of the document so the pages load faster -->
	<%@ include file="footer.jsp" %>
	<script type="text/javascript" src="<c:url value='/static/js/config.js' />"></script>
</body>
</html>