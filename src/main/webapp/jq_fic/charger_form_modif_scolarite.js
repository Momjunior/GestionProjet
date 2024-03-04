$(document).ready(function(){

    // code to read selected table row cell data (values).
    $(".table").on('click','.btn_charger_modal_modifier_scolarite',function(){

	$('.resultat3').html("");
	 $('.erreur_mois1').html("");
    $('.erreur_versement1').html("");
    $('.erreur_dateVersement').html("");
    
    $('#mois1').css('border-color', '');
    $('#versement1').css('border-color', '');
	 
       // $('.resultat7').empty();
       // $("#target option:first").prop("selected", "selected");
        
        var id = $(this).attr('id').replace(/btnModifierScolarite-/, '');
        
         // get the current row
         var currentRow=$(this).closest("tr"); 
         
         var dateVersement=currentRow.find("td:eq(1)").text(); // get current row 2nd TD  
         var mois=currentRow.find("td:eq(2)").text(); // get current row 2nd TD  
         var montant=currentRow.find("td:eq(3)").text(); // get current row 2nd TD          

         var date =dateVersement.split("-");

         $('#idInscription3').val(id);
         $('#mois1').val(mois);
         $('#mois3').val(mois);
         $('#versement1').val(montant);
         $('#jourVersement1').val(date[0]);
         $('#moisVersement1').val(date[1]);
         $('#anneeVersement1').val(date[2]);

         $('#modalModifierScolarite').modal('show');      
                       
    });
});