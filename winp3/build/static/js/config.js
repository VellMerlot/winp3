$(document).ready(function() {
//	loadConfiguration();
	
	$(".alert-success").delay(3000).fadeOut("slow", function () { $(this).remove(); });
});

//function loadConfiguration() {
//	
//	var success = function(data) {
//		var obj = jQuery.parseJSON(data);
//		console.log(obj);
//		
//		
//	}
//
//	ajax('', '/winp3/rest/configuration/list/', success);
//}