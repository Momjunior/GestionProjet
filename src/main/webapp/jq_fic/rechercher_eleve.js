$(function() {
  
//Current request reference; can be used else where
var request;
 
/* attach a submit handler to the form */
$(".btn_rechercher_eleve").click(function(event) {
$('.divHide').hide(500);
	  $('#spanNom').html("");
	  $('#spanIdEleve').html("");
	  $('#spanPrenom').html("");
	  $('#spanTel').html("");
	  $('#spanSexe').html("");
	  $('#spanDateNaiss').html("");
	  $('#spanMatricule').html("");
	  $('#spanClasse').html("");
	  $('#spanAnneeScolaire').html("");
	  $('#idEleve').val("0");
	  $('#idEleve1').val("0");

    $('#anneeScolaire').val("");
    $('.erreur_matricule').html("");

    $('.resultat').html("");
	
    // abort any pending request
    if (request) {
        request.abort();
    }
  /* stop form from submitting normally */
  event.preventDefault();

  var annee  = $("#as").html();
  var matricule = $("#matricule").val();
  
  $('#anneeScolaire').val(annee); 

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

	          $('#spanIdEleve').html("");
	          $('#spanNom').html("");
	          $('#spanPrenom').html("");
	          $('#spanTel').html("");
	          $('#spanDateNaiss').html("");
	          $('#spanMatricule').html("");
	          $('#spanClasse').html("");
	          
	          var dateNaiss =data.dateNaiss.split("-");  
	          var dateNaiss2 = dateNaiss[2]+"-"+dateNaiss[1]+"-"+dateNaiss[0]
	          
				  $('#spanIdEleve').html(data.idEleve);
		          $('#spanNom').html(data.nom);
		          $('#spanPrenom').html(data.prenom);
		          $('#spanSexe').html(data.sexe);
		          $('#spanDateNaiss').html(dateNaiss2);
		          $('#spanTel').html(data.tel);
		          $('#spanClasse').html(data.nomClasse);
		          $('#spanMatricule').html(data.matricule);    
		          
		          $('#spanNom1').html(data.nom);
		          $('#spanPrenom1').html(data.prenom);
		          $('#spanDateNaiss1').html(dateNaiss2);
		          $('#spanClasse1').html(data.nomClasse);
		          $('#spanMatricule1').html(data.matricule);   

		  	$('#idInscription4Note').val(data.idEleve);
		  	$('#idInscription4AjoutNote').val(data.idInscription);
		  	$('#idEleve4Bulletin').val(data.idInscription);
		  	$('#idInscription4DetailsBulletin').val(data.idInscription);
		  	$('#idInscription4Scolarite').val(data.idInscription);
		  	$('#idInscription4AjoutScolarite').val(data.idInscription);
		  	$('#idInscription4ModifScolarite').val(data.idInscription);
		  	$('#idInscription1ListeSco').val(data.idInscription);
		  	$('#idInscription7').val(data.idInscription);
		  	
		  	$('#idEleve').val(data.idEleve);
		  	$('#idEleve1').val(data.idEleve);
		  	$('#idEleve2').val(data.idEleve);
		  	$('#idEleve3').val(data.idEleve);
		  	$('#idEleve4').val(data.idEleve);
		  	$('#idEleve5').val(data.idEleve);
		  	$('#idEleve6').val(data.idEleve);
		  	$('#idEleve7').val(data.idEleve);
		  	$('#idEleve8').val(data.idEleve);
		  	$('#idEleve9').val(data.idEleve);
		  	$('#idEleve10').val(data.idEleve);
		  	$('#idEleve11').val(data.idEleve);
		  	$('#idEleve12').val(data.idEleve);
		  
				var annee  = $("#as").html();
				$('#spanAnneeScolaire').html(annee);
          
	      },
	      error:function(jqXHR, textStatus, errorThrown){
		$('.divHide').hide(500);
	    	setTimeout(function () {
		       	$('.bd-example-modal-lg').modal('hide');
	           $('.resultat').html(jqXHR.responseText);
	           $('.resultat').css('color', 'red');
		       }, 1000);
		       $('#spanIdEleve').html("0");
		       $('#spanIdEleve').html("");
	          $('#spanNom').html("");
	          $('#spanPrenom').html("");
	          $('#spanTel').html("");
	          $('#spanDateNaiss').html("");
	          $('#spanMatricule').html("");
	          $('#spanClasse').html("");
	      }  
	  });
	  return false;
	  }
});

});
