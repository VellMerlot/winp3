<%@ page session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>

<head>
  <%@ include file="head.jsp" %>
  
  <title>Configuración de constantes</title>
</head> 

<body>
  	<%@ include file="navbar.jsp" %>
  	<%@ include file="logout.jsp" %>
  	
  	<div class="container">
  		
		<h1>
			<c:if test="${not empty username}">Usuario: ${username}</c:if>
			<c:if test="${empty username}">Nuevo usuario</c:if>
		</h1>
		
		<br>
		<div class="well bs-component">
              <form:form class="form-horizontal" method="post" modelAttribute="userForm" action="${formActionUrl}">
              	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                <fieldset>
                  <legend>Datos de usuario</legend>
                  <div class="form-group">
                    <label for="userName" class="col-lg-2 control-label">Nombre usuario</label>
                    <div class="col-lg-10">
                      <input type="text" class="form-control" id="userName" name="userName" placeholder="" value="${userForm.userName}">
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="password" class="col-lg-2 control-label">Password</label>
                    <div class="col-lg-10">
                      <input type="password" class="form-control" id="password" name="password" placeholder="Password" value="${userForm.password}">
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="firstName" class="col-lg-2 control-label">Nombre</label>
                    <div class="col-lg-10">
                      <input type="text" class="form-control" id="firstName" name="firstName" placeholder="" value="${userForm.firstName}">
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="lastName" class="col-lg-2 control-label">Apellidos</label>
                    <div class="col-lg-10">
                      <input type="text" class="form-control" id="lastName" name="lastName" placeholder="" value="${userForm.lastName}">
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="email" class="col-lg-2 control-label">Email</label>
                    <div class="col-lg-10">
                      <input type="text" class="form-control" id="email" name="email" placeholder="Email" value="${userForm.email}">
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="role" class="col-lg-2 control-label">Tipo de usuario</label>
                    <div class="col-lg-10">
                      <input type="text" readonly class="form-control" id="role" name="role" value="${userForm.role}">
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="status" class="col-lg-2 control-label">Estado</label>
                    <div class="col-lg-10">
                      <input type="text" readonly class="form-control" id="status" name="status" value="${userForm.status}">
                    </div>
                  </div>
                  
                  <div class="form-group">
                    <div class="col-lg-10 col-lg-offset-2">
                      <button type="reset" class="btn btn-default">Cancela</button>
                      <button type="submit" class="btn btn-primary">Guardar</button>
                    </div>
                  </div>
                </fieldset>
              </form:form>
            
       </div>
            
            
		
</div><!-- /.container -->

	<%@ include file="footer.jsp" %>
</body>
</html>