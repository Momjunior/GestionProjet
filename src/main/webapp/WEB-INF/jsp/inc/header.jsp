<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="page-header navbar navbar-fixed-top">
            <div class="page-header-inner ">
                <!-- logo start -->
                <div class="page-logo">
                    <a href="./">
                    <img alt="" src="assets/img/logo1.png" style="width:32px; height:32px;">
                    <span class="logo-default" >School</span> </a>
                </div>
                <!-- logo end -->
				<ul class="nav navbar-nav navbar-left in">
					<li><a href="#" class="menu-toggler sidebar-toggler font-size-20"><i class="fa fa-exchange" aria-hidden="true"></i></a></li>
				</ul>
				 <!-- Start Apps Dropdown -->
                 <ul class="nav navbar-nav navbar-left in">
				 	<li class="dropdown dropdown-extended dropdown-notification " >
                            <a href="javascript:;" class="dropdown-toggle app-list-icon font-size-20" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
                                <i class="fa fa-th" aria-hidden="true"></i>
                            </a>
                            <ul class="dropdown-menu app-icon">
                            	<li class="app-dropdown-header">
                                    <p><span class="bold">Applications</span></p>
                                </li>
                                <li>
                                    <ul class="dropdown-menu-list app-icon-dropdown" data-handle-color="#637283">
										<li>
											<a href="annee-scolaire" class="patient-icon">
											<i class="material-icons">event_note</i>
											<span class="block">A. scolaire</span>
											</a>
										</li>
										<li>
											<a href="matiere" class="payment-icon">
											<i class="material-icons">subject</i>
											<span class="block">Matière</span>
											</a>
										</li>
								  		<li>
											<a href="coefficient" class="doctor-icon">
											<i class="material-icons">domain</i>
											<span class="block">Coefficient</span>
											</a>
										</li>
										<li>
											<a href="categorie" class="map-icon">
											<i class="material-icons">grade</i>
											<span class="block">Catégorie</span>
											</a>
										</li>
										<li>
											<a href="prof" class="appoint-icon">
											<i class="material-icons">people</i>
											<span class="block">Professeur</span>
											</a>
										</li>
									<!--	<li>
											<a href="classe" class="email-icon">
											<i class="material-icons">domain</i>
											<span class="block">Classe</span>
											</a>
										</li>-->	
										
											
									 	
									<!-- 	
										<li>
											<a href="detail-matiere" class="doctor-icon w-75">
											<i class="material-icons">domain</i>
											<span class="block">Dét. Matière</span>
											</a>
										</li>										
										-->									
                                    </ul>
                                </li>
                            </ul>
                        </li> 
                 </ul>
                 <!-- End Apps Dropdown -->
				 
                <ul class="nav navbar-nav navbar-left in">
                	<!-- start full screen button -->
                    <li><a href="javascript:;" class="fullscreen-click font-size-20"><i class="fa fa-arrows-alt"></i></a></li>
                    <!-- end full screen button -->
                </ul>
                <!-- start mobile menu -->
                <a href="javascript:;" class="menu-toggler responsive-toggler" data-toggle="collapse" data-target=".navbar-collapse">
                    <span></span>
                </a>
               <!-- end mobile menu -->
			   
                <!-- start header menu -->
                <div class="top-menu">
			
                   <ul class="nav navbar-nav pull-right">
					<li>
					<span class="mdl-chip mdl-chip--contact mt-3 mr-3">
					    <span class="mdl-chip__contact mdl-color--teal mdl-color-text--white">A.S</span>
					    <span id="as" class="mdl-chip__text">${anneeScolaire}</span>
					</span>
					</li>
					
                        <!-- start notification dropdown -->
                        
                        <!-- end notification dropdown -->
                        <!-- start message dropdown -->
 						
                        <!-- end message dropdown -->
 						<!-- start manage user dropdown -->
 						<li>
 						<button type="button" class="btn btn-circle btn-sm btn-primary mt-3 mr-2">Déconnexion</button>
 						</li>
                        <!-- end manage user dropdown -->
                        
                    </ul>
                </div>
				
            </div>
			
</div>
		