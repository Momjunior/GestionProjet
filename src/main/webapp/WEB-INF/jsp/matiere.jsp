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
    <title>School | Matière</title>
    <!-- google font -->
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet" type="text/css" />
	<!-- icons -->
    <link href="fonts/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
	<!--bootstrap -->
	<link href="assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
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
                                <div class="page-title">Accueil</div>
                            </div>
                            <ol class="breadcrumb page-breadcrumb pull-right">
                                <li><i class="fa fa-home"></i>&nbsp;<a class="parent-item" href="index.html">Accueil</a>&nbsp;<i class="fa fa-angle-right"></i>
                                </li>
                                
                                <li class="active">Matière</li>
                            </ol>
                        </div>
                    </div>
					<div class="row">
						<div class="">
							<div class="card  card-box bg-transparent">
								
								<div class="card-body ">
									<div class="row">
                                       <div class="col-md-12">
                                           <button type="button" class="btn btn-success" data-toggle="modal" data-target="#modalAjouterMatiere"><i class="fa fa-plus"></i> Ajouter une matière </button>
                                           
                                       </div>
                                   </div>
								</div>
							</div>
						</div>										
                   </div>
				   <!-- BEGIN LIST -->
				   <div class="row">
					<div class="col-md-12">
						<div class="row">
							<div class="col-sm-5">
								<div class="card  card-box">
									<div class="card-head">
										<header>Liste des matières</header>
										<div class="tools">
											<a class="fa fa-repeat btn-color box-refresh" href="javascript:;"></a>
											<a class="t-collapse btn-color fa fa-chevron-down" href="javascript:;"></a>
										</div>
									</div>
									<div class="card-body ">
										<div class="table-scrollable">
											<table class="table table-striped table-hover">
												<thead>
													<tr>
														<th hidden="true"> id </th>
														<th> # </th>
														<th> Nom </th>
														<th> Action </th>
													</tr>
												</thead>
												<tbody>
												  <c:forEach items="${matieres}" var="matiere" varStatus="boucle">
													<tr>
														<td hidden="true">${matiere.idMatiere}</td>
														<td>${boucle.count}</td>															
														<td>${matiere.nomMatiere}</td>
														<td> 															    
															<button class="btn btn-primary btn-xs btn-modifier" data-toggle="modal" data-target="#modifierMatiere">
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
					</div>
				</div>
                    <!--end .row -->
            </div>
            <!-- end page content -->
			<!-- start modal -->
            <div class="modal fade" id="modalAjouterMatiere" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title" id="exampleModalLabel">Ajout d'une matière</h4>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<form:form action="ajouterMatiere" modelAttribute="matiere" id="form_ajouter_matiere" class="form-horizontal">
						<div class="modal-body">
							<div class="card-body" id="bar-parent1">							
								<div class="form-body">									
									<div class="form-group row">
										<label class="control-label col-md-5">Nom de la matière
											<span class="required"> * </span>
										</label>
										<div class="col-md-5">
											<form:input path="nomMatiere" type="text" id="nomMatiere" name="nomMatiere" data-required="1" class="form-control" />
										 	<span class="clsNotAvailable erreur_nomMatiere" ></span>
										 </div>
									</div>																	
								</div>
								<p class="resultat text-center clsNotAvailable"></p>									
							</div>
						</div>
						<div class="modal-footer">
							<div id="load-img" >
                             	<img  src="assets/img/ajax-loader.gif">
                          	</div>
							<button type="submit" class="btn btn-primary btn_ajouter_matiere">Valider</button>
							<button type="button" class="btn btn-secondary" data-dismiss="modal">Annuler</button>
						</div>
						</form:form>
					</div>
				</div>					            
		</div>
		<!-- end modal -->

        <!-- start modal --> 
		<div class="modal fade" id="modifierMatiere" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title" id="exampleModalLabel">Modification d'une matière</h4>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="card-body" id="bar-parent1">
							<form:form action="modifierMatiere" modelAttribute="matiere" id="form_modifier_matiere"  class="form-horizontal">
								
								<input type="text" name="idMatiere" id="idMatiere" class="form-control" hidden="true"/>
								<input type="text" name="ancienMatiere" id="ancienMatiere" class="form-control" hidden="true"/>
								
								<div class="form-body">								
									<div class="form-group row">
									<label class="control-label col-md-5">Ancien nom
										<span class="required"> * </span>
									</label>
									<div class="col-md-5">
										<input type="text" id="aMatiere" name="aMatiere" data-required="1" class="form-control" disabled/> </div>
									</div>
								</div>
								
								<div class="form-group row">
									<label class="control-label col-md-5">Nouveau nom
										<span class="required"> * </span>
									</label>
									<div class="col-md-5">
										<form:input path="nomMatiere" type="text" id="nomMatiere1" name="nomMatiere" data-required="1" class="form-control" /> 
										<span class="clsNotAvailable erreur_nomMatiere1" ></span>
									</div>
								</div>
								<p class="resultat1 text-center"></p>
								<div class="modal-footer">
									<div id="load-img1" >
		                          		<img  src="assets/img/ajax-loader.gif">
		                       		</div>
		                       		<button type="submit" class="btn btn-primary btn_modifier_matiere">Valider</button>
									<button type="button" class="btn btn-secondary" data-dismiss="modal">Annuler</button>									
								</div>
							</form:form>
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
						<h3>Matière ajoutée avec succès!</h3>
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
						<h3>Matière modifiée avec succès!</h3>
						<div class="m-t-20"> 
							<button class="btn btn-success" >Ok</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		
		<div id="modalSupprimerMatiere" class="modal fade delete-modal" role="dialog">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-body text-center">
						<img src="assets/img/sent.png" alt="" width="50" height="46">
						<h3>Voulez-vous vraiment supprimer cette Matière?</h3>
						<div class="m-t-20"> <a href="#" class="btn btn-success" data-dismiss="modal">Annuler</a>
							<form:form action="supprimerMatiere" modelAttribute="matiere"  id="form_supprimer_matiere" >
								 <input id="idMatiere1" name="idMatiere1"  type="text" hidden="true" >
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
						<h3>Matière supprimée avec succès!</h3>
						<div class="m-t-20"> 
							<button class="btn btn-success suppression_ok" >Ok</button>
						</div>
					</div>
				</div>
			</div>
		</div>
				<!-- end modal -->
		
				</div>
			</div>
			
        <!-- end page container -->
				
        <!-- start footer -->
        <jsp:include page="inc/footer.jsp" />
        <!-- end footer -->
    </div>
    <!-- start js include path -->
    <script src="assets/plugins/jquery/jquery.min.js" ></script>
	<script src="assets/plugins/popper/popper.min.js" ></script>
    <script src="assets/plugins/jquery-blockui/jquery.blockui.min.js" ></script>
	<script src="assets/plugins/jquery-slimscroll/jquery.slimscroll.js"></script>
    <!-- bootstrap -->
    <script src="assets/plugins/bootstrap/js/bootstrap.min.js" ></script>
	 <!-- data tables -->
    <script src="assets/plugins/datatables/jquery.dataTables.min.js" ></script>
 	<script src="assets/plugins/datatables/plugins/bootstrap/dataTables.bootstrap4.min.js" ></script>
    <script src="assets/js/pages/table/table_data.js" ></script>
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
    
    <script src="jq_fic/ajouter_matiere.js"></script>
    <script src="jq_fic/charger_form_modif_matiere.js"></script>
  	<script src="jq_fic/modifier_matiere.js"></script>
  	<script src="jq_fic/supprimer_matiere.js"></script>
  </body>
</html>