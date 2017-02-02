$(document).ready(function(){
    $("#myBtn").click(function(){
    	$("#error_msg").hide();
    	showLoginPanel();
    });
    
    $("#error_msg").hide();    
    var error = $("#error").val();
    if (error){
    	$("#error_msg").html(error);
    	$("#error_msg").show();
    	showLoginPanel();
    }
});

function showLoginPanel(){
	$("#myModal").modal();
}