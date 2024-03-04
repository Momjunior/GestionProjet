$(function() {
  
//Current request reference; can be used else where
var request;
 
/* attach a submit handler to the form */
$(".btn-modifier-versement").click(function(event) {

    $('.erreur_mois1').html("");
    $('.erreur_versement1').html("");
    $('.erreur_dateVersement').html("");

    $('.resultat3').html("");
	
    // abort any pending request
    if (request) {
        request.abort();
    }
  /* stop form from submitting normally */
  event.preventDefault();

  var mois  = $("#mois1").val();
  var versement = $("#versement1").val();
  var jourVersement = $("#jourVersement1").val();
  var moisVersement = $("#moisVersement1").val();
  var anneeVersement = $("#anneeVersement1").val();

  if ($.trim(mois) ==='') {
	  $('#mois1').css('border-color', 'red');
	  $('.erreur_mois1').html("Champ obligatoire!");
  }
  else
  {
  	$('#mois1').css('border-color', '');
  }
  
   if ($.trim(versement) ==='') {
	  $('#versement1').css('border-color', 'red');
	  $('.erreur_versement1').html("Champ obligatoire!");
  }
  else
  {
  	$('#versement1').css('border-color', '');
  }
  
 if ($.trim(jourVersement) ==='' || $.trim(moisVersement) ==='' ||$.trim(anneeVersement) ==='' ) {
			$('.erreur_dateVersement').html("Veuillez remplir la date de versement!");
			}
			else{
				$('#jourVersement1').css('border-color', '');
			  	$('#moisVersement1').css('border-color', '');
			  	$('#anneeVersement1').css('border-color', '');
			  	$('.erreur_dateVersement').html("");
			}
  
  var erreur_mois = $.trim($(".erreur_mois1").html());
  var erreur_versement = $.trim($(".erreur_versement1").html());
  var erreur_dateVersement = $.trim($(".erreur_dateVersement").html());

  
  if ((erreur_mois !== '')||(erreur_versement !== '')|| (erreur_dateVersement !== ''))
     {         
	  return false;
     }
  else
	  {

	  	var form = $('#form_modifier_versement');

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

	          $('#modal-modifier-versement-reussi').modal('show'); 
	          
	          $(".btn-success").click(function(event) {
	        	  $('#modal-modifier-versement-reussi').modal('hide'); 
	          });	          
     	
     			setTimeout(function() {
					    location.reload();
					}, 2000);  
     	
	      },
	      error:function(jqXHR, textStatus, errorThrown){
	    	setTimeout(function () {				
		       	$('.bd-example-modal-lg').modal('hide'); 		       
		       }, 1000);
	           $('.resultat3').html(jqXHR.responseText);
	           $('.resultat3').css('color', 'red');
	      }  
	  });
	  return false;
	  }
});

});
