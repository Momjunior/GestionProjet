$(function() {

//Current request reference; can be used else where
var request;
 
/* attach a submit handler to the form */
$(".btn_ajouter_classe").click(function(event) {
    
    $('.erreur_classe').html("");
    $('.erreur_categorie').html("");
    $('.resultat').html("");
	
    // abort any pending request
    if (request) {
        request.abort();
    }
  /* stop form from submitting normally */
  event.preventDefault();

  var classe = $("#classe").val();
  var categorie = $("#categorie").val();
 
  if ($.trim(classe) ==='') {
	  $('#classe').css('border-color', 'red');
	  $('.erreur_classe').html("Champ obligatoire!");
  }
  else
  {
  	$('#classe').css('border-color', '');
  }
  
    if ($.trim(categorie) ==='') {
	  $('#categorie').css('border-color', 'red');
	  $('.erreur_categorie').html("Champ obligatoire!");
  }
  else
  {
  	$('#categorie').css('border-color', '');
  }

  
  var erreur_classe = $.trim($(".erreur_classe").html());
  var erreur_categorie = $.trim($(".erreur_categorie").html());
 
  if ((erreur_classe !== '') ||(erreur_categorie !== ''))
     {
         
	  return false;
     }
  else
	  {
	  var form = $("#form_ajouter_classe");

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
