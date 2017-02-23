<%@ page session="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>

<head>
  <%@ include file="head.jsp" %>

  <title>Resultado simulación</title>
</head> 

<body>
	<%@ include file="navbar.jsp" %>
  	<%@ include file="logout.jsp" %>
  	
  	<div class="container">
		<h1>RESULTADO SIMULACIÓN</h1>
		
		<div class="row" style="padding-top: 5%; margin: 0.67em 0;">
			<fieldset>
				<legend>Parámetros generales</legend>
				<div class="col-sm-6 col-lg-4">
					<div class="form-group">
						<label for="name" class="col-md-4 control-label">Name:</label>
						<div class="col-md-8 input-group">
							<input type="text" name="name" value="${outcomeForm.name}" readonly>
						</div>
					</div>
				</div>
			</fieldset>
		</div>
		
		<div class="row" style="padding-top: 2%; text-align: right;">
	      		<div class="col-md-12">
	      			<form name="form" action="${formActionGenerate}" method="post">
	      				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	      				
	      				<input type="hidden" name="id" value="${simulatorForm.id}" />
	    				<input type="hidden" name="name" value="${simulatorForm.name}" />
	    				
		        		<button type="submit" class="btn btn-primary">Guardar Simulación</button>
		        		<button type="button" id="btn_print" class="btn btn-primary">Imprimir Resultado</button>
		        	</form>
	      		</div>
	      	</div>
	 	
    </div><!--/.container-->
	
	<%@ include file="footer.jsp" %>
	<script type="text/javascript" src="<c:url value='/static/js/outcome.js' />"></script>
</body>
</html>