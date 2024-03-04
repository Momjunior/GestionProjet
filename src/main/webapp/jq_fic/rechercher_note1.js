$(function() {

//Current request reference; can be used else where
var request;
 
/* attach a submit handler to the form */
 $(document).on('click', '.btn_rechercher_note', function(event){
$('#divErreur').html("");
	 // abort any pending request
    if (request) {
        request.abort();
    }
  /* stop form from submitting normally */
  event.preventDefault();
	
	$('#tableNote1').DataTable().clear().draw();

	  	var form = $('#form_rechercher_note');

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
		                 obj.dateEpreuve	          		  
		             ] ).draw(false);		      
		               j++;	
											        	
		        	});	
		        	
		     $('#modalDetailsNote').modal('show');
		     
		     
	        	  	          
	      },
	      error:function(jqXHR, textStatus, errorThrown){
				setTimeout(function () {
		       	$('.bd-example-modal-lg').modal('hide');
		       }, 1000);
		       
		       $('#divErreur').html(jqXHR.responseText);		
	    
	    $('#modalErreur').modal('show');
				
				$(".btn-danger").click(function(event) {
	        	  $('#modalErreur').modal('hide'); 
	          });

	      }  
	  });
	  return false;
	 
});

});
