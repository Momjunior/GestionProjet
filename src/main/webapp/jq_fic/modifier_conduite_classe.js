$(function() {
  
//Current request reference; can be used else where
var request;
 
/* attach a submit handler to the form */
$(".btn-modifier-conduite-classe").click(function(event) {

	$('.erreur_modifier_conduite_classe').html("");
	
    $('.resultat13').html("");
    // abort any pending request
    if (request) {
        request.abort();
    }
  /* stop form from submitting normally */
  event.preventDefault();

  var conduite = $("#conduiteClasse1").val();
 
 if ($.trim(conduite) ==='') 
  {
	  $('#conduiteClasse1').css('border-color', 'red');
	  $('.erreur_modifier_conduite').html("Champ obligatoire!");
  }
  else
  {
	var conduite2 = $('#conduiteClasse1').val().replace(/,/g, '.');
  	$('#conduiteClasse1').css('border-color', '');
  	if($.isNumeric(conduite2)) 
  	{
  		if(conduite2 < 0)
  		{
  		 $('#conduiteClasse1').css('border-color', 'red');
  		  $('.erreur_modifier_conduite').html("La conduite doit être >= 0!");
  		}
  		else if (conduite2 > 20)
  		{
		 $('#conduiteClasse1').css('border-color', 'red');
  		  $('.erreur_modifier_conduite').html("La conduite doit être <= 20!");
		}
  		else
  		{
			$('#conduiteClasse1').css('border-color', '');
		}
  	}
  	else
  		{
	  		$('#conduiteClasse1').css('border-color', 'red');
			$('.erreur_modifier_conduite').html("Veuillez saisir une note de conduite valable!");
  		}  		
  }
  
  var erreur_conduite = $.trim($(".erreur_modifier_conduite").html());
  
  if (erreur_conduite !== '')
     {         
	  return false;
     }
  else
	  {
	  var form = $('#form_modifier_conduite_classe');

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
				$('#modal-modif-conduite-reussi').modal('show'); 			
			       	$('.bd-example-modal-lg').modal('hide');		       
			     }, 1000);		    	          
		         	          
	          $(".btn-success").click(function(event) {
	        	  $('#modal-modif-conduite-reussi').modal('hide'); 
	          });
                      $('#modalConduite').modal('hide');
	      },
	      error:function(jqXHR, textStatus, errorThrown){
	           setTimeout(function () {
		       	$('.bd-example-modal-lg').modal('hide');
	           $('.resultat13').html(jqXHR.responseText);
	           $('.resultat13').css('color', 'red');
		       }, 1000);
	      }  
	  });
	  return false;
	  }
});

});
