$(document).ready(function() {
	
	 $.datepicker.regional['es'] = {
		 closeText: 'Cerrar',
		 prevText: '< Ant',
		 nextText: 'Sig >',
		 currentText: 'Hoy',
		 monthNames: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
		 monthNamesShort: ['Ene','Feb','Mar','Abr', 'May','Jun','Jul','Ago','Sep', 'Oct','Nov','Dic'],
		 dayNames: ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'],
		 dayNamesShort: ['Dom','Lun','Mar','Mié','Juv','Vie','Sáb'],
		 dayNamesMin: ['Do','Lu','Ma','Mi','Ju','Vi','Sá'],
		 weekHeader: 'Sm',
		 dateFormat: 'dd/mm/yy',
		 firstDay: 1,
		 isRTL: false,
		 yearSuffix: ''
	 };
	 
	 $.datepicker.setDefaults($.datepicker.regional['es']);
	
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
	
	var formHijo = "<fieldset> <legend>Cuestionario Hija/o</legend> <div class='form-group'> <label for='userName' class='col-lg-2 control-label'>Nombre:</label> <div class='col-lg-4'> <input type='text' class='form-control' id='' name='' placeholder='' value='' required> </div></div><div class='form-group'> <label for='inputPassword' class='col-md-4 control-label'>Sexo:</label><div class='col-md-8 input-group'><label class='radio-inline'><input type='radio' name='sexoHijo'>Hombre</label><label class='radio-inline'><input type='radio' name='sexoHijo'>Mujer</label></div></div><div class='form-group'> <label for='inputLabel3' class='col-lg-2 control-label'>Fecha de Nacimiento:</label><div class='col-lg-4 input-group'><div class='input-group date' id='datetimepicker1'> <input type='text' class='form-control datepicker' id='fechaNacimientoTitular'/> <span class='input-group-addon'> <span class='glyphicon glyphicon-calendar'></span> </span></div></div></div><div class='form-group'> <label for='lastName' class='col-lg-2 control-label'>Hijo de:</label> <div class='col-lg-10'> <select class='form-control' id='sel1'><option>Ambos</option><option>Solo Titular</option><option>Solo Conyuge</option></select> </div></div><div class='form-group'> <label for='email' class='col-lg-2 control-label'>Edad:</label> <div class='col-lg-10'> <input type='text' class='form-control' id='' name='' placeholder='' value='' readonly> </div></div><div class='form-group'> <label for='role' class='col-lg-2 control-label'>Derecho a Orfandad:</label> <div class='col-lg-10'> <input type='text' class='form-control' id='' name='' placeholder='' value='' readonly> </div></div></fieldset>";
	
	for (var i = 0; i < input.value; i++) {
		$( "#step1" ).append( formHijo );
	}
	
}

function tieneConyuge(mostrar) {
	if (mostrar) {
		$("#conyugeForm").show();
	} else {
		$("#conyugeForm").hide();
	}
	
}
