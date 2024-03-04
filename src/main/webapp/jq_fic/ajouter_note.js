$(document).ready(function(){

$(".btn-ajouter-note").click(function(event) {
  $('.resultat10').html("");
  var semestre  = $("#semestre").val();
  var matiere = $("#matiere").val();
  var typeNote = $("#typeNote").val();
  var jourEpreuve = $("#jourEpreuve").val();
  var moisEpreuve = $("#moisEpreuve").val();
  var anneeEpreuve = $("#anneeEpreuve").val();
  
 var $inputs = $("#form_ajouter_note input[name^='note']");
//var $inputs = $("#form_charger_note input[name^='note']");
    // not sure if you wanted this, but I thought I'd add it.
    // get an associative array of just the values.
 /*   var values = {};
    $inputs.each(function() {
        values[this.name] = $(this).val();
    });
 	
$("#form_charger_note").each(function(){
    $(this).find(':input') //<-- Should return all input elements in that specific form.
}); 
*/
 // Get all the inputs into an array...

         // An array of just the ids...
         var liste_note = [];         
         var test = true;
         var test2 = true;
         var test3 = true;
         var test4 = true;
         
         liste_note = [];

         $inputs.each(function (index)
         {
             // For debugging purposes...
         //    alert(index + ': ' + $(this).attr('id'));
//alert($(this).attr('id').replace(/[^0-9]/g,''));
		//	var id= $(this).attr('id');
			var id= $(this).attr('id').replace(/[^0-9]/g,'');
			var note = $(this).val().replace(/,/g, '.');
		//	window['varname'] = "note"+id;
			
			if ($.trim(note) ==='') 
			  {
				  test = false;
			  }	
			  
		 	 if(!$.isNumeric(note)) 
		  		{
				  test2 = false;
				}	
				
			 if(note < 0)
		  		{
		  		 test3 = false
		  		}
			  		
		      if(note > 20)
		  		{
		  		 test4 = false
		  		}		
           
           if(test && test2 && test3 && test4)
           {
	         liste_note.push(id+"+"+note)
		   }
           
         });
         console.log(liste_note.toString());
         if(test && $.trim(semestre) !=='' && $.trim(matiere) !=='' && $.trim(typeNote) !=='' && $.trim(jourEpreuve) !=='' && $.trim(moisEpreuve) !=='' && $.trim(anneeEpreuve) !=='')  
            {
				if(test2)
					{
						if(test3)
							{
								if(test4)
									{
										$('[name="listeNote"]').val( liste_note.toString() );
										$('.resultat10').html("");
										
										// ************************* debut ajout ***************************
										
										var form = $('#form_ajouter_note');
								
									  /* Send the data using post and put the results in a div */
									  request =$.ajax({
									      url: form.attr('action'),
									      type: "post",
									      data:form.serialize(),
									      beforeSend: function() {
									        $('.bd-example-modal-lg').modal('show');
									        },
									      success: function(data, textStatus, jqXHR){
											
											setTimeout(function () {
										       	$('.bd-example-modal-lg').modal('hide');
										       }, 1000);	
								
									          $('#modal-ajout-note-reussi').modal('show'); 
									          
									          $(".btn-success").click(function(event) {
									        	  $('#modal-ajout-note-reussi').modal('hide'); 
									          });	  
									          
									          setTimeout(function () {				
										       	$('#modal-ajout-note-reussi').modal('hide'); 
										       }, 1000);
									          
									          $("#form_ajouter_note")[0].reset() ;        
								     	
									      },
									      error:function(jqXHR, textStatus, errorThrown){
									    		setTimeout(function () {				
										       	$('.bd-example-modal-lg').modal('hide'); 		       
										       }, 1000);
									           $('.resultat10').html(jqXHR.responseText);
									           $('.resultat10').css('color', 'red');
									      }  
									  });
									  return false;
										
										// *************************  fin ajout  ***************************
									}
									else
									{
										$('.resultat10').html("Les notes doivent être <= 20!");
									}								
							}
							else
							{
								$('.resultat10').html("Les notes doivent être >= 0!");
							}
						
					}
				    else
				    {
					   $('.resultat10').html("Veuillez saisir des notes valables!!!");
					}
			}			         
			else
			{
				 $('.resultat10').html("Veuillez remplir tous les champs!!!");
			}
    });
});