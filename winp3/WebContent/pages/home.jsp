<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
  <link rel="stylesheet" href="<c:url value='/static/css/bootstrap-yeti.min.css' />">
  <link rel="stylesheet" href="<c:url value='/static/css/main.css' />">
  
  <script src="<c:url value='/static/js/jquery.min.js' />"></script>
  <script src="<c:url value='/static/js/bootstrap.min.js' />"></script>
  <script src="<c:url value='/static/js/home.js' />"></script>
  
  <%@ include file="navbar.jsp" %>
  
</head> 
<body>	
  
	<c:url value="/web/j_spring_security_logout" var="logoutUrl" />
	<form action="${logoutUrl}" method="post" id="logoutForm">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	</form>
</body>
</html>