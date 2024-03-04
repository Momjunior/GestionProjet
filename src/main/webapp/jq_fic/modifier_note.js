$(function() {
  
//Current request reference; can be used else where
var request;
 
/* attach a submit handler to the form */
$(".btn-modifier-note").click(function(event) {
/*
    $('.erreur_semestre2').html("");
    $('.erreur_matiere2').html("");
    $('.erreur_typeNote2').html("");*/
    $('.erreur_note2').html("");

    $('.resultat7').html("");
	
    // abort any pending request
    if (request) {
        request.abort();
    }
  /* stop form from submitting normally */
  event.preventDefault();
/*
  var semestre1  = $("#semestre2").val();
  var matiere1 = $("#matiere2").val();
  var typeNote1 = $("#typeNote2").val();*/
  var note1 = $("#note2").val();
/*
  if ($.trim(semestre1) ==='') {
	  $('#semestre2').css('border-color', 'red');
	  $('.erreur_semestre2').html("Champ obligatoire!");
  }
  else
  {
  	$('#semestre2').css('border-color', '');
  }
  
  if ($.trim(matiere1) ==='') {
	  $('#matiere2').css('border-color', 'red');
	  $('.erreur_matiere2').html("Champ obligatoire!");
  }
  else
  {
  	$('#matiere2').css('border-color', '');
  }
  
  if ($.trim(typeNote1) ==='') {
	  $('#typeNote2').css('border-color', 'red');
	  $('.erreur_typeNote2').html("Champ obligatoire!");
  }
  else
  {
  	$('#typeNote2').css('border-color', '');
  }
  */
 if ($.trim(note1) ==='') 
  {
	  $('#note2').css('border-color', 'red');
	  $('.erreur_note2').html("Champ obligatoire!");
  }
  else
  {
	var note2 = $('#note2').val().replace(/,/g, '.');
  	$('#note2').css('border-color', '');
  	if($.isNumeric(note2)) 
  	{
  		if(note2 < 0)
  		{
  		 $('#note2').css('border-color', 'red');
  		  $('.erreur_note2').html("La note doit être >= 0!");
  		}
  		else if (note2 > 20)
  		{
		 $('#note2').css('border-color', 'red');
  		  $('.erreur_note2').html("La note doit être <= 20!");
		}
  		else
  		{
			$('#note2').css('border-color', '');
		}
  	}
  	else
  		{
	  		$('#note2').css('border-color', 'red');
			$('.erreur_note2').html("Veuillez saisir une note!");
  		}  		
  }
 /* 
  var erreur_semestre1 = $.trim($(".erreur_semestre2").html());
  var erreur_matiere1 = $.trim($(".erreur_matiere2").html());
  var erreur_typeNote1 = $.trim($(".erreur_typeNote2").html());*/
  var erreur_note1 = $.trim($(".erreur_note2").html());

  if (erreur_note1 !== '')
  //if ((erreur_semestre1 !== '')||(erreur_matiere1 !== '')||(erreur_typeNote1 !== '')||(erreur_note1 !== ''))
     {         
	  return false;
     }
  else
	  {

	  	var form = $('#form_modifier_note');

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
		       
		       $('#modalModifierNote').modal('hide');
	
	          $('#modal-modifier-note-reussi').modal('show'); 
	          
	          $(".btn-success").click(function(event) {
	        	  $('#modal-modifier-note-reussi').modal('hide'); 
	        	   location.reload();
	          });	 
	                    
	          setTimeout(function() {
				    location.reload();
				}, 1000);
		        	     	
	      },
	      error:function(jqXHR, textStatus, errorThrown){
	    		setTimeout(function () {				
		       	$('.bd-example-modal-lg').modal('hide'); 		       
		       }, 1000);
	           $('.resultat7').html(jqXHR.responseText);
	           $('.resultat7').css('color', 'red');
	           
	      }  
	  });
	  return false;
	  }
});

});
