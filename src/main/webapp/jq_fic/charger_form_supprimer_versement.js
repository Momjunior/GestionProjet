$(document).ready(function(){

    // code to read selected table row cell data (values).
    $("#tableListeScolarite").on('click','.btn_afficher_supprimer_scolarite',function(){

	$('.resultat8').html("");
	        
        var id = $(this).attr('id').replace(/btnSupprimerScolarite-/, '');
         
         $('#idScolarite').val(id);
         
        $('#modalSupprimerVersement').modal('show');
    });
});