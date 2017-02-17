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
		<h1>RESULTADOS</h1>
		
		<div class="row" style="padding-top: 2%; text-align: right;">
	      		<div class="col-md-12">
	      			<form name="form" action="${formActionUrl}" method="post">
	      				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		        		<button type="submit" class="btn btn-primary">Generar</button>
		        	</form>	
	      		</div>
	      	</div>
	      	
	     
	
	 
	 	
    </div><!--/.container-->
	
	<%@ include file="footer.jsp" %>
	<script type="text/javascript" src="<c:url value='/static/js/jquery.wizard.js' />"></script>
	<script type="text/javascript" src="<c:url value='/static/js/simulator.js' />"></script>
</body>
</html>