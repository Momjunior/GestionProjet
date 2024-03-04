$(function() {
  
//Current request reference; can be used else where
var request;
 
/* attach a submit handler to the form */
 $(document).on('click', '.btn_lister_matiere_enseignee', function(event){

	 // abort any pending request
    if (request) {
        request.abort();
    }
  /* stop form from submitting normally */
  event.preventDefault();
  
  $('#tableMatiereEnseignee').DataTable().clear().draw();
  
       var id = $(this).attr('id').replace(/btnListeMatiereEnseignee-/, '');

	   let text = $('#idListeMatiereEnseignee'+id).val();
	   let dataObj = {'idProfesseur': text};

	  	var form = $('#form_lister_matiere_enseignee'+id);

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
		       
		       $('#tableMatiereEnseignee').DataTable().clear().draw();
		       var t = $('#tableMatiereEnseignee').DataTable();
		       var result = data;
		       var j = 1;
		       
	        $.each(result, function(i, obj) {						
					 
					 t.row.add( [
						 j,
		                 obj.classe,
		                 obj.matiere,
		                 '<button id="btnSupprimerMatiereEnseignee-'+obj.idMatiereEnseignee+'" class="btn btn-danger btn-sm rounded-0 btn_afficher_supprimer_matiereEnseignee" type="button" data-toggle="tooltip" data-placement="top" title="Supprimer"><i class="fa fa-trash"></i></button>'
		             ] ).draw(false);		      
		               j++;	
											        	
		        	});	
		        	$('#idProf').val(id);
		//     $('#modalDetailsScolarite').modal('show');
	        	 		  	          
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
