$(function() {
  
//Current request reference; can be used else where
var request;
 
/* attach a submit handler to the form */
$(".btn_creer_user").click(function(event) {
    
    $('.erreur_nom').html("");
    $('.erreur_prenom').html("");
	$('.erreur_login').html("");
	$('.erreur_pwd').html("");
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
  var pwd   = $("#password").val();
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
  
  
  if ($.trim(pwd) ==='') {
  $('#pwd').css('border-color', 'red');
	  $('.erreur_pwd').html("Veuillez entrer le mot de passe");    
  }
  else 
	  {
		  if ($.trim(pwd).length <6)
		     {
		     $('#pwd').css('border-color', 'red');
			  $('.erreur_pwd').html('');
			  $('.erreur_pwd').html("Le mot de passe doit dépasser 5 caractères");			 
		     }
		  else
			  {
			  if ($.trim(cpwd) ==='')
					  {
					  $('#pwd').css('border-color', 'red');
					  $('.erreur_cpwd').html('');
					  $('.erreur_cpwd').html("Veuillez confirmer le mot de passe");
				  }
			       else 
			    	   {
			    	    if ($.trim(pwd) !== $.trim(cpwd))
			    	    	{
			    	    	$('#pwd').css('border-color', 'red');
			    	    		$('.erreur_cpwd').html('');
							    $('.erreur_cpwd').html("Les 2 mots de passe ne sont pas identiques!");
			    	    	}
			    	    else 
			    	    {
			    	    $('#pwd').css('border-color', '');
			    	      	$('.erreur_cpwd').html('');
			    	     }
			    	   }
			  }
	  }
  
  var erreur_nom = $.trim($(".erreur_nom").html());
  var erreur_prenom = $.trim($(".erreur_prenom").html());
  var erreur_login = $.trim($(".erreur_login").html());
  var erreur_pwd = $.trim($(".erreur_pwd").html());
  var erreur_cpwd = $.trim($(".erreur_cpwd").html());
  
  
  if ((erreur_nom !== '') ||(erreur_prenom !== '') ||(erreur_login !== '') ||(erreur_pwd !== '') || (erreur_cpwd !== ''))
     {
         
	  return false;
     }
  else
	  {
	  var form = $('#form_creer_user');

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
	          
		         
	          $('#modal-ajout-reussi').modal('show'); 
	          
	          $(".btn-success").click(function(event) {
	        	  $('#modal-ajout-reussi').modal('hide'); 
	          });
                 
	          $("#form_creer_user")[0].reset() ;
                            
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
