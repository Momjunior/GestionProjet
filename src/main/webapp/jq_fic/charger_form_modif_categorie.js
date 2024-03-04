$(document).ready(function(){

    // code to read selected table row cell data (values).
    $(".table").on('click','.btn-modifier',function(){
	 $("#form_modifier_categorie")[0].reset();
	 $('#nomCategorie1').css('border-color', '');
	 
	    $('.erreur_nomCategorie1').html("");
	    	
	        $('.resultat1').empty();
	                
	         // get the current row
	         var currentRow=$(this).closest("tr"); 
	         
	         var id=currentRow.find("td:eq(0)").text();
	         var nomCategorie1=currentRow.find("td:eq(2)").text();

	         $('#idCategorie').val(id);
	         $('#aCategorie').val(nomCategorie1);
	    });
});