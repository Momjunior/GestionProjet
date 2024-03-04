$(function() {
  
//Current request reference; can be used else where
var request;
 
/* attach a submit handler to the form */
$(".btn-rechercher-classe").click(function(event) {
$('.divHide').hide(1000);
	 // abort any pending request
    if (request) {
        request.abort();
    }
  /* stop form from submitting normally */
  event.preventDefault();
  	
  $('.erreur_classe').html("");
  $('.erreur_categorie').html("");	
  $('.resultat').html("");
  $('.resultat10').html("");
  $('#divListeEleve').empty(); 
		        	
	
//	$('#tableNote1').DataTable().clear().draw();
  var classe  = $("#classe").val(); 
  var categorie = $("#categorie").val();

    if ($.trim(classe) ==='') {
	  $('#classe').css('border-color', 'red');
	  $('.erreur_classe').html("Champ obligatoire!");
  }
  else
  {
  	$('#classe').css('border-color', '');
  	$('.erreur_classe').html("");
  }
  
  if ($.trim(categorie) ==='') {
	  $('#categorie').css('border-color', 'red');
	  $('.erreur_categorie').html("Champ obligatoire!");
  }
  else
  {
  	$('#categorie').css('border-color', '');
  	$('.erreur_categorie').html("");	
  }

   var erreur_classe = $.trim($(".erreur_classe").html());
   var erreur_categorie = $.trim($(".erreur_categorie").html());
   
   if ((erreur_classe !== '')||(erreur_categorie !== ''))
     {         
	  return false;
     }
  else
	  {
		 
	  	var form = $('#form_rechercher_classe');

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
		       $('.divHide').show(1000);
		 //   var effectif = data.effectif; 
		 //   var tabloEleve = data.liste_inscrip.split("_-*-_");

		       var result = data;
		       var j = 1;
		       var classe = "";
		       var idDetailClasse = 0;
		       var anneeScolaire = "";
		    		    		    
		    $.each(result, function(i, obj) {						
					      
		               j++;	
						effectif = obj.effectif;
						classe = obj.classe;	
						idDetailClasse = obj.idDetailClasse;
						anneeScolaire = obj.anneeScolaire;
						
						var e = $('<div class="form-group row"><label class="control-label col-md-3">'+obj.prenom+' '+obj.nom+' ('+obj.matricule+')'+'<span class="required"> * </span></label><div class="col-md-5"><input type="text" class="form-control" id="note_'+obj.idInscription+'" name="note_'+obj.idInscription+'" value="0"><span class="clsNotAvailable erreur_note_idInscription" ></span></div></div>');
		        	    $('#divListeEleve').append(e);   				        	
		        	});	
		        	
	      },
	      error:function(jqXHR, textStatus, errorThrown){
			$('.resultat').html(jqXHR.responseText);
				setTimeout(function () {
		       	$('.bd-example-modal-lg').modal('hide');
		       }, 1000);		
	    
	     
	      }  
	  });
	  return false;
	  }
 
	 
});

});
