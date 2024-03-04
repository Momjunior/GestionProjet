$(function() {
  
//Current request reference; can be used else where
var request;
 
/* attach a submit handler to the form */
$(".btn_lister_statut").click(function(event) {
	
	$('.resultat12').html("");
 	$('#mois2').css('border-color', '');
    
    $('.erreur_mois2').html("");
   
	 // abort any pending request
    if (request) {
        request.abort();
    }
  /* stop form from submitting normally */
  event.preventDefault();
	
  var mois  = $("#mois2").val();

  if ($.trim(mois) ==='') {
	  $('#mois2').css('border-color', 'red');
	  $('.erreur_mois2').html("Champ obligatoire!");
  }
  else
  {
  	$('#mois2').css('border-color', '');
  }
  
  var erreur_mois = $.trim($(".erreur_mois2").html());

  if ((erreur_mois !== ''))
     {         
	  return false;
     }
  else
	  {
			
		$('#tableStatutPaiement').DataTable().clear().draw();

	  	var form = $('#form_statut_paiement');

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
		       
		       $('#tableStatutPaiement').DataTable().clear().draw();
		       var t = $('#tableStatutPaiement').DataTable();
		       var result = data;
		       var j = 1;
		       
	        $.each(result, function(i, obj) {						
					 
					 t.row.add( [
						 j,
		                 obj.matricule,
		                 obj.prenom,
		                 obj.nom,
		                 obj.mois,
		                 obj.statut	          		  
		             ] ).draw(false);		      
		               j++;	
											        	
		        	});	
		        			               	  	          
	      },
	      error:function(jqXHR, textStatus, errorThrown){
			$('.resultat12').html(jqXHR.responseText);
				setTimeout(function () {
		       	$('.bd-example-modal-lg').modal('hide');
		       }, 1000);		
	    
	     
	      }  
	  });
	  return false;
	  }

	 
});

});
