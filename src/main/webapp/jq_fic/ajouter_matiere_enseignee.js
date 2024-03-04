$(function() {

//Current request reference; can be used else where
var request;
 
/* attach a submit handler to the form */
 $(document).on('click', '.btn_ajouter_matiere', function(event){
	
    // abort any pending request
    if (request) {
        request.abort();
    }
         
    $('.erreur_matiere').html("");
    $('.erreur_classe').html("");
    $('.resultat').html("");
  /* stop form from submitting normally */
  event.preventDefault();

  var matiere = $("#idMatiere").val();
  var classe = $("#idClasse").val();
 
  if ($.trim(matiere) ==='') {
	  $('#matiere').css('border-color', 'red');
	  $('.erreur_matiere').html("Champ obligatoire!");
  }
  else
  {
  	$('#matiere').css('border-color', '');
  }
  
   if ($.trim(classe) ==='') {
	  $('#classe').css('border-color', 'red');
	  $('.erreur_classe').html("Champ obligatoire!");
  }
  else
  {
  	$('#classe').css('border-color', '');
  }
  
  var erreur_matiere = $.trim($(".erreur_matiere").html());
  var erreur_classe = $.trim($(".erreur_classe").html());
 
  if ((erreur_matiere !== '') || (erreur_classe !== ''))
     {
         
	  return false;
     }
  else
	  {
	  var form = $("#form_ajouter_matiere");

	  /* Send the data using post and put the results in a div */
	  request =$.ajax({
	      url: form.attr('action'),
	      type: "post",
	      data:form.serialize(),
	      beforeSend: function() {
				$('.bd-example-modal-lg').modal('show');
	        },
	      success: function(data, textStatus, jqXHR){
	         setTimeout(function () {				
		       	$('.bd-example-modal-lg').modal('hide');		       
		       }, 1000);          
		         
	          $('#modal-ajout-reussi').modal('show'); 
	          
	          $(".btn-success").click(function(event) {
	        	  $('#modal-ajout-reussi').modal('hide'); 
	        	  
	          });
	          setTimeout(function() {
				    $('#modal-ajout-reussi').modal('hide');
				    $('#modalMatiere').modal('hide'); 
				}, 1000);
               
	      },
	      error:function(jqXHR, textStatus, errorThrown){
				setTimeout(function () {
		       	$('.bd-example-modal-lg').modal('hide');
		       }, 1000);
	    	   $('.bd-example-modal-lg').modal('hide');
	           $('.resultat').html(jqXHR.responseText);
	           $('.resultat').css('color', 'red');
	      }  
	  });
	  return false;
	  }

});

});
