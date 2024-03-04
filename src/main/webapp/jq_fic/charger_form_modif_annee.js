$(document).ready(function(){

    // code to read selected table row cell data (values).
    $(".table").on('click','.btn-modifier',function(){
 $("#form_modifier_annee_scolaire")[0].reset();
 $('#debut1').css('border-color', '');
 $('#fin1').css('border-color', '');
 
    $('.erreur_debut1').html("");
    $('.erreur_fin1').html("");
    	
        $('.resultat1').empty();
                
         // get the current row
         var currentRow=$(this).closest("tr"); 
         
         var id=currentRow.find("td:eq(0)").text();
         var debut=currentRow.find("td:eq(1)").text();
         var fin=currentRow.find("td:eq(2)").text();// get current row 1st TD value

         $('#debut1').val(debut);
         $('#fin1').val(fin);
         $('#idAnneeScolaire').val(id);
         $('#ancienDebut').val(debut);
         $('#ancienFin').val(fin);
                 
    });
});