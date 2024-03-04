$(function() {
  
//Current request reference; can be used else where
var request;
 
/* attach a submit handler to the form */
$(".btn-ajouter-prof").click(function(event) {
    
    $('#dateInscrip').val("");
    $('.erreur_nom').html("");
    $('.erreur_prenom').html("");
	$('.erreur_sexe').html("");
	$('.erreur_dateNaiss').html("");
	$('.erreur_tel').html("");
    $('.resultat1').html("");
	
    // abort any pending request
    if (request) {
        request.abort();
    }
  /* stop form from submitting normally */
  event.preventDefault();

  var nom = $("#nom").val();
  var prenom = $("#prenom").val();
  var sexe = $("#sexe").val();
  var jourNaiss = $("#jourNaiss").val();
  var moisNaiss = $("#moisNaiss").val();
  var anneeNaiss = $("#anneeNaiss").val();
  var dateNaiss = jourNaiss+"-"+moisNaiss+"-"+anneeNaiss;
  var matricule   = $("#matricule").val();
  var tel  = $("#tel").val();
  var classe   = $("#classe").val();
  var versement  = $("#versement").val();
  
  var dte = new Date();
  var y = dte.getFullYear();
  var m = dte.getMonth()+1;
  var d = dte.getDate();
  var maDate = y + "-" + m + "-" + d;
  var maDate2 = d + "-" + m + "-" + y;

	$('#dateInscrip').val(maDate);
	

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


  if ($.trim(sexe) ==='') {
   $('#sexe').css('border-color', 'red');
	  $('.erreur_sexe').html("Champ obligatoire!");
  }
  else 
	  {
	   $('#sexe').css('border-color', '');  
	  }
  
  	if ($.trim(jourNaiss) ==='' || $.trim(moisNaiss) ==='' || $.trim(anneeNaiss) ==='') {
	  $('#jourNaiss').css('border-color', 'red');
	  $('#moisNaiss').css('border-color', 'red');
	  $('#anneeNaiss').css('border-color', 'red');
	  $('.erreur_dateNaiss').html("Champ obligatoire!");
  }
  else
  {
  	$('#jourNaiss').css('border-color', '');
  	$('#moisNaiss').css('border-color', '');
  	$('#anneeNaiss').css('border-color', '');
  	$('.erreur_dateNaiss').html("");
  }
	  
if ($.trim(tel) ==='') {
   $('#tel').css('border-color', 'red');
	  $('.erreur_tel').html("Champ obligatoire!");
  }
  else 
  {
   $('#tel').css('border-color', '');  	  
  }
  
  var erreur_nom = $.trim($(".erreur_nom").html());
  var erreur_prenom = $.trim($(".erreur_prenom").html());
  var erreur_sexe = $.trim($(".erreur_sexe").html());
  var erreur_dateNaiss = $.trim($(".erreur_dateNaiss").html());
  var erreur_tel = $.trim($(".erreur_tel").html());

  
  if ((erreur_nom !== '') ||(erreur_prenom !== '') ||(erreur_sexe !== '') ||(erreur_dateNaiss !== '') || (erreur_tel !== ''))
     {         
	  return false;
     }
  else
	  {

	  	var form = $('#form_ajouter_prof');

	  /* Send the data using post and put the results in a div */
	  request =$.ajax({
	      url: form.attr('action'),
	      type: "post",
	      data:form.serialize(),
	      beforeSend: function() {
	        $('.bd-example-modal-lg').modal('show');
	        },
	      success: function(data, textStatus, jqXHR){
	         setTimeout(function () {
		       	$('.bd-example-modal-lg').modal('hide');
		       }, 1000);	

	          $('#modal-ajout-prof-reussi').modal('show'); 
	          
	          $(".btn-success").click(function(event) {
	        	  $('#modal-ajout-prof-reussi').modal('hide'); 
	        	   location.reload();
	          });
	          
	          setTimeout(function() {
				    location.reload();
				}, 5000);
                            
	      },
	      error:function(jqXHR, textStatus, errorThrown){
	    	  setTimeout(function () {				
		       	$('.bd-example-modal-lg').modal('hide'); 		       
		       }, 1000);
	           $('.resultat1').html(jqXHR.responseText);
	           $('.resultat1').css('color', 'red');
	      }  
	  });
	  return false;
	  }
});

});
