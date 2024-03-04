$(document).ready(function(){

    // code to read selected table row cell data (values).
    $(".table").on('click','.btn-modifier',function(){
	 $("#form_modifier_matiere")[0].reset();
	 $('#nomMatiere1').css('border-color', '');
	 
	    $('.erreur_nomMatiere1').html("");
	    	
	        $('.resultat1').empty();
	                
	         // get the current row
	         var currentRow=$(this).closest("tr"); 
	         
	         var id=currentRow.find("td:eq(0)").text();
	         var nomMatiere1=currentRow.find("td:eq(2)").text();

	         $('#idMatiere').val(id);
	         $('#ancienMatiere').val(nomMatiere1);
	         $('#aMatiere').val(nomMatiere1);
	    });
});