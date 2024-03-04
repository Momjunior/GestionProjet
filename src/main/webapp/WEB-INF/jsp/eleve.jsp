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
    <title>School | Elève</title>
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
                               <!--  <div class="page-title">Rechercher un élève</div>--> 
                            </div>
                            <ol class="breadcrumb page-breadcrumb pull-right">
                                <li><i class="fa fa-home"></i>&nbsp;<a class="parent-item" href="index.html">Accueil</a>&nbsp;<i class="fa fa-angle-right"></i>
                                </li>                                
                                <li class="active">Elève</li>
                            </ol>
                        </div>
                    </div>	
    
	
					 <div class="row">
                        <div class="col-md-12">
                            <!-- BEGIN PROFILE SIDEBAR -->                            
                                <div class="card card-topline-aqua">
                                    <div class="card-body no-padding height-9">
                                    <span>${prenom} ${nom}</span>
                                   <!--  <form:form action="rechercherEleve" modelAttribute="eleve" id="form_rechercher_eleve">													
												 <input type="text" id="anneeScolaire" name="anneeScolaire"  value="0" hidden="true"/>	
												 <div class="form-group">
													<form:input path="matricule" id="matricule" name="matricule" type="text" placeholder="Entrez le matricule" value="CE01"/>
													<button type="submit" class="btn btn-primary btn_rechercher_eleve">Rechercher</button>
												</div>	
												<span class="clsNotAvailable erreur_matricule" ></span>
												
												<p class="resultat text-center"></p>
											</form:form>
                                      
                                       <label>Chercher par:</label>
                                       <select id="myselection">
											<option>Choisir</option>
											<option value="One">Matricule</option>
											<option value="Two">Nom et Prénom</option>
										</select>
										<div id="showOne" class="myDiv">
										
										</div>
										<div id="showTwo" class="myDiv">
											<form:form action="rechercherEleve" modelAttribute="eleve" id="form_rechercher_eleve">													
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
                            <!-- END BEGIN PROFILE SIDEBAR -->
                            <!-- BEGIN PROFILE CONTENT -->

					
					<div class="row bg-info">					
					</div>                                
					<!-- END PROFILE CONTENT -->
				</div>
				
				<div class="row">
						<div class="col-md-12 col-sm-12">
							<div class="card  card-box">
								<div class="card-head">
									<div class="card-body ">
										<div class="btn-group mr-3">
											<button type="button" class="btn btn-default btn_charger_form_modifier_eleve" data-toggle="modal" data-target="#modalModifierEleve">Modifier</button>
										</div>										
										<div class="btn-group mr-3">
											<button type="button" class="btn btn-default btn-danger btn_charger_form_supprimer_eleve" data-toggle="modal" data-target="#modalSupprimerEleve">Supprimer</button>
										</div>
									
										<div class="btn-group">
											<button onclick="generateDetails()" class=" float-right btn bg-info btn-rounded"><i class="fa fa-print"></i> Imprimer</button>
										</div>																				
									</div>
									<div class="card-body float-right">
									
									<div class="btn-group">
												<button type="button" class="btn btn-secondary">NOTE</button>
												<button type="button" class="btn btn-secondary dropdown-toggle m-r-20" data-toggle="dropdown">
													<i class="fa fa-angle-down"></i>
												</button>
												<ul class="dropdown-menu bg-light" role="menu">
													<li><a class="btnAfficherModalAjouterNote" href="#" data-toggle="modal" data-target="#modalAjouterNote">Ajouter</a>
													</li>
													<li class="bg-light">
														<!--<a href="#" data-toggle="modal" data-target="#modalScolarite">Détails</a>-->
															<form:form action="rechercherNote" modelAttribute="eleve" id="form_rechercher_note">
											    			   <input type="text" id="idEleve6" name="idEleve6" value="0" hidden="true"/>
																<button type="submit" class="btn btn-light btn_rechercher_note" data-toggle="modal" data-target="#modalDetailsNote">Détails 1er semestre</button>
															</form:form>
															
													</li>	
													<li class="bg-light">
														<!--<a href="#" data-toggle="modal" data-target="#modalScolarite">Détails</a>-->
															<form:form action="rechercherScolarite" modelAttribute="eleve" id="form_rechercher_scolarite">
											    			   <input type="text" id="idEleve1" name="idEleve1" value="0" hidden="true"/>
																<button type="submit" class="btn btn-light btn_rechercher_scolarite">Détails 2e semestre</button>
															</form:form>
													</li>										
												</ul>
											</div>
									
										<div class="btn-group mr-3">
											<div class="dropdown">
										    <button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">BULLETIN
										    <span class="caret"></span></button>
										    <ul class="dropdown-menu">
										     
										      <li class="dropdown-submenu">
										        <a class="test" tabindex="-1" href="#">1er Semestre<span class="caret"></span></a>
										        <ul class="dropdown-menu">
										          <li>
										           <form:form action="rechercherBulletin1" modelAttribute="eleve" id="form_rechercher_bulletin1">
									    			   <input type="text" id="idEleve8" name="idEleve8" value="0" hidden="true"/>
														<button type="submit" class="btn btn-white btn_rechercher_bulletin1" >Afficher</button>
													</form:form>										         	 
										          </li>
										          <li>
										          	 <form:form action="rechercherDetailsBulletin1" modelAttribute="eleve" id="form_rechercher_details_bulletin1">
									    			   <input type="text" id="idEleve11" name="idEleve11" value="0" hidden="true"/>
														<button type="submit" class="btn btn-white btn_rechercher_details_bulletin1" >Modifier</button>
													</form:form>
										       <!--   <button tabindex="-1"  id="">Ajouter/Modifier</button></li>-->
										       <!--<li class="dropdown-submenu">
										            <a class="test" href="#">Another dropdown <span class="caret"></span></a>
										            <ul class="dropdown-menu">
										              <li><a href="#">3rd level dropdown</a></li>
										              <li><a href="#">3rd level dropdown</a></li>
										            </ul>
										          </li> -->
										        </ul>
										      </li>
										      <li class="dropdown-submenu">
										        <a class="test" tabindex="-1" href="#">2e Semestre<span class="caret"></span></a>
										        <ul class="dropdown-menu">
										          <li><a tabindex="-1" href="#">Afficher</a></li>
										          <li><a tabindex="-1" href="#">Modifier</a></li>
										       <!--<   <li class="dropdown-submenu">
										            <a class="test" href="#">Another dropdown <span class="caret"></span></a>
										            <ul class="dropdown-menu">
										              <li><a href="#">3rd level dropdown</a></li>
										              <li><a href="#">3rd level dropdown</a></li>
										            </ul>
										          </li>-->
										        </ul>
										      </li>
										    </ul>
										  </div>
										</div>										
										<div class="btn-group">
									    			<!--<form:form action="rechercherScolarite" modelAttribute="eleve" id="form_rechercher_scolarite">
									    			   <input type="text" id="idEleve1" name="idEleve1" value="0" hidden="true"/>
														<button type="submit" class="btn btn-primary btn_rechercher_scolarite">SCOLARITE</button>
													</form:form> -->
													<label  class="btn btn-primary ">SCOLARITE</label>
													<button type="button" class="btn btn-primary dropdown-toggle m-r-20" data-toggle="dropdown">
														<i class="fa fa-angle-down"></i>
													</button>
													<ul class="dropdown-menu bg-light" role="menu">
														<li>
															<!--<a href="#" data-toggle="modal" data-target="#modalScolarite">Détails</a>-->
															<form:form action="rechercherScolarite" modelAttribute="eleve" id="form_rechercher_scolarite">
											    			   <input type="text" id="idEleve1" name="idEleve1" value="0" hidden="true"/>
																<button type="submit" class="btn btn-white btn_rechercher_scolarite">Détails</button>
															</form:form>
														</li>
														<li><a class="btnAfficherModalVersement" href="#" data-toggle="modal" data-target="#modalAjouterVersement">Ajouter</a>
														</li>
														<li><a href="#" data-toggle="modal" data-target="#modalModifierVersement">Modifier</a>
														</li>
														<li><a class="btnAfficherModalSupprimerVersement" href="#" data-toggle="modal" data-target="#modalSupprimerVersement">Supprimer</a>
														</li>
														
													</ul>
												</div>																				
									</div>									
								</div>
								<div class="card-body row" id="bar-parent">
									<div class="col-lg-10">
									<div class="container" id="details">
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
														<p class="ml-5"  style="line-height: 12px;"><span id="spanAnneeScolaire" class="h6"></span></p>
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
			                                              <div class="panel-body text-center h5 p-0">DETAILS ELEVE</div>
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
			                                                                                                  
			                                                    <tr class="p-0">                                                          
			                                                        <td class="p-0 text-center w-25 ">Nom</td>
			                                                        <td><span id="spanIdEleve" class="h6"  hidden="true"></span><span id="spanNom" class="h6">${nom}</span></td>
			                                                    </tr>
			                                                    <tr class="p-0">                                                          
			                                                        <td class="p-0 text-center w-25 ">Prénom</td>
			                                                        <td><span id="spanPrenom" class="h6">${prenom}</span></td>
			                                                    </tr>
			                                                     <tr class="p-0">                                                          
			                                                        <td class="p-0 text-center w-25 ">Sexe</td>
			                                                        <td><span id="spanSexe" class="h6">${sexe}</span></td>
			                                                    </tr>
			                                                    <tr class="p-0">                                                          
			                                                        <td class="p-0 text-center w-25 ">Téléphone</td>
			                                                        <td><span id="spanTel" class="h6">${tel}</span></td>
			                                                    </tr>
			                                                    <tr class="p-0">                                                          
			                                                        <td class="p-0 text-center w-25 ">NE (E) le</td>
			                                                        <td><span id="spanDateNaiss" class="h6">${dateNaiss}</span></td>
			                                                    </tr>
			                                                    <tr class="p-0">                                                          
			                                                        <td class="p-0 text-center w-25 ">Matricule</td>
			                                                        <td><span id="spanMatricule" class="h6">${matricule}</span></td>
			                                                    </tr>
			                                                    <tr class="p-0">                                                          
			                                                        <td class="p-0 text-center w-25 ">Classe</td>
			                                                        <td><span id="spanClasse" class="h6">${nomClasse}</span></td>
			                                                    </tr>                                                                                        
			                                                  </tbody>
			                                      </table>
			                                  </div>                                  
			                          </div>
			                      </div>
									</div>
									<div class="col-lg-2">
									  <div class="row">
									    <div class=col>
									    		
									    </div>
									  </div>
									  
									 
									  
								
									</div>
									
								</div>
							</div>
						</div>
					</div>
			</div>                    <!--end .row -->
		</div>
            <!-- end page content -->

			<!-- Modal afficher scolarité -->	
			<div class="modal fade" id="modalDetails" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg modal-full-height modal-bottom " role="document">
                  <div class="modal-content">
                    <div class="modal-header">
                       <div class="container">    
                           <div class="row">
                              <div class="col-11">
                              <nav class="navbar navbar-light">
                              <button onclick="generateDetails()" class=" float-right btn bg-info btn-rounded"><i class="fa fa-print"></i> Imprimer</button>
                              </nav>								
                                  
                              </div>
                              <div class="col-1"><span class="float-right"><span class="float-right"><button type="button" class="close " data-dismiss="modal">&times;</button></span></span></div>
                          </div>		   
                      </div>
                    </div>
                    <div class="modal-body" id="" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                       
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-default" data-dismiss="modal">Fermer</button>
                    </div>
                  </div>
                </div>
              </div>
              <!-- end scolarité -->	

