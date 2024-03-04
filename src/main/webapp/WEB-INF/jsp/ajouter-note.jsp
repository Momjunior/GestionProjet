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
    <title>School | Note</title>
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
                                <div class="page-title">Recherche de notes</div>
                            </div>
                            <ol class="breadcrumb page-breadcrumb pull-right">
                                <li><i class="fa fa-home"></i>&nbsp;<a class="parent-item" href="index.html">Recherche de notes</a>&nbsp;<i class="fa fa-angle-right"></i>
                                </li>
                                
                                <li class="active">Ajout de notes</li>
                            </ol>
                        </div>
                    </div>
		
				<div class="row pl-5">
						<div  style="width:40%;">
							<div class="card  card-box  p-2 pl-5">
								
								<div class="card-body ">
									<div class="row">
                                           <form:form action="rechercherClasse" modelAttribute="classe" id="form_rechercher_classe">
											  <div class="form-row align-items-center">
											    <div class="col-auto my-1">
											      <label class="mr-sm-2" for="classe">Classe</label>
											      <select class="form-control input-height" id="classe" name="classe">
                                                        <option value="">Choisir...</option>
                                                        <c:forEach items="${classes}" var="classe" varStatus="boucle">
                                                       	 <option value="${classe.idClasse}">${classe.nomClasse}</option>
                                                        </c:forEach> 
                                                    </select>
                                                    <span class="clsNotAvailable erreur_classe" ></span>
											    </div>
											    <div class="col-auto my-1">
											      <label class="mr-sm-2" for="categorie">Catégorie</label>
											      <select class="form-control input-height" id="categorie" name="categorie">
                                                        <option value="">Choisir...</option>
                                                        <c:forEach items="${categories}" var="categorie" varStatus="boucle">
                                                       	 <option value="${categorie.idCategorieClasse}">${categorie.nomCategorie}</option>
                                                        </c:forEach> 
                                                    </select>
                                                    <span class="clsNotAvailable erreur_categorie" ></span>
											    </div>
											    <div class="col-auto my-1">
											      <button type="submit" class="btn btn-primary mt-4 ml-3 btn-rechercher-classe">Rechercher</button>
											    </div>
											  </div>
											</form:form>
                                   </div>
                                   <p><span class="clsNotAvailable resultat text-center" ></span><p/>
								</div>
							</div>
						</div>										
                   </div>
		
				   <!-- BEGIN LIST -->
                      <div class="row divHide">
                        <div class="col-md-12 col-sm-12">
                            <div class="card card-box">
                                <div class="card-head">
                                    <header>Ajout de notes</header>                                    
                                </div>
                             
                                <div class="card-body" id="bar-parent">
                                    <form:form action="ajouterNote" modelAttribute="note" id="form_ajouter_note">
                                        <div class="form-body">
                                        	<div class="form-group row">
                                                <label class="control-label col-md-3">Semestre
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-5">
                                                    <select id="semestre" name="semestre" class="form-control input-height">
                                                        <option value="">Choisir...</option>
                                                        <option value="1">1er</option>
                                                        <option value="2">2e</option>
                                                    </select>
                                                    <span class="clsNotAvailable erreur_semestre" ></span>
                                                </div>
                                            </div>
											<div class="form-group row">
                                                <label class="control-label col-md-3">Matière
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-5">
                                                    <select id="matiere" name="matiere" class="form-control input-height">
                                                    <option value="">Choisir...</option>
                                                    <c:forEach items="${matieres}" var="matiere" varStatus="boucle">                                                        
                                                        <option value="${matiere.idMatiere}">${matiere.nomMatiere}</option>
                                                      </c:forEach>
                                                    </select>
                                                    <span class="clsNotAvailable erreur_matiere" ></span>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="control-label col-md-3">Date de l'épreuve
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-5">
                                                  <table class="w-75">
											        <tbody>
											            <tr>
											                <td style="width:180px">
											                	<input name="jourEpreuve" id="jourEpreuve" class="border inputs" type="text" maxlength="2" style="width:45px; height:40px;">-
											                	<input name="moisEpreuve" id="moisEpreuve" class="border inputs" type="text" maxlength="2" style="width:45px; height:40px;" >-
											                	<input name="anneeEpreuve" id="anneeEpreuve" class="border inputs" type="text" maxlength="4" style="width:45px; height:40px;" >
										                	</td>
											            </tr>	
											        </tbody>
											      </table>
                                                  
                                            		<span class="clsNotAvailable erreur_dateEpreuve" ></span>
                                            		<input type="hidden" id="dtp_input2" value="" />
                                                </div>
                                            </div>
											<div class="form-group row">
                                                <label class="control-label col-md-3">Type de note
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-5">
                                                    <select id="typeNote" name="typeNote" class="form-control input-height">
                                                        <option value="">Choisir...</option>
                                                        <option value="interrogation">Interrogation</option>
                                                        <option value="devoir">Devoir</option>
														<option value="exposé">Exposé</option>
														<option value="composition">Composition</option>
                                                    </select>
                                                    <span class="clsNotAvailable erreur_typeNote" ></span>
                                                </div>
                                            </div>
											                                                                                       
                                           <div class="form-group">
											<label  class="col-form-label">Ajoutez les notes des élèves:</label>
										  </div>

										 <div id="divListeEleve">
												  
										 </div>
										 <input type="text" class="form-control" id="listeNote" name="listeNote" value="0" hidden="true">
										 
										 <p class="clsNotAvailable resultat10 text-center"> </p>
										  <button type="button" class="btn btn-primary btn-ajouter-note">Valider</button>
										  <button type="button" class="btn btn-secondary btn-annuler-note" data-dismiss="modal">Annuler</button>
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

			
        </div>
        <!-- end page container -->
		
		 <div id="modal-ajout-note-reussi" class="modal fade delete-modal" role="dialog">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-body text-center">					
						<img src="assets/img/success.png" alt="ll" width="50" height="46">						
						<h3>Notes ajoutées avec succès!</h3>
						<div class="m-t-20"> 
							<button class="btn btn-success" >Ok</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="modal fade bd-example-modal-lg" data-backdrop="static" data-keyboard="false" tabindex="-1">
		    <div class="modal-dialog modal-sm">
		        <div class="modal-content" style="width: 48px">
		            <span class="fa fa-spinner fa-spin fa-3x"></span>
		        </div>
		    </div>
		</div>			
        </div>
        <!-- start footer -->
        <jsp:include page="inc/footer.jsp" />
        <!-- end footer -->
    </div>
    <!-- start js include path -->
  <script src="assets/plugins/jquery/jquery.min.js" ></script>
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
            margin:       [30, 30, 30 ,30],
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
          window.open(pdf.output('bloburl'), '_blank');
        });
       
      }
  </script>
  <script>
  $(function() {
    /* attach a submit handler to the form */
    $(".btn-annuler").click(function() {
    	$("#form_ajouter_inscription")[0].reset() ; 
    });
});

 </script>
  <script>
	$(".inputs").keyup(function () {
	    if (this.value.length == this.maxLength) {
	      $(this).next('.inputs').focus();
	    }
	});
</script>
  <script src="jq_fic/ajouter_inscription.js"></script>
  <script src="jq_fic/charger_form_modif_annee.js"></script>
  <script src="jq_fic/modifier_annee.js"></script>
  <script src="jq_fic/supprimer_annee_scolaire.js"></script>
  <script src="jq_fic/rechercher_classe3.js"></script>
  <script src="jq_fic/ajouter_note.js"></script>
  </body>
</html>