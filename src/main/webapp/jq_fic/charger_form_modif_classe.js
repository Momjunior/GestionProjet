$(document).ready(function(){

    // code to read selected table row cell data (values).
    $(".table").on('click','.btn-modifier',function(){
	 $("#form_modifier_classe")[0].reset();
	 $('#classe1').css('border-color', '');
	 $('#categorie1').css('border-color', '');
	 
	    $('.erreur_classe1').html("");
	    $('.erreur_categorie1').html("");
	    	
	        $('.resultat1').empty();
	                
	         // get the current row
	         var currentRow=$(this).closest("tr"); 
	         
	         var id=currentRow.find("td:eq(0)").text();
	         var classe1=currentRow.find("td:eq(1)").text();
	         var categ=currentRow.find("td:eq(2)").text();
	         var classe=currentRow.find("td:eq(4)").text();
	
	         $('#idClasse').val(id);
	         $('#ancienClasse').val(classe1);
	         $('#ancienCategorie').val(categ);
	         $('#aClasse').val(classe);
	    });
});