<!-- Modal afficher bulletin -->	
<div class="modal fade" id="modalBulletin1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
	<div class="modal-dialog modal-lg modal-full-height modal-bottom " role="document">
	  <div class="modal-content p-0">
		<div class="modal-header">
		   <div class="container">    
			   <div class="row">
				  <div class="col-11">
					<nav class="navbar navbar-light">
					<button onclick="generateBulletin1()" class=" float-right btn bg-info btn-rounded"><i class="fa fa-print"></i> Imprimer</button>
														
					</nav>					  
				  </div>
				  <div class="col-1"><span class="float-right"><span class="float-right"><button type="button" class="close " data-dismiss="modal">&times;</button></span></span></div>
			  </div>		   
		  </div>
		</div>
		<div class="modal-body p-0" id="bulletin1">
		   <div class="container">
			  <div class="col-md-12">
				  <!-- Add content here -->
				  <div class="row border-top border-bottom border-dark" >                                     
					<div class="col-lg-6">
						<div class=" text-left p-1">
							<p class="m-0"  style="line-height: 15px;font-size: 0.875em;">REPUBLIQUE DU NIGER</p>
							<p class="m-0"  style="line-height: 15px;font-size: 0.875em;">Ministère de l'Education Nationale</p>
							<p class="m-0"  style="line-height: 15px;font-size: 0.875em;">Direction Régionale de l'Education Niamey</p>
							<p class="m-0"  style="line-height: 15px;font-size: 0.875em;">Direction Départementale de l'Education Nationale Niamey</p>
							<p class="m-0"  style="line-height: 15px;font-size: 0.875em;">Inspection d'Enseignement Secondaire Général Niamey 2</p>
							<p class="m-0"  style="line-height: 15px;font-size: 0.875em;">CES ANNOUR</p>
							<p class="m-0"  style="line-height: 15px;font-size: 0.875em;">Tél: 90909090</p>							
						</div>
					</div>
					<div class="col-lg-6">
						<h1 class="panel-body text-center pt-0 pb-0 h5">CES ANNOUR</h1>
					</div>
				  </div>
				  <div class="row">                                   
						<div class="col-lg-12 border-0 p-0">
								<div class="border-secondary p-0">
									<p class="panel-body text-center h5 p-0" style="line-height: 15px;"><u>BULLETIN DU 1ER SEMESTRE</u></p>
									<p class="text-center" style="line-height: 10px;">Année académique <span id="span1AnneeScolaire" class="h6">d</span></p>
								</div>																													
						</div>
					</div>
					  <div class="row border-top border-dark">
						  <div class="col-lg-8">
							  <div class="">
								  <div class="panel-body p-0">
										  <p class="m-0"  style="line-height: 14px; font-size: 0.875em;">Nom:    <span id="span1Nom"  class="h6"></span></p>
										  <p class="m-0"  style="line-height: 14px; font-size: 0.875em;">Prénom:   <span id="span1Prenom"  class="h6"></span></p>
										  <p class="m-0"  style="line-height: 14px;font-size: 0.875em;">Matricule:   <span id="span1Matricule"  class="h6"></span></p>
								  </div>
							  </div>
						  </div>
						  <div class="col-lg-4">
							  <div class="">
								  <div class="panel-body text-center">
									 <p class="m-0"  style="line-height: 14px;font-size: 0.875em;">Classe: <span id="span1Classe" class="h6"></span></p>
									  <p class="m-0"  style="line-height: 14px;font-size: 0.875em;">Effectif: <span id="span1Effectif" class="h6"></span></p>
								  </div>
							  </div>
						  </div>
					  </div>					  
					  <div class="row border  border-secondary mt-0">                                   
						<table class="table table-bordered">
							<thead style="background-color: #b0b0b0;">
								<tr >
									<th scope="col" class="text-center" style="font-size: 0.875em; LINE-HEIGHT:15px;">Discipline</th>
									<th scope="col" class="text-center" style="font-size: 0.875em; LINE-HEIGHT:15px;">Coef</th>
									<th scope="col" class="text-center" style="font-size: 0.875em; LINE-HEIGHT:15px;">Note Classe /20</th>
									<th scope="col" class="text-center" style="font-size: 0.875em; LINE-HEIGHT:15px;">Note Compo. /20</th>
									<th scope="col" class="text-center" style="font-size: 0.875em; LINE-HEIGHT:15px;">Moyenne /20</th>
									<th scope="col" class="text-center" style="font-size: 0.875em; LINE-HEIGHT:15px;">Moyenne |Sur</th>
									<th scope="col" class="text-center" style="font-size: 0.875em; LINE-HEIGHT:15px;">Rang</th>
									<th scope="col" class="text-center" style="font-size: 0.875em; LINE-HEIGHT:15px;">Appréciation</th>
								</tr>
							</thead>
							<tbody>
							<!----- 1ere ligne ------------------>
								<tr class="p-0" style="font-size: 0.875em;LINE-HEIGHT:10px;">
								  <td style="font-weight:normal;">Français</td>
								  <td id="coefFr" class="text-center"></td>
								  <td id="frNoteClasse1" class="text-center"></td>
								  <td id="frNoteCompo1" class="text-center"></td>
								  <td id="frMoyenne1" class="text-center"></td>
								  <td class="text-center"><span id="frMoyenneGenerale1" > </span> /<span id="frSur1" > </span></td>
								  <td id="frRang1" class="text-center"></td>
								  <td id="frAppreciation1" class="text-center"></td>
								</tr>
								<tr class="p-0" style="font-size: 0.875em; LINE-HEIGHT:10px;">
								  <td style="font-weight:normal;">Anglais</td>
								  <td id="coefAng" class="text-center"></td>
								  <td id="angNoteClasse1" class="text-center"></td>
								  <td id="angNoteCompo1" class="text-center"></td>
								  <td id="angMoyenne1" class="text-center"></td>
								  <td class="text-center"><span id="angMoyenneGenerale1" > </span> /<span id="angSur1" > </span></td>
								  <td id="angRang1" class="text-center"></td>
								  <td id="angAppreciation1" class="text-center"></td>
							  </tr>
							  <tr class="p-0" style="font-size: 0.875em; LINE-HEIGHT:10px;">
								  <td style="font-weight:normal;">H. Géo</td>
								  <td id="coefHG" class="text-center"></td>
								  <td id="hgNoteClasse1" class="text-center"></td>
								  <td id="hgNoteCompo1" class="text-center"></td>
								  <td id="hgMoyenne1" class="text-center"></td>
								  <td class="text-center"><span id="hgMoyenneGenerale1" > </span> /<span id="hgSur1" > </span></td>
								  <td id="hgRang1" class="text-center"></td>
								  <td id="hgAppreciation1" class="text-center"></td>
							  </tr>										
							  <tr class="p-0" style="font-size: 0.875em; LINE-HEIGHT:10px;">
								  <td style="font-weight:normal;">Maths</td>
								  <td id="coefMath" class="text-center"></td>
								  <td id="mathNoteClasse1" class="text-center"></td>
								  <td id="mathNoteCompo1" class="text-center"></td>
								  <td id="mathMoyenne1" class="text-center"></td>
								  <td class="text-center"><span id="mathMoyenneGenerale1" > </span> /<span id="mathSur1" > </span></td>
								  <td id="mathRang1" class="text-center"></td>
								  <td id="mathAppreciation1" class="text-center"></td>
							  </tr>
							  <tr class="p-0" style="font-size: 0.875em; LINE-HEIGHT:10px;">
								  <td style="font-weight:normal;">P. Chimie</td>
								  <td id="coefPc" class="text-center"></td>
								  <td id="pcNoteClasse1" class="text-center"></td>
								  <td id="pcNoteCompo1" class="text-center"></td>
								  <td id="pcMoyenne1" class="text-center"></td>
								  <td class="text-center"><span id="pcMoyenneGenerale1" > </span> /<span id="pcSur1" > </span></td>
								  <td id="pcRang1" class="text-center"></td>
								  <td id="pcAppreciation1" class="text-center"></td>
							  </tr>
							  <tr class="p-0" style="font-size: 0.875em; LINE-HEIGHT:10px;">
								  <td style="font-weight:normal;">SVT</td>
								  <td id="coefSvt" class="text-center"></td>
								  <td id="svtNoteClasse1" class="text-center"></td>
								  <td id="svtNoteCompo1" class="text-center"></td>
								  <td id="svtMoyenne1" class="text-center"></td>
								  <td class="text-center"><span id="svtMoyenneGenerale1" > </span> /<span id="svtSur1" > </span></td>
								  <td id="svtRang1" class="text-center"></td>
								  <td id="svtAppreciation1" class="text-center"></td>
							  </tr>
							  <tr class="p-0" style="font-size: 0.875em; LINE-HEIGHT:10px;">
								  <td style="font-weight:normal;">EFS</td>
								  <td id="coefEfs" class="text-center"></td>
								 <td id="efsNoteClasse1" class="text-center"></td>
								  <td id="efsNoteCompo1" class="text-center"></td>
								  <td id="efsMoyenne1" class="text-center"></td>
								  <td class="text-center"><span id="efsMoyenneGenerale1" > </span> /<span id="efsSur1" > </span></td>
								  <td id="efsRang1" class="text-center"></td>
								  <td id="efsAppreciation1" class="text-center"></td>
							  </tr>
							  <tr class="p-0" style="font-size: 0.875em; LINE-HEIGHT:10px;">
								  <td style="font-weight:normal;">EPS</td>
								  <td id="coefEps" class="text-center"></td>
								  <td id="epsNoteClasse1" class="text-center"></td>
								  <td id="epsNoteCompo1" class="text-center"></td>
								  <td id="epsMoyenne1" class="text-center"></td>
								  <td class="text-center"><span id="epsMoyenneGenerale1" > </span> /<span id="epsSur1" > </span></td>
								  <td id="epsRang1" class="text-center"></td>
								  <td id="epsAppreciation1" class="text-center"></td>
							  </tr>
							  <tr class="p-0" style="font-size: 0.875em; LINE-HEIGHT:10px;">
								  <td style="font-weight:normal;">Conduite</td>
								  <td id="coefConduite" class="text-center"></td>
								  <td class="text-center"></td>
								  <td class="text-center"></td>
								  <td class="text-center"></td>
								  <td class="text-center"><span id="conduite" ></span> /20</td>
								  <td class="text-center"></td>
								  <td class="text-center"></td>
							  </tr>
							  <tr class="p-0" style="font-size: 0.875em; LINE-HEIGHT:1px;">
								<td style="font-weight:normal;">Total</td>
								<td id="totalCoef" class="text-center"></td>
								<td class="text-center" colspan="4"><span id="totalPoint"></span> sur <span id="totalCoefSur"></span></td>
								<td class="text-center" colspan="2" rowspan="2"><span id="moySemRang1" class="h6"> </span> sur <span id="span2Effectif" class="h6"></span></td>								
							  </tr>
							  <tr class="p-0" style="font-size: 0.875em; LINE-HEIGHT:1px;">
								<td colspan="6" style="font-weight:normal;" class="text-center">Moyenne semestre Nº1: <span id="moyenneSem1"></span> sur 20</td>							
							  </tr>
							  
							  <tr class="p-0" style="font-size: 0.875em; LINE-HEIGHT:1px;">
								<td colspan="3" style="font-weight:normal;">Moyenne semestre Nº2</td>
								<td class="text-center">sur 20</td>
								<td class="text-center" colspan="4" rowspan="2"><span id="appreciation1"></span></td>								
							  </tr>
							  <tr class="p-0" style="font-size: 0.875em; LINE-HEIGHT:1px;">
								<td colspan="3" style="font-weight:normal;">Moyenne annuelle: sur 20</td>	
								<td  style="font-weight:normal;" class="text-center">sur 20</td>							
							  </tr>							  							
							</tbody>
						</table>
						<table class="table table-bordered table-sm">
							<thead class="p-0" style="background-color: #b0b0b0;  LINE-HEIGHT:1px;">
								<tr>
									<th scope="col" class="text-center" style="font-size: 0.875em; LINE-HEIGHT:1px;">Travail de la classe</th>
									<th scope="col" class="text-center" style="font-size: 0.875em; LINE-HEIGHT:1px;">Conduite</th>
									<th scope="col" class="text-center" style="font-size: 0.875em; LINE-HEIGHT:1px;">Tableau d'honneur </th>
									<th scope="col" class="text-center" style="font-size: 0.875em; LINE-HEIGHT:1px;">Assiduité - retard</th>									
								</tr>
							</thead>
							<tbody>
								<tr> 
									<td style="font-size: 0.875em;">
										<p class="m-0"  style="line-height: 14px;">Conduite de la classe:    <span id="conduiteClasse" class="h6"></span></p>
										<p class="m-0"  style="line-height: 14px;">Moyenne de la classe:   <span id="moyenneClasse" class="h6"></span></p>
										<p class="m-0"  style="line-height: 14px;">Plus forte moyenne:   <span id="plusGrand" class="h6"></span></p>
										<p class="m-0"  style="line-height: 14px;">Plus faible moyenne:   <span id = "plusPetit" class="h6"></span></p>
										<p class="m-0"  style="line-height: 14px;">Moyenne ≥ 10:   <span id="cptSupDix" class="h6"></span></p>
									</td>
									<td style="font-size: 0.875em;">
										<p class="m-0"  style="line-height: 14px;">Bien <span id="conduiteBien" class="h6"></span></p>
										<p class="m-0"  style="line-height: 14px;">Passable <span id="conduitePassable" class="h6"></span></p>
										<p class="m-0"  style="line-height: 14px;">Mal <span id="conduiteMal" class="h6"></span></p>
										<p class="m-0"  style="line-height: 14px;">Avertissement <span id="conduiteAvertissement" class="h6"></span></p>
										<p class="m-0"  style="line-height: 14px;">blâme  <span id="conduiteBlame" class="h6"></span></p>
									</td>
									<td style="font-size: 0.875em;">
										<p class="m-0"  style="line-height: 15px;">Inscrit(e) <span id="tabHonInscrit" class="h6"></span></p>
										<p class="m-0"  style="line-height: 15px;">Félicitation <span id="tabHonFelicitation" class="h6"></span></p>
										<p class="m-0"  style="line-height: 15px;">Encouragement <span id="tabHonEncouragement" class="h6"></span></p>
										<p class="m-0"  style="line-height: 15px;">Non inscrit <span id="tabHonNonInscrit" class="h6"></span></p>
										<p class="m-0"  style="line-height: 14px;">    </p>
										<p class="m-0"  style="line-height: 14px;">   </p>
									</td>
									<td style="font-size: 0.875em; LINE-HEIGHT:1px;">
										<p class="m-0"  style="line-height: 14px;"> <span id="assiduite" class="h6"></span></p>
									</td>									
								</tr>
							</tbody>
						</table>					
					</div>
					                               
					<div class="row mt-1">
						<div class="col-lg-7 pl-4 m-0">
							<p class="m-0" ><span>Prof Responsable: </span> <span id="profResponsable" ></span></p>
							<p class="m-0 ml-1 mt-2"  style="line-height: 11px; font-size:12px;"><span>Le Proviseur </span></p>
							<p class="mt-1" style="line-height: 11px; font-size:12px;"><span>ABDOUL MOUMOUNI ABOUBACAR </span></p>
						</div>
							
							
							<div class="col-lg-5  text-left">
							<p class="m-0"  style="line-height: 13px; font-size:10px;">Méthode de calcul de moyenne</p>
							<p class="m-0"  style="line-height: 13px; font-size:10px;">Note de classe = (Note Interro + Note_dev)/2</p>
							<p class="m-0"  style="line-height: 13px; font-size:10px;">M. Semestrielle = (Note_classe + Note_compo)/2</p>
							<p class="m-0"  style="line-height: 13px; font-size:10px;">M. Annuelle = (MS1+MS2)/2</p>
							</div>
					</div>
					
					  
			  </div>
		  </div>
		</div>
		<div class="modal-footer">
		  <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		</div>
	  </div>
	</div>
  </div>
 <!-- end modal bulletin -->

