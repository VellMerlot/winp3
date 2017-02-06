$(document).ready(function() {
	loadList();
	loadUser();
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
				 
				 if (this['role'] == 1) html += ' >';
				 if (this['role'] == 2) html += ' class="info">';
				 
				 html += '<td></td>';
				 html += '<td>'+this['userName']+'</td>';
				 html += '<td>'+this['firstName']+'</td>';
				 html += '<td>'+this['lastName']+'</td>';
				 html += '<td>'+this['email']+'</td>';
				 html += '<td>';
				 
				 if (this['status'] == '0') html += 'Activo';
				 if (this['status'] == '1') html += 'Eliminado';
				 if (this['status'] == '2') html += 'Pendiente';
				 
				 html += '</td>';

				 html += '<td class="actions">';
				 
				 if (this['status'] == '0'){
					 html += '<button type="button" class="btn btn-xs btn-info"><span class="glyphicon glyphicon-pencil"></span></button>';
					 html += '<button type="button" class="btn btn-xs btn-info"><span class="glyphicon glyphicon-trash"></span></button>';
				 }
				 if (this['status'] == '1'){
					 html += '<button type="button" class="btn btn-xs btn-info"><span class="glyphicon glyphicon-refresh"></span></button>';
				 }
				 if (this['status'] == '2'){
					 html += '<button type="button" class="btn btn-xs btn-info"><span class="glyphicon glyphicon-wrench"></span></button>';
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