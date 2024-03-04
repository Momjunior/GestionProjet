$(document).ready(function(){

$(".btn_charger_form_modifier_eleve").click(function(event) {
 	console.log("ujujuju");
 	$('#nom').css('border-color', '');
 	$('#prenom').css('border-color', '');
 	$('#sexe').css('border-color', '');
    $('#jourNaiss').css('border-color', '');
  	$('#moisNaiss').css('border-color', '');
  	$('#anneeNaiss').css('border-color', '');
    $('#matricule1').css('border-color', '');
    $('#tel').css('border-color', '');
       
    $('.erreur_nom').html("");
    $('.erreur_prenom').html("");
    $('.erreur_sexe').html("");
	$('.erreur_dateNaiss').html("");
	$('.erreur_matricule1').html("");
	$('.erreur_tel').html("");
	
    $('.resultat1').empty();
    
    var nom = $('#spanNom').html();
    var prenom = $('#spanPrenom').html();
    var sexe = $('#spanSexe').html();
    var dateNaiss = $('#spanDateNaiss').html();
    var tel = $('#spanTel').html();
    var matricule = $('#spanMatricule').html();

    
	var result = dateNaiss.split("-");

     $('#nom').val(nom);
     $('#prenom').val(prenom);
     $('#sexe').val(sexe);
     $('#jourNaiss').val(result[0]);
  	 $('#moisNaiss').val(result[1]);
  	 $('#anneeNaiss').val(result[2]);
     $('#matricule1').val(matricule);
     $('#tel').val(tel);  
                       
    });
});