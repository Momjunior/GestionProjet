<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="fr" xmlns:th="http://www.thymeleaf.org">
<!-- BEGIN HEAD -->
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1" name="viewport" />
    <meta name="description" content="Responsive Admin Template" />
    <meta name="author" content="Sunray" />
    <title>School | Année scolaire</title>
    <!-- google font -->
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet" type="text/css" />
	<!-- icons -->
    <link href="fonts/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
	<!--bootstrap -->
	<link href="assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<!-- data tables -->
    <link href="assets/plugins/datatables/plugins/bootstrap/dataTables.bootstrap4.min.css" rel="stylesheet" type="text/css"/>
	<link rel="stylesheet" type="text/css" href="assets/css/jquery.dataTables.min.css">
    <link rel="stylesheet" type="text/css" href="assets/css/buttons.dataTables.min.css">
    <link rel="stylesheet" type="text/css" href="assets/css/jquery-ui.min.css">
    <!-- Material Design Lite CSS -->
    <!-- Material Design Lite CSS -->
	<link href="assets/plugins/material/material.min.css" rel="stylesheet" >
	<link href="assets/css/material_style.css" rel="stylesheet">
	<!-- morris chart -->
    <link href="assets/plugins/morris/morris.css" rel="stylesheet" type="text/css" />
	<!-- Theme Styles -->
    <link href="assets/css/style.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/plugins.min.css" rel="stylesheet" type="text/css" />
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
                                <div class="page-title">Année scolaire</div>
                            </div>
                            <ol class="breadcrumb page-breadcrumb pull-right">
                                <li><i class="fa fa-home"></i>&nbsp;<a class="parent-item" href="index.html">Accueil</a>&nbsp;<i class="fa fa-angle-right"></i>
                                </li>
                                
                                <li class="active">Année scolaire</li>
                            </ol>
                        </div>
                    </div>
					<div class="row">
						<div class="">
							<div class="card  card-box bg-transparent">
								
								<div class="card-body ">
									<div class="row">
                                       <div class="col-md-6">
                                           <button type="button" class="btn btn-success btn-afficher-modal-ajouter" data-toggle="modal" data-target="#ajouterAnneeScolaire"><i class="fa fa-plus"></i> Ajouter année scolaire </button>
                                       </div>
                                       <div class="col-md-6">
                                           <button type="button" class="btn btn-warning btn-afficher-modal-changer" data-toggle="modal" data-target="#modalChangerAnnee"><i class="fa fa-plus"></i> Définir année scolaire </button>
                                       </div>
                                   </div>
								</div>
							</div>
						</div>										
                    </div>
                   
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card card-box">
                                <div class="card-head">
                                    <header>Liste des années scolaires</header>
                                    <div class="tools">
                                        <a class="fa fa-repeat btn-color box-refresh" href="javascript:;"></a>
	                                    <a class="t-collapse btn-color fa fa-chevron-down" href="javascript:;"></a>
	                                    <a class="t-close btn-color fa fa-times" href="javascript:;"></a>
                                    </div>
                                </div>
                                <div class="card-body ">
                                    <table id="tableAnneeScolaire" class="display table"  style="width:100%;">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>Début</th>
                                                <th>Fin</th>
                                                <th>Statut</th>
                                                <th>Action</th>                                                
                                            </tr>
                                        </thead>
                                        <tbody>
                                       	  <c:forEach items="${annees}" var="annee" varStatus="boucle">
                                               <tr>
                                                    <td>${annee.idAnneeScolaire}</td>
                                                    <td>${annee.debut}</td>
                                                    <td>${annee.fin}</td>
                                                    <td>${annee.statut}</td>
                                                    <td> 															    
														<button class="btn btn-primary btn-modifier btn-xs" data-toggle="modal" data-target="#modifierAnneeScolaire">
															<i class="fa fa-pencil"></i>
														</button>
														<button class="btn btn-danger btn-xs btn-afficher-supprimer">
															<i class="fa fa-trash-o "></i>
														</button>  
													</td>
                                                </tr>
                                           </c:forEach> 
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                   
            </div>
            <!-- end page content -->
            <!-- start modal -->
            <div class="modal fade" id="ajouterAnneeScolaire" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
					    <div class="modal-dialog" role="document">
					        <div class="modal-content">
					            <div class="modal-header">
					                <h4 class="modal-title" id="exampleModalLabel">Ajout d'une année scolaire</h4>
					                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					                    <span aria-hidden="true">&times;</span>
					                </button>
					            </div>
                                <form:form action="ajouterAnneeScolaire" modelAttribute="annee-scolaire" id="form_ajouter_annee_scolaire"> 
					            <div class="modal-body">
					                <div class="card-body" id="bar-parent1">
                                    
                                        <div class="form-body">                                            
                                            <div class="form-group row">
                                                <label class="control-label col-md-5">Année début
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-5">
                                                    <form:input path="debut" type="text" id="debut" name="debut" data-required="1" class="form-control" /> 
                                                 	<span class="clsNotAvailable erreur_debut" ></span>
                                                </div>                                                                                              
                                            </div>
                                            </div>
											
											<div class="form-group row">
                                                <label class="control-label col-md-5">Année fin
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-5">
                                                    <form:input path="fin" type="text" id="fin" name="fin" data-required="1" class="form-control" />
                                               		<span class="clsNotAvailable erreur_fin" ></span>
                                                </div>
                                            </div>
                                            <p class="resultat text-center"> </p>
                                </div>
                                </div>
                                <div class="modal-footer">
	                                <div id="load-img" >
		                             	<img  src="assets/img/ajax-loader.gif">
		                          	</div>
                                	<button type="submit" class="btn btn-primary btn_ajouter_annee_scolaire">Valider</button>                                
					                <button type="button" class="btn btn-secondary" data-dismiss="modal">Annuler</button>
					            </div>					             
                                </form:form>
                            </div>
                            
                        </div>					            
                </div>
                <!-- end modal -->
            </div>
        </div>
            <!-- end chat sidebar -->
			
			<div class="modal fade" id="modifierAnneeScolaire" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
					    <div class="modal-dialog" role="document">
					        <div class="modal-content">
					            <div class="modal-header">
					                <h4 class="modal-title" id="exampleModalLabel">Modification d'une année scolaire</h4>
					                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					                    <span aria-hidden="true">&times;</span>
					                </button>
					            </div>
					            <div class="modal-body">
					                <div class="card-body" id="bar-parent1">
                                    <form:form  action="modifierAnneeScolaire" modelAttribute="annee-scolaire" id="form_modifier_annee_scolaire" class="form-horizontal">
                                        
                                        <input type="text" name="idAnneeScolaire" id="idAnneeScolaire" class="form-control" hidden="true"/>
                                        <input type="text" name="ancienDebut" id="ancienDebut" class="form-control" hidden="true"/>
                                        <input type="text" name="ancienFin" id="ancienFin" class="form-control" hidden="true"/>
                                        <div class="form-body">
                                            
                                            <div class="form-group row">
                                                <label class="control-label col-md-5">Année début
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-5">
                                                    <form:input path="debut" type="text" id="debut1" name="debut" data-required="1" class="form-control" /> 
                                                    <span class="clsNotAvailable erreur_debut1" ></span>
                                                </div>
                                                </div>
                                            </div>
											
											<div class="form-group row">
                                                <label class="control-label col-md-5">Année fin
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-5">
                                                    <form:input path="fin" type="text" id="fin1" name="fin" data-required="1" class="form-control" />
                                                    <span class="clsNotAvailable erreur_fin1" ></span>
                                                </div>
                                                </div>
                                                <p class="resultat1 text-center"> </p>
                                                <div class="modal-footer">
                                                	<div id="load-img1" >
						                             <img  src="assets/img/ajax-loader.gif">
						                             </div>
                                                    <button type="submit" class="btn btn-primary btn_modifier_annee">Valider</button>
                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Annuler</button>                                                    
                                                </div>
                                            </form:form>
                                            </div>
                                        </div>  
                               		 </div>
					            </div>
					            
					        </div>
					    </div>
				
			
        <div id="modal-ajout-reussi" class="modal fade delete-modal" role="dialog">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-body text-center">					
						<img src="assets/img/success.png" alt="ll" width="50" height="46">						
						<h3>Année ajoutée avec succès!</h3>
						<div class="m-t-20"> 
							<button class="btn btn-success" >Ok</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		  <div id="modal-changement-reussi" class="modal fade delete-modal" role="dialog">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-body text-center">					
						<img src="assets/img/success.png" alt="ll" width="50" height="46">						
						<h3>Année changée avec succès!</h3>
						<div class="m-t-20"> 
							<button class="btn btn-success" >Ok</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div id="modal-modif-reussi" class="modal fade delete-modal" role="dialog">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-body text-center">					
						<img src="assets/img/success.png" alt="ll" width="50" height="46">						
						<h3>Année modifiée avec succès!</h3>
						<div class="m-t-20"> 
							<button class="btn btn-success" >Ok</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div id="modalSupprimerAnneeScolaire" class="modal fade delete-modal" role="dialog">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-body text-center">
						<img src="assets/img/sent.png" alt="" width="50" height="46">
						<h3>Voulez-vous vraiment supprimer cette année?</h3>
						<div class="m-t-20"> <a href="#" class="btn btn-success  mb-2" data-dismiss="modal">Annuler</a>
							<form:form action="supprimerAnneeScolaire" modelAttribute="annee-scolaire"  id="form_supprimer_annee_scolaire" >
								 <input id="idAnneeScolaire1" name="idAnneeScolaire1"  type="text" hidden="true" >
								<button type="submit" class="btn btn-danger btn-valider-suppression">Confirmer</button>
							</form:form>
						</div>
						 <div id="load-img2" >
	                           <img  src="assets/img/ajax-loader.gif">
	                        </div>
					</div>
				</div>
			</div>
		</div>
		
		
		 <div id="modal-suppression-reussi" class="modal fade delete-modal" role="dialog">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-body text-center">					
						<img src="assets/img/success.png" alt="ll" width="50" height="46">						
						<h3>Année supprimée avec succès!</h3>
						<div class="m-t-20"> 
							<button class="btn btn-success suppression_ok" >Ok</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		
        <!-- end page container -->
		<div class="modal fade" id="modalChangerAnnee" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="exampleModalLabel">Changement d'année scolaire</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="card-body" id="bar-parent1">
                           <form:form action="changerAnneeScolaire" modelAttribute="annee-scolaire" id="form_changer_annee_scolaire"> 
					            <div class="modal-body">
					                <div class="card-body" id="bar-parent1">
                                    
                                        <div class="form-body">                                            
                                            <div class="form-group row">
                                                <label class="control-label col-md-5">Année début
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-5">
                                                    <input type="text" id="debut2" name="debut2" data-required="1" class="form-control" /> 
                                                 	<span class="clsNotAvailable erreur_debut2" ></span>
                                                </div>                                                                                              
                                            </div>
                                            </div>
											
											<div class="form-group row">
                                                <label class="control-label col-md-5">Année fin
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-5">
                                                    <input type="text" id="fin2" name="fin2" data-required="1" class="form-control" />
                                               		<span class="clsNotAvailable erreur_fin2" ></span>
                                                </div>
                                            </div>
                                            <p class="resultat2 text-center"> </p>
                                </div>
                                </div>
                                <div class="modal-footer">
	                                <div id="load-img" >
		                             	<img  src="assets/img/ajax-loader.gif">
		                          	</div>
                                	<button type="submit" class="btn btn-primary btn_changer_annee_scolaire">Valider</button>                                
					                <button type="button" class="btn btn-secondary" data-dismiss="modal">Annuler</button>
					            </div>					             
                                </form:form>
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
		
        <!-- start footer -->
        	<jsp:include page="inc/footer.jsp" />
        <!-- end footer -->
  
   
    <!-- start js include path -->
   <script src="assets/plugins/jquery/jquery.min.js" ></script>
	<script src="assets/plugins/popper/popper.min.js" ></script>
    <script src="assets/plugins/jquery-blockui/jquery.blockui.min.js" ></script>
	<script src="assets/plugins/jquery-slimscroll/jquery.slimscroll.js"></script>
	<script src="assets/plugins/jquery-validation/js/jquery.validate.min.js" ></script>
    <script src="assets/plugins/jquery-validation/js/additional-methods.min.js" ></script>
    <!-- bootstrap -->
    <script src="assets/plugins/bootstrap/js/bootstrap.min.js" ></script>
    <!-- data tables -->
    <script src="assets/plugins/datatables/jquery.dataTables.min.js" ></script>
	<script src="assets/plugins/datatables/dataTables.buttons.min.js"></script> 
 	<script src="assets/plugins/datatables/plugins/bootstrap/dataTables.bootstrap4.min.js" ></script>
    <script src="assets/js/pages/table/table_data.js" ></script>
	<script src="assets/plugins/datatables/editabletable.js" ></script>
    <script src="assets/js/pages/table/editable_table_data.js" ></script>
    <!-- counterup -->
    <script src="assets/plugins/counterup/jquery.waypoints.min.js" ></script>
    <script src="assets/plugins/counterup/jquery.counterup.min.js" ></script>
    <!-- Common js-->
	<script src="assets/js/app.js" ></script>
    <script src="assets/js/layout.js" ></script>
    <script src="assets/js/theme-color.js" ></script>
    <!-- material -->
    <script src="assets/plugins/material/material.min.js"></script>
   
    <!-- end js include path -->
    <script> 
	$(document).ready(function(){
		$(".btn-afficher-modal-ajouter").click(function(event) {
			$('#debut').css('border-color', '');
		    $('#fin').css('border-color', '');
		    
		    $('.erreur_debut').html("");
		    $('.erreur_fin').html("");
		    $('.resultat').html("");
	    });
	});
	</script> 
	<script> 
	$(document).ready(function(){
		$(".btn-afficher-modal-changer").click(function(event) {
			$('#debut2').css('border-color', '');
		    $('#fin2').css('border-color', '');
		    
		    $("#debut2").val("");
		    $("#fin2").val("");
		    
		    $('.erreur_debut2').html("");
		    $('.erreur_fin2').html("");
		    $('.resultat2').html("");
	    });
	});
	</script> 
   <script>
	  $(document).ready(function() {
	 
		    // DataTable
		    var table = $('#tableAnneeScolaire').DataTable({
		    	"language": {
	        		"url": "French.json"
	            }	
		    });	 
		} );
  </script>
  <script src="jq_fic/ajouter_annee_scolaire.js"></script>
  <script src="jq_fic/changer_annee_scolaire.js"></script>
  <script src="jq_fic/charger_form_modif_annee.js"></script>
  <script src="jq_fic/modifier_annee.js"></script>
  <script src="jq_fic/supprimer_annee_scolaire.js"></script>
  </body>
</html>