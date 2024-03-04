$(function() {
  
//Current request reference; can be used else where
var request;
 
/* attach a submit handler to the form */
$(".btn_modifier_user").click(function(event) {

	$('.erreur_nom').html("");
	$('.erreur_prenom').html("");
	$('.erreur_login').html("");
	$('.erreur_apwd').html("");
	$('.erreur_npwd').html("");
	$('.erreur_cpwd').html("");
        $('.resultat').html("");
    // abort any pending request
    if (request) {
        request.abort();
    }
  /* stop form from submitting normally */
  event.preventDefault();

  var nom = $("#nom").val();
  var prenom = $("#prenom").val();
  var login = $("#login").val();
  var apwd   = $("#apwd").val();
  var npwd  = $("#npwd").val();
  var cpwd  = $("#cpwd").val();
 
 if ($.trim(nom) ==='') {
	  $('#nom').css('border-color', 'red');
	  $('.erreur_nom').html("Champ obligatoire!");
  }
  else
  {
  	$('#nom').css('border-color', '');
  }
  
    if ($.trim(prenom) ==='') {
	  $('#prenom').css('border-color', 'red');
	  $('.erreur_prenom').html("Champ obligatoire!");
  }
  else
  {
  	$('#prenom').css('border-color', '');
  }

  if ($.trim(login) ==='') {
   $('#login').css('border-color', 'red');
	  $('.erreur_login').html("Veuillez entrer le login");
  }
  else 
	  {
	   if ($.trim(login).length <3)
	     {
	     $('#login').css('border-color', 'red');
			  $('.erreur_login').html("");
			  $('.erreur_login').html("Le login doit dépasser 2 caractères");			 
	     }
	     else
	     {
	      $('#login').css('border-color', '');
	     }	  	  
	  }
  
  
  if (($.trim(apwd) !=='') || ($.trim(npwd) !=='') || ($.trim(apwd) !=='' )) {
   if ($.trim(apwd) ==='') {
	  $('#apwd').css('border-color', 'red');
	  $('.erreur_apwd').html("Veuillez préciser l'ancien password");
    
  	}
  	if ($.trim(npwd) ==='') {
	  $('#npwd').css('border-color', 'red');
	  $('.erreur_npwd').html("Veuillez préciser le nouveau password");    
  	}
  	else
  	{
  	   if ($.trim(npwd).length <6)
		     {
		     $('#npwd').css('border-color', 'red');
			  $('.erreur_npwd').html('');
			  $('.erreur_npwd').html("Le mot de passe doit dépasser 5 caractères");			 
		     }
		  else
			  {
			  if ($.trim(cpwd) ==='')
					  {
					  $('#npwd').css('border-color', 'red');
					  $('.erreur_cpwd').html('');
					  $('.erreur_cpwd').html("Veuillez confirmer le mot de passe");
				  }
			       else 
			    	   {
			    	    if ($.trim(npwd) !== $.trim(cpwd))
			    	    	{
			    	    	$('#npwd').css('border-color', 'red');
			    	    		$('.erreur_cpwd').html('');
							    $('.erreur_cpwd').html("Les 2 mots de passe ne sont pas identiques!");
			    	    	}
			    	    else 
			    	    {
			    	    $('#npwd').css('border-color', '');
			    	      	$('.erreur_cpwd').html('');
			    	     }
			    	   }
			  }
  	}
  	
  }
  
  var erreur_nom = $.trim($(".erreur_nom").html());
  var erreur_prenom = $.trim($(".erreur_prenom").html());
  var erreur_login = $.trim($(".erreur_login").html());
  var erreur_apwd = $.trim($(".erreur_apwd").html());
  var erreur_npwd = $.trim($(".erreur_npwd").html());
  var erreur_cpwd = $.trim($(".erreur_cpwd").html());
  
  if (((erreur_nom) !== '') ||((erreur_prenom) !== '') ||((erreur_login) !== '') || ((erreur_apwd) !== '') || ((erreur_npwd) !== '')|| ((erreur_cpwd) !== ''))
     {         
	  return false;
     }
  else
	  {
	  var form = $('#form_modifier_user');

	  /* Send the data using post and put the results in a div */
	  request =$.ajax({
	      url: form.attr('action'),
	      type: "post",
	      data:form.serialize(),
	      beforeSend: function() {
	        $('#load-img').show();
	        },
	      success: function(data, textStatus, jqXHR){
	          $('#load-img').hide();	       	          
		         
	          $('#modal-modif-reussi').modal('show'); 
	          
	          $(".btn-success").click(function(event) {
	        	  $('#modal-modif-reussi').modal('hide'); 
	        	   $('.bd-example-modal-lg').modal('hide');
	        	  location.reload();
	          });
                 
	          $("#form_modifier_user")[0].reset()           
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
