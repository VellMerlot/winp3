$(document).ready(function() {
	$("#new_password").click(function(){    	
    	getNewPassword();
    });
	
	$("#btn_password").click(function(){    	
		var psd = $('#inputPassword').html();
		$('#password').val(psd);
		$('#password_span').val("********");
		$('#password_span').blur();
    });
	
	
	$("#role_list").change(function() {
		var option = $( "select option:selected" ).val();
		$("#role").val(option);
	});

	$("#password_span").focus(function(){
		$("#new_password" ).focus();
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

