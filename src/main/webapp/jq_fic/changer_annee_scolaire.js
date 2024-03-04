$(function() {

//Current request reference; can be used else where
var request;
 
/* attach a submit handler to the form */
$(".btn_changer_annee_scolaire").click(function(event) {
    
    $('.erreur_debut2').html("");
    $('.erreur_fin2').html("");
    $('.resultat2').html("");
	
    // abort any pending request
    if (request) {
        request.abort();
    }
  /* stop form from submitting normally */
  event.preventDefault();

  var debut = $("#debut2").val();
  var fin = $("#fin2").val();
 
  if ($.trim(debut) ==='') {
	  $('#debut2').css('border-color', 'red');
	  $('.erreur_debut2').html("Champ obligatoire!");
  }
  else
  {
  	$('#debut2').css('border-color', '');
  }
  
    if ($.trim(fin) ==='') {
	  $('#fin2').css('border-color', 'red');
	  $('.erreur_fin2').html("Champ obligatoire!");
  }
  else
  {
  	$('#fin2').css('border-color', '');
  }

  
  var erreur_debut = $.trim($(".erreur_debut2").html());
  var erreur_fin = $.trim($(".erreur_fin2").html());
 
  if ((erreur_debut !== '') ||(erreur_fin !== ''))
     {
         
	  return false;
     }
  else
	  {
	  var form = $("#form_changer_annee_scolaire");

	  /* Send the data using post and put the results in a div */
	  request =$.ajax({
	      url: form.attr('action'),
	      type: "post",
	      data:form.serialize(),
	      beforeSend: function() {
				$('.bd-example-modal-lg').modal('show');
	        },
	      success: function(){
		
		$('#modal-changement-reussi').modal('show');
		
		  $(".btn-success").click(function(event) {
	        	 $('#modal-changement-reussi').modal('hide');  
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
	           $('.resultat2').html(jqXHR.responseText);
	           $('.resultat2').css('color', 'red');
	      }  
	  });
	  return false;
	  }

});

});
