$(document).ready(function(){

    // code to read selected table row cell data (values).
    $("#listeCoefficient").on('click','.btn-modifier',function(){
 $("#form_modifier_coefficient")[0].reset();
 $('#nouvelleVal').css('border-color', '');
 
    $('.erreur_nouvelleVal').html("");
    	
        $('.resultat1').empty();
                
         // get the current row
         var currentRow=$(this).closest("tr"); 
         
         var id = $(this).attr('id').replace(/btnModifierCoefficient-/, '');
         var classe=currentRow.find("td:eq(1)").text();
         var matiere=currentRow.find("td:eq(2)").text();
         var val=currentRow.find("td:eq(3)").text();// get current row 1st TD value

         $('#idCoefficient').val(id);
         $('#classe').val(classe);
         $('#matiere').val(matiere);
         $('#ancienVal').val(val);
         
                 
    });
});