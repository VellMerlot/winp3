$(document).ready(function() {
	
	$("#conyugeForm").hide();
	
	
	    $( "#fechaNacimientoTitular" ).datepicker({
	      changeMonth: true,
	      changeYear: true,
	      dateFormat: 'dd/mm/yy',
	      onSelect: calculateT,
	      maxDate: '+0d',     
	      yearRange: '1910:+0',
	    });
	    
	    $( "#fechaNacimientoConyuge" ).datepicker({
	      changeMonth: true,
	      changeYear: true,
	      dateFormat: 'dd/mm/yy',
	      onSelect: calculateC,
	      maxDate: '+0d',     
	      yearRange: '1910:+0',
	    });
	
	    $(".numberTxt").keydown(function (e) {
	        // Allow: backspace, delete, tab, escape, enter and .
	        if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110]) !== -1 /*||
	             // Allow: Ctrl+A, Command+A
	            (e.keyCode === 65 && (e.ctrlKey === true || e.metaKey === true)) || 
	             // Allow: home, end, left, right, down, up
	            (e.keyCode >= 35 && e.keyCode <= 40)*/) {
	                 // let it happen, don't do anything
	                 return;
	        }
	        // Ensure that it is a number and stop the keypress
	        if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 54)) && (e.keyCode < 96 || e.keyCode > 105)) {
	            e.preventDefault();
	        }
	    });
	    
	//$('#datetimepicker1').datetimepicker();
	
	$('#upload').mfupload({
		type: 'xml', //all types
		maxsize: 5,
		post_upload: "/winp3/rest/simulator/upload",
		folder: "/",
		ini_text: "clicka o arrastra el XML aquí",
		over_text: ".....",
		over_col: 'white',
		over_bkcol: 'blue',
		init: function(){ },        
		loaded: function(result){
			if (result.respuesta == "ERROR") {
				//bootbox.alert("ERROR: "+result.error);
			} else {
				//createVersion();
				$("#simActions").hide();
				$("#form").removeClass("hidden");
				
				
				// Injectar resultado al form
			}
		},
		error: function(error){ 
			//bootbox.alert(unescape(messages["app.label.box.war.error"] + " ("+error.filename+")"));
		}
        
	}); 
	
	$("#btn_print").click(function(){
		window.print();
	});
});

function calculateT() {
	
	var start = $('#fechaNacimientoTitular').datepicker('getDate');
	
	if (start != null) {
		var end       = new Date();
		var age_year  = Math.floor((end - start)/31536000000);
		var age_month = Math.floor(((end - start)% 31536000000)/2628000000);
		var age_day   = Math.floor((((end - start)% 31536000000) % 2628000000)/86400000);
  
		$("#edadTitular").val(age_year);
	}
}

function calculateC() {
	
	var start = $('#fechaNacimientoConyuge').datepicker('getDate');
	
	if (start != null) {
		var end       = new Date();
		var age_year  = Math.floor((end - start)/31536000000);
		var age_month = Math.floor(((end - start)% 31536000000)/2628000000);
		var age_day   = Math.floor((((end - start)% 31536000000) % 2628000000)/86400000);
  
		$("#edadConyuge").val(age_year);
	}
}

function mostrarHijosForms(input) {
	
	var formHijo = "<fieldset> <legend>Datos de usuario</legend> <div class='form-group'> <label for='userName' class='col-lg-2 control-label'>Nombre usuario</label> <div class='col-lg-4'> <c:if test='${userForm.id eq 0}'> <input type='text' class='form-control' id='userName' name='userName' placeholder='' value='${userForm.userName}' required> </c:if> <c:if test='${userForm.id ne 0}'> <input type='hidden' id='userName' name='userName' value='${userForm.userName}'> <span disabled class='form-control'>${userForm.userName}</span> </c:if> </div></div><div class='form-group'> <label for='password' class='col-lg-2 control-label'>Password</label> <div class='col-lg-4'> <input type='hidden' id='password' name='password' value='${userForm.password}'> <input class='form-control' data-error='Obtener nuevo password mediante boton' id='password_span' required value='<c:if test='${userForm.id eq 0}'></c:if><c:if test='${userForm.id ne 0}'>********</c:if>'/> <div class='help-block with-errors'></div></div><div class='col-lg-4'> <button type='button' id='new_password' class='btn btn-default'>Obtener password</button> </div></div><div class='form-group'> <label for='firstName' class='col-lg-2 control-label'>Nombre</label> <div class='col-lg-10'> <input type='text' class='form-control' id='firstName' name='firstName' placeholder='' value='${userForm.firstName}'> </div></div><div class='form-group'> <label for='lastName' class='col-lg-2 control-label'>Apellidos</label> <div class='col-lg-10'> <input type='text' class='form-control' id='lastName' name='lastName' placeholder='' value='${userForm.lastName}'> </div></div><div class='form-group'> <label for='email' class='col-lg-2 control-label'>Email</label> <div class='col-lg-10'> <input type='text' class='form-control' id='email' name='email' placeholder='Email' value='${userForm.email}'> </div></div><div class='form-group'> <label for='role' class='col-lg-2 control-label'>Tipo de usuario</label> <div class='col-lg-10'> <input type='hidden' id='role' name='role' value='${userForm.role}'> <c:if test='${userForm.id ne 0}'> <span disabled class='form-control'> <c:if test='${userForm.role eq 1}'>USUARIO</c:if> <c:if test='${userForm.role eq 2}'>ADMIN</c:if> </span> </c:if> <c:if test='${userForm.id eq 0}'> <select id='role_list' class='form-control' required> <option></option> <option value='1'>USUARIO</option> <option value='2'>ADMIN</option> </select> <div class='help-block with-errors'></div></c:if> </div></div><div class='form-group'> <div class='col-lg-10 col-lg-offset-2'> <a href='<c:url value='/web/pages/users'/>' class='btn btn-default' role='button'>Cancela</a> <button type='submit' class='btn btn-primary'>Guardar</button> </div></div></fieldset>";
	
	$( "#step1" ).append( formHijo );
}

function tieneConyuge(mostrar) {
	if (mostrar) {
		$("#conyugeForm").show();
	} else {
		$("#conyugeForm").hide();
	}
	
}
