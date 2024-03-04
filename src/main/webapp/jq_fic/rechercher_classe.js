$(function() {
  
//Current request reference; can be used else where
var request;
 
/* attach a submit handler to the form */
$(".btn-rechercher-classe").click(function(event) {

	 // abort any pending request
    if (request) {
        request.abort();
    }
  /* stop form from submitting normally */
  event.preventDefault();
  
  $('#listeEleve').DataTable().clear().draw();
	
  $('.erreur_classe').html("");
  $('.erreur_categorie').html("");	
  $('.spanClasse').html("");
  $('.spanAnneeScolaire').html("");
  $('.resultat').html("");
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
		       
		 //   var effectif = data.effectif; 
		 //   var tabloEleve = data.liste_inscrip.split("_-*-_");

		    
		    $('#listeEleve').DataTable().clear().draw();
		       var t = $('#listeEleve').DataTable();
		       var result = data;
		       var j = 1;
		       var effectif =0;
		       var classes = "";
		       var idDetailClasse = 0;
		       var anneeScolaire = "";
		    		    		    
		    $.each(result, function(i, obj) {						
					 
					 t.row.add( [
						 j,
		                 obj.matricule,
		                 obj.prenom,
		                 obj.nom,
		                 obj.sexe,
		                 obj.dateNaiss,
		                 obj.tel,	
		                 '<button type="button" id="btnModifierEleve-'+obj.idEleve+'" class="btn btn-info btn-xs btn_charger_form_modifier_eleve" data-toggle="modal" data-target="#modalModifierEleve"><i class="fa fa-edit "></i></button> <button type="button" id="btnSupprimerEleve-'+obj.idEleve+'" class="btn btn-danger btn-xs btn_charger_form_supprimer_eleve" data-toggle="modal" data-target="#modalSupprimerEleve"><i class="fa fa-trash-o "></i></button>',
		                 '<div class="btn-group btn-group-circle">\
                                         <button type="button" class="btn btn-default">NOTE</button>\
                                         <button type="button" class="btn btn-circle-right btn-default dropdown-toggle m-r-20" data-toggle="dropdown">\
                                             <i class="fa fa-angle-down"></i>\
                                         </button>\
                                         <ul class="dropdown-menu" role="menu">\
                                             <form:form action="rechercherNote" modelAttribute="eleve" id="form_rechercher_note'+obj.idInscription+'">\
							    			   <input type="text" id="idInscription4Note'+obj.idInscription+'" name="idInscription4" value="'+obj.idInscription+'" hidden="true"/>\
											   <button type="submit" id="btnNote-'+obj.idInscription+'" class="btn btn-link btn_rechercher_note">Détails 1er semestre</button>\
											 </form:form>\
											 <!-- <form:form action="rechercherNote" modelAttribute="eleve" id="form_rechercher_note">\
							    			   <input type="text" id="idInscription4" name="idInscription4" value="'+obj.idInscription+'" hidden="true"/>\
											   <button type="submit" class="btn btn-link btn_rechercher_note">Détails 2e semestre</button>\
											 </form:form>-->\
                                         </ul>\
                                     </div>\
									<div class="btn-group btn-group-circle">\
                                         <button type="button" class="btn btn-info">SCOLARITE</button>\
                                         <button type="button" class="btn btn-circle-right btn-info dropdown-toggle m-r-20" data-toggle="dropdown">\
                                             <i class="fa fa-angle-down"></i>\
                                         </button>\
                                         <ul class="dropdown-menu" role="menu">\
                                             <form:form action="rechercherScolarite" modelAttribute="eleve" id="form_rechercher_scolarite'+obj.idInscription+'">\
							    			   <input type="text" id="idInscription1Sco'+obj.idInscription+'" name="idInscription1" value="'+obj.idInscription+'" hidden="true"/>\
											   <button type="submit" id="btnSco-'+obj.idInscription+'" class="btn btn-link btn_rechercher_scolarite">Détails</button>\
											 </form:form>\
                                             <li>\
                                             	<button type="button" id="btnAfficherModalVersement-'+obj.idInscription+'" class="btn btn-link btn_charger_form_ajouter_versement" data-toggle="modal" data-target="#modalAjouterVersement">Ajouter</button>\
                                             </li>\
                                             <li>\
                                             	<form:form action="listerScolarite" modelAttribute="eleve" id="form_lister_scolarite'+obj.idInscription+'">\
								    			   <input type="text" id="idInscription1ListeSco'+obj.idInscription+'" name="idInscription2" value="'+obj.idInscription+'" hidden="true"/>\
												   <button type="submit" id="btnListeSco-'+obj.idInscription+'" class="btn btn-link btn_lister_scolarite">Modifier / Supprimer</button>\
												 </form:form>\
                                             </li>\
                                         </ul>\
                                     </div>\
                                     <div class="btn-group btn-group-circle">\
                                         <button type="button" class="btn btn-warning">BULLETIN</button>\
                                         <button type="button" class="btn btn-circle-right btn-warning dropdown-toggle m-r-20" data-toggle="dropdown">\
                                             <i class="fa fa-angle-down"></i>\
                                         </button>\
                                         <ul class="dropdown-menu">\
										      <li class="dropdown-submenu">\
										        <a class="test" tabindex="-1" href="#">1er Semestre<span class="caret"></span></a>\
										        <ul class="dropdown-menu">\
										          <li>\
										           <form:form action="rechercherBulletin" modelAttribute="eleve" id="form_rechercher_bulletin'+obj.idInscription+'">\
									    			   <input type="text" id="idInscriptions'+obj.idInscription+'" name="idInscription" value="'+obj.idInscription+'" hidden="true"/>\
									    			   <input type="text" id="semestre" name="semestre" value="1" hidden="true"/>\
														<button type="submit" id="btnBulletin-'+obj.idInscription+'" class="btn btn-white btn_rechercher_bulletin1" >Afficher</button>\
													</form:form>\
										          </li>\
										          <li>\
										          	 <form:form action="rechercherDetailsBulletin1" modelAttribute="eleve" id="form_rechercher_details_bulletin'+obj.idInscription+'">\
									    			   <input type="text" id="idInscriptionss'+obj.idInscription+'" name="idInscription" value="'+obj.idInscription+'" />\
														<button type="submit" id="btnDetailsBulletin-'+obj.idInscription+'" class="btn btn-white btn_rechercher_details_bulletin1" >Modifier</button>\
													</form:form>\
										        </ul>\
										      </li>\
										      <li class="dropdown-submenu">\
										        <a class="test" tabindex="-1" href="#">2e Semestre<span class="caret"></span></a>\
										        <ul class="dropdown-menu">\
										          <li><a tabindex="-1" href="#">Afficher</a></li>\
										          <li><a tabindex="-1" href="#">Modifier</a></li>\
										        </ul>\
										      </li>\
										    </ul>\
                                     </div>'
		             ] ).draw(false);		      
		               j++;	
						effectif = obj.effectif;
						classes = obj.classe;	
						idDetailClasse = obj.idDetailClasse;
						anneeScolaire = obj.anneeScolaire;
						
						var e = $('<div class="form-group row"><label class="control-label col-md-4">'+obj.prenom+' '+obj.nom+' ('+obj.matricule+')'+'<span class="required"> * </span></label><div class="col-md-5"><input type="text" class="form-control" id="note_'+obj.idInscription+'" name="note_'+obj.idInscription+'" value="0"><span class="clsNotAvailable erreur_note_idInscription" ></span></div></div>');
		        	    $('#divListeEleve').append(e);   				        	
		        	});	
		        	$('.spanClasse').html(classes);
		        	$('#idDetailClasse1').val(idDetailClasse);	
		        	
		        	$('#idDetailClasse2').val(idDetailClasse);	
		        	$('#idInscriptionConduite1').val(idDetailClasse);
		        	$('.spanAnneeScolaire').html(anneeScolaire);
		        	
		        	$('#nomClasse5').val(classe);
		        	$('#nomCategorie5').val(categorie);
		        	
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
