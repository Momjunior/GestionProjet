$(function() {

//Current request reference; can be used else where
var request;
 
/* attach a submit handler to the form */
 $(document).on('click', '.btn-rechercher-conduite1', function(event){
	
	$('.erreur_modifier_conduite').html("");
	$('#conduiteClasse1').css('border-color', '');
	$('.resultat13').html("");	

	 // abort any pending request
    if (request) {
        request.abort();
    }
  /* stop form from submitting normally */
  event.preventDefault();

	  	var form = $('#form_rechercher_conduite1');

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
		       
		     $("#idDetailClasse3").val(data.idDetailClasse);  
		     $("#conduiteClasse1").val(data.conduiteClasse); 	
		     $('#modalConduite').modal('show');
		             	  	          
	      },
	      error:function(jqXHR, textStatus, errorThrown){
			alert(jqXHR.responseText);
				setTimeout(function () {
		       	$('.bd-example-modal-lg').modal('hide');
		       }, 1000);		
	    
	     
	      }  
	  });
	  return false;
	 
});

});
