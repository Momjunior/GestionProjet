$(function() {

//Current request reference; can be used else where
var request;
 
/* attach a submit handler to the form */
$(".btn_ajouter_categorie").click(function(event) {
    
    $('.erreur_nomCategorie').html("");
    $('.resultat').html("");
	
    // abort any pending request
    if (request) {
        request.abort();
    }
  /* stop form from submitting normally */
  event.preventDefault();

  var nomCategorie = $("#nomCategorie").val();
 
  if ($.trim(nomCategorie) ==='') {
	  $('#nomCategorie').css('border-color', 'red');
	  $('.erreur_nomCategorie').html("Champ obligatoire!");
  }
  else
  {
  	$('#nomCategorie').css('border-color', '');
  }
  
  var erreur_nomCategorie = $.trim($(".erreur_nomCategorie").html());
 
  if ((erreur_nomCategorie !== ''))
     {
         
	  return false;
     }
  else
	  {
	  var form = $("#form_ajouter_categorie");

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
				}, 5000);
               
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
