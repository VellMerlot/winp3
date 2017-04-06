$(document).ready(function() {
	
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
			}
		},
		error: function(error){ 
			//bootbox.alert(unescape(messages["app.label.box.war.error"] + " ("+error.filename+")"));
		}
        
	});

});

