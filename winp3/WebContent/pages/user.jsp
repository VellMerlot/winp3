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
			<c:if test="${userForm.id ne 0}">Detalle usuario</c:if>
			<c:if test="${userForm.id eq 0}">Nuevo usuario</c:if>
		</h1>
		
		<br>
		<div class="well bs-component">
              <form:form class="form-horizontal" method="post" modelAttribute="userForm" action="${formActionUrl}">
              	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
              	<input type="hidden" name="id" value="${userForm.id}" />
              	
                <fieldset>
                  <legend>Datos de usuario</legend>
                  <div class="form-group">
                    <label for="userName" class="col-lg-2 control-label">Nombre usuario</label>
                    <div class="col-lg-4">
                      <input type="text" class="form-control" id="userName" name="userName" placeholder="" value="${userForm.userName}">
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="password" class="col-lg-2 control-label">Password</label>
                    <div class="col-lg-4">
                      <input type="password" class="form-control" id="password" name="password" placeholder="Password" value="${userForm.password}">
                    </div>
                    <div class="col-lg-4">
                      <button type="button" id="new_password" class="btn btn-default">Obtener password</button>
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
                      <input type="hidden" readonly class="form-control" id="role" name="role" value="${userForm.role}">
                      <c:if test="${userForm.id ne 0}">
                      	<span>${userForm.role}</span>
                      </c:if>
                      <c:if test="${userForm.id eq 0}">
                      	<select id="role_list"  class="form-control">
                      		<option value="0" selected="selected">--</option>
                      		<option value="1">USUARIO</option>
                      		<option value="2">ADMIN</option>
                      	</select>
                      </c:if>
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
            
            
		  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header" style="padding:35px 50px;">
          <h4 class="modal-title">Password generado</h4>
        </div>
        <div class="modal-body" style="padding:40px 50px;">
            <div class="form-group" style="text-align: center;background-color: powderblue;padding-top: 15px;padding-bottom: 15px;">
              	<span id="inputPassword"></span>
            </div>
            <br>
            <p class="text-info">Debe copiar éste password para enviarselo al usuario. Después de cerrar la ventana no estará disponible.</p>
          
        <div class="modal-footer">
        	<button type="button" id="btn_password" class="btn btn-primary" data-dismiss="modal">Aceptar</button>       
        </div>
      </div>
      
    </div>
  </div> 
</div><!-- /.container -->

	<%@ include file="footer.jsp" %>
	<script type="text/javascript" src="<c:url value='/static/js/user.js' />"></script>
	
</body>
</html>