$(function() {
  
//Current request reference; can be used else where
var request;
 
/* attach a submit handler to the form */
 $(document).on('click', '.btn_lister_scolarite', function(event){

	 // abort any pending request
    if (request) {
        request.abort();
    }
  /* stop form from submitting normally */
  event.preventDefault();
  
  $('#tableNote1').DataTable().clear().draw();
  
       var id = $(this).attr('id').replace(/btnListeSco-/, '');

	   let text = $('#idInscription1ListeSco'+id).val();
	   let dataObj = {'idInscription2': text};

	  	var form = $('#form_lister_scolarite'+id);

	  /* Send the data using post and put the results in a div */
	  request =$.ajax({
	      url: form.attr('action'),
	      type: "post",
	      data:dataObj,
	      dataType: "json",
	      beforeSend: function() {
	        $('.bd-example-modal-lg').modal('show');
	        },
	      success: function(data, textStatus, jqXHR){
			setTimeout(function () {				
		       	$('.bd-example-modal-lg').modal('hide');		       
		       }, 1000);	
		       
		       $('#tableListeScolarite').DataTable().clear().draw();
		       var t = $('#tableListeScolarite').DataTable();
		       var result = data;
		       var j = 1;
		       
	        $.each(result, function(i, obj) {						
					 
					 t.row.add( [
						 j,
		                 obj.dateVersement,
		                 obj.mois,
		                 obj.montant,	          		  
		                 '<button id="btnModifierScolarite-'+obj.idInscription+'" class="btn btn-success btn-sm rounded-0 btn_charger_modal_modifier_scolarite" type="button" data-placement="top" title="Modifier" ><i class="fa fa-edit"></i></button> <button id="btnSupprimerScolarite-'+obj.idScolarite+'" class="btn btn-danger btn-sm rounded-0 btn_afficher_supprimer_scolarite" type="button" data-toggle="tooltip" data-placement="top" title="Supprimer"><i class="fa fa-trash"></i></button>'
		             ] ).draw(false);		      
		               j++;	
											        	
		        	});	
		        	
		     $('#modalDetailsScolarite').modal('show');
	        	 		  	          
	      },
	      error:function(jqXHR, textStatus, errorThrown){
			alert(jqXHR.responseText);
				setTimeout(function () {
		       	$('.bd-example-modal-lg').modal('hide');
		       }, 1000);		
	    /*
	       	  $('#spanNom1').html("");
	          $('#spanPrenom1').html("");
	          $('#spanTel1').html("");
	          $('#spanDateNaiss1').html("");
	          $('#spanMatricule1').html("");
	          $('#spanClasse1').html("");
	          $('#spanAnneeScolaire1').html("");
	          $('#spanDateInscrip1').html("");
	          $('#spanMontant1').html("");*/
	      }  
	  });
	  return false;
	 
});

});
