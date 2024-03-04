$(function() {
  
//Current request reference; can be used else where
var request;
 
/* attach a submit handler to the form */
$(".btn_rechercher_details_eleve").click(function(event) {

    // abort any pending request
    if (request) {
        request.abort();
    }
  /* stop form from submitting normally */
  event.preventDefault();
  
  var annee  = $("#as").html();
  $('#anneeScolaire').val("");
  $('#anneeScolaire').val(annee); 

  
  if ((annee === ''))
     {     
	alert("l'année scolaire n'est pas precisée")    
	  return false;
     }
  else
	  {

	  	var form = $('#form_rechercher_details_eleve');

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
		         
		      $('#spanDateInscrip').html("");
	          $('#spanVersement').html("");
	          $('#spanNom').html("");
	          $('#spanPrenom').html("");
	          $('#spanTel').html("");
	          $('#spanSexe').html("");
	          $('#spanDateNaiss').html("");
	          $('#spanMatricule').html("");
	          $('#spanClasse').html("");
		       var result = data.split("(**)");
		       
		       for ( var i = 0; i< result.length;  i+=9 ) {
				  $('#spanDateInscrip').html(result[i]);
		          $('#spanVersement').html(result[i+1]);
		          $('#spanNom').html(result[i+2]);
		          $('#spanPrenom').html(result[i+3]);
		          $('#spanSexe').html(result[i+4]);
		          $('#spanDateNaiss').html(result[i+5]);
		          $('#spanTel').html(result[i+6]);
		          $('#spanMatricule').html(result[i+7]);
		          $('#spanClasse').html(result[i+8]);
				}
				
				var annee  = $("#as").html();
				$('#spanAnneeScolaire').html(annee);
	          
	          	$('#modalDetails').modal('show'); 
		    },
	      error:function(jqXHR, textStatus, errorThrown){
	    	  setTimeout(function () {
		       	$('.bd-example-modal-lg').modal('hide');
	           $('.resultat').html(jqXHR.responseText);
	           $('.resultat').css('color', 'red');
		       }, 1000);
	      }  
	  });
	  return false;
	  }
});

});

function modal(){
       $('.bd-example-modal-lg').modal('show');
       setTimeout(function () {
       	console.log('hejsan');
       	$('.bd-example-modal-lg').modal('hide');
       }, 3000);
    }