<!-- Modal afficher scolarité -->	
			<div class="modal fade" id="modalScolarite" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
			  <div class="modal-dialog modal-lg modal-full-height modal-bottom " role="document">
				<div class="modal-content">
				  <div class="modal-header">
					 <div class="container">    
						 <div class="row">
							<div class="col-11">
							<nav class="navbar navbar-light">
							<button onclick="generateScolarite()" class=" float-right btn bg-info btn-rounded"><i class="fa fa-print"></i> Imprimer</button>
							  								
							</nav>								
								
							</div>
							<div class="col-1"><span class="float-right"><span class="float-right"><button type="button" class="close " data-dismiss="modal">&times;</button></span></span></div>
						</div>		   
					</div>
				  </div>
				  <div class="modal-body" id="scolarite">
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
													<!-- <img alt="ll" src="assets/img/logo1.png"  width="72" height="72" > -->
												</div>
												
												<div class="col-lg-4  text-left">
												<p class="m-0"  style="line-height: 12px;">Année académique</p>
												<p class="ml-5"  style="line-height: 12px;"><span id="spanAnneeScolaire1" class="h6"></span></p>
												</div>
											</div>																						
										</div>										
									</div>
								</div>
								<div class="row mt-3">
                                    <div class="col-lg-8">
                                        <div class="">
                                            <div class="panel-body p-0">
											        <p class="m-0"  style="line-height: 14px;">Nom:    <span id="spanNom1" class="h6"></span></p>
											        <p class="m-0"  style="line-height: 14px;">Prénom:   <span id="spanPrenom1" class="h6"></span></p>
											        <p class="m-0"  style="line-height: 14px;">NE (E) le:   <span id="spanDateNaiss1" class="h6"></span></p>
											        <p class="m-0"  style="line-height: 14px;">Matricule:   <span id="spanMatricule1" class="h6"></span></p>

											        <p class="m-0"  style="line-height: 14px;">Classe:   <span id="spanClasse1" class="h6"></span></p>
											</div>
                                        </div>
                                    </div>                                    
                                </div>
								<div class="row mt-2">
                                    <div class="col-lg-4">
                                        
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="panel border-secondary">
                                            <div class="panel-body text-center h5 p-0">DETAILS SCOLARITE</div>
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        
                                    </div>
                                </div>
								<div class="row p-4 border-0  border-secondary mt-0">                                   
                                    <table class="table table-bordered mytable" id="table-scolarite1" >
									           
                                                <tbody>
												<!----- 1ere ligne ------------------>
                                                   
                                                    <tr class="p-0">
                                                        <td colspan="2"><p class="m-0"  style="line-height: 14px;">Date d'inscription:    <span id="spanDateInscrip1" class="h6"></span></p></td>
                                                    </tr>
													<tr class="p-0">
                                                        <td colspan="2"><p class="m-0"  style="line-height: 14px;">Montant versé: <span id="spanMontant1" class="h6"></span></p></td>
                                                    </tr>
                                                                                                   
                                                </tbody>
									</table>
									<table class="table table-bordered mytable" id="table-scolarite3" >
									           <thead class="p-0" style="background-color: #b0b0b0;">
                                                    <tr>
                                                        <th class="text-center">#</th>
                                                        <th class="text-center">Date versement</th>
														<th class="text-center">Mois</th>
														<th class="text-center">Montant</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
												                                
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

