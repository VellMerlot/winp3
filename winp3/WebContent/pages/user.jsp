<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@page session="true"%>
<!DOCTYPE html>

<html>
	<head>
	    <meta charset="UTF-8">
	    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="description" content="">
		<meta name="author" content="">
		<link rel="icon" href="<c:url value='/img/favicon.ico' />">
	
    	<title>USERS</title>

	 	<!-- Bootstrap core CSS -->
    	<link href="<c:url value='/static/css/bootstrap.min.css'/>" rel="stylesheet">
	    
	    <!-- Custom styles for this template -->
    	<link rel="stylesheet" href="<c:url value='/static/css/bootstrap-yeti.min.css' />">
    
	</head>

  <body>
  
	<div class="container">
	
		<div class="navbar navbar-default navbar-fixed-top" role="navigation">
	      <div class="container">
	        <div class="navbar-header">
	          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
	            <span class="sr-only">Toggle navigation</span>
	            <span class="icon-bar"></span>
	            <span class="icon-bar"></span>
	            <span class="icon-bar"></span>
	          </button>
	          <a class="navbar-brand" href="<c:url value='/' />">WIMP3</a>
	        </div>
        <div class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li class="dropdown active">
	           <a href="<c:url value='/web/admin' />" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">ADMIN <span class="caret"></span></a>
               <ul class="dropdown-menu" role="menu">
               		<li><a href="<c:url value='jobs' />">1</a></li>
	                <li><a href="<c:url value='exports' />">2</a></li>
	                <li><a href="<c:url value='repository' />">3</a></li>	                 
	                <li><a href="<c:url value='instances' />">4</a></li>	                
	                <li><a href="<c:url value='upload' />">5</a></li>
	                <li class="active"><a href="<c:url value='notification' />">6</a></li>
               </ul>
             </li>
          </ul>
          <ul class="nav navbar-nav navbar-right">
                <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><span
                    class="glyphicon glyphicon-user"></span>session <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a href="javascript:logout()"><span class="glyphicon glyphicon-off"></span>logout</a></li>
          </ul>
                </li>
	            </ul>
	            </div>
	        <!--/.nav-collapse -->
	      </div>
	    </div>
		<c:url value="/web/j_spring_security_logout" var="logoutUrl" />
		<form action="${logoutUrl}" method="post" id="logoutForm">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		</form>
    	      	    

			<div class="jumbotron">
				<h1>title</h1>
				<p>description</p>
			</div>
		
			<div class="page-header">
	        	<h1>title</h1>
	      	</div>
	      	
			<div class="row" style="padding-top: 5%;">
				<div class="col-md-12">
		          <table class="table table-striped table-hover" id="tabla">
		            <thead>
		              <tr>
		              	<th>table.col1</th>
						<th>table.col2</th>
						<th>table.col3</th>
						<th>table.col4</th>
						<th>table.col5</th>
						<th>table.col6</th>
						<th>table.col7</th>
		              </tr>
		            </thead>
		            <tbody>		             
		            </tbody>
		          </table>
		        </div>				
			</div>
			<!--/row-->
			<hr>
			<footer>
			<p>footer.label.copyright</p>
			</footer>
		</div>
				
		
	    
	    <!-- Placed at the end of the document so the pages load faster -->
		<script type="text/javascript" src="<c:url value='/static/js/jquery.min.js' />"></script>
		<script type="text/javascript" src="<c:url value='/static/js/bootstrap.min.js' />"></script>
		<script type="text/javascript" src="<c:url value='/static/js/user.js' />"></script>
				
	</body>
</html>