$(document).ready(function(){

$(".btn-ajouter-coefficient").click(function(event) {
  $('.resultat2').html("");
  
 var $inputs = $("#form_ajouter_coefficient input[name^='coef']");

         // An array of just the ids...
         var liste_coefficient = [];         
         var test = true;
         var test2 = true;
         var test3 = true;
         var test4 = true;
         
         liste_coefficient = [];

         $inputs.each(function (index)
         {
             // For debugging purposes...
         //    alert(index + ': ' + $(this).attr('id'));
//alert($(this).attr('id').replace(/[^0-9]/g,''));
		//	var id= $(this).attr('id');
			var id= $(this).attr('id').replace(/[^0-9]/g,'');console.log("id est "+id);
			var coefficient = $(this).val().replace(/,/g, '.');console.log("coefficient est "+coefficient);
		//	window['varname'] = "coefficient"+id;
			
			if ($.trim(coefficient) ==='') 
			  {
				  test = false;
			  }	
			  
		 	 if(!$.isNumeric(coefficient)) 
		  		{
				  test2 = false;
				}	
				
			 if(coefficient < 0)
		  		{
		  		 test3 = false
		  		}
			  		
		      if(coefficient > 20)
		  		{
		  		 test4 = false
		  		}		
           
           if(test && test2 && test3 && test4)
           {
	         liste_coefficient.push(id+"+"+coefficient)
		   }
           
         });
         console.log(liste_coefficient.toString());
         if(test)  
            {
				if(test2)
					{
						if(test3)
							{
								if(test4)
									{
										$('[name="listeCoefficient"]').val( liste_coefficient.toString() );
										$('.resultat2').html("");
										
										// ************************* debut ajout ***************************
										
										var form = $('#form_ajouter_coefficient');
								
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
								
									          $('#modal-ajout-coefficient-reussi').modal('show'); 
									          
									          $(".btn-success").click(function(event) {
									        	  $('#modal-ajout-coefficient-reussi').modal('hide'); 
									          });	  
									          
									          setTimeout(function () {				
										       	$('#modal-ajout-coefficient-reussi').modal('hide'); 
										       	$('#modalAjouterNote').modal('hide'); 		       
										       }, 1000);
									          
									          $("#form_ajouter_coefficient")[0].reset() ;        
								     	
									      },
									      error:function(jqXHR, textStatus, errorThrown){
									    		setTimeout(function () {				
										       	$('.bd-example-modal-lg').modal('hide'); 		       
										       }, 1000);
									           $('.resultat2').html(jqXHR.responseText);
									           $('.resultat2').css('color', 'red');
									      }  
									  });
									  return false;
										
										// *************************  fin ajout  ***************************
									}
									else
									{
										$('.resultat2').html("Les coefficients doivent être <= 20!");
									}								
							}
							else
							{
								$('.resultat2').html("Les coefficients doivent être >= 0!");
							}
						
					}
				    else
				    {
					   $('.resultat2').html("Veuillez saisir des coefficients valables!!!");
					}
			}			         
			else
			{
				 $('.resultat2').html("Veuillez remplir tous les champs!!!");
			}
    });
});