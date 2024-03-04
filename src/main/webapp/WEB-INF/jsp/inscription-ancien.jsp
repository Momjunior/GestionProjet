<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="fr">
<!-- BEGIN HEAD -->
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1" name="viewport" />
    <meta name="description" content="Responsive Admin Template" />
    <meta name="author" content="Sunray" />
    <title>School | Inscription</title>
    <!-- google font -->
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet" type="text/css" />
	<!-- icons -->
    <link href="fonts/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
	<!--bootstrap -->
	<link href="assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/plugins/bootstrap-datepicker/css/bootstrap-datepicker3.min.css" rel="stylesheet" type="text/css" />
	    <!-- data tables -->
    <link href="assets/plugins/datatables/plugins/bootstrap/dataTables.bootstrap4.min.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" type="text/css" href="assets/css/jquery-ui.min.css">
    <!-- Material Design Lite CSS -->
	<link href="assets/plugins/material/material.min.css" rel="stylesheet" >
	<link href="assets/css/material_style.css" rel="stylesheet">

	<!-- Theme Styles -->
    <link href="assets/css/style.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/plugins.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/pages/formlayout.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/responsive.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/theme-color.css" rel="stylesheet" type="text/css" />
	<!-- favicon -->
    <link rel="shortcut icon" href="assets/img/favicon.png" /> 
 </head>
 <!-- END HEAD -->
