$(document).ready(function() {
	loadConfiguration();
});

function loadConfiguration() {
	
	var success = function(data) {
		var obj = jQuery.parseJSON(data);
		console.log(obj);
		
		
	}

	ajax('', '/winp3/rest/configuration/list/', success);
}