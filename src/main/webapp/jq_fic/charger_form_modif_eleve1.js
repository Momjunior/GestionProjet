$(document).ready(function(){

 $("#listeEleve").on('click','.btn_charger_form_modifier_eleve',function(){
 	
 	$('#nom').css('border-color', '');
 	$('#prenom').css('border-color', '');
 	$('#sexe').css('border-color', '');
    $('#jourNaiss').css('border-color', '');
  	$('#moisNaiss').css('border-color', '');
  	$('#anneeNaiss').css('border-color', '');
    $('#matricule1').css('border-color', '');
    $('#tel').css('border-color', '');
       
    $('.erreur_nom').html("");
    $('.erreur_prenom').html("");
    $('.erreur_sexe').html(""); 
	$('.erreur_dateNaiss').html("");
	$('.erreur_matricule1').html("");
	$('.erreur_tel').html("");
	
    $('.resultat1').empty();
    
    var currentRow=$(this).closest("tr"); 
         
     var matricule=currentRow.find("td:eq(1)").text();// get current row 1st TD value
	 var nom=currentRow.find("td:eq(2)").text();
	 var prenom=currentRow.find("td:eq(3)").text();// get current row 1st TD value
	 var sexe=currentRow.find("td:eq(4)").text();
	 var dateNaiss=currentRow.find("td:eq(5)").text();// get current row 1st TD value
	 var tel=currentRow.find("td:eq(6)").text();
	
   /* 
    var url_params = new URLSearchParams(window.location.search);
    
    var id = url_params.get('id');*/
    
    var id = $(this).attr('id').replace(/btnModifierEleve-/, '');
    
	var result = dateNaiss.split("-");

     $('#nom').val(nom);
     $('#prenom').val(prenom);
     $('#sexe').val(sexe);
     $('#jourNaiss').val(result[2]);
  	 $('#moisNaiss').val(result[1]);
  	 $('#anneeNaiss').val(result[0]);
     $('#matricule1').val(matricule);
     $('#tel').val(tel);  
     $('#idEleve').val(id);       
                       
    });
});