$(function() {
  
//Current request reference; can be used else where
var request;
 
/* attach a submit handler to the form */
$(".btn_ajouter_inscription").click(function(event) {
    
    $('#dateInscrip').val("");
    $('.erreur_nom').html("");
    $('.erreur_prenom').html("");
	$('.erreur_sexe').html("");
	$('.erreur_dateNaiss').html("");
	$('.erreur_matricule').html("");
	$('.erreur_tel').html("");
	$('.erreur_classe').html("");
	$('.erreur_categorie').html("");
	$('.erreur_versement').html("");
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
  var categorie   = $("#categorie").val();
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

	  
	  if ($.trim(matricule) ==='') {
   $('#matricule').css('border-color', 'red');
	  $('.erreur_matricule').html("Champ obligatoire!");
  }
  else 
	  {
	   $('#matricule').css('border-color', '');  	  
	  }
	  
if ($.trim(tel) ==='') {
   $('#tel').css('border-color', 'red');
	  $('.erreur_tel').html("Champ obligatoire!");
  }
  else 
  {
   $('#tel').css('border-color', '');  	  
  }
	  
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
	  
  if ($.trim(versement) ==='') {
   $('#versement').css('border-color', 'red');
	  $('.erreur_versement').html("Champ obligatoire!");
  }
  else 
  {
	if($.isNumeric(versement) )
	{
		$('#versement').css('border-color', '');  	
		
	}
	else
     $('.erreur_versement').html("Veuillez entrer un vrai montant!");
  }
  
  var erreur_nom = $.trim($(".erreur_nom").html());
  var erreur_prenom = $.trim($(".erreur_prenom").html());
  var erreur_sexe = $.trim($(".erreur_sexe").html());
  var erreur_dateNaiss = $.trim($(".erreur_dateNaiss").html());
  var erreur_matricule = $.trim($(".erreur_matricule").html());
  var erreur_tel = $.trim($(".erreur_tel").html());
  var erreur_classe = $.trim($(".erreur_classe").html());
  var erreur_categorie = $.trim($(".erreur_categorie").html());
  var erreur_versement = $.trim($(".erreur_versement").html());
  
  if ((erreur_nom !== '') ||(erreur_prenom !== '') ||(erreur_sexe !== '') ||(erreur_dateNaiss !== '') || (erreur_matricule !== '')|| (erreur_tel !== '') || (erreur_classe !== '') || (erreur_categorie !== '')|| (erreur_versement !== ''))
     {         
	  return false;
     }
  else
	  {

	  	var form = $('#form_ajouter_inscription');

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
	          var mat = 0;
	          
	          if(data ==='')
	          	mat = matricule;
	          else
	          	mat = data;

	          $('#spanDateInscrip').html("");
	          $('#spanVersement').html("");
	          $('#spanNom').html("");
	          $('#spanPrenom').html("");
	          $('#spanTel').html("");
	          $('#spanDateNaiss').html("");
	          $('#spanMatricule').html("");
	          $('#spanClasse').html("");
	          $('#spanCategorie').html("");
	          
	          $('#spanDateInscrip').html(maDate2);
	          $('#spanVersement').html(versement);
	          $('#spanNom').html(nom);
	          $('#spanPrenom').html(prenom);
	          $('#spanTel').html(tel);
	          $('#spanDateNaiss').html(dateNaiss);
	          $('#spanMatricule').html(mat);
	          $('#spanClasse').html(classe);
	          $('#spanCategorie').html(categorie);	         	          
	          
	          setTimeout(function() {
				$('#modal-ajout-reussi').modal('hide'); 
				    $('#modalRecu').modal('show');
				}, 3000);
	          
	          $(".btn-success").click(function(event) {
	        	  $('#modal-ajout-reussi').modal('hide'); 
	        	  $('#modalRecu').modal('show');
	          });
                 
	          
                            
	      },
	      error:function(jqXHR, textStatus, errorThrown){
	    	  $('#load-img').hide();
	           $('.resultat1').html(jqXHR.responseText);
	           $('.resultat1').css('color', 'red');
	      }  
	  });
	  return false;
	  }
});

});
