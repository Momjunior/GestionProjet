$(function() {
  
//Current request reference; can be used else where
var request;
 
/* attach a submit handler to the form */
$(document).on('click', '.btn_rechercher_bulletin1', function(event){
 $('#divErreur').html("");
	 // abort any pending request
    if (request) {
        request.abort();
    }
  /* stop form from submitting normally */
  event.preventDefault();
  
  var id = $(this).attr('id').replace(/btnBulletin-/, '');
  
   let text = $('#idInscriptions'+id).val();
   let dataObj = {'idInscription': text};
	
	  	var form = $('#form_rechercher_bulletin'+id);

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
		       
		       $('#tableBulletin tbody').empty();
		       
		       $('#span1AnneeScolaire').html("");
		       $('#span1Nom').html("");
		       $('#span1Prenom').html("");
		       $('#span1Matricule').html("");
		       $('#span1Classe').html("");
		       $('#span1Effectif').html("");
		       $('#span2Effectif').html("");
		   /*    
		       $('#pcNoteClasse1').html("");
		       $('#pcNoteCompo1').html("");
		       $('#pcMoyenne1').html("");
		       $('#pcMoyenneGenerale1').html("");
		       $('#pcSur1').html("");
		       $('#pcRang1').html("");
		       $('#pcAppreciation1').html("");
		       
		       $('#frNoteClasse1').html("");
		       $('#frNoteCompo1').html("");
		       $('#frMoyenne1').html("");
		       $('#frMoyenneGenerale1').html("");
		       $('#frSur1').html("");
		       $('#frRang1').html("");
		       $('#frAppreciation1').html("");
		       
		       $('#angNoteClasse1').html("");
		       $('#angNoteCompo1').html("");
		       $('#angMoyenne1').html("");
		       $('#angMoyenneGenerale1').html("");
		       $('#angSur1').html("");
		       $('#angRang1').html("");
		       $('#angAppreciation1').html("");
		       
		       $('#hgNoteClasse1').html("");
		       $('#hgNoteCompo1').html("");
		       $('#hgMoyenne1').html("");
		       $('#hgMoyenneGenerale1').html("");
		       $('#hgSur1').html("");
		       $('#hgRang1').html("");
		       $('#hgAppreciation1').html("");
		       
		       $('#mathNoteClasse1').html("");
		       $('#mathNoteCompo1').html("");
		       $('#mathMoyenne1').html("");
		       $('#mathMoyenneGenerale1').html("");
		       $('#mathSur1').html("");
		       $('#mathRang1').html("");
		       $('#mathAppreciation1').html("");
		       
		       $('#svtNoteClasse1').html("");
		       $('#svtNoteCompo1').html("");
		       $('#svtMoyenne1').html("");
		       $('#svtMoyenneGenerale1').html("");
		       $('#svtSur1').html("");
		       $('#svtRang1').html("");
		       $('#svtAppreciation1').html("");
		       
		       $('#efsNoteClasse1').html("");
		       $('#efsNoteCompo1').html("");
		       $('#efsMoyenne1').html("");
		       $('#efsMoyenneGenerale1').html("");
		       $('#efsSur1').html("");
		       $('#efsRang1').html("");
		       $('#efsAppreciation1').html("");
		       
		       $('#epsNoteClasse1').html("");
		       $('#epsNoteCompo1').html("");
		       $('#epsMoyenne1').html("");
		       $('#epsMoyenneGenerale1').html("");
		       $('#epsSur1').html("");
		       $('#epsRang1').html("");
		       $('#epsAppreciation1').html("");
		       
		       $('#coefPc').html("");
		       $('#coefFr').html("");
		       $('#coefAng').html("");
		       $('#coefHG').html("");
		       $('#coefMath').html("");
		       $('#coefSvt').html("");
		       $('#coefEfs').html("");
		       $('#coefEps').html("");*/
		       $('#totalCoef').html("");
		       $('#totalCoefSur').html("");
		       $('#totalPoint').html("");
		       $('#conduite').html("");
		       $('#coefConduite').html("");
		       $('#moyenneSem1').html("");
		       $('#appreciation1').html("");
		       $('#moySemRang1').html("");
		       $('#moyenneClasse').html("");
		       $('#conduiteClasse').html("");
		       $('#plusGrand').html("");
		       $('#plusPetit').html("");
		       $('#cptSupDix').html("");
		       $('#assiduite').html("");
		       $('#conduiteBien').html("");
		       $('#conduitePassable').html("");
		       $('#conduiteMal').html("");
		       $('#conduiteAvertissement').html("");
		       $('#conduiteBlame').html("");
		       $('#tabHonInscrit').html("");
		       $('#tabHonFelicitation').html("");
		       $('#tabHonEncouragement').html("");
		       $('#tabHonNonInscrit').html("");
		       $('#profResponsable2').html("");
		       
		       $('#span1AnneeScolaire').html(data.anneeScolaire);
		       $('#span1Nom').html(data.nom);
		       $('#span1Prenom').html(data.prenom);
		       $('#span1Matricule').html(data.matricule);
		       $('#span1Classe').html(data.nomClasse);
		       $('#span1Effectif').html(data.effectif);
		       $('#span2Effectif').html(data.effectif);
		       
		       var total = 0;
		       
		        var tabloMatiere =data.listeMatiere.split("_-*-_");
		         	 for ( var i = 0; i< tabloMatiere.length-1;  i+=8 ) {
		   			  $('#tableBulletin tbody').append('<tr class="p-0" style="font-size: 0.875em;LINE-HEIGHT:10px;"><td style="font-weight:normal;">'+tabloMatiere[i]+'</td><td id="coef-'+tabloMatiere[i]+'" class="text-center">'+tabloMatiere[i+1]+'</td><td id="'+tabloMatiere[i]+'-noteClasse1" class="text-center">'+tabloMatiere[i+2]+'</td><td id="'+tabloMatiere[i]+'-noteCompo1" class="text-center">'+tabloMatiere[i+3]+'</td><td id="'+tabloMatiere[i]+'-moyenne1" class="text-center">'+tabloMatiere[i+4]+'</td><td class="text-center"><span id="'+tabloMatiere[i]+'-moyenneGenerale1" > </span> '+tabloMatiere[i+5]+' /<span id="'+tabloMatiere[i]+'-sur1" > '+tabloMatiere[i+1]*20+' </span></td><td id="'+tabloMatiere[i]+'-rang1" class="text-center">'+tabloMatiere[i+6]+'</td><td id="'+tabloMatiere[i]+'-appreciation1" class="text-center">'+tabloMatiere[i+7]+'</td></tr>');
		          	total = total + tabloMatiere[i+5]; 
		          	}
		          	total = total + data.conduite;
		        $('#tableBulletin tbody').append('<tr class="p-0" style="font-size: 0.875em; LINE-HEIGHT:10px;"><td style="font-weight:normal;">Conduite</td><td id="coefConduite" class="text-center">1</td><td class="text-center">'+data.conduite+'</td><td class="text-center"></td><td class="text-center">'+data.conduite+'</td><td class="text-center"><span id="conduite" >'+data.conduite+'</span> / 20</td><td class="text-center"></td><td class="text-center"></td></tr>');
		        $('#tableBulletin tbody').append('<tr class="p-0" style="font-size: 0.875em; LINE-HEIGHT:1px;"><td style="font-weight:normal;">Total</td><td id="totalCoef" class="text-center">'+data.totalCoef+'</td><td class="text-center" colspan="4"><span id="totalMoyenne" class="h6" style="margin-right:20px;">'+data.totalMoyenne+'</span> sur <span id="totalCoefSur" class="h6" style="margin-left:20px;">'+data.totalCoefSur+'</span></td><td class="text-center" colspan="2" rowspan="2"><span id="moySemRang1" class="h4">'+data.moySemRang1+' </span> sur <span id="span2Effectif" class="h5">'+data.effectif+'</span></td></tr>');
		        $('#tableBulletin tbody').append('<tr class="p-0" style="font-size: 0.875em; LINE-HEIGHT:1px;"><td colspan="6" style="font-weight:normal;" class="text-center">Moyenne semestre Nº1: <span id="moyenneSem1" class="h6">'+data.moyenneSem1+'</span> sur 20</td></tr>');
		        $('#tableBulletin tbody').append('<tr class="p-0" style="font-size: 0.875em; LINE-HEIGHT:1px;"><td colspan="3" style="font-weight:normal;">Moyenne semestre Nº2</td><td class="text-center">sur 20</td><td class="text-center" colspan="4" rowspan="2"><span id="appreciation1"></span></td></tr>');
		        $('#tableBulletin tbody').append('<tr class="p-0" style="font-size: 0.875em; LINE-HEIGHT:1px;"><td colspan="3" style="font-weight:normal;">Moyenne annuelle: sur 20</td><td  style="font-weight:normal;" class="text-center">sur 20</td></tr>');
		        
		        $('#moyenneClasse').html(data.moyenneClasse.toString().replace(/\./g, ','));
		        $('#conduiteClasse').html(data.conduiteClasse);
		        $('#plusGrand').html(data.plusGrand.toString().replace(/\./g, ','));
		        $('#plusPetit').html(data.plusPetit.toString().replace(/\./g, ','));
		        $('#cptSupDix').html(data.cptSupDix);
		        $('#assiduite').html(data.assiduite);
		        $('#profResponsable2').html(data.prof);

		       if(data.conduite < 4)
		       		$('#conduiteBlame').html("*");
	       		else if(data.conduite >= 4 && data.conduite < 7) 
	       			$('#conduiteAvertissement').html("*");
       			else if(data.conduite >= 7 && data.conduite < 10) 
	       			$('#conduiteMal').html("*");
       			else if(data.conduite >= 10 && data.conduite < 13) 
	       			$('#conduitePassable').html("*");
       			else $('#conduiteBien').html("*");
       		
       			if(data.tabHon == 'inscrit')
		       		$('#tabHonInscrit').html("*");
	       		else if(data.tabHon == 'felicitation') 
	       			$('#tabHonFelicitation').html("*");
       			else if(data.tabHon == 'encouragement') 
	       			$('#tabHonEncouragement').html("*");
       			else if(data.tabHon == 'nonInscrit') 
	       			$('#tabHonNonInscrit').html("*");
		  /*     
		       $('#pcNoteClasse1').html(data.pcNoteClasse1.toString().replace(/\./g, ','));
		       $('#pcNoteCompo1').html(data.pcNoteCompo1.toString().replace(/\./g, ','));
		       $('#pcMoyenne1').html(data.pcMoyenne1.toString().replace(/\./g, ','));
		       $('#pcMoyenneGenerale1').html(data.pcMoyenneGenerale1.toString().replace(/\./g, ','));
		       $('#pcSur1').html(data.pcSur1);
		       $('#pcRang1').html(data.pcRang1);
		       $('#pcAppreciation1').html(data.pcAppreciation1);
		       
		       $('#angNoteClasse1').html(data.angNoteClasse1.toString().replace(/\./g, ','));
		       $('#angNoteCompo1').html(data.angNoteCompo1.toString().replace(/\./g, ','));
		       $('#angMoyenne1').html(data.angMoyenne1.toString().replace(/\./g, ','));
		       $('#angMoyenneGenerale1').html(data.angMoyenneGenerale1.toString().replace(/\./g, ','));
		       $('#angSur1').html(data.angSur1);
		       $('#angRang1').html(data.angRang1);
		       $('#angAppreciation1').html(data.angAppreciation1);
		       
		       $('#frNoteClasse1').html(data.frNoteClasse1).toString().replace(/\./g, ',');
		       $('#frNoteCompo1').html(data.frNoteCompo1.toString().replace(/\./g, ','));
		       $('#frMoyenne1').html(data.frMoyenne1.toString().replace(/\./g, ','));
		       $('#frMoyenneGenerale1').html(data.frMoyenneGenerale1.toString().replace(/\./g, ','));
		       $('#frSur1').html(data.frSur1);
		       $('#frRang1').html(data.frRang1);
		       $('#frAppreciation1').html(data.frAppreciation1);
		       
		       $('#hgNoteClasse1').html(data.hgNoteClasse1.toString().replace(/\./g, ','));
		       $('#hgNoteCompo1').html(data.hgNoteCompo1.toString().replace(/\./g, ','));
		       $('#hgMoyenne1').html(data.hgMoyenne1.toString().replace(/\./g, ','));
		       $('#hgMoyenneGenerale1').html(data.hgMoyenneGenerale1.toString().replace(/\./g, ','));
		       $('#hgSur1').html(data.hgSur1);
		       $('#hgRang1').html(data.hgRang1);
		       $('#hgAppreciation1').html(data.hgAppreciation1);
		       
		       $('#mathNoteClasse1').html(data.mathNoteClasse1.toString().replace(/\./g, ','));
		       $('#mathNoteCompo1').html(data.mathNoteCompo1.toString().replace(/\./g, ','));
		       $('#mathMoyenne1').html(data.mathMoyenne1.toString().replace(/\./g, ','));
		       $('#mathMoyenneGenerale1').html(data.mathMoyenneGenerale1);
		       $('#mathSur1').html(data.mathSur1);
		       $('#mathRang1').html(data.mathRang1);
		       $('#mathAppreciation1').html(data.mathAppreciation1);
		       
		       $('#svtNoteClasse1').html(data.svtNoteClasse1.toString().replace(/\./g, ','));
		       $('#svtNoteCompo1').html(data.svtNoteCompo1.toString().replace(/\./g, ','));
		       $('#svtMoyenne1').html(data.svtMoyenne1.toString().replace(/\./g, ','));
		       $('#svtMoyenneGenerale1').html(data.svtMoyenneGenerale1.toString().replace(/\./g, ','));
		       $('#svtSur1').html(data.svtSur1);
		       $('#svtRang1').html(data.svtRang1);
		       $('#svtAppreciation1').html(data.svtAppreciation1);
		       
		       $('#efsNoteClasse1').html(data.efsNoteClasse1.toString().replace(/\./g, ','));
		       $('#efsNoteCompo1').html(data.efsNoteCompo1.toString().replace(/\./g, ','));
		       $('#efsMoyenne1').html(data.efsMoyenne1.toString().replace(/\./g, ','));
		       $('#efsMoyenneGenerale1').html(data.efsMoyenneGenerale1.toString().replace(/\./g, ','));
		       $('#efsSur1').html(data.efsSur1);
		       $('#efsRang1').html(data.efsRang1);
		       $('#efsAppreciation1').html(data.efsAppreciation1);
		       
		       $('#epsNoteClasse1').html(data.epsNoteClasse1.toString().replace(/\./g, ','));
		       $('#epsNoteCompo1').html(data.epsNoteCompo1.toString().replace(/\./g, ','));
		       $('#epsMoyenne1').html(data.epsMoyenne1.toString().replace(/\./g, ','));
		       $('#epsMoyenneGenerale1').html(data.epsMoyenneGenerale1.toString().replace(/\./g, ','));
		       $('#epsSur1').html(data.epsSur1);
		       $('#epsRang1').html(data.epsRang1);
		       $('#epsAppreciation1').html(data.epsAppreciation1);
		        
		       $('#coefPc').html(data.coefPc);
		       $('#coefFr').html(data.coefFr);
		       $('#coefAng').html(data.coefAng);
		       $('#coefHG').html(data.coefHG);
		       $('#coefMath').html(data.coefMath);
		       $('#coefSvt').html(data.coefSvt);
		       $('#coefEfs').html(data.coefEfs);
		       $('#coefEps').html(data.coefEps);
		       $('#totalCoef').html(data.totalCoef);
		       $('#totalCoefSur').html(data.totalCoefSur);
		       $('#totalPoint').html(data.totalPoint.toString().replace(/\./g, ','));
		       $('#conduite').html(data.conduite);
		       $('#coefConduite').html(data.coefConduite);
		       $('#moyenneSem1').html(data.moyenneSem1.toString().replace(/\./g, ','));
		       $('#appreciation1').html(data.appreciation);
		       $('#moySemRang1').html(data.moySemRang1);
		       $('#moyenneClasse').html(data.moyenneClasse.toString().replace(/\./g, ','));
		       $('#conduiteClasse').html(data.conduiteClasse);
		       $('#plusGrand').html(data.plusGrand.toString().replace(/\./g, ','));
		       $('#plusPetit').html(data.plusPetit.toString().replace(/\./g, ','));
		       $('#cptSupDix').html(data.cptSupDix);
		       $('#assiduite').html(data.assiduite);
		       $('#profResponsable2').html(data.prof);
		       console.log("data est "+data.prof);
		       if(data.conduite < 4)
		       		$('#conduiteBlame').html("*");
	       		else if(data.conduite >= 4 && data.conduite < 7) 
	       			$('#conduiteAvertissement').html("*");
       			else if(data.conduite >= 7 && data.conduite < 10) 
	       			$('#conduiteMal').html("*");
       			else if(data.conduite >= 10 && data.conduite < 13) 
	       			$('#conduitePassable').html("*");
       			else $('#conduiteBien').html("*");
       		
       			if(data.tabHon == 'inscrit')
		       		$('#tabHonInscrit').html("*");
	       		else if(data.tabHon == 'felicitation') 
	       			$('#tabHonFelicitation').html("*");
       			else if(data.tabHon == 'encouragement') 
	       			$('#tabHonEncouragement').html("*");
       			else if(data.tabHon == 'nonInscrit') 
	       			$('#tabHonNonInscrit').html("*");
		   */     	
		    $('#modalBulletin1').modal('show');
		     
		  //   alert("ok");
	        	  	          
	      },
	      error:function(jqXHR, textStatus, errorThrown){
			setTimeout(function () {
		       	$('.bd-example-modal-lg').modal('hide');
		       }, 1000);
			
				$('#divErreur').html(jqXHR.responseText);
				
				$('#modalErreur').modal('show');
				
				$(".btn-danger").click(function(event) {
	        	  $('#modalErreur').modal('hide'); 
	          });
	      }  
	  });
	  return false;
	 
});

});
