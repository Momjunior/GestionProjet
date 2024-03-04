$(document).ready(function(){

    // code to read selected table row cell data (values).
    $(".table").on('click','.btn_charger_modal_modifier_note',function(){

	$('.resultat7').html("");

	 $('#note2').css('border-color', '');
    
    $('.erreur_note2').html("");
	 
       // $('.resultat7').empty();
       // $("#target option:first").prop("selected", "selected");
        
        var id = $(this).attr('id').replace(/btnModifierNote-/, '');
        
         // get the current row
         var currentRow=$(this).closest("tr"); 
         
         var note=currentRow.find("td:eq(4)").text(); // get current row 2nd TD          

         $('#idNote').val(id);
         $('#note2').val(note);   
         
         $('#modalModifierNote').modal('show');      
                       
    });
});