<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<!-- BEGIN HEAD -->
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1" name="viewport" />
    <meta name="description" content="Responsive Admin Template" />
    <meta name="author" content="Sunray" />
    <title>School | Classe</title>
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
	<link rel="stylesheet" type="text/css" href="assets/css/jquery.dataTables.min.css">
	<link rel="stylesheet" type="text/css" href="assets/css/buttons.dataTables.min.css">
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
                                <div class="page-title">Rechercher Classe</div>
                            </div>
                            <ol class="breadcrumb page-breadcrumb pull-right">
                                <li><i class="fa fa-home"></i>&nbsp;<a class="parent-item" href="index.html">Recherche de classe</a>&nbsp;<i class="fa fa-angle-right"></i>
                                </li>
                                
                                <li class="active">Rechercher Classe</li>
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
<!-- BEGIN LIST -->
<div class="row">
	<div class="col-md-12">
		<div class="card card-box">
			<div class="card-head">
				<header>Liste des élèves de la <span class="spanClasse"></span> - Année scolaire <span class="spanAnneeScolaire"></span></header>
				 
				<div class="card-body ">
								<div class="btn-group mr-3">
                                      <form:form action="listerEleve" modelAttribute="eleve" id="form_lister_eleve">
									 	<input type="text" id="idDetailClasse1" name="idDetailClasse1" value="0" hidden="true"/>
										<button type="button" class="btn btn-success btn-lister-eleve">EFFECTIF</button>
									 </form:form>
                                  </div>
                                  <div class="btn-group">
                                      <button type="button" class="btn btn-default">NOTE</button>
                                      <button type="button" class="btn btn-default dropdown-toggle m-r-20" data-toggle="dropdown">
                                          <i class="fa fa-angle-down"></i>
                                      </button>
                                      <ul class="dropdown-menu" role="menu">
                                          <li>
                                          	<button type="button" class="btn btn-link btn-afficher-modal-note" data-toggle="modal" data-target="#modalAjouterNote">Ajouter des notes</button>
                                          </li>
                                          <li>
                                          	<button type="button" class="btn btn-link btn-afficher-modal-rechercher-note" data-toggle="modal" data-target="#modalRechercherNote">Rechercher des notes</button>
                                          </li>                                         
                                      </ul>
                                  </div>
                                  <!-- button-group 
                                  <div class="btn-group">
                                      <button type="button" class="btn btn-primary">EMPLOI DU TEMPS</button>
                                      <button type="button" class="btn btn-primary dropdown-toggle m-r-20" data-toggle="dropdown">
                                          <i class="fa fa-angle-down"></i>
                                      </button>
                                      <ul class="dropdown-menu" role="menu">
                                          <li><a id="btnEmploi1" href="#" data-toggle="modal" data-target="#modalEmploi1">1er Semestre</a>
                                          </li>
                                          <li><a href="#">2e Semestre</a>
                                          </li>
                                          <li><a href="#">Open With</a>
                                          </li>
                                          <li class="divider"></li>
                                          <li><a href="#">Exit</a>
                                          </li>
                                      </ul>
                                  </div>
                                  <!-- button-group -->
                                  <div class="btn-group">
                                      <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#modalStatutPaiement">Statut Paiement</button>
                                  </div>
                                  <div class="btn-group ml-3">
                                      <button type="button" class="btn btn-light">CONDUITE CLASSE</button>
                                      <button type="button" class="btn btn-light dropdown-toggle m-r-20" data-toggle="dropdown">
                                          <i class="fa fa-angle-down"></i>
                                      </button>
                                      <ul class="dropdown-menu" role="menu">
                                          <li>
                                          	<form:form action="rechercherConduite" modelAttribute="eleve" id="form_rechercher_conduite1">
                                          		<input type="text" id="idInscriptionConduite1" name="idInscriptionConduite1" value="0" hidden="true"/>
                                          		<button type="submit" class="btn btn-light btn-rechercher-conduite1">1er Semestre</button>
                                            </form:form>  
                                          </li>
                                          <li>
                                          	<button type="button" class="btn btn-light btn-afficher-modal-note" data-toggle="modal" data-target="#modalConduite">2e Semestre</button>
                                          </li>                                         
                                      </ul>
                                  </div>
                                  <!-- button-group -->
						</div>
								
			</div>
			<div class="card-body ">
				<table id="listeEleve" class="display" style="width:100%;">
					<thead>
						<tr class="text-center">
							<th style="width:1%;">#</th>
							<th style="width:5%;">Num Carte</th>
							<th style="width:10%;">Nom</th>
							<th style="width:10%;">Prénom</th>							
							<th style="width:10%;">Sexe</th>
							<th style="width:10%;">Date naiss.</th>
							<th style="width:10%;">Tél.</th>
							<th style="width:10%;">Action</th>
							<th></th>
						</tr>
					</thead>
					<tbody class="text-center">  
									
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<!--end .row -->
<!--end .row -->

            </div>
            <!-- end page content -->
            <!-- start chat sidebar -->

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
                                 		<span class="clsNotAvailable erreur_dateEpreuve" ></span>
                                		
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


