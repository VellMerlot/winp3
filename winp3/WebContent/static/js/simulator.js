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
//	      onSelect: calculateT,
	      maxDate: '+0d',     
	      yearRange: '1910:+0',
	    });
	    
	    $( "#fechaNacimientoConyuge" ).datepicker({
	      changeMonth: true,
	      changeYear: true,
	      dateFormat: 'dd/mm/yy',
//	      onSelect: calculateC,
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
				
				
				// Inyectar resultado al form
			}
		},
		error: function(error){ 
			//bootbox.alert(unescape(messages["app.label.box.war.error"] + " ("+error.filename+")"));
		}
        
	}); 
	
	$("#btn_print").click(function(){
		window.print();
	});
	
	
	
	
	var ctx = document.getElementById("chart-area").getContext("2d");
	
	var gradient = ctx.createLinearGradient(0, 0, 200, 0);
	gradient.addColorStop(0, 'red');
	gradient.addColorStop(1, 'green');
	
	var myChart = new Chart(ctx, {
	    type: 'horizontalBar',
	    data: {
	        labels: ["Red", "Blue", "Yellow", "Green", "Purple", "Orange"],
	        datasets: [{
	            label: '# of Votes',
	            data: [12, 19, 3, 5, 2, 3],
	            backgroundColor: [
	            	/*'rgba(255, 99, 132, 0.2)',*/
	            	gradient,
	                'rgba(54, 162, 235, 0.2)',
	                'rgba(255, 206, 86, 0.2)',
	                'rgba(75, 192, 192, 0.2)',
	                'rgba(153, 102, 255, 0.2)',
	                'rgba(255, 159, 64, 0.2)'
	            ],
	            borderColor: [
	                'rgba(255,99,132,1)',
	                'rgba(54, 162, 235, 1)',
	                'rgba(255, 206, 86, 1)',
	                'rgba(75, 192, 192, 1)',
	                'rgba(153, 102, 255, 1)',
	                'rgba(255, 159, 64, 1)'
	            ],
	            borderWidth: 1,
	            /*backgroundColor: gradient,
				hoverBackgroundColor: gradient,
				hoverBorderWidth: 2,
				hoverBorderColor: 'purple'*/
	        }]
	    },
	    options: {
	        scales: {
	            yAxes: [{
	                ticks: {
	                    beginAtZero:true
	                }
	            }]
	        },
	        legend: {
	            display: true,
	            position: 'right'
	        },
	        title: {
	            display: true,
	            text: 'Custom Chart Title'
	        }
	    }
	});	
	
	
	var ctx2 = document.getElementById("chart-area2").getContext("2d");
	var myChart2 = new Chart(ctx2, {
	    type: 'bar',
	    data: {
	        labels: ["Red", "Blue", "Yellow", "Green", "Purple", "Orange"],
	        datasets: [
	        	{
	        		yAxesGroup: 'etiqueta1',
	            data: [12, 19, 3, 5, 2, 3],
	            backgroundColor: [
	                'rgba(255, 99, 132, 0.2)',
	                'rgba(54, 162, 235, 0.2)',
	                'rgba(255, 206, 86, 0.2)',
	                'rgba(75, 192, 192, 0.2)',
	                'rgba(153, 102, 255, 0.2)',
	                'rgba(255, 159, 64, 0.2)'
	            ],
	            borderColor: [
	                'rgba(255,99,132,1)',
	                'rgba(54, 162, 235, 1)',
	                'rgba(255, 206, 86, 1)',
	                'rgba(75, 192, 192, 1)',
	                'rgba(153, 102, 255, 1)',
	                'rgba(255, 159, 64, 1)'
	            ],
	            borderWidth: 1
	        },
	        {
	        	 yAxesGroup: 'etiqueta2',
	            data: [15, 29, 9, 8, 4, 4],
	            backgroundColor: [
	                'rgba(155, 99, 132, 0.2)',
	                'rgba(44, 162, 235, 0.2)',
	                'rgba(155, 206, 86, 0.2)',
	                'rgba(65, 192, 192, 0.2)',
	                'rgba(53, 102, 255, 0.2)',
	                'rgba(155, 159, 64, 0.2)'
	            ],
	            borderColor: [
	                'rgba(255,99,132,1)',
	                'rgba(54, 162, 235, 1)',
	                'rgba(255, 206, 86, 1)',
	                'rgba(75, 192, 192, 1)',
	                'rgba(153, 102, 255, 1)',
	                'rgba(255, 159, 64, 1)'
	            ],
	            borderWidth: 1
	        }
	        	]
	    },
	    options: {
	        scales: {
	        	xAxes: [{
	                stacked: true
	            }],
	            yAxes: [{
	                stacked: true
	            }]
	        },
	        legend: {
	            display: true,
	            position: 'right'
	        },
	        title: {
	            display: true,
	            text: 'Custom Chart Title'
	        }
	    }
	});	
	
	
	$(".next-text").click(function(){    	
    	submitManual();
    	if ($("div#divStep1 .has-error").length > 0 && $("div#divStep1.active")) {
    		alert('Verifique todos los campos.');
    		return false;
    	}
    	if ($("div#divStep2 .has-error").length > 0 && $("div#divStep2.active")) {
    		alert('Verifique todos los campos.');
    		return false;
    	}
    	if ($("div#divStep3 .has-error").length > 0 && $("div#divStep3.active")) {
    		alert('Verifique todos los campos.');
    		return false;
    	}
    }); 
});

function submitManual(){
	$("input").blur();
}

