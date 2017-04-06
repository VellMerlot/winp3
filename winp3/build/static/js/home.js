function logout() {
	document.getElementById("logoutForm").submit();
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