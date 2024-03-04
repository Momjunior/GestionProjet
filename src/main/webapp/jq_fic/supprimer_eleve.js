$(function(){

//Current request reference; can be used else where
var request;
 
/* attach a submit handler to the form */
$(".btn-valider-suppression-eleve").click(function(event) {
	
	$('.resultat9').html("");
		  
		//Current request reference; can be used else where
	 	
	     // abort any pending request
	     if (request) {
	         request.abort();
	     }
	   /* stop form from submitting normally */
	   event.preventDefault();
	  
	   var form = $('#form_supprimer_eleve');

	 	  /* Send the data using post and put the results in a div */
	 	  request =$.ajax({
	 		  url: form.attr('action'),  
	 		  type: "POST",
	 		  data:form.serialize(),
	 		 beforeSend: function() {
	 	        $('.bd-example-modal-lg').modal('show');
	 	        },
	 	      success: function(data, textStatus, jqXHR){
	 	          setTimeout(function () {
			       	$('.bd-example-modal-lg').modal('hide');
			       }, 1000);	
		       
		       $('#modal-suppression-eleve-reussi').modal('show'); 
		       
		   $(".suppression_ok").click(function(event) {
	 	        	  $('#modal-suppression-eleve-reussi').modal('hide'); 	 	        	  
	 	        	 location.reload();	 	        	 
	 	          });
	 	             setTimeout(function() {
					    location.reload();
					}, 5000);        
	 	      },
	 	      error:function(jqXHR, textStatus, errorThrown){
	 	           setTimeout(function () {				
		       	$('.bd-example-modal-lg').modal('hide'); 		       
		       }, 1000);
	           $('.resultat9').html(jqXHR.responseText);
	           $('.resultat9').css('color', 'red');
	 	      }  
	 	  });
	 	  return false;
	
	
});
});
