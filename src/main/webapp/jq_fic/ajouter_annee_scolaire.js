$(function() {

//Current request reference; can be used else where
var request;
 
/* attach a submit handler to the form */
$(".btn_ajouter_annee_scolaire").click(function(event) {
    
    $('.erreur_debut').html("");
    $('.erreur_fin').html("");
    $('.resultat').html("");
	
    // abort any pending request
    if (request) {
        request.abort();
    }
  /* stop form from submitting normally */
  event.preventDefault();

  var debut = $("#debut").val();
  var fin = $("#fin").val();
 
  if ($.trim(debut) ==='') {
	  $('#debut').css('border-color', 'red');
	  $('.erreur_debut').html("Champ obligatoire!");
  }
  else
  {
  	$('#debut').css('border-color', '');
  }
  
    if ($.trim(fin) ==='') {
	  $('#fin').css('border-color', 'red');
	  $('.erreur_fin').html("Champ obligatoire!");
  }
  else
  {
  	$('#fin').css('border-color', '');
  }

  
  var erreur_debut = $.trim($(".erreur_debut").html());
  var erreur_fin = $.trim($(".erreur_fin").html());
 
  if ((erreur_debut !== '') ||(erreur_fin !== ''))
     {
         
	  return false;
     }
  else
	  {
	  var form = $("#form_ajouter_annee_scolaire");

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
