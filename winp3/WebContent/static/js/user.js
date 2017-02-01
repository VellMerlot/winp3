$(document).ready(function() {
	loadList();
});


function loadList() {
		
	$("#tabla tbody tr").remove();
	
	var success = function(data) {
		var obj = jQuery.parseJSON(data);
		
		if (obj && obj.length > 0){
			 $.each(obj, function() {
				 var html = '<tr id="'+this['id']+'">';
				 
				 html += '<td>'+this['userName']+'</td>';
				 html += '<td>'+this['firstName']+'</td>';
				 html += '<td>'+this['lastName']+'</td>';
				 html += '<td>'+this['email']+'</td>';
				 html += '<td>'+this['status']+'</td>';
				 html += '<td>'+this['role']+'</td>';
				 
				 html += '<td></td>';
				 html += '</tr>';
				 
				 $('#tabla').append(html);
			   });
			 
			
		}
		return;
	};
	
	ajax('', '/winp3/rest/user/list/', success);
}

function ajax(_type, _url, _success, _error) {
	$.ajax({
        type: isEmpty(_type) ? "GET" : _type,
        url: _url,
        dataType: "html", // data type of response
        success: function(data) {
        	if (_success && typeof(_success) === "function") {   
        		_success(data);
	 	    } else {
	 	    	if (typeof(data) === "object")
	 	    		console.log(data.responseText);
	 	    	else
	 	    		console.log(data);
	 	    }
        },
        error: function(data) {      	        	
        	if (_error && typeof(_error) === "function") {   
        		_error(data);
	 	    } else {
	 	    	if (typeof(data) === "object")
	 	    		console.log("ERROR: " + data.responseText);
	 	    	else
	 	    		console.log("ERROR: " + data);
	 	    }
        },
        complete: function(data){
        	// $('input[type=submit]').attr('disabled', '');
        },
	    timeout:10000,
        cache: false,
        async: (_type == "GET")? true:false
    });
}

function getId(elem){
	var tr = $(elem).parents('tr');
	if (tr){
		return tr.attr('id');
	}
	return null;
}

function isEmpty(val){
    return (val === undefined || val == null || val.length <= 0) ? true : false;
}
