$(function() {

//Current request reference; can be used else where
var request;
 
/* attach a submit handler to the form */
$(".btn_ajouter_coefficient").click(function(event) {
    
    $('.erreur_classe').html("");
    $('.erreur_matiere').html("");
    $('.erreur_coefficient').html("");
    $('.resultat').html("");
	
    // abort any pending request
    if (request) {
        request.abort();
    }
  /* stop form from submitting normally */
  event.preventDefault();

  var classe = $("#nomClasse").val();console.log("classe est "+classe);
  var matiere = $("#nomMatiere").val();
  var coefficient = $("#coefficient").val();
 
  if ($.trim(classe) ==='') {
	  $('#nomClasse').css('border-color', 'red');
	  $('.erreur_classe').html("Champ obligatoire!");
  }
  else
  {
  	$('#nomClasse').css('border-color', '');
  }
  
  if ($.trim(matiere) ==='') {
	  $('#nomMatiere').css('border-color', 'red');
	  $('.erreur_matiere').html("Champ obligatoire!");
  }
  else
  {
  	$('#nomMatiere').css('border-color', '');
  }
  
  if ($.trim(coefficient) ==='') {
	  $('#coefficient').css('border-color', 'red');
	  $('.erreur_coefficient').html("Champ obligatoire!");
  }
  else
  {
  	$('#coefficient').css('border-color', '');
  }

  
  var erreur_classe = $.trim($(".erreur_classe").html());
  var erreur_matiere = $.trim($(".erreur_matiere").html());
  var erreur_coefficient = $.trim($(".erreur_coefficient").html());
 
  if ((erreur_classe !== '') ||(erreur_matiere !== '')||(erreur_coefficient !== ''))
     {
         
	  return false;
     }
  else
	  {
	  var form = $("#form_ajouter_coefficient");

	  /* Send the data using post and put the results in a div */
	  request =$.ajax({
	      url: form.attr('action'),
	      type: "post",
	      data:form.serialize(),
	      beforeSend: function() {
				$('.bd-example-modal-lg').modal('show');
	        },
	      success: function(){
		
			setTimeout(function () {
		       	$('.bd-example-modal-lg').modal('hide');
		       }, 1000);	
		         
	          $('#modal-ajout-reussi').modal('show'); 
	          
	          $(".btn-success").click(function(event) {
	        	  $('#modal-ajout-reussi').modal('hide'); 
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
	           $('.resultat').html(jqXHR.responseText);
	           $('.resultat').css('color', 'red');
	      }  
	  });
	  return false;
	  }

});

});
