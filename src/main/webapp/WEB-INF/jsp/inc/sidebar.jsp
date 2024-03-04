<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="sidebar-container">
 				<div class="sidemenu-container navbar-collapse collapse fixed-menu">
	                <div id="remove-scroll" class="left-sidemenu">
	                    <ul class="sidemenu  page-header-fixed slimscroll-style" data-keep-expanded="false" data-auto-scroll="true" data-slide-speed="200" style="padding-top: 20px">
	                        <li class="sidebar-toggler-wrapper hide">
	                            <div class="sidebar-toggler">
	                                <span></span>
	                            </div>
	                        </li>
	                        <li class="sidebar-user-panel">
	                            <div class="user-panel">
	                                <div class="pull-left image">
	                                    <img src="assets/img/user/11.png" class="img-circle user-img-circle" alt="User Image" />
	                                </div>
	                                <div class="pull-left info">
	                                    <p> Mr. Doudou</p>
	                                    <small>Diop</small>
	                                </div>
	                            </div>
	                        </li>
							
	                        <li class="nav-item active open">
	                            <a href="./" class="nav-link nav-toggle">
	                                <i class="material-icons">dashboard</i>
	                                <span class="title">Accueil</span>	                               
	                            </a>	                            
	                        </li>
							<li class="nav-item ">
	                            <a href="inscription" class="nav-link nav-toggle">
	                                <i class="material-icons">create</i>
	                                <span class="title">Inscription</span>	
	                                <span class="arrow"></span>                               
	                            </a>
	                            <ul class="sub-menu">
	                                <li class="nav-item  ">
	                                    <a href="inscription-nouveau" class="nav-link ">
	                                        <span class="title">Nouvel Elève</span>
	                                    </a>
	                                </li>
	                                <li class="nav-item  ">
	                                    <a href="inscription-ancien" class="nav-link ">
	                                        <span class="title">Ancien Elève</span>
	                                    </a>
	                                </li>	                                
	                            </ul>	                            
	                        </li>
	                        <li class="nav-item ">
	                            <a href="inscription" class="nav-link nav-toggle">
	                                <i class="material-icons">description</i>
	                                <span class="title">Note</span>	
	                                <span class="arrow"></span>                               
	                            </a>
	                            <ul class="sub-menu">
	                                <li class="nav-item  ">
	                                    <a href="ajouter-note" class="nav-link ">
	                                        <span class="title">Ajouter une Note</span>
	                                    </a>
	                                </li>
	                                <li class="nav-item  ">
	                                    <a href="rechercher-note" class="nav-link ">
	                                        <span class="title">Rechercher une Note</span>
	                                    </a>
	                                </li>	                                
	                            </ul>	                            
	                        </li>
	                        <li class="nav-item ">
	                            <a href="rechercher-classe" class="nav-link nav-toggle">
	                                <i class="material-icons">domain</i>
	                                <span class="title">Classe</span>
	                                <span class="arrow"></span>	                               
	                            </a>
	                            <ul class="sub-menu">
	                                <li class="nav-item  ">
	                                    <a href="liste-classe" class="nav-link ">
	                                        <span class="title">Liste des classes</span>
	                                    </a>
	                                </li>
	                                <li class="nav-item  ">
	                                    <a href="rechercher-classe" class="nav-link ">
	                                        <span class="title">Rechercher une classe</span>
	                                    </a>
	                                </li>	                                
	                            </ul>		                            
	                        </li>
							<li class="nav-item ">
	                            <a href="rechercher-eleve" class="nav-link nav-toggle">
	                                <i class="material-icons">people_outline</i>
	                                <span class="title">Rechercher Elève</span>	                               
	                            </a>	                            
	                        </li>
	                        <li class="nav-item ">
	                            <a href="rechercher-classe" class="nav-link nav-toggle">
	                                <i class="material-icons">domain</i>
	                                <span class="title">Années Antérieures</span>
	                                <span class="arrow"></span>	                               
	                            </a>
	                            <ul class="sub-menu">	                                
	                                <li class="nav-item  ">
	                                    <a href="rechercher-classe2" class="nav-link ">
	                                        <span class="title">Rechercher une classe</span>
	                                    </a>
	                                </li>	                                
	                            </ul>		                            
	                        </li>																					                       
	                    </ul>
	                </div>
                </div>
            </div>