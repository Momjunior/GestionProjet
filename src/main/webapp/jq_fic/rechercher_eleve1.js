$(function() {
  
//Current request reference; can be used else where
var request;
 
/* attach a submit handler to the form */
$(".btn_rechercher_eleve").click(function(event) {

    $('.divHide').hide(500);
	$("#form_ajouter_inscription")[0].reset() ;
	$('.erreur_nom').html("");
    $('.erreur_prenom').html("");
	$('.erreur_sexe').html("");
	$('.erreur_dateNaiss').html("");
	$('.erreur_matricule').html("");
	$('.erreur_tel').html("");
	$('.erreur_classe').html("");
	$('.erreur_categorie').html("");
	$('.erreur_versement').html("");
    $('.resultat').html("");
    $('.resultat1').html("");
    
    $('#nom').css('border-color', '');
    $('#prenom').css('border-color', '');
    $('#sexe').css('border-color', '');
    $('#dateNaiss').css('border-color', '');  
    $('#matricule').css('border-color', ''); 
    $('#tel').css('border-color', '');
    $('#classe').css('border-color', '');
    $('#categorie').css('border-color', '');
    $('#versement').css('border-color', '');
	 
    $('.erreur_matricule').html("");
	
    // abort any pending request
    if (request) {
        request.abort();
    }
  /* stop form from submitting normally */
  event.preventDefault();

  var matricule = $("#matricule").val();
  
  if ($.trim(matricule) ==='') {
	  $('#matricule').css('border-color', 'red');
	  $('.erreur_matricule').html("Champ obligatoire!");
  }
  else
  {
  	$('#matricule').css('border-color', '');
  }
  
  var erreur_matricule = $.trim($(".erreur_matricule").html());

  
  if ((erreur_matricule !== ''))
     {         
	  return false;
     }
  else
	  {

	  	var form = $('#form_rechercher_eleve');

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
		$('.divHide').show(500);
			setTimeout(function () {				
		       	$('.bd-example-modal-lg').modal('hide');		       
		       }, 1000);	

		     $("#idEleve").val(data.idEleve);
		     $("#matri").val(data.matri);
        	 $("#nom").val(data.nom);
        	 $("#prenom").val(data.prenom);
        	 $("#sexe").val(data.sexe);        	 
        	 $("#tel").val(data.tel);  
        	 
        	 var dateNaiss =data.dateNaiss.split("-");  
        	 $("#jourNaiss").val(dateNaiss[2]);
        	 $("#moisNaiss").val(dateNaiss[1]);   
        	 $("#anneeNaiss").val(dateNaiss[0]);           	     
	      },
	      error:function(jqXHR, textStatus, errorThrown){
		$('.divHide').hide(500);
	    	setTimeout(function () {
		       	$('.bd-example-modal-lg').modal('hide');
	           $('.resultat').html(jqXHR.responseText);
	           $('.resultat').css('color', 'red');
		       }, 1000);
	      }  
	  });
	  return false;
	  }
});

});
