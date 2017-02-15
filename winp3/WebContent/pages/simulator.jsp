<%@ page session="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>

<head>
  <%@ include file="head.jsp" %>
  <title>Simulador</title>
</head> 

<body>
	<%@ include file="navbar.jsp" %>
  	<%@ include file="logout.jsp" %>
  	
  	<div class="container">
		<h1>SIMULATOR</h1>
		
		<div class="row" style="padding-top: 2%; text-align: right;">
	      		<div class="col-md-12">
	      			<form name="form" action="${formActionUrl}" method="post">
	      				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		        		<button type="submit" class="btn btn-primary">Generar</button>
		        	</form>	
	      		</div>
	      	</div>
	      	
	      	
	      <div class="row" style="padding-top: 2%; text-align: right;">
	      		<div class="col-md-12">	
	      			<form name="form2" action="/winp3/web/pages/simulator/load" method="post" >
	      				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						File1 to upload: <input type="file" name="file">
						<button type="submit"  class="btn btn-primary">Upload</button>
					</form>
	      		</div>
	      </div>
	</div>
	
	<%@ include file="footer.jsp" %>
</body>
</html>