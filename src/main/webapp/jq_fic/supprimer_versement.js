$(function() {
  
//Current request reference; can be used else where
var request;
 
/* attach a submit handler to the form */
$(".btn-supprimer-versement").click(function(event) {
  
    $('.resultat8').html("");
	
    // abort any pending request
    if (request) {
        request.abort();
    }
  /* stop form from submitting normally */
  event.preventDefault();

	  	var form = $('#form_supprimer_versement');

	  /* Send the data using post and put the results in a div */
	  request =$.ajax({
	      url: form.attr('action'),
	      type: "post",
	      data:form.serialize(),
	      beforeSend: function() {
	        $('.bd-example-modal-lg').modal('show');
	        },
	      success: function(data, textStatus, jqXHR){
			setTimeout(function () {
		       	$('.bd-example-modal-lg').modal('hide');
		       }, 1000);	

	          $('#modal-supprimer-versement-reussi').modal('show'); 
	          
	          $(".btn-success").click(function(event) {
	        	  $('#modal-supprimer-versement-reussi').modal('hide'); 
	          });	
	          
	          setTimeout(function() {
					    location.reload();
					}, 2000);           
     	
	      },
	      error:function(jqXHR, textStatus, errorThrown){
	    	setTimeout(function () {				
		       	$('.bd-example-modal-lg').modal('hide'); 		       
		       }, 1000);
	           $('.resultat4').html(jqXHR.responseText);
	           $('.resultat4').css('color', 'red');
	      }  
	  });
	  return false;
});

});
