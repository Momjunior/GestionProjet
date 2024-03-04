$(function(){

 
/* attach a submit handler to the form */
$(".table").on('click','.btn_afficher_supprimer_note',function(){
	
	$('.resultat8').html("");
	
	 $('#modalSupprimerNote').modal('show');
	
	var idNote = $(this).attr('id').replace(/btnSupprimerNote-/, '');
	
	 $('#idNote1').val(idNote);
	
    /* *************************************************** */
	 
	 /* attach a submit handler to the form */
	 $(".btn-valider-suppression").click(function(event) {
		  
		//Current request reference; can be used else where
		var request;
	 	
	     // abort any pending request
	     if (request) {
	         request.abort();
	     }
	   /* stop form from submitting normally */
	   event.preventDefault();
	  
	   var form = $('#form_supprimer_note');

	 	  /* Send the data using post and put the results in a div */
	 	  request =$.ajax({
	 		  url: form.attr('action'),  
	 		  type: "POST",
	 		  data:form.serialize(),
	 		  dataType: "json",
	 		 beforeSend: function() {
	 	        $('.bd-example-modal-lg').modal('show');
	 	        },
	 	      success: function(data, textStatus, jqXHR){
	 	          setTimeout(function () {
		       	$('.bd-example-modal-lg').modal('hide');
		       }, 1000);	
		       
		       $('#modalSupprimerNote').modal('hide');
		       
		       $('#tableNote1').DataTable().clear().draw();

	          $('#modal-suppression-note-reussi').modal('show'); 
	          
	          $(".btn-success").click(function(event) {
	        	  $('#modal-suppression-note-reussi').modal('hide'); 
	          });	 
	                    
	          
	           var t = $('#tableNote1').DataTable();
		       var result = data;
		       var j = 1;
		       
	        $.each(result, function(i, obj) {						
					 
					  t.row.add( [
						 j,
		                 obj.matiere,
		                 obj.typeNote,
		                 obj.note,	          		  
		                 '<button id="btnModifierNote-'+obj.idNote+'" class="btn btn-success btn-sm rounded-0 btn_charger_modal_modifier_note" type="button" data-placement="top" title="Modifier" data-toggle="modal" data-target="#modalModifierNote"><i class="fa fa-edit"></i></button> <button id="btnSupprimerNote-'+obj.idNote+'" class="btn btn-danger btn-sm rounded-0 btn_afficher_supprimer_note" type="button" data-toggle="tooltip" data-placement="top" title="Supprimer"><i class="fa fa-trash"></i></button>'
		             ] ).draw(false);		      
		               j++;	
											        	
		        	});	        
	 	      },
	 	      error:function(jqXHR, textStatus, errorThrown){
	 	           setTimeout(function () {				
		       	$('.bd-example-modal-lg').modal('hide'); 		       
		       }, 1000);
	           $('.resultat8').html(jqXHR.responseText);
	           $('.resultat8').css('color', 'red');
	 	      }  
	 	  });
	 	  return false;
	 });	
	
});
});
