$(function() {
  
//Current request reference; can be used else where
var request;
 
/* attach a submit handler to the form */
$(".btn-ajouter-versement").click(function(event) {

    $('.erreur_mois').html("");
    $('.erreur_versement').html("");

    $('.resultat2').html("");
	
    // abort any pending request
    if (request) {
        request.abort();
    }
  /* stop form from submitting normally */
  event.preventDefault();

  var mois  = $("#mois").val();
  var versement = $("#versement").val();

  if ($.trim(mois) ==='') {
	  $('#mois').css('border-color', 'red');
	  $('.erreur_mois').html("Champ obligatoire!");
  }
  else
  {
  	$('#mois').css('border-color', '');
  }
  
   if ($.trim(versement) ==='') {
	  $('#versement').css('border-color', 'red');
	  $('.erreur_versement').html("Champ obligatoire!");
  }
  else
  {
  	$('#versement').css('border-color', '');
  }
  
  var erreur_mois = $.trim($(".erreur_mois").html());
  var erreur_versement = $.trim($(".erreur_versement").html());

  
  if ((erreur_mois !== '')||(erreur_versement !== ''))
     {         
	  return false;
     }
  else
	  {

	  	var form = $('#form_ajouter_versement');

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

	          $('#modal-ajout-scolarite-reussi').modal('show'); 
	          
	          $(".btn-success").click(function(event) {
	        	  $('#modal-ajout-scolarite-reussi').modal('hide'); 
	          });	          
     	
	      },
	      error:function(jqXHR, textStatus, errorThrown){
	    		setTimeout(function () {				
		       	$('.bd-example-modal-lg').modal('hide'); 		       
		       }, 1000);
	           $('.resultat2').html(jqXHR.responseText);
	           $('.resultat2').css('color', 'red');
	      }  
	  });
	  return false;
	  }
});

});
