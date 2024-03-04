$(document).ready(function(){

    // code to read selected table row cell data (values).
    $(".table").on('click','.btn-modifier',function(){
 $("#form_modifier_user")[0].reset();
 $('#nom').css('border-color', '');
 $('#prenom').css('border-color', '');
 $('#login').css('border-color', '');
  $('#apwd').css('border-color', '');
   $('#npwd').css('border-color', '');
    $('#cpwd').css('border-color', '');
    $('.erreur_nom').html("");
    $('.erreur_prenom').html("");
    $('.erreur_login').html("");
	$('.erreur_apwd').html("");
	$('.erreur_npwd').html("");
	$('.erreur_cpwd').html("");
	
        $('.resultat').empty();
        $("#target option:first").prop("selected", "selected");
        
         // get the current row
         var currentRow=$(this).closest("tr"); 
         
         var col1=currentRow.find("td:eq(0)").text();
         var id=currentRow.find("td:eq(1)").text();// get current row 1st TD value
         var nom=currentRow.find("td:eq(2)").text(); // get current row 2nd TD  
         var prenom=currentRow.find("td:eq(3)").text(); // get current row 2nd TD  
         var login=currentRow.find("td:eq(4)").text(); // get current row 2nd TD          
         var pwd=currentRow.find("td:eq(5)").text(); // get current row 3rd TD 
          
         $('#idUtilisateur').val(id);
         $('#nom').val(nom);
         $('#prenom').val(prenom);
         $('#login').val(login);
         $('#hiddenPwd').val(pwd);
         
                       
    });
});