<!-- start modal modifier eleve -->
<div class="modal fade" id="modalModifierEleve" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" id="exampleModalLabel">Modification des détails sur l'élève</h4>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="card-body" id="bar-parent1">
					<form:form action="modifierEleve" modelAttribute="eleve" id="form_modifier_eleve">
                                        
                             <input type="text" id="idEleve" name="idEleve" value="0" />
                             
                             <div class="form-body">
                             	<div class="form-group row">
                                     <label class="control-label col-md-3">Nom 
                                         <span class="required"> * </span>
                                     </label>
                                     <div class="col-md-5">
                                         <form:input path="nom" type="text" id="nom" name="nom" placeholder="Entrez le nom" class="form-control input-height" /> 
                                    	    <span class="clsNotAvailable erreur_nom" ></span>
                                     </div>
                                 </div>
                                 <div class="form-group row">
                                     <label class="control-label col-md-3">Prénom
                                         <span class="required"> * </span>
                                     </label>
                                     <div class="col-md-5">
                                         <form:input path="prenom" type="text" id="prenom" name="prenom" data-required="1" placeholder="Entrez le prénom" class="form-control input-height" /> 
                                         <span class="clsNotAvailable erreur_prenom" ></span>
                                     </div>
                                 </div>
								 <div class="form-group row">
                                     <label class="control-label col-md-3">Sexe
                                         <span class="required"> * </span>
                                     </label>
                                     <div class="col-md-5">
                                         <form:select path="sexe" class="form-control input-height" id="sexe" name="sexe">
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
                                		
                                     </div>
                                 </div>
                                 <div class="form-group row">
                                      <label class="control-label col-md-3">Matricule
                                          <span class="required"> * </span>
                                      </label>
                                      <div class="col-md-5">
                                          <form:input path="matricule" type="text" id="matricule1" name="matricule" data-required="1" placeholder="Entrez le matricule" class="form-control input-height" value="CE0"/> 
                                          <span class="clsNotAvailable erreur_matricule1" ></span>
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
                                 
                                  <p class="resultat1 text-center"></p>
                                  <div class="row">
                                      <div class="offset-md-3 col-md-9">                                       
                                          <button type="submit" class="btn btn-info btn_modifier_eleve">Valider</button>
                                          <button type="button" class="btn btn-default btn-annuler" data-dismiss="modal">Annuler</button>
                                      </div>
                                  	</div>                                 
							</div>
                     </form:form>
				</div>
			</div>						
		</div>
	</div>
			
