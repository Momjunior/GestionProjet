$(function() {
  
//Current request reference; can be used else where
var request;
 
/* attach a submit handler to the form */
$(".btn_lister_note").click(function(event) {
	
	$('.resultat11').html("");
 	$('#semestre1').css('border-color', '');
	 $('#matiere1').css('border-color', '');
	 $('#typeNote1').css('border-color', '');
    
    $('.erreur_semestre1').html("");
    $('.erreur_matiere1').html("");
    $('.erreur_typeNote1').html("");
    $('.erreur_note1').html("");
	 // abort any pending request
    if (request) {
        request.abort();
    }
  /* stop form from submitting normally */
  event.preventDefault();
	
  var semestre  = $("#semestre1").val();
  var matiere = $("#matiere1").val();
  var typeNote = $("#typeNote1").val();
  
  if ($.trim(semestre) ==='') {
	  $('#semestre1').css('border-color', 'red');
	  $('.erreur_semestre1').html("Champ obligatoire!");
  }
  else
  {
  	$('#semestre1').css('border-color', '');
  }
  
  if ($.trim(matiere) ==='') {
	  $('#matiere1').css('border-color', 'red');
	  $('.erreur_matiere1').html("Champ obligatoire!");
  }
  else
  {
  	$('#matiere1').css('border-color', '');
  }
  
  if ($.trim(typeNote) ==='') {
	  $('#typeNote1').css('border-color', 'red');
	  $('.erreur_typeNote1').html("Champ obligatoire!");
  }
  else
  {
  	$('#typeNote1').css('border-color', '');
  }
  
  var erreur_semestre = $.trim($(".erreur_semestre1").html());
  var erreur_matiere = $.trim($(".erreur_matiere1").html());
  var erreur_typeNote = $.trim($(".erreur_typeNote1").html());

  if ((erreur_semestre !== '')||(erreur_matiere !== '')||(erreur_typeNote !== ''))
     {         
	  return false;
     }
  else
	  {
			
		$('#tableNote').DataTable().clear().draw();

	  	var form = $('#form_lister_note');

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
		       
		       $("#semestre2").val(semestre);
		       
		       $('#tableNote').DataTable().clear().draw();
		       var t = $('#tableNote').DataTable();
		       var result = data;
		       var j = 1;
		       
	        $.each(result, function(i, obj) {						
					 
					 t.row.add( [
						 j,
		                 obj.matricule,
		                 obj.prenom,
		                 obj.nom,
		                 obj.note,	
		                 obj.dateEpreuve,          		  
		                 '<button id="btnModifierNote-'+obj.idNote+'" class="btn btn-success btn-sm rounded-0 btn_charger_modal_modifier_note" type="button" data-placement="top" title="Modifier" ><i class="fa fa-edit"></i></button>'
		             ] ).draw(false);		      
		               j++;	
											        	
		        	});	
		               	  	          
	      },
	      error:function(jqXHR, textStatus, errorThrown){
			$('.resultat11').html(jqXHR.responseText);
				setTimeout(function () {
		       	$('.bd-example-modal-lg').modal('hide');
		       }, 1000);		
	    
	     
	      }  
	  });
	  return false;
	  }

	 
});

});