<!-- Modal afficher effectif -->	
<div class="modal fade" id="modalEffectif" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg modal-full-height modal-bottom " role="document">
	  <div class="modal-content">
		<div class="modal-header">
		   <div class="container">    
			   <div class="row">
				  <div class="col-11">
				  <nav class="navbar navbar-light">
				  <button onclick="generateEffectif()" class=" float-right btn bg-info btn-rounded"><i class="fa fa-print"></i> Imprimer</button>
													
				  </nav>								
					  
				  </div>
				  <div class="col-1"><span class="float-right"><span class="float-right"><button type="button" class="close " data-dismiss="modal">&times;</button></span></span></div>
			  </div>		   
		  </div>
		</div>
		<div class="modal-body" id="effectif">
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
									  <p class="ml-5"  style="line-height: 12px;"><span class="h6 spanAnneeScolaire"></span></p>
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
								  <div class="panel-body text-center h5 p-0">EFFECTIF de la <span class="spanClasse"></span></div>
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
											  <td colspan="2"><p class="m-2"  style="line-height: 14px;">Nombre d'élèves:    <span class="h6" id="effectifEleve"></span></p></td>
										  </tr>
																																 
									  </tbody>
						  </table>
						  <table class="table table-bordered mytable" id="tableEleve" >
									 <thead class="p-0" style="background-color: #b0b0b0;">
										  <tr>
											  <th class="text-center">#</th>
											  <th class="text-center">Matricule</th>
											  <th class="text-center">Nom</th>
											  <th class="text-center">Prénom</th>
										  </tr>
									  </thead>
									  <tbody class="text-center">
										 																				
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
	
  <!-- Modal afficher bulletin -->	
  <div class="modal fade" id="afficherBulletin1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
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
							<p class="m-0"  style="line-height: 15px;font-size: 0.875em;">Direction Départementale de l'Education Nationale Niamey 2</p>
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
									<p class="text-center" style="line-height: 10px;">Année académique <span class="h6"></span></p>
								</div>																													
						</div>
					</div>
					  <div class="row border-top border-dark">
						  <div class="col-lg-8">
							  <div class="">
								  <div class="panel-body p-0">
										  <p class="m-0"  style="line-height: 14px; font-size: 0.875em;">Nom:    <span class="h6">Diop Assane</span></p>
										  <p class="m-0"  style="line-height: 14px; font-size: 0.875em;">Prénom:   <span class="h6">Amadou</span></p>
										  <p class="m-0"  style="line-height: 14px;font-size: 0.875em;">Matricule:   <span class="h6">CE001</span></p>
								  </div>
							  </div>
						  </div>
						  <div class="col-lg-4">
							  <div class="">
								  <div class="panel-body text-center">
									 <p class="m-0"  style="line-height: 14px;font-size: 0.875em;">Classe: <span class="h6">6e A</span></p>
									  <p class="m-0"  style="line-height: 14px;font-size: 0.875em;">Effectif: <span class="h6">60</span></p>
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
									<td style="font-weight:normal;">FranÃ§ais</td>
									<td class="text-center">2</td>
									<td class="text-center">16,00</td>
									<td class="text-center">8,00</td>
									<td class="text-center">12,00</td>
									<td class="text-center">24,00 /40</td>
									<td class="text-center">6</td>
									<td class="text-center">Assez bon travail</td>
								</tr>
								<tr class="p-0" style="font-size: 0.875em; LINE-HEIGHT:10px;">
								  <td style="font-weight:normal;">Anglais</td>
								  <td class="text-center">2</td>
								  <td class="text-center">16,00</td>
								  <td class="text-center">8,00</td>
								  <td class="text-center">12,00</td>
								  <td class="text-center">24,00 /40</td>
								  <td class="text-center">6</td>
								  <td class="text-center">Assez bon travail</td>
							  </tr>
							  <tr class="p-0" style="font-size: 0.875em; LINE-HEIGHT:10px;">
								  <td style="font-weight:normal;">H. Géo</td>
								  <td class="text-center">2</td>
								  <td class="text-center">16,00</td>
								  <td class="text-center">8,00</td>
								  <td class="text-center">12,00</td>
								  <td class="text-center">24,00 /40</td>
								  <td class="text-center">6</td>
								  <td class="text-center">Assez bon travail</td>
							  </tr>										
							  <tr class="p-0" style="font-size: 0.875em; LINE-HEIGHT:10px;">
								  <td style="font-weight:normal;">Maths</td>
								  <td class="text-center">2</td>
								  <td class="text-center">16,00</td>
								  <td class="text-center">8,00</td>
								  <td class="text-center">12,00</td>
								  <td class="text-center">24,00 /40</td>
								  <td class="text-center">6</td>
								  <td class="text-center">Assez bon travail</td>
							  </tr>
							  <tr class="p-0" style="font-size: 0.875em; LINE-HEIGHT:10px;">
								  <td style="font-weight:normal;">P. Chimie</td>
								  <td class="text-center">2</td>
								  <td class="text-center">16,00</td>
								  <td class="text-center">8,00</td>
								  <td class="text-center">12,00</td>
								  <td class="text-center">24,00 /40</td>
								  <td class="text-center">6</td>
								  <td class="text-center">Assez bon travail</td>
							  </tr>
							  <tr class="p-0" style="font-size: 0.875em; LINE-HEIGHT:10px;">
								  <td style="font-weight:normal;">SVT</td>
								  <td class="text-center">2</td>
								  <td class="text-center">16,00</td>
								  <td class="text-center">8,00</td>
								  <td class="text-center">12,00</td>
								  <td class="text-center">24,00 /40</td>
								  <td class="text-center">6</td>
								  <td class="text-center">Assez bon travail</td>
							  </tr>
							  <tr class="p-0" style="font-size: 0.875em; LINE-HEIGHT:10px;">
								  <td style="font-weight:normal;">EFS</td>
								  <td class="text-center">2</td>
								  <td class="text-center">16,00</td>
								  <td class="text-center">8,00</td>
								  <td class="text-center">12,00</td>
								  <td class="text-center">24,00 /40</td>
								  <td class="text-center">6</td>
								  <td class="text-center">Assez bon travail</td>
							  </tr>
							  <tr class="p-0" style="font-size: 0.875em; LINE-HEIGHT:10px;">
								  <td style="font-weight:normal;">EPS</td>
								  <td class="text-center">2</td>
								  <td class="text-center">16,00</td>
								  <td class="text-center">8,00</td>
								  <td class="text-center">12,00</td>
								  <td class="text-center">24,00 /40</td>
								  <td class="text-center">6</td>
								  <td class="text-center">Assez bon travail</td>
							  </tr>
							  <tr class="p-0" style="font-size: 0.875em; LINE-HEIGHT:10px;">
								  <td style="font-weight:normal;">Conduite</td>
								  <td class="text-center">2</td>
								  <td class="text-center">16,00</td>
								  <td class="text-center">8,00</td>
								  <td class="text-center">12,00</td>
								  <td class="text-center">24,00 /40</td>
								  <td class="text-center">6</td>
								  <td class="text-center">Assez bon travail</td>
							  </tr>
							  <tr class="p-0" style="font-size: 0.875em; LINE-HEIGHT:1px;">
								<td style="font-weight:normal;">Total</td>
								<td class="text-center">22</td>
								<td class="text-center" colspan="4">300,50 sur 440</td>
								<td class="text-center" colspan="2" rowspan="2">4 ème sur 66</td>								
							  </tr>
							  <tr class="p-0" style="font-size: 0.875em; LINE-HEIGHT:1px;">
								<td colspan="6" style="font-weight:normal;" class="text-center">Moyenne semestre NÂº1: 13,66 sur 20</td>							
							  </tr>
							  
							  <tr class="p-0" style="font-size: 0.875em; LINE-HEIGHT:1px;">
								<td colspan="3" style="font-weight:normal;">Moyenne semestre NÂº2</td>
								<td class="text-center">sur 20</td>
								<td class="text-center" colspan="4" rowspan="2">Du courage mais peut mieux faire</td>								
							  </tr>
							  <tr class="p-0" style="font-size: 0.875em; LINE-HEIGHT:1px;">
								<td colspan="3" style="font-weight:normal;">Moyenne annuelle: 13,66 sur 20</td>	
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
										<p class="m-0"  style="line-height: 14px;">Conduite de la classe:    <span class="h6">18</span></p>
										<p class="m-0"  style="line-height: 14px;">Moyenne de la classe:   <span class="h6">8,14</span></p>
										<p class="m-0"  style="line-height: 14px;">Plus forte moyenne:   <span class="h6">16,26</span></p>
										<p class="m-0"  style="line-height: 14px;">Plus faible moyenne:   <span class="h6">5,26</span></p>
										<p class="m-0"  style="line-height: 14px;">Moyenne â¥ 10   <span class="h6">25</span></p>
									</td>
									<td style="font-size: 0.875em;">
										<p class="m-0"  style="line-height: 14px;">Bien</p>
										<p class="m-0"  style="line-height: 14px;">Passable </p>
										<p class="m-0"  style="line-height: 14px;">Mal </p>
										<p class="m-0"  style="line-height: 14px;">Avertissement </p>
										<p class="m-0"  style="line-height: 14px;">blÃ¢me  </p>
									</td>
									<td style="font-size: 0.875em;">
										<p class="m-0"  style="line-height: 14px;">Inscrit(e)</p>
										<p class="m-0"  style="line-height: 14px;">Félicitation </p>
										<p class="m-0"  style="line-height: 14px;">Encouragement </p>
										<p class="m-0"  style="line-height: 14px;">Non inscrit </p>
									</td>
									<td style="font-size: 0.875em; LINE-HEIGHT:1px;">
										RAS
									</td>									
								</tr>
							</tbody>
						</table>					
					</div>
					                               
					<div class="row mt-1">
						<div class="col-lg-7 pl-4 m-0">
							<p class="m-0" ><span>Prof Responsable: Adamou Issaka </span></p>
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


 <!-- start ajouter scolarité -->
			<div class="modal fade" id="modalAjouterNote" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
					    <div class="modal-dialog modal-lg " role="document">
					        <div class="modal-content">
					            <div class="modal-header">
					                <h4 class="modal-title" id="exampleModalLabel">Ajout de notes</h4>
					                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					                    <span aria-hidden="true">&times;</span>
					                </button>
					            </div>
					            <div class="modal-body">
					                <div class="card-body" id="bar-parent1">
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
					</div>
			
        </div>
        <!-- end rechercher note -->
		
		 <!-- start ajouter scolarité -->
 <div class="modal fade" id="modalRechercherNote" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" style="z-index: 1600;">
	<div class="modal-dialog modal-lg" style="max-width: 1150px!important;" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" id="exampleModalLabel">Recherche de notes</h4>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Fermer</button>

			</div>
			<div class="modal-body">
				<div class="card-body" id="bar-parent1">
				<form:form action="listerNote" modelAttribute="note" id="form_lister_note">
				
					<input id="nomClasse5" name="nomClasse"  type="text" hidden="true">
					<input id="nomCategorie5" name="nomCategorie"  type="text" hidden="true">
					
					<div class="form-body">
						<div class="form-group row">
							<label class="control-label col-md-3">Semestre
								<span class="required"> * </span>
							</label>
							<div class="col-md-5">
								<select class="form-control input-height" id="semestre1" name="semestre1">
									<option value="">Choisir...</option>
									<option value="1" selected>1er</option>
                                    <option value="2">2e</option>
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
                                     <option value="${matiere.idMatiere}">${matiere.nomMatiere}</option>
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
                                     <option value="interrogation" selected>Interrogation</option>
                                     <option value="devoir">Devoir</option>
									<option value="exposé">Exposé</option>
									<option value="composition">Composition</option>
                                 </select>
                                 <span class="clsNotAvailable erreur_typeNote1" ></span>
							</div>
						</div>
						
						<button type="submit" class="btn btn-primary btn_lister_note">Rechercher</button>																				   
					   
						<p class="clsNotAvailable resultat11 text-center"></p>
					</div>
				</form:form>
				
				<table class="table table-bordered mytable" id="tableNote" >
		          	 <thead class="p-0" style="background-color: #b0b0b0;">
	                 <tr>
	                      <th class="text-center">#</th>
	                      <th class="text-center">Num carte</th>
						  <th class="text-center">Prénom</th>
						  <th class="text-center">Nom</th>
						  <th class="text-center">Note</th>
						  <th class="text-center">Date Epreuve</th>
						  <th class="text-center"></th>
	                  </tr>
	                  </thead>
	                  <tbody class="text-center">
	              
	                  </tbody>
				</table>
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
                                                <tbody class="text-center">
												                                
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
            
            
             <!-- start statut paiement -->
 <div class="modal fade" id="modalStatutPaiement" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" style="z-index: 1600;">
	<div class="modal-dialog modal-lg" style="max-width: 1150px!important;" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" id="exampleModalLabel">Statut paiement scolarité</h4>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Fermer</button>

			</div>
			<div class="modal-body">
				<div class="card-body" id="bar-parent1">
				<form:form action="listerStatutPaiement" modelAttribute="scolarite" id="form_statut_paiement">
				
					<input id="idDetailClasse2" name="idDetailClasse2"  type="text"  hidden="true">
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
												
						<button type="submit" class="btn btn-primary btn_lister_statut">Rechercher</button>																				   
					   
						<p class="clsNotAvailable resultat12 text-center"></p>
					</div>
				</form:form>
				
				<table class="table table-bordered mytable" id="tableStatutPaiement" >
		          	 <thead class="p-0" style="background-color: #b0b0b0;">
	                 <tr>
	                      <th class="text-center">#</th>
	                      <th class="text-center">Num carte</th>
						  <th class="text-center">Prénom</th>
						  <th class="text-center">Nom</th>
						  <th class="text-center">Mois</th>
						  <th class="text-center">Statut paiement</th>
	                  </tr>
	                  </thead>
	                  <tbody class="text-center">
	              
	                  </tbody>
				</table>
			</div>
		   </div>
			
		</div>
	</div>
