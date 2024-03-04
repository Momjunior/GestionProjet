$(function() {
 
//Current request reference; can be used else where
var request;
 
/* attach a submit handler to the form */
$(".btn_modifier_classe").click(function(event) {

	$('.erreur_classe1').html("");
	$('.erreur_categorie1').html("");	
    $('.resultat1').html("");
    // abort any pending request
    if (request) {
        request.abort();
    }
  /* stop form from submitting normally */
  event.preventDefault();

  var classe = $("#classe1").val();
  var categorie = $("#categorie1").val();
  
 if ($.trim(classe) ==='') {
	  $('#classe1').css('border-color', 'red');
	  $('.erreur_classe1').html("Champ obligatoire!");
  }
  else
  {
  	$('#classe1').css('border-color', '');
  }
  
    if ($.trim(categorie) ==='') {
	  $('#categorie1').css('border-color', 'red');
	  $('.erreur_categorie1').html("Champ obligatoire!");
  }
  else
  {
  	$('#categorie1').css('border-color', '');
  }
  
  var erreur_classe = $.trim($(".erreur_classe1").html());
  var erreur_categorie = $.trim($(".erreur_categorie1").html());
  
if ((erreur_classe !== '') ||(erreur_categorie !== ''))
     {         
	  return false;
     }
  else
	  {
	  var form = $("#form_modifier_classe");

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
				}, 5000);
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