</div>

					
		<!-- start ajouter versement -->
<div class="modal fade" id="modalAjouterVersement" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" id="exampleModalLabel">Ajout d'un versement</h4>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="card-body" id="bar-parent1">
					<form:form action="ajouterVersement" modelAttribute="eleve" id="form_ajouter_versement">
						
						<input type="text" id="idEleve2" name="idEleve2" value="0" hidden="true"/>
												
						<div class="form-body">							
							<div class="form-group row">
								<label class="control-label col-md-3">Mois
									<span class="required"> * </span>
								</label>
								<div class="col-md-5">
									<select class="form-control input-height" name="mois" id="mois">
										<option value="">Choisir...</option>
										<option value="janvier">Janvier</option>
										<option value="février">Février</option>
										<option value="mars">Mars</option>
										<option value="avril">Avril</option>
										<option value="mai">Mai</option>
										<option value="juin">Juin</option>
										<option value="juillet">Juillet</option>
										<option value="août">Août</option>
										<option value="septembre">Septembre</option>
										<option value="octobre">Octobre</option>
										<option value="novembre">Novembre</option>
										<option value="décembre">Décembre</option>
									</select>
									<span class="clsNotAvailable erreur_mois" ></span>
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
							<p class="resultat2 text-center"></p>
							<div class="row">
								<div class="offset-md-3 col-md-9">
									<button type="submit" class="btn btn-info btn-ajouter-versement" data-toggle="modal" data-target="#detailsScolarite">Valider</button>
									<button type="button" class="btn btn-default" data-dismiss="modal">Annuler</button>
								</div>
								</div>
						   
						</div>
					</form:form>
				</div>
					</div>						
			</div>
			</div>
			
		</div>
		<!-- end modal modifier versement -->

			<!-- start modifier versement -->
<div class="modal fade" id="modalModifierVersement" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" id="exampleModalLabel">Modification d'un versement</h4>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="card-body" id="bar-parent1">
					<form:form action="modifierVersement" modelAttribute="eleve" id="form_modifier_versement">
						
						<input type="text" id="idEleve3" name="idEleve3" value="0" hidden="true"/>
						
						<div class="form-body">	
							<div class="form-group row">
                                       <label class="control-label col-md-3">Date de versement
                                       </label>
                                       <div class="col-md-5">
                                        <table class="w-75">
									        <tbody>
									            <tr>
									                <td style="width:180px">
									                	<input name="jourVersement" id="jourVersement" class="border inputs" type="text" maxlength="2" style="width:45px; height:40px;">-
									                	<input name="moisVersement" id="moisVersement" class="border inputs" type="text" maxlength="2" style="width:45px; height:40px;" >-
									                	<input name="anneeVersement" id="anneeVersement" class="border inputs" type="text" maxlength="4" style="width:45px; height:40px;" ></td>
									            </tr>	
									        </tbody>
								      	</table>
                                          
                                   		<span class="clsNotAvailable erreur_dateVersement" ></span>
                                   		<input type="hidden" id="dtp_input2" value="" />
                                       </div>
                                   </div>					
							<div class="form-group row">
								<label class="control-label col-md-3">Mois
									<span class="required"> * </span>
								</label>
								<div class="col-md-5">
									<select class="form-control input-height" name="mois1" id="mois1">
										<option value="">Choisir...</option>
										<option value="janvier">Janvier</option>
										<option value="février">Février</option>
										<option value="mars">Mars</option>
										<option value="avril">Avril</option>
										<option value="mai">Mai</option>
										<option value="juin">Juin</option>
										<option value="juillet">Juillet</option>
										<option value="août">Août</option>
										<option value="septembre">Septembre</option>
										<option value="octobre">Octobre</option>
										<option value="novembre">Novembre</option>
										<option value="décembre">Décembre</option>
									</select>
									<span class="clsNotAvailable erreur_mois1" ></span>
								</div>
							</div>						    											
							<div class="form-group row">
								<label class="control-label col-md-3">Versement
									<span class="required"> * </span>
								</label>
								<div class="col-md-5">
								<input type="text" id="versement1" name="versement1" data-required="1" placeholder="Entrez le montant versé" class="form-control input-height" />
								<span class="clsNotAvailable erreur_versement1" ></span>
								 </div>
							</div>
							<p class="resultat3 text-center"></p>
							<div class="row">
								<div class="offset-md-3 col-md-9">
									<button type="submit" class="btn btn-info btn-modifier-versement">Valider</button>
									<button type="button" class="btn btn-default" data-dismiss="modal">Annuler</button>
								</div>
								</div>
						   
						</div>
					</form:form>
				</div>
					</div>						
			</div>
			</div>			
		</div>	
		
				<!-- end modal modifier eleve -->
	
				<!-- start modifier versement -->