</div>
            
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
                                    <form:form action="modifierNote" modelAttribute="note" id="form_modifier_note">
                                        
                                        <input type="text" id="idNote" name="idNote" value="0" hidden="true"/>
                                        <input type="text" id="semestre2" name="semestre" value="0" hidden="true"/>
                                        
                                        <div class="form-body">
                                       							
                                            <div class="form-group row">
                                                <label class="control-label col-md-3">Note ( /20)
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-5">
                                                    <input type="text" class="form-control" id="note2" name="note2">
                                                    <span class="clsNotAvailable erreur_note2" ></span>
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
												<p class="ml-5"  style="line-height: 12px;"><span id="spanAnneeScolaire1" class="h6">${anneeScolaire}</span></p>
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
						
						<input type="text" id="idInscription" name="idInscription" value="0" hidden="true"/>
												
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
<div class="modal fade" id="modalModifierScolarite" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg modal-side modal-top-right" role="document">
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
						
						<input type="text" id="idInscription3" name="idInscription3" value="0" />
						<input type="text" id="mois3" name="mois3" value="0" />
						
						<div class="form-body">	
							<div class="form-group row">
                                       <label class="control-label col-md-10">Date de versement
                                       </label>
                                       <div class="col-md-10">
                                        <table class="w-75">
									        <tbody>
									            <tr>
									                <td style="width:180px">
									                	<input name="jourVersement1" id="jourVersement1" class="border inputs" type="text" maxlength="2" style="width:45px; height:40px;">-
									                	<input name="moisVersement1" id="moisVersement1" class="border inputs" type="text" maxlength="2" style="width:45px; height:40px;" >-
									                	<input name="anneeVersement1" id="anneeVersement1" class="border inputs" type="text" maxlength="4" style="width:45px; height:40px;" ></td>
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
		
		
		<!-- Modal afficher details note -->	
			<div class="modal fade right" id="modalDetailsScolarite" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="z-index: 1600;">
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
                                            <div class="panel-body text-center h5 p-0">DETAILS SCOLARITE <span id="spanNomPrenom"></span></div>
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        
                                    </div>
                                </div>
								<div class="row p-4 border-0  border-secondary mt-0">                                   
                                    
									<table class="table table-bordered mytable" id="tableListeScolarite" >
									           <thead class="p-0 text-center" style="background-color: #b0b0b0;">
                                                    <tr>
                                                        <th class="text-center">#</th>
                                                        <th class="text-center">Date versement</th>
														<th class="text-center">Mois</th>
														<th class="text-center">Montant</th>
														<th class="text-center">Action</th>
                                                    </tr>
                                                </thead>
                                                <tbody class="text-center">
												                                
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
							<p class="m-0" ><span>Prof Responsable: </span> <span id="profResponsable2" ></span></p>
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
                                        
                             <input type="text" id="idInscription7" name="idInscription7" value="0" />
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
                                         <input type="text" id="assiduite1" name="assiduite" data-required="1" placeholder="Entrez l'assiduité" class="form-control input-height" /> 
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
                                         <select class="form-control input-height" id="profResponsable1" name="profResponsable">
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


  <!-- start ajouter scolarité -->
			<div class="modal fade" id="modalConduite" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
					    <div class="modal-dialog modal-lg " role="document">
					        <div class="modal-content">
					            <div class="modal-header">
					                <h4 class="modal-title" id="exampleModalLabel">Modification de la conduite de classe</h4>
					                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					                    <span aria-hidden="true">&times;</span>
					                </button>
					            </div>
					            <div class="modal-body">
					                <div class="card-body" id="bar-parent1">
                                    <form:form action="modifierConduite" modelAttribute="note" id="form_modifier_conduite">
                                        <div class="form-body">
                                        	<div class="form-group row">
                                                <label class="control-label col-md-3">Conduite de la classe
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-5">
                                                <input type="text" class="form-control" id="idDetailClasse3" name="idDetailClasse">
                                                
                                                    <input type="text" class="form-control" id="conduiteClasse1" name="conduiteClasse">
													<span class="clsNotAvailable erreur_modifier_conduite" ></span>
                                                </div>
                                            </div>
										
										 
										 <p class="clsNotAvailable resultat13 text-center"> </p>
										  <button type="button" class="btn btn-primary btn-modifier-conduite">Valider</button>
										  <button type="button" class="btn btn-secondary btn-annuler-conduite" data-dismiss="modal">Annuler</button>
										</div>
                                    </form:form>
                                </div>
					            </div>
					            
					        </div>
					    </div>
					</div>	
					
