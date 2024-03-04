$(document).ready(function(){

    // code to read selected table row cell data (values).
    $("#listeEleve").on('click','.btn_charger_form_supprimer_eleve',function(){

	$('.resultat9').html("");
	        
        var id = $(this).attr('id').replace(/btnSupprimerEleve-/, '');
         
         $('#idEleve12').val(id);
        
    });
});