<div class="modal fade" id="modalSupprimerVersement" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" id="exampleModalLabel">Suppression d'un versement</h4>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="card-body" id="bar-parent1">
					<form:form action="supprimerVersement" modelAttribute="eleve" id="form_supprimer_versement">
						
						<input type="text" id="idEleve4" name="idEleve4" value="0" hidden="true"/>
						
						<div class="form-body">	
										
							<div class="form-group row">
								<label class="control-label col-md-3">Mois
									<span class="required"> * </span>
								</label>
								<div class="col-md-5">
									<select class="form-control input-height" name="mois2" id="mois2">
										<option value="">Choisir...</option>
										<option value="janvier">Janvier</option>
										<option value="février">Février</option>
										<option value="mars">Mars</option>
										<option value="avril">Avril</option>
										<option value="mai">Mai</option>
										<option value="juin">Juin</option>
										<option value="juillet">Juillet</option>
										<option value="août">Août</option>
										<option value="septembre">Septembre</option>
										<option value="octobre">Octobre</option>
										<option value="novembre">Novembre</option>
										<option value="décembre">Décembre</option>
									</select>
									<span class="clsNotAvailable erreur_mois2" ></span>
								</div>
							</div>						    											
						
							<p class="resultat4 text-center"></p>
							<div class="row">
								<div class="offset-md-3 col-md-9">
									<button type="submit" class="btn btn-info btn-supprimer-versement">Valider</button>
									<button type="button" class="btn btn-default" data-dismiss="modal">Annuler</button>
								</div>
								</div>
						   
						</div>
					</form:form>
				</div>
					</div>						
			</div>
			</div>			
		</div>	
	
		
		<!-- start ajouter scolarité -->
			<div class="modal fade " id="modalAjouterNote" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
					    <div class="modal-dialog modal-lg" role="document">
					        <div class="modal-content">
					            <div class="modal-header">
					                <h4 class="modal-title" id="exampleModalLabel">Ajout de note</h4>
					                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					                    <span aria-hidden="true">&times;</span>
					                </button>
					            </div>
					            <div class="modal-body">
					                <div class="card-body" id="bar-parent1">
					                
					                 <form:form action="ajouterNote" modelAttribute="eleve" id="form_ajouter_note">
                                        
                                                                              
                                        <input type="text" id="idEleve5" name="idEleve5" value="0" hidden="true"/>
                                        
                                        <div class="form-body">
                                        	<div class="form-group row">
                                                <label class="control-label col-md-3">Semestre
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-5">
                                                    <select id="semestre" name="semestre" class="form-control input-height">
                                                        <option value="">Choisir...</option>
                                                        <option value="1er">1er</option>
                                                        <option value="2e">2e</option>
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
                                            
                                            <div class="form-group row">
                                                <label class="control-label col-md-3">Note ( /20)
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-5">
                                                    <input type="text" class="form-control" id="maNote" name="maNote">
                                                    <span class="clsNotAvailable erreur_note" ></span>
                                                </div>
                                            </div>
										<p class="clsNotAvailable resultat5 text-center"></p>
										  <button type="submit" class="btn btn-primary btn-ajouter-note">Valider</button>
										  <button type="button" class="btn btn-secondary" data-dismiss="modal">Annuler</button>
										</div>
                                    </form:form>					                
                                    
                                </div>
					            </div>
					            
					        </div>
					    </div>
			
        </div>
        <!-- end rechercher note -->
        	<!-- Top Right  -->
					<div class="modal fade right" id="modalModifierNote" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
					   <div class="modal-dialog modal-side modal-top-right" role="document">
					        <div class="modal-content">
					            <div class="modal-header">
					                <h4 class="modal-title" id="exampleModalLabel">Modification de note</h4>
					                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					                    <span aria-hidden="true">&times;</span>
					                </button>
					            </div>
					            <div class="modal-body">
					                 <div class="card-body" id="bar-parent1">
                                    <form:form action="modifierNote" modelAttribute="eleve" id="form_modifier_note">
                                        
                                        <input type="text" id="idEleve9" name="idEleve9" value="0" hidden="true"/>
                                        <input type="text" id="idNote" name="idNote" value="0" hidden="true"/>
                                        <input type="text" id="ancienTypeNote" name="ancienTypeNote" value="0" hidden="true"/>
                                        
                                        <div class="form-body">
                                        	<div class="form-group row">
                                                <label class="control-label col-md-3">Semestre
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-5">
                                                    <select id="semestre1" name="semestre1" class="form-control input-height">
                                                        <option value="1er">1er</option>
                                                        <option value="2e">2e</option>
                                                    </select>
                                                    <span class="clsNotAvailable erreur_semestre1" ></span>
                                                </div>
                                            </div>
											<div class="form-group row">
                                                <label class="control-label col-md-3">Matière
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-5">
                                                    <select id="matiere1" name="matiere1" class="form-control input-height">
                                                    <option value="">Choisir...</option>
                                                    <c:forEach items="${matieres}" var="matiere" varStatus="boucle">                                                        
                                                        <option value="${matiere.nomMatiere}">${matiere.nomMatiere}</option>
                                                      </c:forEach>
                                                    </select>
                                                    <span class="clsNotAvailable erreur_matiere1" ></span>
                                                </div>
                                            </div>
											<div class="form-group row">
                                                <label class="control-label col-md-3">Type de note
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-5">
                                                    <select id="typeNote1" name="typeNote1" class="form-control input-height">
                                                        <option value="">Choisir...</option>
                                                        <option value="interrogation">Interrogation</option>
                                                        <option value="devoir">Devoir</option>
														<option value="exposé">Exposé</option>
														<option value="composition">Composition</option>
                                                    </select>
                                                    <span class="clsNotAvailable erreur_typeNote1" ></span>
                                                </div>
                                            </div>
                                            
                                            <div class="form-group row">
                                                <label class="control-label col-md-3">Note ( /20)
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-5">
                                                    <input type="text" class="form-control" id="note1" name="note1">
                                                    <span class="clsNotAvailable erreur_note1" ></span>
                                                </div>
                                            </div>
										<p class="clsNotAvailable resultat7 text-center"></p>
										  <button type="submit" class="btn btn-primary btn-modifier-note">Valider</button>
										  <button type="button" class="btn btn-secondary" data-dismiss="modal">Annuler</button>
										</div>
                                    </form:form>
                                </div>
					            </div>
					            
					        </div>
					    </div>
					</div>
        

	<!-- Modal afficher details note -->	
			<div class="modal fade right" id="modalDetailsNote" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="z-index: 1600;">
			  <div class="modal-dialog modal-lg" style="max-width: 1150px!important;" role="document">
				<div class="modal-content">
				  <div class="modal-header">
					 <div class="container">    
						 <div class="row">						
							<div class="col-1"><span class="float-right"><span class="float-right"><button type="button" class="close " data-dismiss="modal">&times;</button></span></span></div>
						</div>		   
					</div>
				  </div>
				  <div class="modal-body" id="scolarite">
					 <div class="container">
                        <div class="col-md-12">
                            <!-- Add content here -->											
								<div class="row mt-2">
                                    <div class="col-lg-4">
                                        
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="panel border-secondary">
                                            <div class="panel-body text-center h5 p-0">DETAILS NOTE 1er SEMESTRE</div>
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        
                                    </div>
                                </div>
								<div class="row p-4 border-0  border-secondary mt-0">                                   
                                    
									<table class="table table-bordered mytable" id="tableNote1" >
									           <thead class="p-0" style="background-color: #b0b0b0;">
                                                    <tr>
                                                        <th class="text-center">#</th>
                                                        <th class="text-center">Matière</th>
														<th class="text-center">Type de note</th>
														<th class="text-center">Note</th>
														<th class="text-center">Action</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
												                                
                                                </tbody>
									</table>
                                </div>
                                
                        </div>
                    </div>
				  </div>
				  <div class="modal-footer">
					<button type="button" class="btn btn-default btn-fermer" data-dismiss="modal">Fermer</button>
				  </div>
				</div>
			  </div>
			</div>
            <!-- end details note -->
            
            
            <!-- start modal modifier eleve -->