</div>
<!-- end rechercher note -->
  
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
								 <input type="text" id="idEleve12" name="idEleve12" value="0" hidden="true"/>
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
		
		<div id="modalSupprimerVersement" class="modal fade delete-modal" role="dialog">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-body text-center">
						<img src="assets/img/sent.png" alt="" width="50" height="46">
						<h3>Voulez-vous vraiment supprimer ce versement?</h3>
						<div class="m-t-20"> <a href="#" class="btn btn-default mb-2" data-dismiss="modal">Annuler</a>
							<form:form action="supprimerVersement" modelAttribute="eleve"  id="form_supprimer_versement" >
								 <input id="idScolarite" name="idScolarite"  type="text" hidden="true" >
								<button type="submit" class="btn btn-danger btn-supprimer-versement">Confirmer</button>
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
		
		<div id="modal-modif-conduite-reussi" class="modal fade delete-modal" role="dialog">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-body text-center">					
						<img src="assets/img/success.png" alt="ll" width="50" height="46">						
						<h3>Conduite de classe modifiée avec succès!</h3>
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
    <script src="assets/js/dataTables.buttons.min.js"></script>
    <script src="assets/js/buttons.flash.min.js"></script> 
    <script src="assets/js/datatables.min.js"></script>
 	<script src="assets/plugins/datatables/plugins/bootstrap/dataTables.bootstrap4.min.js" ></script>
    <script src="assets/js/pages/table/table_data.js" ></script>
	<script src="assets/plugins/datatables/editabletable.js" ></script>
    <script src="assets/js/pages/table/editable_table_data.js" ></script>
	<!-- pdf  -->
	<script src="assets/js/buttons.flash.min.js"></script> 
	<script src="assets/js/buttons.html5.min.js"></script> 
    <script src="assets/js/buttons.print.min.js"></script> 
	<script src="assets/js/pdfmake.min.js"></script> 
	<script src="assets/js/vfs_fonts.js"></script> 
	<script src="assets/js/jszip.min.js"></script> 
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
		$(document).ready(function() {
		   
			  var dte = new Date();
			  var y = dte.getFullYear();
			  var m = dte.getMonth()+1;
			  var d = dte.getDate();
			  var maDate = 'school-'+d + "-" + m + "-" + y;
			  var anneeScolaire = $("#spanAnneeScolaire").text();
			  var maClasse = $("#spanClasse").text();
		      var titre = 'Détails scolarité - Année scolaire: '+anneeScolaire+' - Date: '+d + "-" + m + "-" + y;			  
			  
		   // DataTable
			  var table = $('#tableListeScolarite').DataTable({
				  "language": {
		        		"url": "French.json"
		            },
				  dom: 'lfrtip'
			  });
		   
		  } );
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
			  pdf.text("Universités Partenaires : UAM de Niamey - I A E et I S P E D de Bordeuax - I N T E C de Paris", pdf.internal.pageSize.getWidth() - 500, pdf.internal.pageSize.getHeight() -10);
			} 
		  }).save();
		 
		}
	</script>
	<script>
		$(document).ready(function() {
		   
			  var dte = new Date();
			  var y = dte.getFullYear();
			  var m = dte.getMonth()+1;
			  var d = dte.getDate();
			  var maDate = 'school-'+d + "-" + m + "-" + y;
			  var anneeScolaire = $(".spanAnneeScolaire").text();
			  var maClasse = $(".spanClasse").text();
		      var titre = 'Détails scolarité - Année scolaire: '+anneeScolaire+' - Date: '+d + "-" + m + "-" + y;			  
			  
		   // DataTable
			  var table = $('#tableNote').DataTable({
				  "language": {
		        		"url": "French.json"
		            },
				  dom: 'lBfrtip',
					buttons: [
						  {
							  extend: 'copyHtml5',
							  exportOptions: {
								  columns: [ 0, 1, 2, 3, 4, 5 ]
							  },
							  text: 'Copier',
							  title: titre
						  },
						  {
							  extend: 'excelHtml5',
							  exportOptions: {
								  columns: [ 0, 1, 2, 3, 4, 5 ]
							  },
							  title: titre,
							  filename: maDate
						  },
						  {
							  extend: 'pdfHtml5',
							   exportOptions: {
								  columns: [ 0, 1, 2, 3, 4, 5 ]
							  },
							  orientation: 'portrait',
							  title: titre,
							  filename: maDate,
							  customize: function(doc) {
								  doc.pageMargins = [10, 20, 10,10 ];
				                	doc.defaultStyle.fontSize = 8; 
				                	doc.styles.tableHeader.fontSize = 8; //2, 3, 4, etc
			                        doc.content[1].table.widths = [ '2%',  '14%', '14%', '14%', 
			                                                           '14%', '14%', '14%', '14%'];
				                	doc.styles.tableBodyEven.alignment = 'center';
				                    doc.styles.tableBodyOdd.alignment = 'center'; 
				                	doc.content[1].table.widths = 
				                        Array(doc.content[1].table.body[0].length + 1).join('*').split('');
				                	
				                    doc['footer'] = (function(page, pages) {
				                      return {
				                        columns: [
				                          {
				                            alignment: 'center',
				                            text: [
				                              { text: page.toString(), italics: true },
				          					' sur ',
				                              { text: pages.toString(), italics: true }
				          				  ]
				                        }],
				                        margin: [10, 0]
				                      }
				                    })
								 // doc.content.splice( 1, 0, {
								  //    margin: [ 0, 50, 0, 12 ]
									 // alignment: 'left'
									 // image: 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAIAAAD/gAIDAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA9lpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMC1jMDYwIDYxLjEzNDc3NywgMjAxMC8wMi8xMi0xNzozMjowMCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wUmlnaHRzPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvcmlnaHRzLyIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcFJpZ2h0czpNYXJrZWQ9IkZhbHNlIiB4bXBNTTpPcmlnaW5hbERvY3VtZW50SUQ9ImFkb2JlOmRvY2lkOnBob3Rvc2hvcDoxN2FlYzk4Yy0zMjgzLTExZGEtYTIzOC1lM2UyZmFmNmU5NjkiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6QUYzODU5RTYxNDNCMTFFNTlBNjVCOTY4NjAwQzY5QkQiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6QUYzODU5RTUxNDNCMTFFNTlBNjVCOTY4NjAwQzY5QkQiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNSBNYWNpbnRvc2giPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDowODgwMTE3NDA3MjA2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'
								//  } );
								} 
						  }
					  ]
			  });
		   
		  } );
		</script>
	<script>
		$(document).ready(function() {
		   
			  var dte = new Date();
			  var y = dte.getFullYear();
			  var m = dte.getMonth()+1;
			  var d = dte.getDate();
			  var maDate = 'school-'+d + "-" + m + "-" + y;
			  var anneeScolaire = $(".spanAnneeScolaire").text();
			  var maClasse = $(".spanClasse").text();
		      var titre = 'Liste des élèves de la '+maClasse+'- Année scolaire: '+anneeScolaire+' - Date: '+d + "-" + m + "-" + y;			  
			  
		   // DataTable
			  var table = $('#listeEleve').DataTable({
				  "language": {
		        		"url": "French.json"
		            },
				  dom: 'lBfrtip',
					buttons: [
						  {
							  extend: 'copyHtml5',
							  exportOptions: {
								  columns: [ 0, 1, 2, 3, 4 ]
							  },
							  text: 'Copier',
							  title: titre
						  },
						  {
							  extend: 'excelHtml5',
							  exportOptions: {
								  columns: [ 0, 1, 2, 3, 4 ]
							  },
							  title: titre,
							  filename: maDate
						  },
						  {
							  extend: 'pdfHtml5',
							   exportOptions: {
								  columns: [ 0, 1, 2, 3, 4 ]
							  },
							  orientation: 'portrait',
							  title: titre,
							  filename: maDate,
							  customize: function(doc) {
								  doc.pageMargins = [10, 20, 10,10 ];
				                	doc.defaultStyle.fontSize = 8; 
				                	doc.styles.tableHeader.fontSize = 8; //2, 3, 4, etc
			                        doc.content[1].table.widths = [ '2%',  '14%', '14%', '14%', 
			                                                           '14%', '14%', '14%', '14%'];
				                	doc.styles.tableBodyEven.alignment = 'center';
				                    doc.styles.tableBodyOdd.alignment = 'center'; 
				                	doc.content[1].table.widths = 
				                        Array(doc.content[1].table.body[0].length + 1).join('*').split('');
				                	
				                    doc['footer'] = (function(page, pages) {
				                      return {
				                        columns: [
				                          {
				                            alignment: 'center',
				                            text: [
				                              { text: page.toString(), italics: true },
				          					' sur ',
				                              { text: pages.toString(), italics: true }
				          				  ]
				                        }],
				                        margin: [10, 0]
				                      }
				                    })
								 // doc.content.splice( 1, 0, {
								  //    margin: [ 0, 50, 0, 12 ]
									 // alignment: 'left'
									 // image: 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAIAAAD/gAIDAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA9lpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMC1jMDYwIDYxLjEzNDc3NywgMjAxMC8wMi8xMi0xNzozMjowMCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wUmlnaHRzPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvcmlnaHRzLyIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcFJpZ2h0czpNYXJrZWQ9IkZhbHNlIiB4bXBNTTpPcmlnaW5hbERvY3VtZW50SUQ9ImFkb2JlOmRvY2lkOnBob3Rvc2hvcDoxN2FlYzk4Yy0zMjgzLTExZGEtYTIzOC1lM2UyZmFmNmU5NjkiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6QUYzODU5RTYxNDNCMTFFNTlBNjVCOTY4NjAwQzY5QkQiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6QUYzODU5RTUxNDNCMTFFNTlBNjVCOTY4NjAwQzY5QkQiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNSBNYWNpbnRvc2giPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDowODgwMTE3NDA3MjA2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'
								//  } );
								} 
						  }
					  ]
			  });
		   
		  } );
		</script>
		<script>
		$(document).ready(function() {
		   
		   // DataTable
			  var table = $('#tableEleve').DataTable({
				  "bPaginate": false,
			        "bFilter": false,
			        "bInfo": false,
				  "language": {
		        		"url": "French.json"
		            },
				  dom: 'l'
			  });
		   
		  } );
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
      <script>
		function generateEffectif() {
		  // Choose the element that our invoice is rendered in.
		  var element = document.getElementById('effectif');
		  html2pdf()
		  .from(element)
		  .set({
			  margin:       [30, 30, 30 ,30],
			  filename:     'effectif.pdf',
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
			  pdf.text("Universités Partenaires : UAM de Niamey - I A E et I S P E D de Bordeuax - I N T E C de Paris", pdf.internal.pageSize.getWidth() - 500, pdf.internal.pageSize.getHeight() - 40);
			} 
		  }).save();
		 
		}
	  </script>

	  <script>
		$(".inputs").keyup(function () {
		    if (this.value.length == this.maxLength) {
		      $(this).next('.inputs').focus();
		    }
		});
	</script>
	
	<script> 
	$(document).ready(function(){
		$(".btn-afficher-modal-rechercher-note").click(function(event) {
									
			$('.resultat11').html("");
			
			$('#semestre1').css('border-color', '');
			$('#matiere1').css('border-color', '');
			$('#typeNote1').css('border-color', '');
		    
		    $('.erreur_semestre1').html("");
		    $('.erreur_matiere1').html("");
		    $('.erreur_typeNote1').html("");
		    $('.erreur_note1').html("");
		    
		    $('#tableNote').DataTable().clear().draw();
	    });
	});
	</script>
	<script> 
	$(document).ready(function(){
		$(".btn-afficher-modal-note").click(function(event) {
			
			$('.resultat10').html("");
			 $("#form_ajouter_note")[0].reset() ;    
			
	    });
	});
	</script>
	
    <!-- end js include path -->
    <script src="jq_fic/rechercher_classe.js"></script>
    <script src="jq_fic/lister_eleve.js"></script>
    <script src="jq_fic/ajouter_note.js"></script>
 	<script src="jq_fic/lister_note.js"></script>
 	<script src="jq_fic/rechercher_note.js"></script>
 	<script src="jq_fic/charger_form_modif_note.js"></script>
 	<script src="jq_fic/modifier_note.js"></script>
 	<script src="jq_fic/lister_statut_paiement.js"></script>
 	<script src="jq_fic/charger_form_modif_eleve1.js"></script>
    <script src="jq_fic/modifier_eleve.js"></script>
    <script src="jq_fic/charger_form_supprimer_eleve.js"></script>
    <script src="jq_fic/rechercher_scolarite.js"></script>
    <script src="jq_fic/lister_scolarite.js"></script>
    <script src="jq_fic/charger_form_ajouter_versement.js"></script>
    <script src="jq_fic/charger_form_modif_scolarite.js"></script>
    <script src="jq_fic/ajouter_versement.js"></script>
    <script src="jq_fic/modifier_versement.js"></script>
 	<script src="jq_fic/supprimer_versement.js"></script>
 	<script src="jq_fic/charger_form_supprimer_versement.js"></script>
 	<script src="jq_fic/rechercher_bulletin.js"></script>
    <script src="jq_fic/charger_form_modif_bulletin.js"></script>
    <script src="jq_fic/modifier_bulletin.js"></script>
    <script src="jq_fic/rechercher_conduite1.js"></script>
    <script src="jq_fic/modifier_conduite.js"></script>
  </body>
</html>