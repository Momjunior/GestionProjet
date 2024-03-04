$(function() {

//Current request reference; can be used else where
var request;
 
/* attach a submit handler to the form */
$(".btn_ajouter_matiere").click(function(event) {
    
    $('.erreur_nomMatiere').html("");
    $('.resultat').html("");
	
    // abort any pending request
    if (request) {
        request.abort();
    }
  /* stop form from submitting normally */
  event.preventDefault();

  var nomMatiere = $("#nomMatiere").val();
 
  if ($.trim(nomMatiere) ==='') {
	  $('#nomMatiere').css('border-color', 'red');
	  $('.erreur_nomMatiere').html("Champ obligatoire!");
  }
  else
  {
  	$('#nomMatiere').css('border-color', '');
  }
  
  var erreur_nomMatiere = $.trim($(".erreur_nomMatiere").html());
 
  if ((erreur_nomMatiere !== ''))
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
				$('#load-img').show();
	        },
	      success: function(){
	         $('#load-img').hide();	          
		         
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
	    	   $('#load-img').hide();
	           $('.resultat').html(jqXHR.responseText);
	           $('.resultat').css('color', 'red');
	      }  
	  });
	  return false;
	  }

});

});