function calculaEdad(campoOrigen, campoDestino) {
	
	var dateString = campoOrigen.value;
	var dateParts = dateString.split("/");
	var birthDate = new Date(dateParts[2], dateParts[1] - 1, dateParts[0]); // month is 0-based;

	if (birthDate != null) {
		var today       = new Date();
		var AgeInYears  = Math.floor ( (today - birthDate) / 31556952000 )

		campoDestino.value = AgeInYears;
	}
}


function mostrarHijosForms(input) {
	
	var formHijo = "";
	
	$(".FormHijo").remove();
	
	for (var i = 1; i < (parseInt(input.value) + 1); i++) {
		formHijo = "<fieldset id='formHijo" + i + "' class='FormHijo'>" +
				"<legend>Cuestionario Hija/o</legend>" +
				"<div class='form-group'>" +
				"<label for='userName' class='col-lg-2 control-label'>Nombre:</label>" +
				"<div class='col-lg-4 input-group'>" +
				"<input required data-error='Campo obligatorio' type='text' class='form-control' id='' name='NombreHijo" + i + "' placeholder='' value='' required>" +
				"</div>" +
				"</div>" +
				"<div class='form-group'>" +
				"<label for='inputPassword' class='col-lg-2 control-label'>Sexo:</label>" +
				"<div class='col-lg-4 input-group'>" +
				"<label class='radio-inline'><input type='radio' name='sexoHijo" + i + "'>Hombre</label>" +
				"<label class='radio-inline'><input type='radio' name='sexoHijo" + i + "'>Mujer</label>" +
				"</div>" +
				"</div>" +
				"<div class='form-group'>" +
				"<label for='inputLabel3' class='col-lg-2 control-label'>Fecha de Nacimiento:</label>" +
				"<div class='col-lg-4 input-group'>" +
				"<div class='input-group date' id='datetimepicker1'>" +
				"<input required data-error='Campo obligatorio' type='text' class='form-control datepicker' id='fechaNacimientoHijo" + i + "'" +
				" onChange='calculaEdad(fechaNacimientoHijo"+i+",edadHijo"+i+");CalculaOrfandad(HijoDe" + i + ", edadHijo" + i + ", OrfandadHijo" + i + ", OrfandadCHijo" + i + ");'/>" +
				"<span class='input-group-addon'>" +
				"<span class='glyphicon glyphicon-calendar'></span> </span></div></div></div><div class='form-group'>" +
				"<label for='lastName' class='col-lg-2 control-label'>Hijo de:</label> <div class='col-lg-10'>" +
				"<select class='form-control' id='HijoDe" + i + "' onChange='CalculaOrfandad(HijoDe" + i + ", edadHijo" + i + ", OrfandadHijo" + i + ", OrfandadCHijo" + i + ")'>" +
						"<option>Ambos</option>" +
						"<option>Sólo Titular</option>" +
						"<option>Sólo Cónyuge</option>" +
				"</select>" +
				"</div>" +
				"</div>" +
				"<div class='form-group'>" +
				"<label for='email' class='col-lg-2 control-label'>Edad:</label>" +
				"<div class='col-lg-10'>" +
				"<input type='text' class='form-control' id='edadHijo" + i + "' name='edadHijo" + i + "' placeholder='' value='' readonly>" +
				"</div>" +
				"</div>" +
				"<div class='form-group'>" +
				"<label for='role' class='col-lg-2 control-label'>Derecho a Orfandad:</label>" +
				"<div class='col-lg-10'>" +
				"<input type='text' class='form-control' id='' name='OrfandadHijo" + i + "' placeholder='' value='' readonly>" +
				"</div>" +
				"</div>" +
				"<div class='form-group'>" +
				"<label for='role' class='col-lg-2 control-label'>Derecho a Orfandad (C):</label>" +
				"<div class='col-lg-10'>" +
				"<input type='text' class='form-control' id='' name='OrfandadCHijo" + i + "' placeholder='' value='' readonly>" +
				"</div>" +
				"</div>" +
				"</fieldset>";
		$( "#step1" ).append( formHijo );
	}
	
	$( ".datepicker" ).datepicker({
	      changeMonth: true,
	      changeYear: true,
	      dateFormat: 'dd/mm/yy',
//	      onSelect: calculateC,
	      maxDate: '+0d',     
	      yearRange: '1910:+0',
	    });
	$("#form").validator('update');
}

function showConyugeForm(mostrar) {
	if (mostrar) {
		$("#conyugeForm").show();
		$(".conyugeForm").show();
	} else {
		$("#conyugeForm").hide();
		$(".conyugeForm").hide();
	}
}

function CalculaOrfandad(hijoDe, edadHijo, OrfandadHijo, OrfandadCHijo) {
	var hijo = edadHijo.name.slice(4);
	
	if (edadHijo.value) {
		if (edadHijo.value < 25) {
			//quizá
			if (hijoDe.value == "Ambos") {
				OrfandadHijo.value = 'Sí';
				OrfandadCHijo.value = 'Sí';
			} else if (hijoDe.value == "Sólo Titular") {
				OrfandadHijo.value = 'Sí';
				OrfandadCHijo.value = 'No';
			} else {
				OrfandadHijo.value = 'No';
				OrfandadCHijo.value = 'Sí';
			}
		} else {
			//nope
			OrfandadHijo.value = 'No';
			OrfandadCHijo.value = 'No';
		}
	} else {
		alert('Seleccione fecha de nacimiento de ' + hijo);
	}
	
}