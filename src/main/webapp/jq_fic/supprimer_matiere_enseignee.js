$(function(){

 
/* attach a submit handler to the form */
 $("#tableMatiereEnseignee").on('click','.btn_afficher_supprimer_matiereEnseignee',function(){
	$('.resultat2').html("");
	 $('#modalSupprimerMatiere').modal('show');
		
	 var idMatiere = $(this).attr('id').replace(/btnSupprimerMatiereEnseignee-/, '');
	 $('#idMatiere1').val(idMatiere);
	
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
	  
	   var form = $('#form_supprimer_matiere');

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
				    $('#modal-suppression-reussi').modal('hide');
				     $('#modalSupprimerMatiere').modal('hide');
				    $('#modalMatiere').modal('hide'); 
				}, 1000);        
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
