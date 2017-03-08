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
  	
  	<div class="container">
		
	 	<div class="jumbotron">
			<h1>WinP3</h1>
			<p>Realizar una simulación</p>
			
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
		
		
		
		<form name="form" action="${formActionOutcome}" method="post">
	    	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	    	
	    	<input type="hidden" name="id" value="1" />
	    	<input type="hidden" name="name" value="Form_simulator" />
	    	
			<div data-wizard-init>
		  		<ul class="steps">
					<li data-step="1">Details</li>
					<li data-step="2">Address</li>
					<li data-step="3">Template</li>
					<li data-step="4">Delivery</li>
					<li data-step="5">Payment</li>
		  		</ul>
				  <div class="steps-content">
					<div data-step="1">
					  <h4>Details</h4>
					  <div class="form-group">
						<label for="name" class="col-md-4 control-label">Name:</label>
						<div class="col-md-8 input-group">
							<input type="text" name="name" value="${outcomeForm.name}" >
						</div>
						</div>
					  <p>
						Sed ac nulla nec turpis pharetra rutrum et at mauris. Phasellus eleifend molestie est, eu lacinia nisi gravida non. Nullam sit amet pulvinar dolor. Etiam id fermentum erat. Proin quis rutrum sapien.
					  </p>
					</div>
					<div data-step="2">
					  <h4>Address</h4>
					  <p>
					  Sed eleifend lobortis dolor, vel hendrerit neque interdum eget. Proin ac hendrerit diam. Mauris tristique libero vel condimentum sodales. Ut sed augue euismod, tincidunt nunc at, rutrum risus. Cras consequat purus sit amet augue varius; vitae ornare erat commodo. In hac habitasse platea dictumst. Nunc lobortis auctor ligula dictum scelerisque. Integer sed justo rutrum, rutrum tortor nec, feugiat nulla?
					  </p>
					</div>
					<div data-step="3">
					  <h4>Template</h4>
					  <p>
						Donec pharetra vel felis facilisis aliquam! Nunc consequat, lorem a scelerisque porttitor, orci neque mattis velit; at rhoncus quam felis a lorem. Cras dictum augue elit, non tempus leo pharetra nec! Nunc iaculis ex quis ante elementum varius. Curabitur a ultrices risus. Etiam elementum magna a eros maximus ornare. Aenean lectus dui, venenatis non tincidunt sed, dignissim at turpis? Vestibulum varius tempor turpis eget laoreet. Phasellus hendrerit purus vel arcu dapibus ullamcorper? Aliquam et nunc sagittis, semper orci eu, eleifend turpis! Integer eget aliquet libero. Vestibulum rutrum, ipsum nec bibendum sagittis, leo libero tristique erat, ut euismod lorem tortor quis lorem. Vivamus et tellus eu purus tempor posuere.
					  </p>
					</div>
					<div data-step="4">
					  <h4>Delivery</h4>
					  <p>
						Nullam sit amet sollicitudin leo. Donec lobortis est a sagittis ornare. Mauris mattis dui sit amet tortor dapibus, sit amet scelerisque nisl fermentum. Praesent efficitur ac mauris sit amet placerat. Pellentesque ultricies, nibh eu elementum convallis, sapien dolor egestas nunc, vitae volutpat lorem orci sed libero. Nullam posuere, massa a tempor maximus, tortor enim ultricies urna, pretium viverra nisi urna id erat? Etiam nec dolor condimentum, consequat velit sagittis, luctus metus. Proin molestie neque justo, ut elementum arcu congue faucibus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla orci est, elementum et venenatis congue, pharetra in lorem. Fusce a blandit arcu.
					  </p>
					</div>
					<div data-step="5">
					  <h4>Payment</h4>
					  <p>
						Ut sed dignissim orci. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nullam scelerisque dapibus magna id scelerisque. Donec enim ligula, commodo ut sapien vitae, tincidunt tincidunt orci. Etiam faucibus sit amet ante ut ultrices. Etiam lacinia purus et sem fermentum commodo. Morbi a nulla ac purus cursus viverra. Fusce mauris sem, blandit quis arcu nec, posuere porta purus? Curabitur sit amet mauris tortor. Etiam pulvinar lacinia quam, vel interdum orci vulputate non. Praesent pharetra justo in lacus lacinia convallis. Morbi viverra blandit ultrices.			  
					  </p>
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