<div class="modal fade" id="modalModifierBulletin" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg" style="max-width: 1150px!important;" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" id="exampleModalLabel">Modification du bulletin du 1er semestre</h4>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="card-body" id="bar-parent1">
					<form:form action="modifierBulletin" modelAttribute="eleve" id="form_modifier_bulletin">
                                        
                             <input type="text" id="idEleve7" name="idEleve7" value="0" hidden="true"/>
                             <input type="text" id="semestre" name="semestre" value="1er" hidden="true"/>
                             
                             <div class="form-body">
                             	<div class="form-group row">
                                     <label class="control-label col-md-3">Conduite 
                                         <span class="required"> * </span>
                                     </label>
                                     <div class="col-md-5">
                                         <input type="text" id="conduite1" name="conduite" placeholder="Entrez la conduite" class="form-control input-height" /> 
                                    	    <span class="clsNotAvailable erreur_conduite" ></span>
                                     </div>
                                 </div>
                                 <div class="form-group row">
                                     <label class="control-label col-md-3">Tableau d'honneur
                                         <span class="required"> * </span>
                                     </label>
                                     <div class="col-md-5">
                                         <select class="form-control input-height" id="tableauHonneur" name="tableauHonneur">
											<option value="">Choisir</option>
											<option value="inscrit">Inscrit(e)</option>
											<option value="felicitation">Félicitation</option>
											<option value="encouragement">Encouragement</option>
											<option value="nonInscrit">Non inscrit</option>
										</select>
                                         <span class="clsNotAvailable erreur_tableauHonneur" ></span>
                                     </div>
                                 </div>
                                 <div class="form-group row">
                                     <label class="control-label col-md-3">Assiduité
                                         <span class="required"> * </span>
                                     </label>
                                     <div class="col-md-5">
                                         <input type="text" id="assiduite" name="assiduite" data-required="1" placeholder="Entrez l'assiduité" class="form-control input-height" /> 
                                         <span class="clsNotAvailable erreur_assiduite" ></span>
                                     </div>
                                 </div>
                                 <div class="form-group row">
                                     <label class="control-label col-md-3">Appréciation
                                         <span class="required"> * </span>
                                     </label>
                                     <div class="col-md-5">
                                         <input type="text" id="appreciation" name="appreciation" data-required="1" placeholder="Entrez l'appréciation" class="form-control input-height" /> 
                                         <span class="clsNotAvailable erreur_appreciation" ></span>
                                     </div>
                                 </div>
								 <div class="form-group row">
                                     <label class="control-label col-md-3">Prof responsable
                                         <span class="required"> * </span>
                                     </label>
                                     <div class="col-md-5">
                                         <select class="form-control input-height" id="profResponsable" name="profResponsable">
											<option value="">Choisir</option>
											<c:forEach items="${profs}" var="prof" varStatus="boucle">                                                        
                                              <option value="${prof.idProfesseur}">${prof.prenom} ${prof.nom}</option>
                                            </c:forEach>
										</select>
                                   <span class="clsNotAvailable erreur_profResponsable" ></span>
                                     </div>
                                 </div>
								                                 
                                  <p class="resultat6 text-center"></p>
                                  <div class="row">
                                      <div class="offset-md-3 col-md-9">                                       
                                          <button type="submit" class="btn btn-info btn_modifier_bulletin">Valider</button>
                                          <button type="button" class="btn btn-default btn-annuler" data-dismiss="modal">Annuler</button>
                                      </div>
                                  	</div>                                 
							</div>
                     </form:form>
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
						<h3>Elève modifié avec succès!</h3>
						<div class="m-t-20"> 
							<button class="btn btn-success" >Ok</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div id="modalSupprimerEleve" class="modal fade delete-modal" role="dialog">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-body text-center">
						<img src="assets/img/sent.png" alt="" width="50" height="46">
						<h3>Voulez-vous vraiment supprimer les informations de cet élève?</h3>
						<div class="m-t-20"> <a href="#" class="btn btn-default mb-2" data-dismiss="modal">Annuler</a>
							<form:form action="supprimerEleve" modelAttribute="eleve"  id="form_supprimer_eleve" >
								 <input type="text" id="idEleve12" name="idEleve12" value="0" />
								<button type="submit" class="btn btn-danger btn-valider-suppression-eleve">Confirmer</button>
							</form:form>
						</div>
						 <div id="load-img3" >
	                           <img  src="assets/img/ajax-loader.gif">
	                        </div>
					</div>
					<p class="resultat9 text-center"> </p>
				</div>
			</div>
		</div>
		
		
		 <div id="modal-suppression-eleve-reussi" class="modal fade delete-modal" role="dialog">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-body text-center">					
						<img src="assets/img/success.png" alt="ll" width="50" height="46">						
						<h3>Elève supprimé avec succès!</h3>
						<div class="m-t-20"> 
							<button class="btn btn-success suppression_ok" >Ok</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div id="modal-ajout-scolarite-reussi" class="modal fade delete-modal" role="dialog">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-body text-center">					
						<img src="assets/img/success.png" alt="ll" width="50" height="46">						
						<h3>Scolarité ajoutée avec succès!</h3>
						<div class="m-t-20"> 
							<button class="btn btn-success" >Ok</button>
						</div>
					</div>
				</div>
			</div>
		</div>	
		
		<div id="modal-modifier-versement-reussi" class="modal fade delete-modal" role="dialog">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-body text-center">					
						<img src="assets/img/success.png" alt="ll" width="50" height="46">						
						<h3>Versement modifié avec succès!</h3>
						<div class="m-t-20"> 
							<button class="btn btn-success" >Ok</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div id="modal-supprimer-versement-reussi" class="modal fade delete-modal" role="dialog">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-body text-center">					
						<img src="assets/img/success.png" alt="ll" width="50" height="46">						
						<h3>Versement supprimé avec succès!</h3>
						<div class="m-t-20"> 
							<button class="btn btn-success" >Ok</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div id="modal-ajout-note-reussi" class="modal fade delete-modal" role="dialog">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-body text-center">					
						<img src="assets/img/success.png" alt="ll" width="50" height="46">						
						<h3>Note ajoutée avec succès!</h3>
						<div class="m-t-20"> 
							<button class="btn btn-success" >Ok</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div id="modal-modifier-note-reussi" class="modal fade delete-modal" role="dialog">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-body text-center">					
						<img src="assets/img/success.png" alt="ll" width="50" height="46">						
						<h3>Note modifiée avec succès!</h3>
						<div class="m-t-20"> 
							<button class="btn btn-success" >Ok</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div id="modal-modifier-bulletin-reussi" class="modal fade delete-modal" role="dialog">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-body text-center">					
						<img src="assets/img/success.png" alt="ll" width="50" height="46">						
						<h3>Bulletin modifié avec succès!</h3>
						<div class="m-t-20"> 
							<button class="btn btn-success" >Ok</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div id="modalErreur" class="modal fade delete-modal" role="dialog">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-body text-center">					
						<img src="assets/img/sent.png" alt="" width="50" height="46">				
						<h3 class="clsNotAvailable" id="divErreur"></h3>
						<div class="m-t-20"> 
							<button class="btn btn-danger" >Ok</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div id="modalSupprimerNote" class="modal fade delete-modal" role="dialog">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-body text-center">
						<img src="assets/img/sent.png" alt="" width="50" height="46">
						<h3>Voulez-vous vraiment supprimer cette note?</h3>
						<div class="m-t-20"> <a href="#" class="btn btn-default mb-2" data-dismiss="modal">Annuler</a>
							<form:form action="supprimerNote" modelAttribute="eleve"  id="form_supprimer_note" >
								 <input id="idNote1" name="idNote1"  type="text" hidden="true" >
								 <input type="text" id="idEleve10" name="idEleve10" value="0" hidden="true"/>
								<button type="submit" class="btn btn-danger btn-valider-suppression">Confirmer</button>
							</form:form>
						</div>
						 <div id="load-img2" >
	                           <img  src="assets/img/ajax-loader.gif">
	                        </div>
					</div>
					<p class="resultat8 text-center"> </p>
				</div>
			</div>
		</div>
		
		
		 <div id="modal-suppression-note-reussi" class="modal fade delete-modal" role="dialog">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-body text-center">					
						<img src="assets/img/success.png" alt="ll" width="50" height="46">						
						<h3>Note supprimée avec succès!</h3>
						<div class="m-t-20"> 
							<button class="btn btn-success suppression_ok" >Ok</button>
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
		<!-- end modal modifier eleve -->		
        </div>

   </div>      <!-- start footer -->
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
    <script src="assets/plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>
    <script src="assets/plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker-init.js"></script>
	 <!-- data tables -->
    <script src="assets/plugins/datatables/jquery.dataTables.min.js" ></script>
 	<script src="assets/plugins/datatables/plugins/bootstrap/dataTables.bootstrap4.min.js" ></script>
    <script src="assets/js/pages/table/table_data.js" ></script>
	<script src="assets/plugins/datatables/editabletable.js" ></script>
    <script src="assets/js/pages/table/editable_table_data.js" ></script>
    <!-- counterup -->
    <script src="assets/plugins/counterup/jquery.waypoints.min.js" ></script>
    <script src="assets/plugins/counterup/jquery.counterup.min.js" ></script>
    <!-- Common js-->
	<script src="assets/js/app.js" ></script>
	 <script src="assets/js/pages/validation/form-validation.js" ></script>
    <script src="assets/js/layout.js" ></script>
    <script src="assets/js/theme-color.js" ></script>
    <!-- material -->
    <script src="assets/plugins/material/material.min.js"></script>
	<script type="text/javascript" src="assets/js/html2pdf.bundle.min.js"></script>
    <script>
      function generateDetails() {
        // Choose the element that our invoice is rendered in.
        var element = document.getElementById('details');
        html2pdf()
        .from(element)
        .set({
            margin:       [30, 30, 30 ,30],
            filename:     'details.pdf',
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
            pdf.text("Universités Partenaires : UAM de Niamey - I A E et I S P E D de Bordeaux - I N T E C de Paris", pdf.internal.pageSize.getWidth() - 500, pdf.internal.pageSize.getHeight() - 40);
          } 
        }).save();
       
      }
    </script>
	<script>
      function generateScolarite() {
        // Choose the element that our invoice is rendered in.
        var element = document.getElementById('scolarite');
        html2pdf()
        .from(element)
        .set({
            margin:       [30, 30, 0 ,30],
            filename:     'scolarite.pdf',
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
		function generateBulletin1() {
		  // Choose the element that our invoice is rendered in.
		  var element = document.getElementById('bulletin1');
		  html2pdf()
		  .from(element)
		  .set({
			  margin:       [0, 0, 0 ,0],
			  filename:     'bulletin1.pdf',
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
			  pdf.text("Universités Partenaires : UAM de Niamey - I A E et I S P E D de Bordeaux - I N T E C de Paris", pdf.internal.pageSize.getWidth() - 500, pdf.internal.pageSize.getHeight() -10);
			} 
		  }).save();
		 
		}
	</script>
	<script>
		$(document).ready(function(){
		    $('#myselection').on('change', function(){
		    	var demovalue = $(this).val(); 
		        $("div.myDiv").hide();
		        $("#show"+demovalue).show();
		    });
		});
	</script>
	<script> 
	$(document).ready(function(){
		$(".btnAfficherModalVersement").click(function(event) {
			$("#mois").val("");
			$("#versement").val("");
			$('.erreur_mois').html("");
			$('.erreur_versement').html("");
			$('.resultat2').html("");
			$('#mois').css('border-color', '');
			$('#versement').css('border-color', '');
	    });
	});
	</script>  
	<script> 
	$(document).ready(function(){
		$(".btnAfficherModalSupprimerVersement").click(function(event) {
			$("#mois2").val("");
			$('.erreur_mois2').html("");
			$('.resultat4').html("");
			$('#mois2').css('border-color', '');
	    });
	});
	</script> 
	<script> 
	$(document).ready(function(){
		$(".btnAfficherModalAjouterNote").click(function(event) {
			$("#semestre").val("");
			$("#matiere").val("");
			$("#typeNote").val("");
			$("#maNote").val("");
			$('.erreur_semestre').html("");
		    $('.erreur_matiere').html("");
		    $('.erreur_typeNote').html("");
		    $('.erreur_note').html("");
			$('.resultat5').html("");
			$('#semestre').css('border-color', '');
			$('#matiere').css('border-color', '');
			$('#typeNote').css('border-color', '');
			$('#note').css('border-color', '');
	    });
	});
	</script> 
	<script> 
	$(document).ready(function(){
		$("#btnModalModifierBulletin").click(function(event) {
			
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
<script>
	  $(document).ready(function() {
	 
		    // DataTable
		    var table = $('#tableNote1').DataTable({
		    	"language": {
	        		"url": "French.json"
	            }	
		    });	 
		} );
  </script>
    <!-- end js include path -->
  <script src="jq_fic/rechercher_eleve.js"></script>  
  <script src="jq_fic/rechercher_scolarite.js"></script>
  <script src="jq_fic/rechercher_details_eleve.js"></script>
  <script src="jq_fic/charger_form_modif_eleve.js"></script>
  <script src="jq_fic/modifier_eleve.js"></script>
  <script src="jq_fic/supprimer_eleve.js"></script>
  <script src="jq_fic/supprimer_annee_scolaire.js"></script>
  <script src="jq_fic/ajouter_versement.js"></script>
  <script src="jq_fic/ajouter_note.js"></script>
  <script src="jq_fic/charger_form_modif_note.js"></script>
  <script src="jq_fic/modifier_bulletin.js"></script>
  <script src="jq_fic/modifier_note.js"></script>
  <script src="jq_fic/rechercher_note.js"></script>
  <script src="jq_fic/supprimer_note.js"></script>
  <script src="jq_fic/rechercher_bulletin.js"></script>
  <script src="jq_fic/charger_form_modif_bulletin.js"></script>
  <script src="jq_fic/modifier_versement.js"></script>
  <script src="jq_fic/supprimer_versement.js"></script>
  </body>
</html>