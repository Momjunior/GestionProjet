$(function() {

//Current request reference; can be used else where
var request;
 
/* attach a submit handler to the form */
$(".btn_rechercher_coefficient").click(function(event) {
  
    $('#classe').css('border-color', '');
    
  /*  $('#debutAnnee').css('border-color', '');
    $('#finAnnee').css('border-color', '');
    $('.erreur_debutAnnee').html("");
    $('.erreur_finAnnee').html("");*/
    $('.erreur_classe').html("");
    
    $('.resultat').html(""); 
	
    // abort any pending request
    if (request) {
        request.abort();
    }
  /* stop form from submitting normally */
  event.preventDefault();

  var classe = $("#classe").val();

/*
  var debut = $("#debutAnnee").val();
  var fin = $("#finAnnee").val();
  
 
  if ($.trim(debut) ==='') {
	  $('#debutAnnee').css('border-color', 'red');
	  $('.erreur_debutAnnee').html("Champ obligatoire!");
  }
  else
  {
  	$('#debutAnnee').css('border-color', '');
  }
  
	if ($.trim(fin) ==='') {
	  $('#finAnnee').css('border-color', 'red');
	  $('.erreur_finAnnee').html("Champ obligatoire!");
  }
  else
  {
  	$('#finAnnee').css('border-color', '');
  }
  */
  if ($.trim(classe) ==='') {
	  $('#classe').css('border-color', 'red');
	  $('.erreur_classe').html("Champ obligatoire!");
  }
  else
  {
  	$('#classe').css('border-color', '');
  }

  /*
  var erreur_debut = $.trim($(".erreur_debutAnnee").html());
  var erreur_fin = $.trim($(".erreur_finAnnee").html());
  */
  var erreur_classe = $.trim($(".erreur_classe").html());
 
  if ((erreur_classe !== ''))
     {
         
	  return false;
     }
  else
	  {
	
	$('#tableCoefficient').DataTable().clear().draw();	
		
	  var form = $("#form_rechercher_coefficient");

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
		         
	           $('#tableCoefficient').DataTable().clear().draw();
		       var t = $('#tableCoefficient').DataTable();
		       var result = data;
		       var j = 1;
		       
	        $.each(result, function(i, obj) {						
					 
					 t.row.add( [
						 j,
		                 obj.anneeScolaire,
		                 obj.classe,
		                 obj.matiere,	
		                 obj.valeur,          		  
		                 '<button id="btn-'+obj.idCoefficient+'" class="btn btn-success btn-sm rounded-0 btn_charger_modal_modifier_note" type="button" data-placement="top" title="Modifier" data-toggle="modal" data-target="#modalModifierNote"><i class="fa fa-edit"></i></button> <button id="'+obj.idCoefficient+'" class="btn btn-danger btn-sm rounded-0 btn_afficher_supprimer_entree" type="button" data-toggle="tooltip" data-placement="top" title="Supprimer"><i class="fa fa-trash"></i></button>'
		             ] ).draw(false);		      
		               j++;	
											        	
		        	});	
		        	
		     $('#modalDetailsNote').modal('show');
               
	      },
	      error:function(jqXHR, textStatus, errorThrown){
	    	   setTimeout(function () {
		       	$('.bd-example-modal-lg').modal('hide');
		       }, 1000);
		 $('.resultat').html(jqXHR.responseText); 
		 console.log(jqXHR.responseText+" nooooooooooooooonn");
	      }  
	  });
	  return false;
	  }

});

});
