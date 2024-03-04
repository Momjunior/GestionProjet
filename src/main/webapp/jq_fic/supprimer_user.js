$(function(){

 
/* attach a submit handler to the form */
$(".table").on('click','.btn-afficher-supprimer',function(){
	 $('#confirm_delete_user').modal('show');
	
	var currentRow=$(this).closest("tr");
	
	 var idUser=currentRow.find("td:eq(6)").text();
	 $('#idUser2').val(idUser);
	
   
	 /* *************************************************** */
	 
	 /* attach a submit handler to the form */
	 $(".btn-valider-suppression").click(function(event) {
		  
		//Current request reference; can be used else where
		var request;
	 	
	     // abort any pending request
	     if (request) {
	         request.abort();
	     }
	   /* stop form from submitting normally */
	   event.preventDefault();
	  
	   var form = $('#form_supprimer_user');

	 	  /* Send the data using post and put the results in a div */
	 	  request =$.ajax({
	 		  url: form.attr('action'),  
	 		  type: "POST",
	 		  data:form.serialize(),
	 		 beforeSend: function() {
	 	        $('#load-img3').show();
	 	        },
	 	      success: function(data, textStatus, jqXHR){
	 	          $('#load-img3').hide();
	 	         
	 	          $('#modal-suppression-reussi').modal('show'); 
	 	          
	 	          $(".suppresion_ok").click(function(event) {
	 	        	  $('#modal-suppression-reussi').modal('hide'); 
	 	        	  $('#confirm_delete_user').modal('hide');
	 	        	 location.reload();
	 	        	// $(".tablo-client").load(location.href + " .tablo-client")
	 	        	 
	 	          });
	 	                      
	 	      },
	 	      error:function(jqXHR, textStatus, errorThrown){
	 	           $('#load-img3').hide();
	 	           $('.resultat').html(jqXHR.responseText);
	 	           $('.resultat').css('color', 'red');
	 	      }  
	 	  });
	 	  return false;
	 });
	 
	 /* *************************************************** */
	 
	
});
});