<body class="page-header-fixed sidemenu-closed-hidelogo page-content-white page-md header-white dark-color logo-dark">
    <div class="page-wrapper">
        <!-- start header -->
			<jsp:include page="inc/header.jsp" />
        <!-- end header -->
        <!-- start page container -->
        <div class="page-container">
 			<!-- start sidebar menu -->
 				<jsp:include page="inc/sidebar.jsp" />
			 <!-- end sidebar menu -->
			<!-- start page content -->
            <div class="page-content-wrapper">
                <div class="page-content">
                    <div class="page-bar">
                        <div class="page-title-breadcrumb">
                            <div class=" pull-left">
                                <div class="page-title">Accueil</div>
                            </div>
                            <ol class="breadcrumb page-breadcrumb pull-right">
                                <li><i class="fa fa-home"></i>&nbsp;<a class="parent-item" href="index.html">Accueil</a>&nbsp;<i class="fa fa-angle-right"></i>
                                </li>
                                
                                <li class="active">Inscription</li>
                            </ol>
                        </div>
                    </div>
		
				   <!-- BEGIN LIST -->
                    <div class="row">
                       <div class="col-md-12">
                             <!-- BEGIN PROFILE SIDEBAR -->                            
                                <div class="card card-topline-aqua">
                                    <div class="card-body no-padding height-9">
                                    <form:form action="rechercherEleve" modelAttribute="eleve" id="form_rechercher_eleve">													
												 <input type="text" id="anneeScolaire" name="anneeScolaire"  value="0" hidden="true"/>	
												 <div class="form-group">
													<form:input path="matricule" id="matricule" name="matricule" type="text" placeholder="Entrez le matricule" value=""/>
													<button type="submit" class="btn btn-primary btn_rechercher_eleve">Rechercher</button>
												</div>	
												<span class="clsNotAvailable erreur_matricule" ></span>
												
												<p class="resultat text-center"></p>
											</form:form>
                                    <!--   
                                       <label>Chercher par:</label>
                                       <select id="myselection">
											<option>Choisir</option>
											<option value="One">Matricule</option>
											<option value="Two">Nom et Prénom</option>
										</select>
										<div id="showOne" class="myDiv">
										
										</div>
										<div id="showTwo" class="myDiv">
											<form:form action="rechercherEleve" modelAttribute="rechercher-eleve" id="form_rechercher_eleve">													
												 <input type="text" id="anneeScolaire" name="anneeScolaire"  value="0" hidden="true"/>	
												 <div class="form-group">
													<input id="nomPrenom" name="nomPrenom" type="text" placeholder="Entrez le nom et Prénom" />
													<button type="submit" class="btn btn-primary btn_rechercher_eleve">Rechercher</button>
												</div>	
												<span class="clsNotAvailable erreur_nomPrenom" ></span>
												
												<p class="resultat text-center"></p>
											</form:form>
										</div>
									-->
										</div>
                                        <!-- END SIDEBAR BUTTONS -->
                                    </div>                              
                            </div>
                        <div class="col-md-12 col-sm-12 divHide">
                            <div class="card card-box">
                                <div class="card-head">
                                    <header>Inscription</header>                                    
                                </div>
                                <div class="card-body" id="bar-parent">
                                    <form:form action="ajouterInscription" modelAttribute="eleve" id="form_ajouter_inscription">
                                        
                                        <input type="text" id="dateInscrip" name="dateInscrip" value="0" hidden="true"/>
                                        <input type="text" id="idEleve" name="idEleve" value="0" hidden="true"/>
                                        <input type="text" id="matri" name="matri" value="0" hidden="true"/>
                                        
                                        <div class="form-body">
                                        	<div class="form-group row">
                                                <label class="control-label col-md-3">Nom 
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-5">
                                                    <form:input path="nom" type="text" id="nom" name="nom" placeholder="Entrez le nom" class="form-control input-height" disabled="true"/> 
                                               	    <span class="clsNotAvailable erreur_nom" ></span>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="control-label col-md-3">Prénom
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-5">
                                                    <form:input path="prenom" type="text" id="prenom" name="prenom" data-required="1" placeholder="Entrez le prénom" class="form-control input-height" disabled="true"/> 
                                                    <span class="clsNotAvailable erreur_prenom" ></span>
                                                </div>
                                            </div>
											<div class="form-group row">
                                                <label class="control-label col-md-3">Sexe
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-5">
                                                    <form:select path="sexe" class="form-control input-height" id="sexe" name="sexe" disabled="true">
		                                                <form:option value="" label="Choisir..."/>
		                                                <form:option value="Masculin" label="Masculin"/>
		                                                <form:option value="Féminin" label="Féminin"/>
		                                            </form:select>
		                                            <span class="clsNotAvailable erreur_sexe" ></span>
                                                </div>
                                            </div>
											<div class="form-group row">
                                                <label class="control-label col-md-3">Date de naissance
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-5">
                                                    <table class="w-75">
												        <tbody>
												            <tr>
												                <td style="width:180px">
												                	<input name="jourNaiss" id="jourNaiss" class="border inputs" type="text" maxlength="2" style="width:45px; height:40px;">-
												                	<input name="moisNaiss" id="moisNaiss" class="border inputs" type="text" maxlength="2" style="width:45px; height:40px;" >-
												                	<input name="anneeNaiss" id="anneeNaiss" class="border inputs" type="text" maxlength="4" style="width:45px; height:40px;" ></td>
												            </tr>	
												        </tbody>
												      </table>		                                                  
                                            		<span class="clsNotAvailable erreur_dateNaiss" ></span>
                                            		<input type="hidden" id="dtp_input2" value="" />
                                                </div>
                                            </div>
                                           <div class="form-group row">
                                                <label class="control-label col-md-3">Téléphone
                                                </label>
                                                <div class="col-md-5">
                                                    <form:input path="tel" id="tel" name="tel" type="text" data-required="1" placeholder="Entrez le numéro" class="form-control input-height" />
                                                    <span class="clsNotAvailable erreur_tel" ></span>
                                                 </div>
                                            </div>
                                            
                                            <div class="form-group row">
                                                <label class="control-label col-md-3">Classe
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-5">
                                                    <select class="form-control input-height" id="classe" name="classe">
                                                        <option value="">Choisir...</option>
                                                        <c:forEach items="${classes}" var="classe" varStatus="boucle">
                                                       	 <option value="${classe.nomClasse} ">${classe.nomClasse} </option>
                                                        </c:forEach> 
                                                    </select>
                                                    <span class="clsNotAvailable erreur_classe" ></span>
                                                </div>
                                            </div>	
                                            <div class="form-group row">
                                                <label class="control-label col-md-3">Catégorie
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-5">
                                                    <select class="form-control input-height" id="categorie" name="categorie">
                                                        <option value="">Choisir...</option>
                                                        <c:forEach items="${categories}" var="categorie" varStatus="boucle">
                                                       	 <option value="${categorie.nomCategorie} ">${categorie.nomCategorie} </option>
                                                        </c:forEach> 
                                                    </select>
                                                    <span class="clsNotAvailable erreur_categorie" ></span>
                                                </div>
                                            </div>											
											<div class="form-group row">
                                                <label class="control-label col-md-3">Versement
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-5">
                                                    <input type="text" id="versement" name="versement" data-required="1" placeholder="Entrez le montant versé" class="form-control input-height" />
                                                    <span class="clsNotAvailable erreur_versement" ></span>
                                                </div>
                                            </div>
                                            <p class="resultat1 text-center"></p>
                                            <div class="row">
                                                <div class="offset-md-3 col-md-9">
	                                                <div id="load-img" >
							                          	<img  src="assets/img/ajax-loader.gif">
							                       	</div>
                                                    <button type="submit" class="btn btn-info btn_ajouter_inscription">Valider</button>
                                                    <button type="button" class="btn btn-default btn-annuler">Annuler</button>
                                                </div>
                                            	</div>
                                           
										</div>
                                    </form:form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--end .row -->
            </div>
            <!-- end page content -->
            			
            <div id="modal-ajout-reussi" class="modal fade delete-modal" role="dialog">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-body text-center">					
						<img src="assets/img/success.png" alt="ll" width="50" height="46">						
						<h3>Elève inscrit avec succès!</h3>
						<div class="m-t-20"> 
							<button class="btn btn-success" >Ok</button>
						</div>
					</div>
				</div>
			</div>
		</div>

			<!-- Modal afficher scolarité -->	
			<div class="modal fade" id="modalRecu" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
                <div class="modal-dialog modal-lg modal-full-height modal-bottom " role="document">
                  <div class="modal-content">
                    <div class="modal-header">
                       <div class="container">    
                           <div class="row">
                              <div class="col-11">
                              <nav class="navbar navbar-light">
                              <button onclick="generateRecu()" class=" float-right btn bg-info btn-rounded"><i class="fa fa-print"></i> Imprimer</button>
                                                                
                              </nav>								
                                  
                              </div>
                              <div class="col-1"><span class="float-right"><span class="float-right"><button type="button" class="close " data-dismiss="modal">&times;</button></span></span></div>
                          </div>		   
                      </div>
                    </div>
                    <div class="modal-body" id="recu">
                       <div class="container">
                          <div class="col-md-12">
                              <!-- Add content here -->
                                  <div class="row" style="background-color: #b0b0b0;">
                                     
                                      <div class="col-lg-12">
                                          <div class=" text-center p-2">
                                              <p class="m-0"  style="line-height: 11px;">REPUBLIQUE DU NIGER</p>
                                              <p class="m-0"  style="line-height: 11px;">----------</p>
                                              <p class="m-0"  style="line-height: 11px;"><small>Fraternité-Travail-Progrès</small></p>
                                              
                                          </div>
                                      </div>
                                  </div>
                                  <div class="row mb-0 monBorder mt-2">                                   
                                      <div class="col-lg-12 border-0">
                                          <div class=" p-1 ">
                                              <div class="panel-body text-center pt-0 pb-0 h5">COLLEGE PRIVE ANNOUR</div>
                                              <div class="row">
                                                <div class="col-lg-4 text-center pl-4 m-0">
                                                    <p class="m-0"  style="line-height: 11px; font-size:10px;"><span>B.P 13 407 Niamey - Niger</span></p>
                                                    <p class="m-0"  style="line-height: 11px; font-size:10px;"><span>Tél: (+227) 20 77 77 77 Fax 20 77 77 77 </span></p>
                                                    <p class="m-0"  style="line-height: 11px; font-size:10px;"><span>Ã  Poudrière, rue du ceg 7 </span></p>
                                                    <p class="m-0"  style="line-height: 11px; font-size:10px;"><span>email: school@gmail.com </span></p>
                                                </div>
                                                 <div class="col-lg-4 text-center" >
                                                     <img alt="ll" src="assets/img/logo1.png"  width="72" height="72" > 
                                                  </div>
                                                  
                                                  <div class="col-lg-4  text-left">
                                                    <p class="m-0"  style="line-height: 12px;">Année académique</p>
                                                    <p class="ml-5"  style="line-height: 12px;"><span class="h6">${anneeScolaire}</span></p>
                                                  </div>
                                              </div>																						
                                          </div>										
                                      </div>
                                  </div>
                                  
                                  <div class="row mt-2">
                                      <div class="col-lg-4">
                                          
                                      </div>
                                      <div class="col-lg-4">
                                          <div class="panel border-secondary">
                                              <div class="panel-body text-center h5 p-0">DETAILS INSCRIPTION</div>
                                          </div>
                                      </div>
                                      <div class="col-lg-4">
                                          
                                      </div>
                                  </div>
                                  <div class="row p-4 border-0  border-secondary mt-0">                                   
                                      
                                      <table class="table table-bordered mytable" id="table-scolarite2" >
                                                 <thead class="p-0" style="background-color: #b0b0b0;">
                                                      
                                                  </thead>
                                                  <tbody>
                                                  <!----- 1ere ligne ------------------>
                                                    
                                                    <tr class="p-0">                                                          
                                                        <td class="p-0 text-center w-25 ">Date d'inscription:</td>
                                                        <td><span id="spanDateInscrip" class="h6"></span></td>
                                                    </tr>
                                                    <tr class="p-0">                                                          
                                                        <td class="p-0 text-center w-25 ">Montant versé</td>
                                                        <td><span id="spanVersement" class="h6"></span></td>
                                                    </tr>
                                                    <tr class="p-0">                                                          
                                                        <td class="p-0 text-center w-25 ">Nom</td>
                                                        <td><span id="spanNom" class="h6"></span></td>
                                                    </tr>
                                                    <tr class="p-0">                                                          
                                                        <td class="p-0 text-center w-25 ">Prénom</td>
                                                        <td><span id="spanPrenom" class="h6"></span></td>
                                                    </tr>
                                                    <tr class="p-0">                                                          
                                                        <td class="p-0 text-center w-25 ">Téléphone</td>
                                                        <td><span id="spanTel" class="h6"></span></td>
                                                    </tr>
                                                    <tr class="p-0">                                                          
                                                        <td class="p-0 text-center w-25 ">NE (E) le</td>
                                                        <td><span id="spanDateNaiss" class="h6"></span></td>
                                                    </tr>
                                                    <tr class="p-0">                                                          
                                                        <td class="p-0 text-center w-25 ">Matricule</td>
                                                        <td><span id="spanMatricule" class="h6"></span></td>
                                                    </tr>
                                                    <tr class="p-0">                                                          
                                                        <td class="p-0 text-center w-25 ">Classe</td>
                                                        <td><span id="spanClasse" class="h6"></span><span id="spanCategorie" class="h6"></span></td>
                                                    </tr>                                                                                                  
                                                  </tbody>
                                      </table>
                                  </div>                                  
                          </div>
                      </div>
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-default" data-dismiss="modal">Fermer</button>
                    </div>
                  </div>
                </div>
              </div>
              <!-- end scolarité -->
			
        </div>
        <!-- end page container -->
		
		<div class="modal fade bd-example-modal-lg" data-backdrop="static" data-keyboard="false" tabindex="-1">
		    <div class="modal-dialog modal-sm">
		        <div class="modal-content" style="width: 48px">
		            <span class="fa fa-spinner fa-spin fa-3x"></span>
		        </div>
		    </div>
		</div>	
		
		 <table id="tabloMatricule" >
           <tbody>          
               <tr>
                <c:forEach items="${inscriptions}" var="matricule" varStatus="boucle">
                   <td>${matricule.eleve.matricule}</td>  
                    </c:forEach>   
               </tr>              
           </tbody>
       </table>
					
        </div>
        <!-- start footer -->
        <jsp:include page="inc/footer.jsp" />
        <!-- end footer -->
    </div>
    <!-- start js include path -->
    <script src="assets/plugins/jquery/jquery.min.js" ></script>
    <script src="assets/js/jquery-ui.min.js"></script> 
	<script src="assets/plugins/popper/popper.min.js" ></script>
    <script src="assets/plugins/jquery-blockui/jquery.blockui.min.js" ></script>
    <script src="assets/plugins/jquery-validation/js/jquery.validate.min.js" ></script>
    <script src="assets/plugins/jquery-validation/js/additional-methods.min.js" ></script>
    <script src="assets/plugins/jquery-slimscroll/jquery.slimscroll.js"></script>
    <!-- bootstrap -->
    <script src="assets/plugins/bootstrap/js/bootstrap.min.js" ></script>
    <script src="assets/plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>
    <script src="assets/plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker-init.js"></script>
    <!-- Common js-->
	<script src="assets/js/app.js" ></script>
    <script src="assets/js/layout.js" ></script>
	<script src="assets/js/theme-color.js" ></script>
	<!-- Material -->
	<script src="assets/plugins/material/material.min.js"></script>
     <!-- end js include path -->
        <script type="text/javascript" src="assets/js/html2pdf.bundle.min.js"></script>

    <!-- end js include path -->
	   <script>
      function generateRecu() {
        // Choose the element that our invoice is rendered in.
        var element = document.getElementById('recu');
        html2pdf()
        .from(element)
        .set({
            margin:       [20, 20, 0 ,20],
            filename:     'recu.pdf',
            image:        { type: 'jpeg',quality: 1 },
            html2canvas:  { scale: 2  },
            jsPDF:        { unit: 'pt', format: 'letter', orientation: 'portrait' }
        })
        .toPdf()
        .get('pdf').then(function (pdf) {
          var totalPages = pdf.internal.getNumberOfPages();
          
          for (let i = 1; i <= totalPages; i++) {
            pdf.setPage(i);
            pdf.setFontSize(10);
            pdf.setTextColor(150);
          //entÃªte  pdf.text("my header text", 10, 10);
          } 
        }).save();
       
      }
  </script>
   <script>
	     $(function(){	    	 
	    	 var tableMatricule = [];
	
	    	 $("#tabloMatricule tr").each(function() {
	    	     var arrayOfThisRow = [];
	    	     var tableData = $(this).find('td');
	    	     if (tableData.length > 0) {
	    	         tableData.each(function() { arrayOfThisRow.push($(this).text()); });
	    	         tableMatricule.push(arrayOfThisRow);
	    	     }
	    	 });
	    	 
	    	 var uniq = tableMatricule[0].reduce(function(a,b){
	    		    if (a.indexOf(b) < 0 ) a.push(b);
	    		    return a;
	    		  },[]);
	    	 
	    	 $('#matricule').autocomplete({ 
	    		    maxResults: 10,
	    		    source: function(request, response) {
	    		        var results = $.ui.autocomplete.filter(uniq, request.term);
	    		        
	    		        response(results.slice(0, this.options.maxResults));
	    		    }
	    		});
	    
	     });
 	 </script>
  <script>
  $(function() {
    /* attach a submit handler to the form */
    $(".btn-annuler").click(function() {
    	$("#form_ajouter_inscription")[0].reset() ; 
    });
});

 </script>
  <script src="jq_fic/rechercher_eleve1.js"></script>
  <script src="jq_fic/ajouter_inscription.js"></script>
  <script src="jq_fic/charger_form_modif_annee.js"></script>
  <script src="jq_fic/modifier_annee.js"></script>
  <script src="jq_fic/supprimer_annee_scolaire.js"></script>
  </body>
</html>