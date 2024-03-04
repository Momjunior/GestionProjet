$(function() {
  
//Current request reference; can be used else where
var request;
 
/* attach a submit handler to the form */
 $(document).on('click', '.btn_rechercher_scolarite', function(event){
	
	 // abort any pending request
    if (request) {
        request.abort();
    }
  /* stop form from submitting normally */
  event.preventDefault();

			  $('#spanNom1').html("");
	          $('#spanPrenom1').html("");
	          $('#spanTel1').html("");
	          $('#spanDateNaiss1').html("");
	          $('#spanMatricule1').html("");
	          $('#spanClasse1').html("");
	          $('#spanAnneeScolaire1').html("");
	          $('#spanDateInscrip1').html("");
	          $('#spanMontant1').html("");
	          $('#table-scolarite3 tbody').empty();
	          
	          
       var id = $(this).attr('id').replace(/btnSco-/, '');

	   let text = $('#idInscription1Sco'+id).val();
	   let dataObj = {'idInscription1': text};

	  	var form = $('#form_rechercher_scolarite'+id);

	  /* Send the data using post and put the results in a div */
	  request =$.ajax({
	      url: form.attr('action'),
	      type: "post",
	      data:dataObj,
	      dataType: "json",
	      beforeSend: function() {
	        $('.bd-example-modal-lg').modal('show');
	        },
	      success: function(data, textStatus, jqXHR){
			setTimeout(function () {				
		       	$('.bd-example-modal-lg').modal('hide');		       
		       }, 1000);	
		       
		       $('#modalScolarite').modal('show');	
/*
	          $('#spanNom1').html("");
	          $('#spanPrenom1').html("");
	          $('#spanTel1').html("");
	          $('#spanDateNaiss1').html("");
	          $('#spanMatricule1').html("");
	          $('#spanClasse1').html("");
	          $('#spanAnneeScolaire1').html("");
	          $('#spanDateInscrip1').html("");
	          $('#spanMontant1').html("");
	          
		          $('#spanNom1').html(data.nom);
		          $('#spanPrenom1').html(data.prenom);
		          $('#spanDateNaiss1').html(data.dateNaiss);
		          $('#spanTel1').html(data.tel);
		          $('#spanClasse1').html(data.classe);
		          $('#spanMatricule1').html(data.matricule);
		          $('#spanAnneeScolaire1').html(data.anneeScolaire);   
		          */ 
		          
		          $('#spanNom1').html(data.nom);
		          $('#spanPrenom1').html(data.prenom); 
		          $('#spanDateNaiss1').html(data.dateNaiss);
		          $('#spanMatricule1').html(data.matricule);
		          $('#spanClasse1').html(data.classe);   
		          $('#spanDateInscrip1').html(data.date); 
		          $('#spanMontant1').html(data.montant); 
		        
		          var tabloSco =data.scolarite.split("_-*-_");
		         	 for ( var i = 0; i< tabloSco.length-1;  i++ ) {
		   			  $('#table-scolarite3 tbody').append('<tr class="p-0 text-center"><td>'+tabloSco[i]+'</td><td>'+tabloSco[i+1]+'</td><td>'+tabloSco[i+2]+'</td><td>'+tabloSco[i+3]+'</td></tr>');
		          	}
	        	 		  	          
	      },
	      error:function(jqXHR, textStatus, errorThrown){
			alert(jqXHR.responseText);
				setTimeout(function () {
		       	$('.bd-example-modal-lg').modal('hide');
		       }, 1000);		
	    /*
	       	  $('#spanNom1').html("");
	          $('#spanPrenom1').html("");
	          $('#spanTel1').html("");
	          $('#spanDateNaiss1').html("");
	          $('#spanMatricule1').html("");
	          $('#spanClasse1').html("");
	          $('#spanAnneeScolaire1').html("");
	          $('#spanDateInscrip1').html("");
	          $('#spanMontant1').html("");*/
	      }  
	  });
	  return false;
	 
});

});
