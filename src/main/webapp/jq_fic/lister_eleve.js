$(function() {
  
//Current request reference; can be used else where
var request;
 
/* attach a submit handler to the form */
$(".btn-lister-eleve").click(function(event) {

    $('#effectifEleve').html("");	
	$('#tableEleve').DataTable().clear().draw();

 	var form = $('#form_lister_eleve');

	  /* Send the data using post and put the results in a div */
	  request =$.ajax({
	      url: form.attr('action'),
	      type: "post",
	      data:form.serialize(),
	      dataType: "json",
	      beforeSend: function() {
	        $('.bd-example-modal-lg').modal('show');
	        },
	      success: function(data, textStatus, jqXHR){
			setTimeout(function () {				
		       	$('.bd-example-modal-lg').modal('hide');		       
		       }, 1000);	
			 
		    $('#tableEleve').DataTable().clear().draw();
		       var t = $('#tableEleve').DataTable();
		       var result = data;
		       var j = 1;
		       var effectif =0;
		    		    		    
		    $.each(result, function(i, obj) {						
					 
					 t.row.add( [
						 j,
		                 obj.matricule,
		                 obj.nom,
		                 obj.prenom
		             ] ).draw(false);		      
		               j++;	
						effectif = obj.effectif;
		        	});	
		        	
		        	$('#effectifEleve').html(effectif);	
		        	
		        	$('#modalEffectif').modal('show');     	     
          	     
	      },
	      error:function(jqXHR, textStatus, errorThrown){
	    	setTimeout(function () {
			 alert(jqXHR.responseText);
		       	$('.bd-example-modal-lg').modal('hide');	          
		       }, 1000);
		       
	      }  
	  });
	  return false;
});

});
