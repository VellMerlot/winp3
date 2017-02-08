$(document).ready(function() {
	$("#new_password").click(function(){    	
    	getNewPassword();
    });
	
	$("#btn_password").click(function(){    	
		var psd = $('#inputPassword').html();
		$('#password').val(psd);
		$('#password_span').html("********");
    });
	
	
	$("#role_list").change(function() {
		var option = $( "select option:selected" ).val();
		$("#role").val(option);
	});

});

function getNewPassword() {
	var success = function(data) {
		if (data && data.length > 0){
			$('#inputPassword').html(data);
			$("#myModal").modal();
		}
	};
	ajax('', '/winp3/rest/users/password/', success);
}

