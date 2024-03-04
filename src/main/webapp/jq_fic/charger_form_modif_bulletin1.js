$(document).ready(function(){

//Current request reference; can be used else where
var request;
    // code to read selected table row cell data (values).
    $(document).on('click', '.btn_rechercher_details_bulletin1', function(event){

			$("#conduite1").val("");
			$("#assiduite1").val("");
			$("#profResponsable1").val("");
			$("#tableauHonneur").val("");
			$("#appreciation").val("");
		    $('.erreur_conduite').html("");
		    $('.erreur_tableauHonneur').html("");
		    $('.erreur_assiduite').html("");
		    $('.erreur_profResponsable').html("");
		    $('.erreur_appreciation').html("");
			$('.resultat5').html("");
			$('#conduite1').css('border-color', '');
			$('#assiduite1').css('border-color', '');
			$('#profResponsable1').css('border-color', '');
			$('#tableauHonneur').css('border-color', '');
			$('#appreciation').css('border-color', '');
         
    // abort any pending request
    if (request) {
        request.abort();
    }
  /* stop form from submitting normally */
  event.preventDefault();
  
  	var form = $('#form_rechercher_details_bulletin');

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
		       
		       $('#conduite1').val(data.conduite);	
		       $('#tableauHonneur').val(data.tableauHonneur);
		       $('#assiduite1').val(data.assiduite);
		       $('#appreciation').val(data.appreciation);
		       $('#profResponsable1').val(data.profResponsable);

	          $('#modalModifierBulletin').modal('show'); 
	          
	         
	      },
	      error:function(jqXHR, textStatus, errorThrown){
	    		setTimeout(function () {				
		       	$('.bd-example-modal-lg').modal('hide'); 		       
		       }, 1000);
	         $('#modalModifierBulletin').modal('show'); 
	      }  
	  });
	  return false;
 
    });
});