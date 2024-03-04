$(function() {

//Current request reference; can be used else where
var request;
 
/* attach a submit handler to the form */
 $(document).on('click', '.btn_rechercher_note', function(event){

	 // abort any pending request
    if (request) {
        request.abort();
    }
  /* stop form from submitting normally */
  event.preventDefault();
	
	$('#tableNote1').DataTable().clear().draw();

   var id = $(this).attr('id').replace(/btnNote-/, '');
  
   let text = $('#idInscription4Note'+id).val();
   let dataObj = {'idInscription4': text};

	  	var form = $('#form_rechercher_note'+id);

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
		       
		       $('#tableNote1').DataTable().clear().draw();
		       var t = $('#tableNote1').DataTable();
		       var result = data;
		       var j = 1;
		       
	        $.each(result, function(i, obj) {						
					 
					 t.row.add( [
						 j,
		                 obj.matiere,
		                 obj.typeNote,
		                 obj.note,	          		  
		                 '<button id="btnModifierNote-'+obj.idNote+'" class="btn btn-success btn-sm rounded-0 btn_charger_modal_modifier_note" type="button" data-placement="top" title="Modifier" ><i class="fa fa-edit"></i></button> <button id="btnSupprimerNote-'+obj.idNote+'" class="btn btn-danger btn-sm rounded-0 btn_afficher_supprimer_note" type="button" data-toggle="tooltip" data-placement="top" title="Supprimer"><i class="fa fa-trash"></i></button>'
		             ] ).draw(false);		      
		               j++;	
											        	
		        	});	
		        	
		     $('#modalDetailsNote').modal('show');
		     
		     
	        	  	          
	      },
	      error:function(jqXHR, textStatus, errorThrown){
			alert(jqXHR.responseText);
				setTimeout(function () {
		       	$('.bd-example-modal-lg').modal('hide');
		       }, 1000);		
	    
	     
	      }  
	  });
	  return false;
	 
});

});
