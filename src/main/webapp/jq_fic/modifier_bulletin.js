$(function() {
  
//Current request reference; can be used else where
var request;
 
/* attach a submit handler to the form */
$(document).on('click', '.btn_modifier_bulletin', function(event){

    $('.erreur_conduite').html("");
    $('.erreur_tableauHonneur').html("");
    $('.erreur_assiduite').html("");
    $('.erreur_profResponsable').html("");
    $('.erreur_appreciation').html("");

    $('.resultat6').html("");
	
    // abort any pending request
    if (request) {
        request.abort();
    }
  /* stop form from submitting normally */
  event.preventDefault();

  var conduite  = $("#conduite1").val();
  var tableauHonneur = $("#tableauHonneur").val();
  var assiduite = $("#assiduite1").val();
  var profResponsable = $("#profResponsable1").val();
  var appreciation = $("#appreciation").val();

  if ($.trim(profResponsable) ==='') {
	  $('#profResponsable1').css('border-color', 'red');
	  $('.erreur_profResponsable').html("Champ obligatoire!");
  }
  else
  {
  	$('#profResponsable1').css('border-color', '');
  }
  
  if ($.trim(tableauHonneur) ==='') {
	  $('#tableauHonneur').css('border-color', 'red');
	  $('.erreur_tableauHonneur').html("Champ obligatoire!");
  }
  else
  {
  	$('#tableauHonneur').css('border-color', '');
  }
  
  if ($.trim(assiduite) ==='') {
	  $('#assiduite1').css('border-color', 'red');
	  $('.erreur_assiduite').html("Champ obligatoire!");
  }
  else
  {
  	$('#assiduite1').css('border-color', '');
  }
  
   if ($.trim(appreciation) ==='') {
	  $('#appreciation').css('border-color', 'red');
	  $('.erreur_appreciation').html("Champ obligatoire!");
  }
  else
  {
  	$('#appreciation').css('border-color', '');
  }
  
 if ($.trim(conduite) ==='') 
  {
	  $('#conduite1').css('border-color', 'red');
	  $('.erreur_conduite').html("Champ obligatoire!");
  }
  else
  {
  	$('#conduite1').css('border-color', '');
  	if($.isNumeric(conduite)) 
  	{
  		if(conduite < 0)
  		{
  		 $('#profResponsable1').css('border-color', 'red');
  		  $('.erreur_conduite').html("La conduite doit être >= 0!");
  		}
  		else if (conduite > 20)
  		{
		 $('#conduite1').css('border-color', 'red');
  		  $('.erreur_conduite').html("La conduite doit être <= 20!");
		}
  		else
  		{
			$('#conduite1').css('border-color', '');
		}
  	}
  	else
  		{
	  		$('#conduite1').css('border-color', 'red');
			$('.erreur_conduite').html("Veuillez saisir une note de conduite!");
  		}  		
  }
  
  var erreur_conduite = $.trim($(".erreur_conduite").html());
  var erreur_tableauHonneur = $.trim($(".erreur_tableauHonneur").html());
  var erreur_assiduite = $.trim($(".erreur_assiduite").html());
  var erreur_profResponsable = $.trim($(".erreur_profResponsable").html());
  var erreur_appreciation = $.trim($(".erreur_appreciation").html());

  
  if ((erreur_conduite !== '')||(erreur_tableauHonneur !== '')||(erreur_assiduite !== '')||(erreur_profResponsable !== '')||(erreur_appreciation !== ''))
     {         
	  return false;
     }
  else
	  {

	  	var form = $('#form_modifier_bulletin');

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

	          $('#modal-modifier-bulletin-reussi').modal('show'); 
	          
	          $(".btn-success").click(function(event) {
	        	  $('#modal-modifier-bulletin-reussi').modal('hide'); 
	          });	          
     	
	      },
	      error:function(jqXHR, textStatus, errorThrown){
	    		setTimeout(function () {				
		       	$('.bd-example-modal-lg').modal('hide'); 		       
		       }, 1000);
	           $('.resultat6').html(jqXHR.responseText);
	           $('.resultat6').css('color', 'red');
	      }  
	  });
	  return false;
	  }
});

});
