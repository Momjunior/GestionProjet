$(function(){

 
/* attach a submit handler to the form */
$(".table").on('click','.btn-afficher-supprimer',function(){
	 $('#modalSupprimerAnneeScolaire').modal('show');
	
	var currentRow=$(this).closest("tr");
	
	 var idAnnee=currentRow.find("td:eq(0)").text();
	 $('#idAnneeScolaire1').val(idAnnee);
	
   
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
	  
	   var form = $('#form_supprimer_annee_scolaire');

	 	  /* Send the data using post and put the results in a div */
	 	  request =$.ajax({
	 		  url: form.attr('action'),  
	 		  type: "POST",
	 		  data:form.serialize(),
	 		 beforeSend: function() {
	 	        $('#load-img2').show();
	 	        },
	 	      success: function(data, textStatus, jqXHR){
	 	          $('#load-img2').hide();
	 	         
	 	          $('#modal-suppression-reussi').modal('show'); 
	 	          
	 	          $(".suppression_ok").click(function(event) {
	 	        	  $('#modal-suppression-reussi').modal('hide'); 	 	        	  
	 	        	 location.reload();	 	        	 
	 	          });
	 	             setTimeout(function() {
					    location.reload();
					}, 5000);         
	 	      },
	 	      error:function(jqXHR, textStatus, errorThrown){
	 	           $('#load-img2').hide();
	 	           $('.resultat').html(jqXHR.responseText);
	 	           $('.resultat').css('color', 'red');
	 	      }  
	 	  });
	 	  return false;
	 });
	 
	 /* *************************************************** */
	 
	
});
});
