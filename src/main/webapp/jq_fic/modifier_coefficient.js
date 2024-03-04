$(function() {
  
//Current request reference; can be used else where
var request;
 
/* attach a submit handler to the form */
$(".btn_modifier_coefficient").click(function(event) {

	$('.erreur_nouvelleVal').html("");
    $('.resultat1').html("");
    // abort any pending request
    if (request) {
        request.abort();
    }
  /* stop form from submitting normally */
  event.preventDefault();

  var val = $("#nouvelleVal").val();
  
 if ($.trim(val) ==='') {
	  $('#nouvelleVal').css('border-color', 'red');
	  $('.erreur_nouvelleVal').html("Champ obligatoire!");
  }
  else
  {
  	$('#nouvelleVal').css('border-color', '');
  }

  
  var erreur_nouvelleVal = $.trim($(".erreur_nouvelleVal").html());
  
if ((erreur_nouvelleVal !== '') )
     {         
	  return false;
     }
  else
	  {
	  var form = $("#form_modifier_coefficient");

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
		         
	          $('#modal-modif-reussi').modal('show'); 
	          
	          $(".btn-success").click(function(event) {
	        	  $('#modal-modif-reussi').modal('hide');
	        	  $('#modifierCoefficient').modal('hide');
	        	   
	          });
	          
	           $('#listeCoefficient').DataTable().clear().draw();
		       var t = $('#listeCoefficient').DataTable();
		       var result = data;
		       var j = 1;
		    		    		    
		    $.each(result, function(i, obj) {						
					 
					 t.row.add( [
						 j,
		                 obj.classe,
		                 obj.matiere,
		                 obj.coefficient,
		                 '<button id="btnModifierCoefficient-'+obj.idCoefficient+'" class="btn btn-primary btn-modifier btn-xs" data-toggle="modal" data-target="#modifierCoefficient"><i class="fa fa-pencil"></i></button> <button id="btnSupprimerCoefficient-'+obj.idCoefficient+'" class="btn btn-danger btn-sm rounded-0 btn_afficher_supprimer_coefficient" type="button" data-toggle="tooltip" data-placement="top" title="Supprimer"><i class="fa fa-trash"></i></button>'
		             ] ).draw(false);		      
		               j++;	
		        	});	
		        setTimeout(function () {				
		       	 $('#modifierCoefficient').modal('hide');		       
		       }, 2000);			        	
   	      },
	      error:function(jqXHR, textStatus, errorThrown){
	           setTimeout(function () {				
		       	$('.bd-example-modal-lg').modal('hide');		       
		       }, 1000);
	           $('.resultat1').html(jqXHR.responseText);
	           $('.resultat1').css('color', 'red');
	      }  
	  });
	  return false;
	  }
});

});
