$(function() {
  
//Current request reference; can be used else where
var request;
 
/* attach a submit handler to the form */
$(".btn_modifier_annee").click(function(event) {

	$('.erreur_debut1').html("");
	$('.erreur_fin1').html("");	
    $('.resultat1').html("");
    // abort any pending request
    if (request) {
        request.abort();
    }
  /* stop form from submitting normally */
  event.preventDefault();

  var debut = $("#debut1").val();
  var fin = $("#fin1").val();
  
 if ($.trim(debut) ==='') {
	  $('#debut1').css('border-color', 'red');
	  $('.erreur_debut1').html("Champ obligatoire!");
  }
  else
  {
  	$('#debut1').css('border-color', '');
  }
  
    if ($.trim(fin) ==='') {
	  $('#fin1').css('border-color', 'red');
	  $('.erreur_fin1').html("Champ obligatoire!");
  }
  else
  {
  	$('#fin1').css('border-color', '');
  }
  
  var erreur_debut = $.trim($(".erreur_debut1").html());
  var erreur_fin = $.trim($(".erreur_fin1").html());
  
if ((erreur_debut !== '') ||(erreur_fin !== ''))
     {         
	  return false;
     }
  else
	  {
	  var form = $("#form_modifier_annee_scolaire");

	  /* Send the data using post and put the results in a div */
	  request =$.ajax({
	      url: form.attr('action'),
	      type: "post",
	      data:form.serialize(),
	      beforeSend: function() {
	        $('#load-img1').show();
	        },
	      success: function(data, textStatus, jqXHR){
	          $('#load-img1').hide();	       	          
		         
	          $('#modal-modif-reussi').modal('show'); 
	          
	          $(".btn-success").click(function(event) {
	        	  $('#modal-modif-reussi').modal('hide'); 	        	   
	        	  location.reload();
	          });
	          setTimeout(function() {
				    location.reload();
				}, 1000);
   	      },
	      error:function(jqXHR, textStatus, errorThrown){
	           $('#load-img1').hide();
	           $('.resultat1').html(jqXHR.responseText);
	           $('.resultat1').css('color', 'red');
	      }  
	  });
	  return false;
	  }
});

});
