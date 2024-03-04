$(document).ready(function(){

    // code to read selected table row cell data (values).
    $("#listeEleve").on('click','.btn_charger_form_ajouter_versement',function(){

    $('#mois').css('border-color', '');
 	$('#versement').css('border-color', '');
 	
 	 $('#mois').val("");
 	$('#versement').val("");
       
    $('.erreur_mois').html("");
    $('.erreur_versement').html("");
    
	$('.resultat2').html("");
	        
        var id = $(this).attr('id').replace(/btnAfficherModalVersement-/, '');
         
         $('#idInscription').val(id);
        
    });
});