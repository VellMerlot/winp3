$(document).ready(function() {
	loadList();
	$(".alert-success").delay(3000).fadeOut("slow", function () { $(this).remove(); });
});

function loadUser() {
	var success = function(data) {
		var obj = jQuery.parseJSON(data);
		console.log(obj);
	};
	
	ajax('', '/winp3/rest/users/find/', success);
}

function loadList() {
		
	$("#tabla tbody tr").remove();
	
	var success = function(data) {
		var obj = jQuery.parseJSON(data);
		
		if (obj && obj.length > 0){
			 $.each(obj, function() {
				 var html = '<tr id="'+this['id']+'"';
				 
				 if (this['role'] == 1 && this['status'] == 0) html += ' >';
				 if (this['role'] == 1 && this['status'] == 1) html += ' class="danger">';
				 
				 if (this['role'] == 2 && this['status'] == 0) html += ' class="info">';
				 if (this['role'] == 2 && this['status'] == 1) html += ' class="danger">';
				 
				 html += '<td></td>';
				 html += '<td>'+this['userName']+'</td>';
				 html += '<td>'+this['firstName']+'</td>';
				 html += '<td>'+this['lastName']+'</td>';
				 html += '<td>'+this['email']+'</td>';
				 html += '<td>';
				 
				 if (this['status'] == '0') html += 'Activo';
				 if (this['status'] == '1') html += 'Eliminado';
				 
				 html += '</td>';

				 html += '<td class="actions">';
				 
				 if (this['status'] == '0'){
					 html += '<a href="/winp3/web/pages/users/show?user='+this['id']+'" class="btn btn-xs btn-info" role="button"><span class="glyphicon glyphicon-pencil"></span></a>';
					 html += '<a href="/winp3/web/pages/users/delete?user='+this['id']+'" class="btn btn-xs btn-info" role="button"><span class="glyphicon glyphicon-trash"></span></a>';
				 }
				 if (this['status'] == '1'){
					 html += '<a href="/winp3/web/pages/users/activate?user='+this['id']+'" class="btn btn-xs btn-info" role="button"><span class="glyphicon glyphicon-refresh"></span></a>';
				 }
				 
				 /*
				  * EDITAR
				  * ELIMINAR
				  * --> RESETEAR PASS
				  * --> RECUPERAR
				  * */
				 
				 
				 html += '</td>';
				 html += '</tr>';
				 
				 $('#tabla').append(html);
			   });
			 
			
		}
		return;
	};
	
	ajax('', '/winp3/rest/users/list/', success);
}