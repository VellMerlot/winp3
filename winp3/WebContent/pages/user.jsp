<%@ page session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>

<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
  <link rel="stylesheet" href="<c:url value='/static/css/bootstrap-yeti.min.css' />">
  <link rel="stylesheet" href="<c:url value='/static/css/main.css' />">
  
  <script src="<c:url value='/static/js/jquery.min.js' />"></script>
  <script src="<c:url value='/static/js/bootstrap.min.js' />"></script>
  <script src="<c:url value='/static/js/home.js' />"></script>
  
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
                    <label for="email" class="col-lg-2 control-label">Email</label>
                    <div class="col-lg-10">
                      <input type="text" class="form-control" id="email" name="email" placeholder="Email" value="${userForm.email}">
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="inputPassword" class="col-lg-2 control-label">Password</label>
                    <div class="col-lg-10">
                      <input type="password" class="form-control" id="inputPassword" placeholder="Password">
                      <div class="checkbox">
                        <label>
                          <input type="checkbox"> Checkbox
                        </label>
                      </div>
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="textArea" class="col-lg-2 control-label">Textarea</label>
                    <div class="col-lg-10">
                      <textarea class="form-control" rows="3" id="textArea"></textarea>
                      <span class="help-block">A longer block of help text that breaks onto a new line and may extend beyond one line.</span>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-lg-2 control-label">Radios</label>
                    <div class="col-lg-10">
                      <div class="radio">
                        <label>
                          <input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked="">
                          Option one is this
                        </label>
                      </div>
                      <div class="radio">
                        <label>
                          <input type="radio" name="optionsRadios" id="optionsRadios2" value="option2">
                          Option two can be something else
                        </label>
                      </div>
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="select" class="col-lg-2 control-label">Selects</label>
                    <div class="col-lg-10">
                      <select class="form-control" id="select">
                        <option>1</option>
                        <option>2</option>
                        <option>3</option>
                        <option>4</option>
                        <option>5</option>
                      </select>
                      <br>
                      <select multiple="" class="form-control">
                        <option>1</option>
                        <option>2</option>
                        <option>3</option>
                        <option>4</option>
                        <option>5</option>
                      </select>
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
</body>
</html>