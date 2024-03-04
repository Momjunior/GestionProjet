$(function(){

 
/* attach a submit handler to the form */
 $("#listeCoefficient").on('click','.btn-afficher-supprimer',function(){
	$('.resultat2').html("");
	 $('#modalSupprimerCoefficient').modal('show');
		
	 var idCoefficient = $(this).attr('id').replace(/btnSupprimerCoefficient-/, '');
	 $('#idCoefficient1').val(idCoefficient);
	
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
	  
	   var form = $('#form_supprimer_coefficient');

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
	 	         
	 	          $('#modal-suppression-reussi').modal('show'); 
	 	          
	 	          $(".suppression_ok").click(function(event) {
	 	        	  $('#modal-suppression-reussi').modal('hide'); 	 	        	  
	 	          });
	 	             
	 	           setTimeout(function() {
					    location.reload();
					}, 2000);          
	 	      },
	 	      error:function(jqXHR, textStatus, errorThrown){
	 	           $('#load-img2').hide();
	 	           $('.resultat2').html(jqXHR.responseText);
	 	           $('.resultat2').css('color', 'red');
	 	      }  
	 	  });
	 	  return false;
	 });
	 
	 /* *************************************************** */
	 
	
});
});
