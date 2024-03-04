$(function() {
  
//Current request reference; can be used else where
var request;
 
/* attach a submit handler to the form */
$(".btn_modifier_eleve").click(function(event) {

	$('.erreur_nom').html("");
	$('.erreur_prenom').html("");
	$('.erreur_sexe').html("");
	$('.erreur_dateNaiss').html("");
	$('.erreur_matricule').html("");
	$('.erreur_tel').html("");
    $('.resultat1').html("");
    // abort any pending request
    if (request) {
        request.abort();
    }
  /* stop form from submitting normally */
  event.preventDefault();

  var nom = $("#nom").val();
  var prenom = $("#prenom").val();
  var sexe = $("#sexe").val();
  var jourNaiss = $("#jourNaiss").val();
  var moisNaiss = $("#moisNaiss").val();
  var anneeNaiss = $("#anneeNaiss").val();
  var dateNaiss = jourNaiss+"-"+moisNaiss+"-"+anneeNaiss;
  var matricule  = $("#matricule").val();
  var tel  = $("#tel").val();
 
  if ($.trim(nom) ==='') {
	  $('#nom').css('border-color', 'red');
	  $('.erreur_nom').html("Champ obligatoire!");
  }
  else
  {
  	$('#nom').css('border-color', '');
  }
  
	if ($.trim(prenom) ==='') {
	  $('#prenom').css('border-color', 'red');
	  $('.erreur_prenom').html("Champ obligatoire!");
  }
  else
  {
  	$('#prenom').css('border-color', '');
  }


  if ($.trim(sexe) ==='') {
   $('#sexe').css('border-color', 'red');
	  $('.erreur_sexe').html("Champ obligatoire!");
  }
  else 
	  {
	   $('#sexe').css('border-color', '');  
	  }
  
  
if ($.trim(jourNaiss) ==='' || $.trim(moisNaiss) ==='' || $.trim(anneeNaiss) ==='') {
	  $('#jourNaiss').css('border-color', 'red');
	  $('#moisNaiss').css('border-color', 'red');
	  $('#anneeNaiss').css('border-color', 'red');
	  $('.erreur_dateNaiss').html("Champ obligatoire!");
  }
  else
  {
  	$('#jourNaiss').css('border-color', '');
  	$('#moisNaiss').css('border-color', '');
  	$('#anneeNaiss').css('border-color', '');
  	$('.erreur_dateNaiss').html("");
  }

	  
if ($.trim(tel) ==='') {
   $('#tel').css('border-color', 'red');
	  $('.erreur_tel').html("Champ obligatoire!");
  }
  else 
  {
   $('#tel').css('border-color', '');  	  
  }
  
  if ($.trim(matricule) ==='') {
   $('#matricule').css('border-color', 'red');
	  $('.erreur_matricule').html("Champ obligatoire!");
  }
  else 
  {
   $('#matricule').css('border-color', '');  	  
  }
  
  var erreur_nom = $.trim($(".erreur_nom").html());
  var erreur_prenom = $.trim($(".erreur_prenom").html());
  var erreur_sexe = $.trim($(".erreur_sexe").html());
  var erreur_dateNaiss = $.trim($(".erreur_dateNaiss").html());
  var erreur_matricule = $.trim($(".erreur_matricule").html());
  var erreur_tel = $.trim($(".erreur_tel").html());
  
  if ((erreur_nom !== '') ||(erreur_prenom !== '') ||(erreur_sexe !== '') ||(erreur_dateNaiss !== '') || (erreur_matricule !== '') ||(erreur_tel !== ''))
     {         
	  return false;
     }
  else
	  {
	  var form = $('#form_modifier_eleve');

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
				$('#modal-modif-reussi').modal('show'); 			
			       	$('.bd-example-modal-lg').modal('hide');		       
			     }, 1000);		    	          
		         	          
	          $(".btn-success").click(function(event) {
	        	  $('#modal-modif-reussi').modal('hide'); 
	          });
                 setTimeout(function() {
					    location.reload();
					}, 2000);          
	      },
	      error:function(jqXHR, textStatus, errorThrown){
	           setTimeout(function () {
		       	$('.bd-example-modal-lg').modal('hide');
	           $('.resultat1').html(jqXHR.responseText);
	           $('.resultat1').css('color', 'red');
		       }, 1000);
	      }  
	  });
	  return false;
	  }
});

});
