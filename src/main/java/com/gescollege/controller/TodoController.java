package com.gescollege.controller;


import java.io.File;
import java.io.IOException;
import java.math.RoundingMode;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.SortedSet;
import java.util.TreeSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.gescollege.service.AnneeScolaireService;
import com.gescollege.service.BulletinService;
import com.gescollege.service.IAnneeScolaireService;
import com.gescollege.service.IBulletinService;
import com.gescollege.service.ICategorieClasseService;
import com.gescollege.service.IClasseService;
import com.gescollege.service.ICoefficientService;
import com.gescollege.service.IMatiereEnseigneeService;
import com.gescollege.service.IDetailClasseService;
import com.gescollege.service.IEleveService;
import com.gescollege.service.IInscriptionService;
import com.gescollege.service.IMatiereService;
import com.gescollege.service.IMoyenneSemestreService;
import com.gescollege.service.IMoyenneService;
import com.gescollege.service.INoteService;
import com.gescollege.service.IProfesseurService;
import com.gescollege.service.IScolariteService;
import com.gescollege.service.IUserService;
import com.gescollege.model.AnneeScolaire;
import com.gescollege.model.Bulletin;
import com.gescollege.model.CategorieClasse;
import com.gescollege.model.Classe;
import com.gescollege.model.Coefficient;
import com.gescollege.model.MatiereEnseignee;
import com.gescollege.model.DetailClasse;
import com.gescollege.model.Eleve;
import com.gescollege.model.Inscription;
import com.gescollege.model.Matiere;
import com.gescollege.model.Moyenne;
import com.gescollege.model.MoyenneSemestre;
import com.gescollege.model.Note;
import com.gescollege.model.Professeur;
import com.gescollege.model.Scolarite;
import com.gescollege.model.User;

import java.util.logging.Level;
import java.util.logging.Logger;
import org.springframework.dao.DataAccessException;


@Controller
public class TodoController {
	    
	@Autowired
	private IUserService userService;
	
	@Autowired
	private IAnneeScolaireService anneeScolaireService;
	
	@Autowired
	private IClasseService classeService;
	
	@Autowired
	private IMatiereService matiereService;
	
	@Autowired
	private IInscriptionService inscriptionService;
	
	@Autowired
	private IEleveService eleveService;
	
	@Autowired
	private IScolariteService scolariteService;
	
	@Autowired
	private INoteService noteService;
	
	@Autowired
	private IBulletinService bulletinService;
	
	@Autowired
	private IProfesseurService professeurService;
	
	@Autowired
	private IMatiereEnseigneeService matiereEnseigneeService;
	
	@Autowired
	private ICategorieClasseService categorieService;
	
	@Autowired
	private IMoyenneService moyenneService;
	
	@Autowired
	private IMoyenneSemestreService moyenneSemestreService;
	
	@Autowired
	private IDetailClasseService detailClasseService;
	
	@Autowired
	private ICoefficientService coefficientService;
	
	
   // ************** Debut chargement des pages ************** 
    
    @RequestMapping(value = "/categorie", method = RequestMethod.GET)
 	public String showCategoriePage(ModelMap model) {
    	String anneeEnCours = anneeScolaireService.findDebutByStatutAnneeScolaire()+"-"+anneeScolaireService.findFinByStatutAnneeScolaire();    	

		model.put("anneeScolaire", anneeEnCours);
    	model.addAttribute("categorie", new CategorieClasse());
    	model.put("categories", categorieService.getAllCategories());
 		return "categorie";
 	}
    
    @RequestMapping(value = "/inscription-nouveau", method = RequestMethod.GET)
 	public String showInscriptionNouveauPage(ModelMap model) {
    	
    	String anneeEnCours = anneeScolaireService.findDebutByStatutAnneeScolaire()+"-"+anneeScolaireService.findFinByStatutAnneeScolaire();    	

		model.put("anneeScolaire", anneeEnCours);
    	model.addAttribute("eleve", new Eleve());
    	model.addAttribute("inscription", new Inscription());
    	model.put("inscriptions", inscriptionService.getAllInscriptions());
    	model.put("classes", classeService.getAllClasses());
    	model.put("categories", categorieService.getAllCategories());
 		return "inscription-nouveau";
 	}
    
    @RequestMapping(value = "/inscription-ancien", method = RequestMethod.GET)
 	public String showInscriptionAncienPage(ModelMap model) {
    	
    	String anneeEnCours = anneeScolaireService.findDebutByStatutAnneeScolaire()+"-"+anneeScolaireService.findFinByStatutAnneeScolaire();    	

		model.put("anneeScolaire", anneeEnCours);
    	model.addAttribute("eleve", new Eleve());
    	model.addAttribute("inscription", new Inscription());
    	model.put("inscriptions", inscriptionService.getAllInscriptions());
    	model.put("classes", classeService.getAllClasses());
    	model.put("categories", categorieService.getAllCategories());
 		return "inscription-ancien";
 	} 
    
    @RequestMapping(value = "/rechercher-eleve", method = RequestMethod.GET)
 	public String showRechercherElevePage(ModelMap model) {
    	
    	String anneeEnCours = anneeScolaireService.findDebutByStatutAnneeScolaire()+"-"+anneeScolaireService.findFinByStatutAnneeScolaire();    	

		model.put("anneeScolaire", anneeEnCours);
    	model.addAttribute("rechercher-eleve", new Eleve());
    	model.addAttribute("eleve", new Eleve());
    	model.addAttribute("inscription", new Inscription());
    	model.put("classes", classeService.getAllClasses());
    	model.put("matieres", matiereService.getAllMatieres());
    	model.put("profs", professeurService.getAllProfesseurs());
    	model.put("inscriptions", inscriptionService.getAllInscriptions());
 		return "rechercher-eleve";
 	}
       
    @RequestMapping(value = "/eleve", method = RequestMethod.GET)
 	public String showElevePage(ModelMap model, @RequestParam(value="id") Integer id) {
    	
    	Eleve eleveExist = eleveService.findByIdEleve(id);
    	
    	if (eleveExist == null) {
			return "erreur";
		} 
		else
		{
			
	    	String matricule = eleveExist.getMatricule();
			String nom = eleveExist.getNom();	
			String prenom = eleveExist.getPrenom();
			String sexe = eleveExist.getSexe();
			Date dateNaiss = eleveExist.getDateNaiss();
			String tel = eleveExist.getTel();
	    	
	    	String anneeEnCours = anneeScolaireService.findDebutByStatutAnneeScolaire()+"-"+anneeScolaireService.findFinByStatutAnneeScolaire();
	    	
	    	Inscription inscriptionExist = inscriptionService.findByIdEleveAndAnneeEnCours(id);
	    	long idClasse = inscriptionExist.getDetailClasse().getClasse().getIdClasse();
  			String nomClasse = classeService.findNomClasseByIdClasse(idClasse);
  			String categ = inscriptionExist.getDetailClasse().getCategorieClasse().getNomCategorie();
  			String classe = nomClasse+" "+categ;   
  		    	    	
	    	model.put("anneeScolaire", anneeEnCours);
	    	model.addAttribute("eleve", new Eleve());
	    	model.addAttribute("inscription", new Inscription());
	    	model.put("classes", classeService.getAllClasses());
	    	model.put("matieres", matiereService.getAllMatieres());
	    	model.put("profs", professeurService.getAllProfesseurs());
	    	
	    	model.put("matricule", matricule);  
	    	model.put("nom", nom); 
	    	model.put("prenom", prenom); 
	    	model.put("sexe", sexe); 
	    	model.put("dateNaiss", dateNaiss);
	    	model.put("tel", tel); 	  
	    	model.put("nomClasse", classe);
	    	
	 		return "eleve";	
		}
    
 	}
    
    @RequestMapping(value = "/classe", method = RequestMethod.GET)
 	public String showClassePage(ModelMap model, @RequestParam(value="id") Integer id) {
    	
    	DetailClasse detailClasseExist = detailClasseService.findDetailClasseByIdDetailClasse(id);
    	
    	if (detailClasseExist == null) {
			return "erreur";
		} 
		else
		{
		 	String anneeEnCours = anneeScolaireService.findDebutByStatutAnneeScolaire()+"-"+anneeScolaireService.findFinByStatutAnneeScolaire();    	
	    	
	    	List<Inscription>  listeInscriptions = inscriptionService.listInscriptionByClasse(detailClasseExist.getIdDetailClasse());
	    	
	    	String nomClasse = detailClasseExist.getClasse().getNomClasse();
	    	String categorie = detailClasseExist.getCategorieClasse().getNomCategorie();
	    	int effectif = inscriptionService.findEffectifClasse(detailClasseExist.getIdDetailClasse());
	    	
	    	model.put("maClasse", nomClasse+" "+categorie);
	    	model.put("anneeScolaire", anneeEnCours);
	    	model.put("inscriptions", listeInscriptions);
	    	model.put("profs", professeurService.getAllProfesseurs());
	    	model.put("effectif", effectif);
	    	model.put("matieres", matiereService.getAllMatieres());
	    	model.addAttribute("eleve", new Eleve());
	    	model.addAttribute("classe", new Classe());
	    	 
	 		return "classe";
		}  	
   
 	}
       
    @RequestMapping(value = "/rechercher-classe", method = RequestMethod.GET)
  	public String showSearchClassePage(ModelMap model) {
     	
    	String anneeEnCours = anneeScolaireService.findDebutByStatutAnneeScolaire()+"-"+anneeScolaireService.findFinByStatutAnneeScolaire();    	

    		model.put("anneeScolaire", anneeEnCours);
	    	model.put("profs", professeurService.getAllProfesseurs());
	    	model.put("matieres", matiereService.getAllMatieres());
	    	model.put("classes", classeService.getAllClasses());
	    	model.put("categories", categorieService.getAllCategories());
	    	model.addAttribute("eleve", new Eleve());
	    	model.addAttribute("classe", new Classe());
	    	 
	 		return "rechercher-classe"; 	
    
  	}
    
    @RequestMapping(value = "/ajouter-note", method = RequestMethod.GET)
  	public String showNotePage(ModelMap model) {
     	
    	String anneeEnCours = anneeScolaireService.findDebutByStatutAnneeScolaire()+"-"+anneeScolaireService.findFinByStatutAnneeScolaire();    	

    		model.put("anneeScolaire", anneeEnCours);
	    	model.put("profs", professeurService.getAllProfesseurs());
	    	model.put("matieres", matiereService.getAllMatieres());
	    	model.put("classes", classeService.getAllClasses());
	    	model.put("categories", categorieService.getAllCategories());
	    	model.addAttribute("eleve", new Eleve());
	    	model.addAttribute("classe", new Classe());
	    	 
	 		return "ajouter-note"; 	
    
  	}
    
    @RequestMapping(value = "/rechercher-note", method = RequestMethod.GET)
  	public String searchNotePage(ModelMap model) {
     	
    	String anneeEnCours = anneeScolaireService.findDebutByStatutAnneeScolaire()+"-"+anneeScolaireService.findFinByStatutAnneeScolaire();    	

    		model.put("anneeScolaire", anneeEnCours);
	    	model.put("profs", professeurService.getAllProfesseurs());
	    	model.put("matieres", matiereService.getAllMatieres());
	    	model.put("classes", classeService.getAllClasses());
	    	model.put("categories", categorieService.getAllCategories());
	    	model.addAttribute("eleve", new Eleve());
	    	model.addAttribute("classe", new Classe());
	    	 
	 		return "rechercher-note"; 	
    
  	}
    
    @RequestMapping(value = "/annee-scolaire", method = RequestMethod.GET)
 	public String showAnneeScolairePage(ModelMap model) {
    	
    	String anneeEnCours = anneeScolaireService.findDebutByStatutAnneeScolaire()+"-"+anneeScolaireService.findFinByStatutAnneeScolaire();    	

		model.put("anneeScolaire", anneeEnCours);
    	model.addAttribute("annee-scolaire", new AnneeScolaire());
    	model.put("annees", anneeScolaireService.getAllAnneeScolaires());
 		return "annee-scolaire";
 	}
    
    @RequestMapping(value = "/liste-classe", method = RequestMethod.GET)
 	public String showListeClassePage(ModelMap model) {
    	model.addAttribute("detailClasse", new DetailClasse());
    	model.addAttribute("classe", new Classe());
    	model.addAttribute("categorie", new CategorieClasse());
    	
    	model.put("classes", classeService.getAllClasses());
    	model.put("categories", categorieService.getAllCategories());
    	
    	String anneeEnCours = anneeScolaireService.findDebutByStatutAnneeScolaire()+"-"+anneeScolaireService.findFinByStatutAnneeScolaire();
    	
    	model.put("anneeScolaire", anneeEnCours);
    	
    	List<DetailClasse> listeClasses = detailClasseService.getAllDetailClasses(); 	
    	
    	 for(DetailClasse s: listeClasses)
		 {
    		int effectif = inscriptionService.findEffectifClasse(s.getIdDetailClasse());
    		int effectifG = inscriptionService.findEffectifGarcon(s.getIdDetailClasse());
    		int effectifF = inscriptionService.findEffectifFille(s.getIdDetailClasse());

    		s.setEffectif(effectif);
    		s.setEffectifGarcon(effectifG);
    		s.setEffectifFille(effectifF);    		 
		 }
    	
    	model.put("detailClasses", detailClasseService.getAllDetailClasses());
    	
 		return "liste-classe";
 	}
    
    @RequestMapping(value = "/matiere", method = RequestMethod.GET)
 	public String showMatierePage(ModelMap model) {
    	String anneeEnCours = anneeScolaireService.findDebutByStatutAnneeScolaire()+"-"+anneeScolaireService.findFinByStatutAnneeScolaire();    	

		model.put("anneeScolaire", anneeEnCours);
    	model.addAttribute("matiere", new Matiere());
    	model.put("matieres", matiereService.getAllMatieres());
    	model.put("classes", classeService.getAllClasses());
 		return "matiere";
 	}
    
    @RequestMapping(value = "/detail-matiere", method = RequestMethod.GET)
 	public String showDetailMatierePage(ModelMap model) {
    	String anneeEnCours = anneeScolaireService.findDebutByStatutAnneeScolaire()+"-"+anneeScolaireService.findFinByStatutAnneeScolaire();    	

    	AnneeScolaire anneeScolaireExist = anneeScolaireService.findAnneeEnCours();
    	
		model.put("anneeScolaire", anneeEnCours);
    	model.addAttribute("matiere", new Matiere());
    	model.put("matieres", matiereService.getAllMatieres());
    	model.put("classes", classeService.getAllClasses());
    	
    	if (anneeScolaireExist != null) {
    		model.put("coefs", coefficientService.getAllCoefficientsByAnnee(anneeScolaireService.findIdByStatutAnneeScolaire()));
		} 
		else
		{
			model.put("coefs", coefficientService.getAllCoefficientsByAnnee(0));
		}
 		return "detail-matiere";
 	}
    
    @RequestMapping(value = "/coefficient", method = RequestMethod.GET)
 	public String showCoefficientPage(ModelMap model) {
    	
    	String anneeEnCours = anneeScolaireService.findDebutByStatutAnneeScolaire()+"-"+anneeScolaireService.findFinByStatutAnneeScolaire();    
    	
    	AnneeScolaire anneeScolaireExist = anneeScolaireService.findAnneeEnCours();

		model.put("anneeScolaire", anneeEnCours);
    	model.addAttribute("matiere", new Matiere());
    	model.addAttribute("annee-scolaire", new AnneeScolaire());
    	model.put("matieres", matiereService.getAllMatieres());
    	model.put("classes", classeService.getAllClasses());
    	
    	if (anneeScolaireExist != null) {
    		model.put("coefs", coefficientService.getAllCoefficientsByAnnee(anneeScolaireService.findIdByStatutAnneeScolaire()));
		} 
		else
		{
			model.put("coefs", coefficientService.getAllCoefficientsByAnnee(0));
		}
    	
 		return "coefficient";
 	}
    
    @RequestMapping(value = "/prof", method = RequestMethod.GET)
 	public String showProfPage(ModelMap model) {
    	
    	String anneeEnCours = anneeScolaireService.findDebutByStatutAnneeScolaire()+"-"+anneeScolaireService.findFinByStatutAnneeScolaire();    	

		model.put("anneeScolaire", anneeEnCours);
    	model.addAttribute("prof", new Professeur());
    	model.put("profs", professeurService.getAllProfesseurs());
    	model.put("classes", classeService.getAllClasses());
    	model.put("matieres", matiereService.getAllMatieres());
 		return "prof";
 	}
    // ************** Fin chargement des pages ************** //
    
 // ************** Debut creation ************** 
    
    @PostMapping("/creerUtilisateur")
	public ResponseEntity<String> addUser(@Valid User user, BindingResult result,ModelMap modelMap) {

		long idUser = user.getIdUser();		
		String login = user.getLogin();		
		
		if (result.hasErrors()) {
			return new ResponseEntity<String>("Erreur survenue lors de l'enregistrement: " , HttpStatus.BAD_REQUEST);
		}
		
		User userExist = userService.findByLoginAndIdUserNot(login, idUser);
		
		if (userExist != null) {
			return new ResponseEntity<String>("Ce login existe déjà!!!", HttpStatus.BAD_REQUEST);
		} 
		else
		{
			userService.saveUser(user);		
			return new ResponseEntity<String>("ok" + result, HttpStatus.OK);	
		}
	}
    
    @PostMapping("/ajouterAnneeScolaire")
	public ResponseEntity<String> addAnneeScolaire(@Valid AnneeScolaire anneeScolaire, BindingResult result,ModelMap modelMap) {

		String debut = anneeScolaire.getDebut()	;
		String fin = anneeScolaire.getFin()	;	
		
		if (result.hasErrors()) {
			return new ResponseEntity<String>("Erreur survenue lors de l'enregistrement: " , HttpStatus.BAD_REQUEST);
		}
		
		List<Classe> classeList = classeService.getAllClasses();
		
		if (classeList.isEmpty()) 
		{			
			return new ResponseEntity<String>("Veuillez ajouter au moins une classe!!!", HttpStatus.BAD_REQUEST);
		}
		else
		{
			List<Matiere> matiereList = matiereService.getAllMatieres();
			
			if (matiereList.isEmpty()) 
			{			
				return new ResponseEntity<String>("Veuillez ajouter au moins une matière!!!", HttpStatus.BAD_REQUEST);
			}
			else
			{

				AnneeScolaire anneeScolaireExist = anneeScolaireService.findByDebutAndFin(debut, fin);
				
				if (anneeScolaireExist != null) {
					return new ResponseEntity<String>("Cette année scolaire existe déjà!!!", HttpStatus.BAD_REQUEST);
				} 
				else
				{
					AnneeScolaire anneeScolaireEncoursExist = anneeScolaireService.findAnneeEnCours();
					
					if (anneeScolaireEncoursExist == null) {				
						
						anneeScolaire.setStatut("en cours");
						
					}
					
					anneeScolaireService.saveAnneeScolaire(anneeScolaire);	
							
					List<Classe>  listeClasses = classeService.getAllClasses();
					List<Matiere>  listeMatieres = matiereService.getAllMatieres();
					
					 for (Classe c : listeClasses) {
						 for (Matiere m : listeMatieres) {
							 Coefficient coefficient = new Coefficient();
							 Classe classe = new Classe();
							 Matiere matiere = new Matiere();
						  		
						  	 long idClasse = c.getIdClasse();
						     long idMatiere = m.getIdMatiere();
						  		
						  	 classe.setIdClasse(idClasse);
						  	 matiere.setIdMatiere(idMatiere);
							 
							 coefficient.setAnneeScolaire(anneeScolaire);
							 coefficient.setClasse(classe);
							 coefficient.setMatiere(matiere);
							 coefficient.setValeur(0);
							 
							 coefficientService.saveCoefficient(coefficient);
						 } 
					 }
											
					return new ResponseEntity<String>("ok" + result, HttpStatus.OK);	
				}
			}
			
		}
		
		
	}
    
    @PostMapping("/ajouterClasse")
  	public ResponseEntity<String> addClasse(@Valid Classe classe, BindingResult result,ModelMap modelMap) {

  		String clas = classe.getNomClasse();
  		
  		if (result.hasErrors()) {
  			return new ResponseEntity<String>("Erreur survenue lors de l'enregistrement: " , HttpStatus.BAD_REQUEST);
  		}
  		
  		Classe classeExist = classeService.findByNomClasse(clas);
  		
  		if (classeExist != null) {
  			return new ResponseEntity<String>("Cette classe existe déjà!!!", HttpStatus.BAD_REQUEST);
  		} 
  		else
  		{
  			classeService.saveClasse(classe);	
  			return new ResponseEntity<String>("ok" + result, HttpStatus.OK);	
  		}
  	}
    
    @PostMapping("/ajouterCoefficient")
  	public ResponseEntity<String> addCoefficient(@Valid Coefficient coefficient, BindingResult result,ModelMap modelMap, @RequestParam(name = "classe") long idClasse , @RequestParam(name = "classe") long idMatiere) {
  		
  		if (result.hasErrors()) {
  			return new ResponseEntity<String>("Erreur survenue lors de l'enregistrement: " , HttpStatus.BAD_REQUEST);
  		}
  		 AnneeScolaire anneeScolaireExist = anneeScolaireService.findAnneeEnCours();
  		
  		if (anneeScolaireExist == null) {
  			return new ResponseEntity<String>("Année scolaire non définie!!!", HttpStatus.BAD_REQUEST);
  		} 
  		else
  		{
  			 Coefficient coefficientExist = coefficientService.findCoefficient(anneeScolaireExist.getIdAnneeScolaire(), idClasse, idMatiere);
  			 
  			if (coefficientExist != null) {
  	  			return new ResponseEntity<String>("Ce coefficient existe déjà!!!", HttpStatus.BAD_REQUEST);
  	  		} 
  	  		else
  	  		{
  	  		AnneeScolaire annee = new AnneeScolaire();
  	  		Matiere matiere = new Matiere();
  	  		Classe classe = new Classe();
  	  		
  	  		annee.setIdAnneeScolaire(anneeScolaireExist.getIdAnneeScolaire());
  	  		matiere.setIdMatiere(idMatiere);
  	  		classe.setIdClasse(idClasse);
  	  		
  	  		coefficient.setAnneeScolaire(annee);
  	  		coefficient.setMatiere(matiere);
  	  		coefficient.setClasse(classe);
  	  		coefficientService.saveCoefficient(coefficient)	;
  			return new ResponseEntity<String>("ok" + result, HttpStatus.OK);		
  	  		} 
  			
  		}
  	}
    
    @PostMapping("/ajouterMatiere")
  	public ResponseEntity<String> addMatiere(@Valid Matiere matiere, BindingResult result,ModelMap modelMap) {

  		String nom = matiere.getNomMatiere();
  		
  		if (result.hasErrors()) {
  			return new ResponseEntity<String>("Erreur survenue lors de l'enregistrement: " , HttpStatus.BAD_REQUEST);
  		}
  		
  		Matiere matiereExist = matiereService.findByNomMatiere(nom);
  		
  		if (matiereExist != null) {
  			return new ResponseEntity<String>("Cette matière existe déjà!!!", HttpStatus.BAD_REQUEST);
  		} 
  		else
  		{
  			matiereService.saveMatiere(matiere);	
  			return new ResponseEntity<String>("ok" + result, HttpStatus.OK);	
  		}
  	}
    
    @PostMapping("/ajouterMatiereEnseignee")
  	public ResponseEntity<String> addMatiereEnseignee(@Valid Matiere matiere1, BindingResult result,ModelMap modelMap, @RequestParam(name = "idClasse") long idClasse,@RequestParam(name = "idMatiere") long idMatiere, @RequestParam(name = "idProf") long idProf) {

  		if (result.hasErrors()) {
  			return new ResponseEntity<String>("Erreur survenue lors de l'enregistrement: " , HttpStatus.BAD_REQUEST);
  		}
  		
  		AnneeScolaire anneeEnCoursExist = anneeScolaireService.findAnneeEnCours();
  		if(anneeEnCoursExist == null)
  		{
  			return new ResponseEntity<String>("Année scolaire non définie !!!" , HttpStatus.BAD_REQUEST);
  		}
  		else
  		{
  			MatiereEnseignee matiereExist = matiereEnseigneeService.findMatiereEnseignee(anneeEnCoursExist.getIdAnneeScolaire(), idMatiere, idClasse, idProf);
  			if(matiereExist == null)
  	  		{
  				MatiereEnseignee matiereEnseignee = new MatiereEnseignee();
  				AnneeScolaire anneeScolaire = new AnneeScolaire();
  				Matiere matiere = new Matiere();
  				Classe classe = new Classe();
  				Professeur prof = new Professeur();
  				
  				anneeScolaire.setIdAnneeScolaire(anneeEnCoursExist.getIdAnneeScolaire());
  				matiere.setIdMatiere(idMatiere);
  				classe.setIdClasse(idClasse);
  				prof.setIdProfesseur(idProf);
  				
  				matiereEnseignee.setAnneeScolaire(anneeScolaire);
  				matiereEnseignee.setMatiere(matiere);
  				matiereEnseignee.setClasse(classe);
  				matiereEnseignee.setProfesseur(prof);
  	  			matiereEnseigneeService.saveMatiereEnseignee(matiereEnseignee);
  	  	
  	  			
  	  		return new ResponseEntity<String>("ok" + result, HttpStatus.OK);
  	  		}
  			else
  			{
  				return new ResponseEntity<String>("Matière déjà enregistrée !!!" , HttpStatus.BAD_REQUEST);
  			}
  			
  		}
  		
  		/*
  		Matiere matiereExist = matiereService.findByNomMatiere(nom);
  		
  		if (matiereExist != null) {
  			return new ResponseEntity<String>("Cette matière existe déjà!!!", HttpStatus.BAD_REQUEST);
  		} 
  		else
  		{
  			matiereService.saveMatiere(matiere);	
  			return new ResponseEntity<String>("ok" + result, HttpStatus.OK);	
  		}*/
  		
  	}
    
    @PostMapping("/ajouterCategorie")
  	public ResponseEntity<String> addCategorie(@Valid CategorieClasse categorie, BindingResult result,ModelMap modelMap) {

  		String nom = categorie.getNomCategorie();
  		
  		if (result.hasErrors()) {
  			return new ResponseEntity<String>("Erreur survenue lors de l'enregistrement: " , HttpStatus.BAD_REQUEST);
  		}
  		
  		CategorieClasse categorieExist = categorieService.findByNomCategorie(nom);
  		
  		if (categorieExist != null) {
  			return new ResponseEntity<String>("Cette catégorie existe déjà!!!", HttpStatus.BAD_REQUEST);
  		} 
  		else
  		{
  			categorieService.saveCategorieClasse(categorie)	;
  			return new ResponseEntity<String>("ok" + result, HttpStatus.OK);	
  		}
  	}
    
    @PostMapping("/ajouterProf")
  	public ResponseEntity<String> addProf(@Valid Professeur prof, BindingResult result,ModelMap modelMap, @RequestParam(name = "nom") String nom, @RequestParam(name = "prenom") String prenom, @RequestParam(name = "sexe") String sexe, @RequestParam(name = "jourNaiss") String jourNaiss, @RequestParam(name = "moisNaiss") String moisNaiss,@RequestParam(name = "anneeNaiss") String anneeNaiss, @RequestParam(name = "tel") String tel) throws ParseException
    {
  		
  		if (result.hasErrors()) {
  			return new ResponseEntity<String>("Erreur survenue lors de l'enregistrement: " , HttpStatus.BAD_REQUEST);
  		}
  		Date fecha;		
		String dateNaiss = anneeNaiss+"-"+moisNaiss+"-"+jourNaiss;
		try {
			fecha = new SimpleDateFormat("yyyy-MM-dd").parse(dateNaiss);
			prof.setDateNaiss(fecha);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		   prof.setNom(nom);
		   prof.setPrenom(prenom);
		   prof.setSexe(sexe);
		   prof.setTel(tel);
		   professeurService.saveProfesseur(prof)	;
  		
		   return new ResponseEntity<String>("ok" + result, HttpStatus.OK);			
  	}
    
    @PostMapping("/ajouterInscription")
  	public ResponseEntity<String> addInscription(@Valid Eleve eleve, BindingResult result,ModelMap modelMap, @RequestParam(name = "classe") String nomClasse,@RequestParam(name = "categorie") String categorie,  @RequestParam(name = "versement") long versement, @RequestParam(name = "dateInscrip") String dateInscrip, @RequestParam(name = "jourNaiss") String jourNaiss, @RequestParam(name = "moisNaiss") String moisNaiss,@RequestParam(name = "anneeNaiss") String anneeNaiss, @RequestParam(name = "idEleve") long idEleve) throws ParseException
    {
  		
  		if (result.hasErrors()) {
  			return new ResponseEntity<String>("Erreur survenue lors de l'enregistrement: " , HttpStatus.BAD_REQUEST);
  		}
  		String matricule = null;
  		
  		AnneeScolaire anneeEnCoursExist = anneeScolaireService.findAnneeEnCours();
  		if(anneeEnCoursExist == null)
  		{
  			return new ResponseEntity<String>("Année scolaire non définie !!!" , HttpStatus.BAD_REQUEST);
  		}
  		else
  		{

  	  		if(idEleve == 0)
  	  		{
  	  			matricule = eleve.getMatricule();
  	  			Eleve eleveExist = eleveService.findByMatricule(matricule);
  	  			if(eleveExist != null)
  	  			{
  	  				return new ResponseEntity<String>("Ce matricule existe déjà !!!" , HttpStatus.BAD_REQUEST);
  	  			}
  	  			else
  	  			{
  	  				Date fecha;		
  					String dateNaiss = anneeNaiss+"-"+moisNaiss+"-"+jourNaiss;
  					try {
  						fecha = new SimpleDateFormat("yyyy-MM-dd").parse(dateNaiss);
  						eleve.setDateNaiss(fecha);
  					} catch (ParseException e) {
  						// TODO Auto-generated catch block
  						e.printStackTrace();
  					}
  	  				eleveService.saveEleve(eleve);	
  			  			matricule = eleve.getMatricule();			
  	  			}
  	  		}
  	  		else
  	  		{
  	  			Inscription inscripExist = inscriptionService.findByIdEleveAndAnneeEnCours(idEleve);
  	  	  		
  					if(inscripExist != null)
  					{
  						return new ResponseEntity<String>("Cet élève est déjà inscrit !!!" , HttpStatus.BAD_REQUEST);
  					}					
  	  		}
  	  	  		
  	  			
  		  		AnneeScolaire annee = new AnneeScolaire();
  		  		Classe classe = new Classe();
  		  		CategorieClasse categorieClasse = new CategorieClasse();
  		  		
  		  		long idClasse = classeService.findIdByNomClasse(nomClasse);
  		  		long idCategorie = categorieService.findIdByCategorie(categorie);
  		  		
  		  		classe.setIdClasse(idClasse);
  		  		categorieClasse.setIdCategorieClasse(idCategorie);
  		  		
  		  		annee.setIdAnneeScolaire(anneeScolaireService.findIdByStatutAnneeScolaire());
  		  		
  		  		
  		  		
  		  		DetailClasse detailClasseExist = detailClasseService.findDetailClasseByNomAndAnnee(anneeScolaireService.findIdByStatutAnneeScolaire(), idClasse, idCategorie);
  		  		
  		  		Inscription inscrip = new Inscription();
		  		inscrip.setEleve(eleve);System.out.println("date inscript est "+dateInscrip);
		  		String pattern = "yyyy-MM-dd";
		  		Date date2 = new SimpleDateFormat(pattern).parse(dateInscrip);
		  		inscrip.setDateInscription(date2);
		  		inscrip.setMontant(versement);
		  		
  		  		if(detailClasseExist == null)
  		  		{
  		  			DetailClasse detailClasse = new DetailClasse();
  		  			detailClasse.setAnneeScolaire(annee);
  		  			detailClasse.setClasse(classe);
  		  			detailClasse.setCategorieClasse(categorieClasse);
  		  			detailClasseService.saveDetailClasse(detailClasse);
  		  			
  		  			inscrip.setDetailClasse(detailClasse);
  		  			
	  		  	
  		  		}
  		  		else {
  		  				inscrip.setDetailClasse(detailClasseExist);
  		  		}
  		  		
  		  		inscriptionService.saveInscription(inscrip);
  		  		/*Date dateVersement;		
  				try {
  					dateVersement = new SimpleDateFormat("dd-MM-yyyy").parse(dateInscrip);
  					scolarite.setDateVersement( dateVersement);
  				} catch (ParseException e) {
  					// TODO Auto-generated catch block
  					e.printStackTrace();
  				}
  		  		scolarite.setInscription(inscrip);
  		  		
  		  		scolarite.setMontantVersement(versement);
  		  		scolariteService.saveScolarite(scolarite);
  	  		*/
  		  		return new ResponseEntity<String>(matricule, HttpStatus.OK);	
  		}
  				
  	}
    
    @PostMapping("/ajouterVersement")
  	public ResponseEntity<String> addVersement(@Valid Classe classe, BindingResult result,ModelMap modelMap,@RequestParam(name = "idInscription") long idInscription,@RequestParam(name = "mois") String mois, @RequestParam(name = "versement") long versement) {

  		String date = java.time.LocalDate.now().toString();
  		if (result.hasErrors()) {
  			return new ResponseEntity<String>("Erreur survenue lors de l'enregistrement: " , HttpStatus.BAD_REQUEST);
  		}
  		
  		Inscription inscriptionExist = inscriptionService.findByIdInscription(idInscription);
  		  		
  		if (inscriptionExist == null) {
  			return new ResponseEntity<String>("Cette inscription n'existe pas!!!", HttpStatus.BAD_REQUEST);
  		} 
  		else
  		{  			
  			Scolarite scolariteExist = scolariteService.findScolariteByInscriptionAndMois(inscriptionExist.getIdInscription(), mois);
  			
  			if (scolariteExist != null) {
  	  			return new ResponseEntity<String>("le versement de "+mois+" a déjà été effectué!!!", HttpStatus.BAD_REQUEST);
  	  		} 
  	  		else
  	  		{ 
  	  			Scolarite scolarite = new Scolarite();

  	  			Date dateVersement;		
  				try {
  					dateVersement = new SimpleDateFormat("yyyy-MM-dd").parse(date);
  					scolarite.setDateVersement( dateVersement);
  				} catch (ParseException e) {
  					// TODO Auto-generated catch block
  					e.printStackTrace();
  				}
  	  			scolarite.setMontantVersement(versement);
  	  			scolarite.setMois(mois);
  	  			scolarite.setInscription(inscriptionExist);
  	  			scolariteService.saveScolarite(scolarite)	;
  	  			return new ResponseEntity<String>("ok" + result, HttpStatus.OK);
  	  		}
  				
  		}
  	}


    
    
    @PostMapping("/ajouterNote")
  	public ResponseEntity<String> addNote(@Valid Note notes, BindingResult result,ModelMap modelMap,@RequestParam(name = "semestre") int semestre, @RequestParam(name = "matiere") long idMatiere, @RequestParam(name = "typeNote") String typeNote, @RequestParam(name = "listeNote") String listeNote, @RequestParam(name = "jourEpreuve") String jourEpreuve, @RequestParam(name = "moisEpreuve") String moisEpreuve, @RequestParam(name = "anneeEpreuve") String anneeEpreuve) throws ParseException
    {
  		//String date = java.time.LocalDate.now().toString();
  		if (result.hasErrors()) {
  			return new ResponseEntity<String>("Erreur survenue lors de l'enregistrement: " , HttpStatus.BAD_REQUEST);
  		}
  		
  		String listeNote1[] = listeNote.split(",");
  		
  		List<Note> noteList = null;
  		boolean test = true;
  		
  		if(typeNote.equals("composition"))
		{
  			for(int i =0; i< listeNote1.length; i++)
  	  		{
  				String data[] = listeNote1[i].split("\\+");
  				
				 noteList = noteService.findListeNoteCompo1Exist(Long.parseLong(data[0]), idMatiere);  	  			
  		  		
  	  		}
  			if (noteList.isEmpty())
  			{

  	  			for(int i =0; i< listeNote1.length; i++)
  	  	  		{
  	  				String data[] = listeNote1[i].split("\\+");
  	  				
	  		  		Inscription inscription = new Inscription();
	  		  		Matiere matiere = new Matiere();
	  		  		Note maNote = new Note();
	  		  		Float resultat = new Float(data[1]);
	  		  		
	  		  		inscription.setIdInscription(Long.parseLong(data[0]));
	  	  			matiere.setIdMatiere(idMatiere);  
	  	  			
	  	  		   Date fecha;		
					String dateEpreuve = anneeEpreuve+"-"+moisEpreuve+"-"+jourEpreuve;
					try {
						fecha = new SimpleDateFormat("yyyy-MM-dd").parse(dateEpreuve);
						maNote.setDateEpreuve(fecha);
					} catch (ParseException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
	
	  	  			maNote.setInscription(inscription);
	  	  			maNote.setMatiere(matiere);
	  	  			maNote.setSemestre(semestre);
	  	  			maNote.setTypeNote(typeNote);
	  	  			maNote.setNote(resultat);
		  			noteService.saveNote(maNote)	;
  	  	  		}
  	  			
  	  		return new ResponseEntity<String>("ok" + result, HttpStatus.OK);
	  		} 
	  		else
	  		{
	  			return new ResponseEntity<String>("Les notes de composition ont déjà été attribuées!!!", HttpStatus.BAD_REQUEST);
	  		}
  			
		}  
  		else
  		{
  			for(int i =0; i< listeNote1.length; i++)
	  	  		{
	  				String data[] = listeNote1[i].split("\\+");
	  				
  		  		Inscription inscription = new Inscription();
  		  		Matiere matiere = new Matiere();
  		  		Note maNote = new Note();
  		  		Float resultat = new Float(data[1]);
  		  		
  		  		inscription.setIdInscription(Long.parseLong(data[0]));
  	  			matiere.setIdMatiere(idMatiere);  	
  	  			
	  	  		Date fecha;		
				String dateEpreuve = anneeEpreuve+"-"+moisEpreuve+"-"+jourEpreuve;
				try {
					fecha = new SimpleDateFormat("yyyy-MM-dd").parse(dateEpreuve);
					maNote.setDateEpreuve(fecha);
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

  	  			maNote.setInscription(inscription);
  	  			maNote.setMatiere(matiere);
  	  			maNote.setSemestre(semestre);
  	  			maNote.setTypeNote(typeNote);
  	  			maNote.setNote(resultat);
	  			noteService.saveNote(maNote)	;
	  	  		}
	  			
	  		return new ResponseEntity<String>("ok" + result, HttpStatus.OK);
  		}
  	}
    
    
    @PostMapping("/ajouterDetailMatiere")
  	public ResponseEntity<String> addDetailMatiere(@Valid MatiereEnseignee MatiereEnseignee, BindingResult result,ModelMap modelMap, @RequestParam(name = "listeDetailMatiere") String listeDetailMatiere) throws ParseException
    {
  		//String date = java.time.LocalDate.now().toString();
  		if (result.hasErrors()) {
  			return new ResponseEntity<String>("Erreur survenue lors de l'enregistrement: " , HttpStatus.BAD_REQUEST);
  		}
	  			
	  		return new ResponseEntity<String>("ok" + result, HttpStatus.OK);
  		
  	}
    
    /*
    @PostMapping("/ajouterNote")
  	public ResponseEntity<String> addNote(@Valid Note note, BindingResult result,ModelMap modelMap,@RequestParam(name = "idEleve5") long idEleve,@RequestParam(name = "semestre") String semestre, @RequestParam(name = "matiere") long matiere, @RequestParam(name = "typeNote") String typeNote, @RequestParam(name = "maNote") String maNote) throws ParseException
    {
    	System.out.println("etape 1");
  		//String date = java.time.LocalDate.now().toString();
  		if (result.hasErrors()) {
  			return new ResponseEntity<String>("Erreur survenue lors de l'enregistrement: " , HttpStatus.BAD_REQUEST);
  		}
  		
  		Eleve eleveExist = eleveService.findByIdEleve(idEleve);
  		
  		if (eleveExist == null) {
  			return new ResponseEntity<String>("Cet élève n'existe pas!!!", HttpStatus.BAD_REQUEST);
  		} 
  		else
  		{ 
  			System.out.println("etape 2");
  	  		Inscription inscriptionExist = inscriptionService.findByIdEleveAndAnneeEnCours(idEleve);
  	  		  		
  	  		if (inscriptionExist == null) {
  	  			return new ResponseEntity<String>("Cette inscription n'existe pas!!!", HttpStatus.BAD_REQUEST);
  	  		} 
  	  		else
  	  		{  	
  	  			maNote = maNote.replaceAll(",",".");
	  			Float resultat = new Float(maNote);

  	  			if(typeNote.equals("composition"))
  	  			{System.out.println("etape 4");
	  	  			Note noteExist = noteService.findNoteCompo1Exist(inscriptionExist.getIdInscription(), matiere);
	  	  			
		  	  		if (noteExist != null) {
		  	  			return new ResponseEntity<String>("Cette note de composition existe déjà!!!", HttpStatus.BAD_REQUEST);
		  	  		} 
		  	  		else
		  	  		{
		  	  		System.out.println("etape 5");
		  	  			Matiere matiereExist = new Matiere();
		  	  			matiereExist.setIdMatiere(matiere);
		  	  			
		  	  			Note notes = new Note();

		  	  			notes.setInscription(inscriptionExist);
		  	  			notes.setMatiere(matiereExist);
		  	  			notes.setSemestre(semestre);
		  	  			notes.setTypeNote(typeNote);
		  	  			notes.setNote(resultat);
			  			noteService.saveNote(notes)	;
			  			
			  			return new ResponseEntity<String>("ok" + result, HttpStatus.OK);
		  	  		}
	  	  		} 
  	  			else
  	  			{
  	  			System.out.println("etape 6");
  	  	  			Matiere matiereExist = new Matiere();
  	  	  			matiereExist.setIdMatiere(matiere);
  	  	  			
  	  	  			Note notes = new Note();
  	  	  			
  	  	  			
  	  	  			notes.setInscription(inscriptionExist);
  	  	  			notes.setMatiere(matiereExist);
  	  	  			notes.setSemestre(semestre);
  	  	  			notes.setTypeNote(typeNote);
  	  	  			notes.setNote(resultat);
  		  			noteService.saveNote(notes)	; 
  		  			
  		  			return new ResponseEntity<String>("ok" + result, HttpStatus.OK);
  	  			}

  	  		}
  		}		
  	}*/
  /*  
    @PostMapping("/ajouterNote")
  	public ResponseEntity<String> addnote(@Valid Note note, BindingResult result,ModelMap modelMap,@RequestParam(name = "idEleve5") long idEleve,@RequestParam(name = "semestre") String semestre, @RequestParam(name = "matiere") long matiere, @RequestParam(name = "typeNote") String typeNote, @RequestParam(name = "note") long maNote) {

  		//String date = java.time.LocalDate.now().toString();
  		if (result.hasErrors()) {
  			return new ResponseEntity<String>("Erreur survenue lors de l'enregistrement: " , HttpStatus.BAD_REQUEST);
  		}
  		
  		Eleve eleveExist = eleveService.findByIdEleve(idEleve);
  		
  		if (eleveExist == null) {
  			return new ResponseEntity<String>("Cet élève n'existe pas!!!", HttpStatus.BAD_REQUEST);
  		} 
  		else
  		{ 

  	  		Inscription inscriptionExist = inscriptionService.findByIdEleveAndAnneeEnCours(idEleve);
  	  		  		
  	  		if (inscriptionExist == null) {
  	  			return new ResponseEntity<String>("Cette inscription n'existe pas!!!", HttpStatus.BAD_REQUEST);
  	  		} 
  	  		else
  	  		{  			
  	  			Note noteExist = new Note();
  	  			Matiere matiereExist = new Matiere();
  	  			matiereExist.setIdMatiere(matiere);

	  			noteExist.setInscription(inscriptionExist);
  	  			noteExist.setMatiere(matiereExist);
  	  			noteExist.setSemestre(semestre);
  	  			noteExist.setTypeNote(typeNote);
  	  			noteExist.setNote(maNote);
	  			noteService.saveNote(noteExist)	;System.out.println("sauvegarder");
	  			
	  			return new ResponseEntity<String>("ok" + result, HttpStatus.OK);
  	  		}
  		}
  		
  	}
  */
  	
  //************** Fin creation ************** 
    
  //************** Debut recherche ************** 
    @RequestMapping(value = "/rechercherEleve", method = RequestMethod.POST)
	public void rechercherEleve(@Valid Eleve eleve, BindingResult result, ModelMap modelMap, HttpServletResponse response ) throws ServletException, IOException{
		
    	response.setContentType("text/html;charset=UTF-8");
    	
    	String matricule = eleve.getMatricule();
  		if (result.hasErrors()) {
  			response.getWriter().println("Erreur lors de la recherche!!!");
  		}
  		
  		Eleve eleveExist = eleveService.findByMatricule(matricule);
  		
  		if (eleveExist == null) {
  			response.getWriter().println("Ce matricule n'existe pas!!!");
  		} 
  		else
  		{
  			long id = eleveService.findIdByMatricule(matricule);
  			
  			Inscription inscriptionExist = inscriptionService.findByIdEleveAndAnneeEnCours(id);
  			  			
  				String matri = eleveExist.getMatricule();
	  			String nom = eleveExist.getNom();	
	  			String prenom = eleveExist.getPrenom();
	  			String sexe = eleveExist.getSexe();
	  			Date dateNaiss = eleveExist.getDateNaiss();
	  			String tel = eleveExist.getTel();
	  			
	  			JSONObject entity = new JSONObject();
	  			entity.put("idInscription", inscriptionExist.getIdInscription());
	  			entity.put("idEleve", id);
	  			entity.put("matricule", matri);
	  			entity.put("nom", nom);
	  			entity.put("prenom", prenom);
	  			entity.put("sexe", sexe);
	  			entity.put("dateNaiss", dateNaiss);
	  			entity.put("tel", tel);	  			

	  			if (inscriptionExist == null) {
	  				entity.put("nomClasse", "non inscrit");
	  	  		} 
	  			else
	  			{
	  	  			long idClasse = inscriptionExist.getDetailClasse().getClasse().getIdClasse();
	  	  			String nomClasse = classeService.findNomClasseByIdClasse(idClasse);
	  	  			String categ = inscriptionExist.getDetailClasse().getCategorieClasse().getNomCategorie();
	  	  			String classe = nomClasse+" "+categ;   
	  	  		    entity.put("nomClasse", classe);
	  			}
	  		          
	  			response.getWriter().println(entity);  			  
  		}		
	}
    
    @RequestMapping(value = "/listerEleve", method = RequestMethod.POST)
   	public void listerEleve(@Valid Eleve eleve, BindingResult result, ModelMap modelMap , @RequestParam(name = "idDetailClasse1") long idDetailClasse, HttpServletResponse response ) throws ServletException, IOException{
   		System.out.println("id est "+idDetailClasse);
       	response.setContentType("text/html;charset=UTF-8");
       	
     		if (result.hasErrors()) {
     			response.getWriter().println("Erreur lors de la recherche!!!");
     		}
     		
     		DetailClasse detailClasseExist = detailClasseService.findDetailClasseByIdDetailClasse(idDetailClasse);
  	  		
			if(detailClasseExist == null)
			{
				response.getWriter().println("Cette classe n'existe pas!!!");
			}	
			else
			{
				List<JSONObject> entities = new ArrayList<JSONObject>();
      			List<Inscription> inscriptionList = inscriptionService.listInscriptionByClasse(idDetailClasse);
      			int effectif = inscriptionService.findEffectifClasse(detailClasseExist.getIdDetailClasse());
                 
                 if (inscriptionList.isEmpty()) {
	      				response.getWriter().println("Aucune inscription pour cette classe!!!");
	    			} 
	    			else
                 {
                     for (Inscription inscrip : inscriptionList) {
                    	 JSONObject entity = new JSONObject();
     			    	 entity.put("matricule", inscrip.getEleve().getMatricule());
     			    	 entity.put("prenom", inscrip.getEleve().getPrenom());
     			    	 entity.put("nom", inscrip.getEleve().getNom());
     			    	 entity.put("effectif", effectif);
     			    	     			    	 
                    	 entities.add(entity);
                     }	
                     response.getWriter().println(Arrays.toString(entities.toArray()));
                 }
     
			}		
   	}  
    
    
   /*
    @RequestMapping(value = "/rechercherDetailsEleve", method = RequestMethod.POST)
	public ResponseEntity<String> rechercherDetailsEleve(@Valid Eleve eleve, BindingResult result, ModelMap modelMap, @RequestParam(name = "idEleve") long idEleve, @RequestParam(name = "anneeScolaire") String anneeScolaire) {

    	if (result.hasErrors()) {
  			return new ResponseEntity<String>("Erreur survenue lors de la recherche: " , HttpStatus.BAD_REQUEST);
  		}
  		
  		Eleve eleveExist = eleveService.findByIdEleve(idEleve);
  		
  		if (eleveExist == null) {
  			return new ResponseEntity<String>("Ces détails n'existent pas!!!", HttpStatus.BAD_REQUEST);
  		} 
  		else
  		{
  			String nom = eleveExist.getNom();	
  			String prenom = eleveExist.getPrenom();
  			String sexe = eleveExist.getSexe();
  			Date dateNaiss = eleveExist.getDateNaiss();
  			String tel = eleveExist.getTel();
  			String matricule = eleveExist.getMatricule();
  			  			
  			List<Inscription> inscriptionList = inscriptionService.getAllInscriptionByIdEleveAndIdDetailClasse(eleveExist.getIdEleve(), detailClasseService.findIdDetailClasseByAnneeEnCours());

  			Date dateInscrip = null;
            String nomClasse = "vide";
            long montant = 0;
            if (!inscriptionList.isEmpty()) 
            {

                for (Inscription insc : inscriptionList) {
                	 dateInscrip = insc.getDateInscription();
                    nomClasse = insc.getDetailClasse().getClasse().getNomClasse()+"e "; 
                    montant = insc.getMontant();
                }	
            }
           
  			return new ResponseEntity<String>(dateInscrip.toString()+"(**)"+montant+"(**)"+nom+"(**)"+prenom+"(**)"+sexe+"(**)"+dateNaiss+"(**)"+tel+"(**)"+matricule+"(**)"+nomClasse, HttpStatus.OK);	
  		}		
	}
    */
    
    @RequestMapping(value = "/rechercherScolarite", method = RequestMethod.POST)
   	public void rechercherScolarite(@Valid Eleve eleve, BindingResult result, ModelMap modelMap , @RequestParam(name = "idInscription1") long idInscription, HttpServletResponse response ) throws ServletException, IOException{
   		
       	response.setContentType("text/html;charset=UTF-8");
       	
     		if (result.hasErrors()) {
     			response.getWriter().println("Erreur lors de la recherche!!!");
     		}
     		
     		Inscription inscripExist = inscriptionService.findByIdInscription(idInscription);
  	  		
			if(inscripExist == null)
			{
				response.getWriter().println("Cet élève n'est pas inscrit !!!");
			}	
			else
			{
     		
      			List<Scolarite> scolariteList = scolariteService.getAllScolariteByIdInscription(idInscription);

                 StringBuilder liste_sco= new StringBuilder();
                 DateFormat df = new SimpleDateFormat("dd-MM-yyyy");
                 if (!scolariteList.isEmpty()) 
                 {
                	 int i = 1; 
                     for (Scolarite sco : scolariteList) {
                    	
					     String requiredDate = df.format(sco.getDateVersement()).toString();
                    	 liste_sco.append(i+"_-*-_");
                    	 liste_sco.append(requiredDate+"_-*-_");
                    	 liste_sco.append(sco.getMois()+"_-*-_");
                    	 liste_sco.append(sco.getMontantVersement()+"_-*-_");  
                    	 i ++;
                     }	
                 }
      			
                 String date[] = df.format(inscripExist.getDateInscription()).toString().split("-");
                 
     			JSONObject entity = new JSONObject();
     			entity.put("date", date[2]+"-"+date[1]+"-"+date[0]);
     			entity.put("montant", inscripExist.getMontant());
     			entity.put("scolarite", liste_sco);
     			          
     			response.getWriter().println(entity);  
			}		
   	}
    
    @RequestMapping(value = "/rechercherClasse", method = RequestMethod.POST)
   	public void rechercherClassee(@Valid Classe claase, BindingResult result, ModelMap modelMap , @RequestParam(name = "classe") long idClasse, @RequestParam(name = "categorie") long idCategorie, HttpServletResponse response ) throws ServletException, IOException{
   		
       	response.setContentType("text/html;charset=UTF-8");
       	
     		if (result.hasErrors()) {
     			response.getWriter().println("Erreur lors de la recherche!!!");
     		}

     		long idAnneeScolaire = anneeScolaireService.findIdByStatutAnneeScolaire();
     		
     		DetailClasse detailClasseExist = detailClasseService.findDetailClasseByNomAndAnnee(idAnneeScolaire, idClasse, idCategorie);
  	  		
			if(detailClasseExist == null)
			{
				response.getWriter().println("Cette classe n'existe pas!!!");
			}	
			else
			{
     		
      			List<Inscription> inscriptionList = inscriptionService.listInscriptionByClasse(idClasse);
      			List<JSONObject> entities = new ArrayList<JSONObject>();
      			int effectif = inscriptionService.findEffectifClasse(detailClasseExist.getIdDetailClasse());
      			String classe = classeService.findNomClasseByIdClasse(idClasse);
      			String categorie = categorieService.findCategorieByIdCategorie(idCategorie);
      			String anneeScolaire = anneeScolaireService.findDebutByStatutAnneeScolaire()+"-"+anneeScolaireService.findFinByStatutAnneeScolaire();

              //   StringBuilder liste_inscrip= new StringBuilder();
                 DateFormat df = new SimpleDateFormat("dd-MM-yyyy");
                 if (inscriptionList.isEmpty()) 
                 {
                	 response.getWriter().println("Aucune inscription pour cette classe!!!");
                	 
                 }
                 else
                 {
                	 for (Inscription inscrip : inscriptionList) {
                    	 JSONObject entity = new JSONObject();
     			    	 entity.put("idDetailClasse", detailClasseExist.getIdDetailClasse());
     			    	 entity.put("idInscription", inscrip.getIdInscription());
     			    	 entity.put("idEleve", inscrip.getEleve().getIdEleve());
     			    	 entity.put("matricule", inscrip.getEleve().getMatricule());
     			    	 entity.put("prenom", inscrip.getEleve().getPrenom());
     			    	 entity.put("nom", inscrip.getEleve().getNom());
     			    	 entity.put("sexe", inscrip.getEleve().getSexe());
     			    	 entity.put("dateNaiss", inscrip.getEleve().getDateNaiss());
     			    	 entity.put("tel", inscrip.getEleve().getTel());
     			    	 entity.put("effectif", effectif);
     			         entity.put("classe", classe+" "+categorie);
     			         entity.put("anneeScolaire", anneeScolaire);
     			    	
                    	 entities.add(entity);
                     }	
                     response.getWriter().println(Arrays.toString(entities.toArray()));
                 }
      		
			}		
   	}
    
    
    @RequestMapping(value = "/listerScolarite", method = RequestMethod.POST)
   	public void liserScolarite(@Valid Eleve eleve, BindingResult result, ModelMap modelMap , @RequestParam(name = "idInscription2") long idInscription, HttpServletResponse response ) throws ServletException, IOException{
   		System.out.println("id est "+idInscription);
       	response.setContentType("text/html;charset=UTF-8");
       	
     		if (result.hasErrors()) {
     			response.getWriter().println("Erreur lors de la recherche!!!");
     		}
     		
     		Inscription inscripExist = inscriptionService.findByIdInscription(idInscription);
  	  		
			if(inscripExist == null)
			{
				response.getWriter().println("Cet élève n'est pas inscrit !!!");
			}	
			else
			{
				List<JSONObject> entities = new ArrayList<JSONObject>();
      			List<Scolarite> scolariteList = scolariteService.getAllScolariteByIdInscription(idInscription);

                 DateFormat df = new SimpleDateFormat("dd-MM-yyyy");
                 
                 if (scolariteList.isEmpty()) {
	      				response.getWriter().println("Aucune versement ajouté!!!");
	    			} 
	    			else
                 {
                     for (Scolarite sco : scolariteList) {
                    	 JSONObject entity = new JSONObject();
                    	 entity.put("idInscription", sco.getInscription().getIdInscription());
                    	 entity.put("idScolarite", sco.getIdScolarite());
                    	 entity.put("dateVersement", df.format(sco.getDateVersement()).toString());
                    	 entity.put("mois", sco.getMois());
                    	 entity.put("montant", sco.getMontantVersement());
                    	 entities.add(entity);
                     }	
                     response.getWriter().println(Arrays.toString(entities.toArray()));
                 }
     
			}		
   	}
    
    @RequestMapping(value = "/listerStatutPaiement", method = RequestMethod.POST)
   	public void listerStatutPaiement(@Valid Eleve eleve, BindingResult result, ModelMap modelMap , @RequestParam(name = "idDetailClasse2") long idDetailClasse, @RequestParam(name = "mois2") String mois, HttpServletResponse response ) throws ServletException, IOException{
   		System.out.println("id est "+idDetailClasse);
       	response.setContentType("text/html;charset=UTF-8");
       	
     		if (result.hasErrors()) {
     			response.getWriter().println("Erreur lors de la recherche!!!");
     		}
     		
     		DetailClasse detailClasseExist = detailClasseService.findDetailClasseByIdDetailClasse(idDetailClasse);
  	  		
			if(detailClasseExist == null)
			{
				response.getWriter().println("Cette classe n'existe pas!!!");
			}	
			else
			{
				List<JSONObject> entities = new ArrayList<JSONObject>();
      			List<Inscription> inscriptionList = inscriptionService.listInscriptionByClasse(idDetailClasse);
                 
                 if (inscriptionList.isEmpty()) {
	      				response.getWriter().println("Aucune inscription pour cette classe!!!");
	    			} 
	    			else
                 {
                     for (Inscription inscrip : inscriptionList) {
                    	 JSONObject entity = new JSONObject();
     			    	 entity.put("matricule", inscrip.getEleve().getMatricule());
     			    	 entity.put("prenom", inscrip.getEleve().getPrenom());
     			    	 entity.put("nom", inscrip.getEleve().getNom());
     			    	 entity.put("mois", mois);
     			    	 
     			    	 Scolarite scolariteExist = scolariteService.findScolariteByInscriptionAndMois(inscrip.getIdInscription(), mois);
     			    	 
     			    	 if(scolariteExist == null)
     			    	 {
     			    		entity.put("statut", "Non payé");
     			    	 }
     			    	 else
     			    	 {
     			    		entity.put("statut", "Payé"); 
     			    	 }
     			    	 
                    	 entities.add(entity);
                     }	
                     response.getWriter().println(Arrays.toString(entities.toArray()));
                 }
     
			}		
   	}
    
    @RequestMapping(value = "/listerMatiereEnseignee", method = RequestMethod.POST)
   	public void listerMatiereEnseignee(@Valid Eleve eleve, BindingResult result, ModelMap modelMap , @RequestParam(name = "idProfesseur") long idProfesseur, HttpServletResponse response ) throws ServletException, IOException{
   		
       	response.setContentType("text/html;charset=UTF-8");
       	
     		if (result.hasErrors()) {
     			response.getWriter().println("Erreur lors de la recherche!!!");
     		}
     		
 			AnneeScolaire anneeScolaireEncoursExist = anneeScolaireService.findAnneeEnCours();
			
			if (anneeScolaireEncoursExist == null) {				
				response.getWriter().println("Année scolaire non définie!!!");				
			}
			else
			{
				
	     		List<JSONObject> entities = new ArrayList<JSONObject>();
	  			List<MatiereEnseignee> matiereEnseigneeList = matiereEnseigneeService.getAllMatiereEnseigneesByProfAndAnnee(idProfesseur, anneeScolaireEncoursExist.getIdAnneeScolaire());
	             
	  			for (MatiereEnseignee mat : matiereEnseigneeList) {
               	 JSONObject entity = new JSONObject();
               	 entity.put("idMatiereEnseignee", mat.getIdMatiereEnseignee());
               	 entity.put("classe", mat.getClasse().getNomClasse());
               	 entity.put("matiere", mat.getMatiere().getNomMatiere());
               	 entities.add(entity);
                }	
                 response.getWriter().println(Arrays.toString(entities.toArray()));

			}
     	
   	}
    
    @RequestMapping(value = "/rechercherNote", method = RequestMethod.POST)
   	public void rechercherNote(@Valid Eleve eleve, BindingResult result, ModelMap modelMap , @RequestParam(name = "idEleve") long idEleve,  @RequestParam(name = "semestre") int semestre, HttpServletResponse response ) throws ServletException, IOException{
   		
       	response.setContentType("text/html;charset=UTF-8");
       	
     		if (result.hasErrors()) {
     			response.getWriter().println("Erreur lors de la recherche!!!");
     		}
     		
     		Inscription inscriptionExist = inscriptionService.findByIdEleveAndAnneeEnCours(idEleve);	
  	  		
			if(inscriptionExist == null)
			{
				response.getWriter().println("Cet élève n'est pas inscrit !!!");
			}	
			else
			{
				long idInscrip = inscriptionExist.getIdInscription();
			
      			
      			List<JSONObject> entities = new ArrayList<JSONObject>();
      			List<Note> noteList = noteService.getAllNoteByIdInscription(idInscrip, semestre);

      			if (noteList.isEmpty()) {
      				response.getWriter().println("Aucune note ajoutée!!!");
    			} 
    			else
    			{		
    				DateFormat df = new SimpleDateFormat("dd-MM-yyyy");
    			    for (Note n : noteList) {
    			    	JSONObject entity = new JSONObject();
    			    	
    			    	String date[] = df.format( n.getDateEpreuve()).toString().split("-");
    			    	
    			    	entity.put("idNote", n.getIdNote());
    			    	entity.put("matiere", n.getMatiere().getNomMatiere());
	    		    	entity.put("typeNote", n.getTypeNote());
	    		    	entity.put("note", n.getNote());
	    		    	entity.put("dateEpreuve", date[1]+"-"+date[1]+"-"+date[2]);
    			        
	    		    	entities.add(entity);
    			    }   
    			    response.getWriter().println(Arrays.toString(entities.toArray()));
    			}
      			     			          
     			
			}		
   	}
  /*  
    @RequestMapping(value = "/rechercherNote", method = RequestMethod.POST)
   	public void rechercherNote(@Valid Eleve eleve, BindingResult result, ModelMap modelMap , @RequestParam(name = "idInscription4") long idInscription,  HttpServletResponse response ) throws ServletException, IOException{
   		
       	response.setContentType("text/html;charset=UTF-8");
       	
     		if (result.hasErrors()) {
     			response.getWriter().println("Erreur lors de la recherche!!!");
     		}
     		
     		Eleve eleveExist = eleveService.findByIdEleve(idEleve);
     		
     		if (eleveExist == null) {
     			response.getWriter().println("Ces détails n'existent pas!!!");
     		} 
     		else
     		{
     			      			
      			Inscription inscripExist = inscriptionService.findByIdEleveAndAnneeEnCours(idEleve);
      	  		
				if(inscripExist == null)
				{
					response.getWriter().println("Cet élève n'est pas inscrit !!!");
				}	
				else
				{
					long idInscrip = inscripExist.getIdInscription();
				
	      			
	      			List<JSONObject> entities = new ArrayList<JSONObject>();
	      			List<Note> noteList = noteService.getAllNote1ByIdInscription(idInscrip);

	      			if (noteList.isEmpty()) {
	      				response.getWriter().println("Aucune note ajoutée!!!");
	    			} 
	    			else
	    			{				
	    			    for (Note n : noteList) {
	    			    	JSONObject entity = new JSONObject();
	    			    	entity.put("idNote", n.getIdNote());
	    			    	entity.put("matiere", n.getMatiere().getNomMatiere());
		    		    	entity.put("typeNote", n.getTypeNote());
		    		    	entity.put("note", n.getNote());
	    			        
		    		    	entities.add(entity);
	    			    }   
	    			    response.getWriter().println(Arrays.toString(entities.toArray()));
	    			}
	      			     			          
	     			
				}
      			
     		}		
   	}
    */
    @RequestMapping(value = "/listerNote", method = RequestMethod.POST)
   	public void listerNote(@Valid Eleve eleve, BindingResult result, ModelMap modelMap , @RequestParam(name = "nomClasse") long idClasse, @RequestParam(name = "nomCategorie") long idCategorie, @RequestParam(name = "semestre1") int semestre, @RequestParam(name = "matiere1") long idMatiere, @RequestParam(name = "typeNote1") String typeNote,  HttpServletResponse response ) throws ServletException, IOException{
   		
       	response.setContentType("text/html;charset=UTF-8");
       	
     		if (result.hasErrors()) {
     			response.getWriter().println("Erreur lors de la recherche!!!");
     		}
     		
     		DetailClasse detailClasseExist  = detailClasseService.findIdDetailClasseByAnneeEnCours(idClasse, idCategorie);
     		 
     		if (detailClasseExist == null) {
     			response.getWriter().println("Cette classe n'existe pas!!!");
    		} 
    		else
    		{

      			List<JSONObject> entities = new ArrayList<JSONObject>();
      			List<Note> noteList = noteService.findListeNoteByClasseAndMatiere(semestre, idMatiere, typeNote, detailClasseExist.getIdDetailClasse());

      			if (noteList.isEmpty()) {
      				response.getWriter().println("Aucune note ajoutée!!!");
    			} 
    			else
    			{		
    				 DateFormat df = new SimpleDateFormat("dd-MM-yyyy");
    			    for (Note n : noteList) {
    			    	JSONObject entity = new JSONObject();
    			    	
    			    	String date[] = df.format( n.getDateEpreuve()).toString().split("-");
    			    	
    			    	entity.put("idNote", n.getIdNote());
    			    	entity.put("matricule", n.getInscription().getEleve().getMatricule());
    			    	entity.put("prenom", n.getInscription().getEleve().getPrenom());
    			    	entity.put("nom", n.getInscription().getEleve().getNom());
    			    	entity.put("dateEpreuve", date[1]+"-"+date[1]+"-"+date[2]);
        		    	entity.put("note", n.getNote());
        		    	
    			        
        		    	entities.add(entity);
    			    }   
    			    response.getWriter().println(Arrays.toString(entities.toArray()));
    			}
    		}
     				
   	}
    
    @RequestMapping(value = "/rechercherDetailsBulletin1", method = RequestMethod.POST)
   	public void rechercherDetailsBulletin(@Valid Eleve eleve, BindingResult result, ModelMap modelMap , @RequestParam(name = "idInscription") long idInscription, @RequestParam(name = "semestre") int semestre,  HttpServletResponse response ) throws ServletException, IOException{
   		
       	response.setContentType("text/html;charset=UTF-8");
     	moyenneService.truncateTable();
       	
     		if (result.hasErrors()) {
     			response.getWriter().println("Erreur lors de la recherche!!!");
     		}
     		
     		Inscription inscripExist = inscriptionService.findByIdInscription(idInscription);
  	  		
			if(inscripExist == null)
			{
				response.getWriter().println("Cet élève n'est pas inscrit !!!");
			}	
			else
			{
					Bulletin bulletinExist = bulletinService.findBulletinByInscriptionAndSemestre(inscripExist.getIdInscription(), semestre)	;  			  			
	  				
					JSONObject entity = new JSONObject();		

		  			if (bulletinExist == null) {
		  				response.getWriter().println("Aucun bulletin pour cet élève!!!");
		  	  		} 
		  			else
		  			{   
		  				
			  			entity.put("conduite", bulletinExist.getConduite());
			  			entity.put("appreciation", bulletinExist.getAppreciation());
			  			entity.put("assiduite", bulletinExist.getAssiduite());
			  			entity.put("tableauHonneur", bulletinExist.getTableauHonneur());
			  			entity.put("profResponsable", bulletinExist.getProfesseur().getIdProfesseur());
			  			
			  			response.getWriter().println(entity); 
		  			}
		  		          
		  			
			}
				
	}
    
    
    @RequestMapping(value = "/rechercherConduiteclasse", method = RequestMethod.POST)
   	public void rechercherConduiteClasse(@Valid Classe classe, BindingResult result, ModelMap modelMap , @RequestParam(value="idInscriptionConduite1") Integer id, @RequestParam(name = "semestre3") int semestre,  HttpServletResponse response ) throws ServletException, IOException{

    	if (result.hasErrors()) {
    		response.getWriter().println("Erreur survenue lors de l'enregistrement: ");
  		}
    	
    	DetailClasse detailClasseExist = detailClasseService.findDetailClasseByIdDetailClasse(id);
    	
    	if (detailClasseExist == null) {
    		response.getWriter().println("Cette classe n'existe pas!!!");
		} 
		else
		{
			JSONObject entity = new JSONObject();
  			entity.put("conduiteClasse", detailClasseExist.getConduiteClasse());
  			entity.put("idDetailClasse", detailClasseExist.getIdDetailClasse());
		 	
  			response.getWriter().println(entity); 
		} 
				
	}
    
    @RequestMapping(value = "/rechercherBulletin", method = RequestMethod.POST)
   	public void rechercherBulletin(@Valid Eleve eleve, BindingResult result, ModelMap modelMap , @RequestParam(name = "idInscription") long idInscription, @RequestParam(name = "semestre") int semestre, HttpServletResponse response ) throws ServletException, IOException{
   		
       	response.setContentType("text/html;charset=UTF-8");
     	moyenneService.truncateTable();
     	moyenneSemestreService.truncateTable();
       	
     		if (result.hasErrors()) {
     			response.getWriter().println("Erreur lors de la recherche!!!");
     		}

	        Inscription inscriptionExist = inscriptionService.findByIdInscription(idInscription);	
  	  		
			if(inscriptionExist == null)
			{
				response.getWriter().println("Cet élève n'est pas inscrit !!!");
			}	
			else
			{		  	  			
	  	  			/************************** Liste des Matieres **************************/
	  	  			
	  	  		    List<Matiere> matiereList = matiereService.getAllMatieres();
	  	  		    
	  	  		    if (matiereList.isEmpty()) 
	  	  		    {
	  	  		    	response.getWriter().println("Aucune matière ajoutée !!!");
	  	  		    }
	  	  		    else
	  	  		    {
		  	  		    List<Note> noteList1 = noteService.getAllNoteByIdInscription(inscriptionExist.getIdInscription(), semestre);
	
		  	  			if (noteList1.isEmpty()) {
		  	  				response.getWriter().println("Aucune note ajoutée!!!");
		  				} 
		  	  			else
		  	  			{
		  	  				long idInscrip = inscriptionExist.getIdInscription();
					        long idClasse = inscriptionExist.getDetailClasse().getClasse().getIdClasse();	
					        long idCategorie = inscriptionExist.getDetailClasse().getCategorieClasse().getIdCategorieClasse();
			  				
					        String matri = inscriptionExist.getEleve().getMatricule();
				  			String nom = inscriptionExist.getEleve().getNom();	
				  			String prenom = inscriptionExist.getEleve().getPrenom();
				  			String sexe = inscriptionExist.getEleve().getSexe();
				  			Date dateNaiss = inscriptionExist.getEleve().getDateNaiss();
				  			String tel = inscriptionExist.getEleve().getTel();
				  			
				  			int effectif= inscriptionService.findEffectifClasse(inscriptionExist.getDetailClasse().getIdDetailClasse());	  			
				  						  			
				  			String anneeScolaire = anneeScolaireService.findDebutByStatutAnneeScolaire()+"-"+anneeScolaireService.findFinByStatutAnneeScolaire();
				  			String nomClasse = classeService.findNomClasseByIdClasse(idClasse);
			  	  			String categ = inscriptionExist.getDetailClasse().getCategorieClasse().getNomCategorie();
			  	  					//classeService.findCategorieByIdClasse(idClasse);
			  	  			String classe = nomClasse+" "+categ; 
			  	  			
			  	  			int somCoefficient = coefficientService.findSommeCoefficient(inscriptionExist.getDetailClasse().getAnneeScolaire().getIdAnneeScolaire(), idClasse);
			  	  			
				  	  	//	List<Coefficient> coefficientList = coefficientService.getAllCoefficients(inscriptionExist.getDetailClasse().getAnneeScolaire().getIdAnneeScolaire(), idClasse, );
			  	  		    	
			  	  		    /************************** fin liste des Matieres ************************/
				  	  		 float noteClasseTotale = 0;
				  	  		 float totalMoyenne = 0;
				  	  		 
				  	  		 StringBuilder liste_matiere= new StringBuilder();
				  	  		 int i = 1; 
				  	  		 
				  	  		DecimalFormat df = new DecimalFormat("##.##");
					  	  	df.setRoundingMode(RoundingMode.DOWN);
					  	  	
					  	    DetailClasse detailClasseExist  = detailClasseService.findIdDetailClasseByAnneeEnCours(idClasse, idCategorie); 
				  	  		if (detailClasseExist == null) {
				     			response.getWriter().println("Cette classe n'existe pas!!!");
				    		}
				  	  		else
				  	  		{
				  	  			
					  	  		List<Inscription> inscriptionList = inscriptionService.listInscriptionByClasse(detailClasseExist.getIdDetailClasse());
				      			
				      			if (inscriptionList.isEmpty()) {
				      				response.getWriter().println("Aucun effectif pour cette classe!!!");
				    			}
				      			else
				      			{
				      				
				      				for (Inscription insc : inscriptionList) {
				      					 List<Float> l1 = new ArrayList<Float>();
				      					/****debut******/
				      					 for (Matiere matiere : matiereList) 
				    		  	  		 {	  	  					  	  			
				    		  	  		    List<Note> noteList = noteService.getAllNoteNotCompo(insc.getIdInscription(), semestre, matiere.getIdMatiere());
				    				        float noteClasse= 0;
				    		  	  			float somme = 0;
				    		  	  			float noteCompo = 0;
				    		  	  			float moyenne = 0;
				    		  	  			int nombreNote = 0;
				    		  	  			int coefficient = 0;
				    			  	  		if (noteList.isEmpty()) {
				    			  	  			noteClasse= 0;			  	  			
				    						} 
				    			  	  		else
				    			  	  		{
				    			  	  			nombreNote = noteList.size();
				    			  	  			for (Note n : noteList) {
				    			  	  			somme = somme + n.getNote();
				    			  	  			 
				    			  	  		 }
				    			  	  		 noteClasse = somme/nombreNote;
				    			  	  		}
				    			  	  		
				    			  	  		Note noteCompoExist = noteService.findNoteCompoExist(idInscrip, matiere.getIdMatiere(), semestre);
				    			  	  		if(noteCompoExist != null)
				    			  	  		{
				    			  	  		  noteCompo = noteCompoExist.getNote();
				    			  	  		}
				    			  	  		
				    			  	  		moyenne = (noteClasse + noteCompo)/2;
				    			  	  		noteClasseTotale = noteClasseTotale + noteClasse;
				    			  	  		
					    			  	  	Inscription inscrip = new Inscription();
									  	    inscrip.setIdInscription(insc.getIdInscription());
									  	  	
									  	    Moyenne moy = new Moyenne();
									  	    
									  	    Matiere mat = new Matiere();
									  	    mat.setIdMatiere(matiere.getIdMatiere());
									  	    
									  	    moy.setInscription(inscrip);
									  	    moy.setMatiere(mat);
									  	    moy.setNote(moyenne);	
									  	    moy.setSemestre(semestre);
									  	    
									  	    moyenneService.saveMoyenne(moy);
									  	    
									  	  float moyenneSem ;
													  	    
									  	   Coefficient coefficientExist = coefficientService.findCoefficient(insc.getDetailClasse().getAnneeScolaire().getIdAnneeScolaire(), idClasse, mat.getIdMatiere());
									  	    
									  	   if(coefficientExist != null)
									  	   {
									  		 coefficient = coefficientExist.getValeur();
									  	   }
									  	   else
									  	   {
									  		 coefficient = 0;
									  	   }
									  	
									  	   moyenneSem= coefficient*moyenne;
									  	   l1.add(moyenneSem);
									  									  	    
				    			  	  	}
				      					/******fin*****/
				      					 
				      					    
								  	    Bulletin bulletinExist = bulletinService.findBulletinByInscriptionAndSemestre(insc.getIdInscription(), semestre);
							  			int conduite1;
							  			 if (bulletinExist == null)
							  			 {
							  				 conduite1 = 0;
							  			 }
							  			 else
							  			 {
							  				 conduite1 = Integer.parseInt(bulletinExist.getConduite());
							  			 }							  								  			 
								  		float noteAll = 0;
								  		System.out.println("taille est "+l1.size());
							  			 for (int a = 0; a < l1.size(); a++) {
							  				  
							  	            // Using get() method to
							  	            // access particular element
							  	            System.out.print("moyenne est: "+l1.get(a) + " ");
							  	            noteAll = noteAll + l1.get(a);
							  	        }
							  			 
							  			System.out.println("somme des moyennes est "+noteAll+conduite1);
							  		//	 liste des coefficients
							  			MoyenneSemestre moySem = new MoyenneSemestre();
							  			moySem.setInscription(insc);
							  			moySem.setSemestre(semestre);
								  		moySem.setNote((noteAll+conduite1)/(somCoefficient+1));

							  		//	moySem.setNote((coefPc*pcMoyenneX+coefFr*frMoyenneX+coefAng*angMoyenneX+coefHG*hgMoyenneX+coefMath*mathMoyenneX+coefSvt*svtMoyenneX+coefEfs*efsMoyenneX+coefEps*epsMoyenneX+coefConduite*conduite1)/(coefPc+coefFr+coefAng+coefHG+coefMath+coefSvt+coefEfs+coefEps+coefConduite));
							  			
							  			moyenneSemestreService.saveMoyenneSemestre(moySem);
				      				}
				      				
				      				 for (Matiere matiere : matiereList) 
						  	  		 {
				      									      					
				      					/****************** debut note ***************************/
				      					List<Note> noteList = noteService.getAllNoteNotCompo(idInscrip, semestre, matiere.getIdMatiere());
								        float noteClasse= 0;
						  	  			float somme = 0;
						  	  			float noteCompo = 0;
						  	  			float moyenne1 = 0;
						  	  			int nombreNote = 0;
						  	  			int coefficient = 0;
							  	  		if (noteList.isEmpty()) {
							  	  			noteClasse= 0;			  	  			
										} 
							  	  		else
							  	  		{
							  	  			nombreNote = noteList.size();
							  	  			for (Note n : noteList) {
							  	  			somme = somme + n.getNote();
							  	  			 
							  	  		 }
							  	  		 noteClasse = somme/nombreNote;
							  	  		}
							  	  		
							  	  		Note noteCompoExist = noteService.findNoteCompoExist(idInscrip, matiere.getIdMatiere(), semestre);
							  	  		if(noteCompoExist != null)
							  	  		{
							  	  		  noteCompo = noteCompoExist.getNote();
							  	  		}
							  	  		
							  	  		moyenne1 = (noteClasse + noteCompo)/2;
							  	  		noteClasseTotale = noteClasseTotale + noteClasse;
							  	  		
							  	  		/*************************/			  	  			
								  	  	liste_matiere.append(matiere.getNomMatiere()+"_-*-_");
						  	  			
						  	  			Coefficient coefficientExist = coefficientService.findCoefficient(inscriptionExist.getDetailClasse().getAnneeScolaire().getIdAnneeScolaire(), idClasse, matiere.getIdMatiere());
							  	  		if(coefficientExist == null)
										{
							  	  			liste_matiere.append("0"+"_-*-_");			  	  			
										}	
										else
										{	
											coefficient = coefficientExist.getValeur();
											liste_matiere.append(coefficient+"_-*-_");
										}
							  	  		liste_matiere.append(df.format(noteClasse)+"_-*-_");
							  	  		liste_matiere.append(df.format(noteCompo)+"_-*-_");
							  	  		liste_matiere.append(df.format(moyenne1)+"_-*-_");
							  	  		liste_matiere.append(df.format(moyenne1*coefficient)+"_-*-_");//Moyenne generale par matiere
				      					
							  	  		totalMoyenne =totalMoyenne + (moyenne1*coefficient);
							  	  		/****************** fin note ***************************/
				      					
				      					/****************** debut rang ***************************/
							  	  		List<Moyenne> listeMoyenne = moyenneService.getAllMoyenneByIdMatiere(matiere.getIdMatiere());
							  	  		
							  	  		int mati =1;
				    	      			int mati2 =1;
				    	      			int matiRang = 0;
				    	      			int matiCompteur = 0;
				    	      			float matiLaMoyenne = 0;
				    	      			
				    		  			for (Moyenne moyenne2 : listeMoyenne) {
				    		  				
				    		  				if (idInscrip == moyenne2.getInscription().getIdInscription())
				    		  				{
				    		  					matiRang = mati;
				    		  					matiLaMoyenne = moyenne2.getNote();
				    		  				}
				    		  						
				    		  				mati++;
				    		  			}
				    		  			
				    		  			for (Moyenne moyenne2 : listeMoyenne) {
				    		  				if (matiLaMoyenne == moyenne2.getNote())
				    		  				{
				    		  					
				    		  					matiCompteur = matiCompteur +1;
				    		  				}			  						
				    		  				mati2++;
				    		  			}	
				    		  			
				    		  			int[] matiTab  = new int[matiCompteur];
				    		  			int matiJ = 1;
				    		  			int matiJ2 = 0;
				    		  			for (Moyenne moyenne3 : listeMoyenne) {
				    		  				if (matiLaMoyenne == moyenne3.getNote())
				    		  				{			    		  					
				    		  					matiTab[matiJ2] = matiJ;
				    		  					matiJ2++;
				    		  				}			  						
				    		  				matiJ++;
				    		  			}
				    		  			
				    		  			if(matiCompteur > 1)
				    		  			{
				    			  	  		if (matiTab[0]==1)
				    			  	  		liste_matiere.append( matiTab[0]+"er ex"+"_-*-_");
				    			  	  		//	entity.put("matiRang1", matiTab[0]+"er ex");
				    			  	  		else
				    			  	  		liste_matiere.append(matiTab[0]+"e ex+"+"_-*-_");
				    			  	  		//	entity.put("matiRang1", matiTab[0]+"e ex");
				    		  			}
				    		  	  		else
				    		  	  		{
				    		  	  			if (matiRang==1)
				    		  	  			liste_matiere.append( matiRang+"er"+"_-*-_");
				    		  	  			//	entity.put("matiRang1", matiRang+"er");
				    		  	  			else
				    		  	  			liste_matiere.append( matiRang+"e"+"_-*-_");	
				    		  	  			//	entity.put("matiRang1", matiRang+"e");
				    		  	  		}
				    		  			/****************** fin rang ***************************/
				    		  			liste_matiere.append( appreciation(moyenne1)+"_-*-_");
						  	  		 }
				      				
				      				/* debut determiner rang general*/
				 		  			List<MoyenneSemestre> listeMoyenneSemestre = null;
				 	      			
				 		  			listeMoyenneSemestre = moyenneSemestreService.getAllMoyenneSemestre1();
				 		  			
				 		  			int moySem =1;
				 	      			int moySem2 =1;
				 	      			int moySemRang = 0;
				 	      			int moySemCompteur = 0;
				 	      			float moySemLaMoyenne = 0;
				 	      			float moySemSomme = 0;
				 	      			int moySemNombre = 0;
				 	      			float plusGrand = 0;
				 	      			float plusPetit = 0;
				 	      			int cptSupDix = 0;
				 	      			
				 		  			for (MoyenneSemestre moyenneSemestre : listeMoyenneSemestre) {
				 		  				if (idInscrip == moyenneSemestre.getInscription().getIdInscription())
				 		  				{
				 		  					moySemRang = moySem;
				 		  					moySemLaMoyenne = moyenneSemestre.getNote();
				 		  				}
				 		  				
				 		  				moySemSomme = moySemSomme + moyenneSemestre.getNote();
				 		  				
				 		  				moySemNombre = moySemNombre + 1;
				 		  				
				 		  				// debut Recherche plus grande moyenne
				 		  				if(moySem ==1 || moyenneSemestre.getNote()>plusGrand)
				 		  				{
				 		  					plusGrand = moyenneSemestre.getNote();
				 		  				}
				 		  				// fin recherche plus grande moyenne
				 		  				
				 		  				// debut Recherche plus petite moyenne
				 		  				if(moySem ==1 || moyenneSemestre.getNote()<plusPetit)
				 		  				{
				 		  					plusPetit = moyenneSemestre.getNote();
				 		  				}
				 		  				// fin recherche plus petite moyenne
				 		  				
				 		  				// debut Recherche nombre >= 10
				 		  				if(moyenneSemestre.getNote()>=10)
				 		  				{
				 		  					cptSupDix = cptSupDix + 1;
				 		  				}
				 		  				// fin recherche nombre >= 10
				 		  				moySem++;
				 		  			}
				 		  			/*
				 		  			System.out.println("la somme moyenne est "+moySemSomme);
				 		  			System.out.println("le nombre moyenne est "+moySemNombre);
				 		  			System.out.println("la plus grande moyenne est "+plusGrand);
				 		  			System.out.println("la plus petit moyenne est "+plusPetit);
				 		  			System.out.println("nombre >= 10 est "+cptSupDix);
				 		  			*/
				 		  			// calculer le nombre de moyennes qui sont egales
				 		  			for (MoyenneSemestre moyenneSemestre: listeMoyenneSemestre) {
				 		  				if (moySemLaMoyenne == moyenneSemestre.getNote())
				 		  				{
				 		  					
				 		  					moySemCompteur = moySemCompteur +1;
				 		  				}			  						
				 		  				moySem2++;
				 		  			}	
				 		  			
				 		  			int[] moySemTab  = new int[moySemCompteur];
				 		  			int moySemJ = 1;
				 		  			int moySemJ2 = 0;
				 		  			for (MoyenneSemestre moyenneSemestre: listeMoyenneSemestre) {
				 		  				if (moySemLaMoyenne == moyenneSemestre.getNote())
				 		  				{			  					
				 		  					moySemTab[moySemJ2] = moySemJ;
				 		  					moySemJ2++;
				 		  				}			  						
				 		  				moySemJ++;
				 		  			}
				 		  					  			
				 		  			/* fin determiner rang general*/
				 		  			int conduite ;
				 		  			
				 		  			if (bulletinService.findConduiteByIdInscrip(idInscrip) == null)
								  		conduite = 0;
								  	else
								  		conduite = Integer.parseInt(bulletinService.findConduiteByIdInscrip(idInscrip));
						  	  	
				 		  			float moyenneSem1 = (totalMoyenne + conduite)/(somCoefficient+1);
				 		  			
				 		  			Bulletin bulletinExist = bulletinService.findBulletinByInscriptionAndSemestre(idInscrip, semestre);
				 		  			
					  	  			JSONObject entity = new JSONObject();
						  			entity.put("idEleve", inscriptionExist.getEleve().getIdEleve());
						  			entity.put("anneeScolaire", anneeScolaire);
						  			entity.put("matricule", matri);
						  			entity.put("nom", nom);
						  			entity.put("prenom", prenom);
						  			entity.put("sexe", sexe);
						  			entity.put("dateNaiss", dateNaiss);
						  			entity.put("tel", tel); 
						  			entity.put("effectif", effectif);		  			
					  	  		    entity.put("nomClasse", classe);
					  	  		    entity.put("conduite", conduite);
					  	  		    entity.put("conduiteClasse", detailClasseExist.getConduiteClasse());
					  	  		    entity.put("totalCoef", somCoefficient+1);
					  	  		    entity.put("totalCoefSur", 20*(somCoefficient+1));
					  	  		    entity.put("totalMoyenne",  df.format(totalMoyenne + conduite));
					  	  		    entity.put("moyenneSem1",  df.format(moyenneSem1));
					  	  		    entity.put("moyenneClasse",  df.format(moySemSomme/moySemNombre));
						  	  		entity.put("plusGrand",  df.format(plusGrand));
					  	  		    entity.put("plusPetit",  df.format(plusPetit));
					  	  		    entity.put("cptSupDix",  cptSupDix);
					  	  		   if (bulletinExist == null)
					  	  		    {
					  	  		    	entity.put("appreciation", "RAS");
					  	  		    	entity.put("tabHon", "");
					  	  		    	entity.put("assiduite", "RAS");
					  	  		    }
					  	  		    else
					  	  		    {
						  	  		    entity.put("tabHon", bulletinExist.getTableauHonneur());
						  	  		    entity.put("appreciation", bulletinExist.getAppreciation());
						  	  		    entity.put("assiduite", bulletinExist.getAssiduite());
						  	  		    entity.put("prof", bulletinExist.getProfesseur().getPrenom()+" "+bulletinExist.getProfesseur().getNom());System.out.println("nom "+bulletinExist.getProfesseur().getPrenom()+" "+bulletinExist.getProfesseur().getNom());
					  	  		    }
					  	  		    entity.put("listeMatiere", liste_matiere);
						  	  		if(moySemCompteur > 1)
						  			{
							  	  		if (moySemTab[0]==1)
							  	  			entity.put("moySemRang1", moySemTab[0]+"er ex");
							  	  		else
							  	  			entity.put("moySemRang1", moySemTab[0]+"e ex");
						  			}
						  	  		else
						  	  		{
						  	  			if (moySemRang==1)			  	  				
						  	  				entity.put("moySemRang1", moySemRang+"er");
						  	  			else
						  	  				entity.put("moySemRang1", moySemRang+"e");
						  	  		}
					  	  		    System.out.println("liste est: "+liste_matiere);
					  	  		    response.getWriter().println(entity);
				      			}
			  	  		  
				  	  		}
					  	  	
		  	  			} 
	  	  		   }
			}		
   	}
    
 
	// ******************* Fin Recherche***************************
    
    
    @RequestMapping(value = "/rechercherBulletin1", method = RequestMethod.POST)
   	public void rechercherBulletin1(@Valid Eleve eleve, BindingResult result, ModelMap modelMap , @RequestParam(name = "idInscription") long idInscription,  HttpServletResponse response ) throws ServletException, IOException{
   		
    	int semestre = 1;
    	
       	response.setContentType("text/html;charset=UTF-8");
     	moyenneService.truncateTable();
     	moyenneSemestreService.truncateTable();
       	
     		if (result.hasErrors()) {
     			response.getWriter().println("Erreur lors de la recherche!!!");
     		}

	        Inscription inscriptionExist = inscriptionService.findByIdInscription(idInscription);	
  	  		
			if(inscriptionExist == null)
			{
				response.getWriter().println("Cet élève n'est pas inscrit !!!");
			}	
			else
			{		  	  			
	  	  			/************************** Liste des Matieres **************************/
	  	  			
	  	  		    List<Matiere> matiereList = matiereService.getAllMatieres();
	  	  		    
	  	  		    if (matiereList.isEmpty()) 
	  	  		    {
	  	  		    	response.getWriter().println("Aucune matière ajoutée !!!");
	  	  		    }
	  	  		    else
	  	  		    {
		  	  		    List<Note> noteList1 = noteService.getAllNoteByIdInscription(inscriptionExist.getIdInscription(), semestre);
	
		  	  			if (noteList1.isEmpty()) {
		  	  				response.getWriter().println("Aucune note ajoutée!!!");
		  				} 
		  	  			else
		  	  			{
		  	  				long idInscrip = inscriptionExist.getIdInscription();
					        long idClasse = inscriptionExist.getDetailClasse().getClasse().getIdClasse();	
					        long idCategorie = inscriptionExist.getDetailClasse().getCategorieClasse().getIdCategorieClasse();
			  				
					        String matri = inscriptionExist.getEleve().getMatricule();
				  			String nom = inscriptionExist.getEleve().getNom();	
				  			String prenom = inscriptionExist.getEleve().getPrenom();
				  			String sexe = inscriptionExist.getEleve().getSexe();
				  			Date dateNaiss = inscriptionExist.getEleve().getDateNaiss();
				  			String tel = inscriptionExist.getEleve().getTel();
				  			
				  			int effectif= inscriptionService.findEffectifClasse(inscriptionExist.getDetailClasse().getIdDetailClasse());	  			
				  						  			
				  			String anneeScolaire = anneeScolaireService.findDebutByStatutAnneeScolaire()+"-"+anneeScolaireService.findFinByStatutAnneeScolaire();
				  			String nomClasse = classeService.findNomClasseByIdClasse(idClasse);
			  	  			String categ = inscriptionExist.getDetailClasse().getCategorieClasse().getNomCategorie();
			  	  					//classeService.findCategorieByIdClasse(idClasse);
			  	  			String classe = nomClasse+" "+categ; 
			  	  			
			  	  			int somCoefficient = coefficientService.findSommeCoefficient(inscriptionExist.getDetailClasse().getAnneeScolaire().getIdAnneeScolaire(), idClasse);
			  	  			
				  	  	//	List<Coefficient> coefficientList = coefficientService.getAllCoefficients(inscriptionExist.getDetailClasse().getAnneeScolaire().getIdAnneeScolaire(), idClasse, );
			  	  		    	
			  	  		    /************************** fin liste des Matieres ************************/
				  	  		 float noteClasseTotale = 0;
				  	  		 float totalMoyenne = 0;
				  	  		 
				  	  		 StringBuilder liste_matiere= new StringBuilder();
				  	  		 int i = 1; 
				  	  		 
				  	  		DecimalFormat df = new DecimalFormat("##.##");
					  	  	df.setRoundingMode(RoundingMode.DOWN);
					  	  	
					  	    DetailClasse detailClasseExist  = detailClasseService.findIdDetailClasseByAnneeEnCours(idClasse, idCategorie); 
				  	  		if (detailClasseExist == null) {
				     			response.getWriter().println("Cette classe n'existe pas!!!");
				    		}
				  	  		else
				  	  		{
				  	  			
					  	  		List<Inscription> inscriptionList = inscriptionService.listInscriptionByClasse(detailClasseExist.getIdDetailClasse());
				      			
				      			if (inscriptionList.isEmpty()) {
				      				response.getWriter().println("Aucun effectif pour cette classe!!!");
				    			}
				      			else
				      			{
				      				
				      				for (Inscription insc : inscriptionList) {
				      					 List<Float> l1 = new ArrayList<Float>();
				      					/****debut******/
				      					 for (Matiere matiere : matiereList) 
				    		  	  		 {	  	  					  	  			
				    		  	  		    List<Note> noteList = noteService.getAllNoteNotCompo(insc.getIdInscription(), semestre, matiere.getIdMatiere());
				    				        float noteClasse= 0;
				    		  	  			float somme = 0;
				    		  	  			float noteCompo = 0;
				    		  	  			float moyenne = 0;
				    		  	  			int nombreNote = 0;
				    		  	  			int coefficient = 0;
				    			  	  		if (noteList.isEmpty()) {
				    			  	  			noteClasse= 0;			  	  			
				    						} 
				    			  	  		else
				    			  	  		{
				    			  	  			nombreNote = noteList.size();
				    			  	  			for (Note n : noteList) {
				    			  	  			somme = somme + n.getNote();
				    			  	  			 
				    			  	  		 }
				    			  	  		 noteClasse = somme/nombreNote;
				    			  	  		}
				    			  	  		
				    			  	  		Note noteCompoExist = noteService.findNoteCompoExist(idInscrip, matiere.getIdMatiere(), semestre);
				    			  	  		if(noteCompoExist != null)
				    			  	  		{
				    			  	  		  noteCompo = noteCompoExist.getNote();
				    			  	  		}
				    			  	  		
				    			  	  		moyenne = (noteClasse + noteCompo)/2;
				    			  	  		noteClasseTotale = noteClasseTotale + noteClasse;
				    			  	  		
					    			  	  	Inscription inscrip = new Inscription();
									  	    inscrip.setIdInscription(insc.getIdInscription());
									  	  	
									  	    Moyenne moy = new Moyenne();
									  	    
									  	    Matiere mat = new Matiere();
									  	    mat.setIdMatiere(matiere.getIdMatiere());
									  	    
									  	    moy.setInscription(inscrip);
									  	    moy.setMatiere(mat);
									  	    moy.setNote(moyenne);	
									  	    moy.setSemestre(semestre);
									  	    
									  	    moyenneService.saveMoyenne(moy);
									  	    
									  	  float moyenneSem ;
													  	    
									  	   Coefficient coefficientExist = coefficientService.findCoefficient(insc.getDetailClasse().getAnneeScolaire().getIdAnneeScolaire(), idClasse, mat.getIdMatiere());
									  	    
									  	   if(coefficientExist != null)
									  	   {
									  		 coefficient = coefficientExist.getValeur();
									  	   }
									  	   else
									  	   {
									  		 coefficient = 0;
									  	   }
									  	
									  	   moyenneSem= coefficient*moyenne;
									  	   l1.add(moyenneSem);
									  									  	    
				    			  	  	}
				      					/******fin*****/
				      					 
				      					    
								  	    Bulletin bulletinExist = bulletinService.findBulletinByInscriptionAndSemestre(insc.getIdInscription(), semestre);
							  			int conduite1;
							  			 if (bulletinExist == null)
							  			 {
							  				 conduite1 = 0;
							  			 }
							  			 else
							  			 {
							  				 conduite1 = Integer.parseInt(bulletinExist.getConduite());
							  			 }							  								  			 
								  		float noteAll = 0;
								  		System.out.println("taille est "+l1.size());
							  			 for (int a = 0; a < l1.size(); a++) {
							  				  
							  	            // Using get() method to
							  	            // access particular element
							  	            System.out.print("moyenne est: "+l1.get(a) + " ");
							  	            noteAll = noteAll + l1.get(a);
							  	        }
							  			 
							  			System.out.println("somme des moyennes est "+noteAll+conduite1);
							  		//	 liste des coefficients
							  			MoyenneSemestre moySem = new MoyenneSemestre();
							  			moySem.setInscription(insc);
							  			moySem.setSemestre(semestre);
								  		moySem.setNote((noteAll+conduite1)/(somCoefficient+1));

							  		//	moySem.setNote((coefPc*pcMoyenneX+coefFr*frMoyenneX+coefAng*angMoyenneX+coefHG*hgMoyenneX+coefMath*mathMoyenneX+coefSvt*svtMoyenneX+coefEfs*efsMoyenneX+coefEps*epsMoyenneX+coefConduite*conduite1)/(coefPc+coefFr+coefAng+coefHG+coefMath+coefSvt+coefEfs+coefEps+coefConduite));
							  			
							  			moyenneSemestreService.saveMoyenneSemestre(moySem);
				      				}
				      				
				      				 for (Matiere matiere : matiereList) 
						  	  		 {
				      									      					
				      					/****************** debut note ***************************/
				      					List<Note> noteList = noteService.getAllNoteNotCompo(idInscrip, semestre, matiere.getIdMatiere());
								        float noteClasse= 0;
						  	  			float somme = 0;
						  	  			float noteCompo = 0;
						  	  			float moyenne1 = 0;
						  	  			int nombreNote = 0;
						  	  			int coefficient = 0;
							  	  		if (noteList.isEmpty()) {
							  	  			noteClasse= 0;			  	  			
										} 
							  	  		else
							  	  		{
							  	  			nombreNote = noteList.size();
							  	  			for (Note n : noteList) {
							  	  			somme = somme + n.getNote();
							  	  			 
							  	  		 }
							  	  		 noteClasse = somme/nombreNote;
							  	  		}
							  	  		
							  	  		Note noteCompoExist = noteService.findNoteCompoExist(idInscrip, matiere.getIdMatiere(), semestre);
							  	  		if(noteCompoExist != null)
							  	  		{
							  	  		  noteCompo = noteCompoExist.getNote();
							  	  		}
							  	  		
							  	  		moyenne1 = (noteClasse + noteCompo)/2;
							  	  		noteClasseTotale = noteClasseTotale + noteClasse;
							  	  		
							  	  		/*************************/			  	  			
								  	  	liste_matiere.append(matiere.getNomMatiere()+"_-*-_");
						  	  			
						  	  			Coefficient coefficientExist = coefficientService.findCoefficient(inscriptionExist.getDetailClasse().getAnneeScolaire().getIdAnneeScolaire(), idClasse, matiere.getIdMatiere());
							  	  		if(coefficientExist == null)
										{
							  	  			liste_matiere.append("0"+"_-*-_");			  	  			
										}	
										else
										{	
											coefficient = coefficientExist.getValeur();
											liste_matiere.append(coefficient+"_-*-_");
										}
							  	  		liste_matiere.append(df.format(noteClasse)+"_-*-_");
							  	  		liste_matiere.append(df.format(noteCompo)+"_-*-_");
							  	  		liste_matiere.append(df.format(moyenne1)+"_-*-_");
							  	  		liste_matiere.append(df.format(moyenne1*coefficient)+"_-*-_");//Moyenne generale par matiere
				      					
							  	  		totalMoyenne =totalMoyenne + (moyenne1*coefficient);
							  	  		/****************** fin note ***************************/
				      					
				      					/****************** debut rang ***************************/
							  	  		List<Moyenne> listeMoyenne = moyenneService.getAllMoyenneByIdMatiere(matiere.getIdMatiere());
							  	  		
							  	  		int mati =1;
				    	      			int mati2 =1;
				    	      			int matiRang = 0;
				    	      			int matiCompteur = 0;
				    	      			float matiLaMoyenne = 0;
				    	      			
				    		  			for (Moyenne moyenne2 : listeMoyenne) {
				    		  				
				    		  				if (idInscrip == moyenne2.getInscription().getIdInscription())
				    		  				{
				    		  					matiRang = mati;
				    		  					matiLaMoyenne = moyenne2.getNote();
				    		  				}
				    		  						
				    		  				mati++;
				    		  			}
				    		  			
				    		  			for (Moyenne moyenne2 : listeMoyenne) {
				    		  				if (matiLaMoyenne == moyenne2.getNote())
				    		  				{
				    		  					
				    		  					matiCompteur = matiCompteur +1;
				    		  				}			  						
				    		  				mati2++;
				    		  			}	
				    		  			
				    		  			int[] matiTab  = new int[matiCompteur];
				    		  			int matiJ = 1;
				    		  			int matiJ2 = 0;
				    		  			for (Moyenne moyenne3 : listeMoyenne) {
				    		  				if (matiLaMoyenne == moyenne3.getNote())
				    		  				{			    		  					
				    		  					matiTab[matiJ2] = matiJ;
				    		  					matiJ2++;
				    		  				}			  						
				    		  				matiJ++;
				    		  			}
				    		  			
				    		  			if(matiCompteur > 1)
				    		  			{
				    			  	  		if (matiTab[0]==1)
				    			  	  		liste_matiere.append( matiTab[0]+"er ex"+"_-*-_");
				    			  	  		//	entity.put("matiRang1", matiTab[0]+"er ex");
				    			  	  		else
				    			  	  		liste_matiere.append(matiTab[0]+"e ex+"+"_-*-_");
				    			  	  		//	entity.put("matiRang1", matiTab[0]+"e ex");
				    		  			}
				    		  	  		else
				    		  	  		{
				    		  	  			if (matiRang==1)
				    		  	  			liste_matiere.append( matiRang+"er"+"_-*-_");
				    		  	  			//	entity.put("matiRang1", matiRang+"er");
				    		  	  			else
				    		  	  			liste_matiere.append( matiRang+"e"+"_-*-_");	
				    		  	  			//	entity.put("matiRang1", matiRang+"e");
				    		  	  		}
				    		  			/****************** fin rang ***************************/
				    		  			liste_matiere.append( appreciation(moyenne1)+"_-*-_");
						  	  		 }
				      				
				      				/* debut determiner rang general*/
				 		  			List<MoyenneSemestre> listeMoyenneSemestre = null;
				 	      			
				 		  			listeMoyenneSemestre = moyenneSemestreService.getAllMoyenneSemestre1();
				 		  			
				 		  			int moySem =1;
				 	      			int moySem2 =1;
				 	      			int moySemRang = 0;
				 	      			int moySemCompteur = 0;
				 	      			float moySemLaMoyenne = 0;
				 	      			float moySemSomme = 0;
				 	      			int moySemNombre = 0;
				 	      			float plusGrand = 0;
				 	      			float plusPetit = 0;
				 	      			int cptSupDix = 0;
				 	      			
				 		  			for (MoyenneSemestre moyenneSemestre : listeMoyenneSemestre) {
				 		  				if (idInscrip == moyenneSemestre.getInscription().getIdInscription())
				 		  				{
				 		  					moySemRang = moySem;
				 		  					moySemLaMoyenne = moyenneSemestre.getNote();
				 		  				}
				 		  				
				 		  				moySemSomme = moySemSomme + moyenneSemestre.getNote();
				 		  				
				 		  				moySemNombre = moySemNombre + 1;
				 		  				
				 		  				// debut Recherche plus grande moyenne
				 		  				if(moySem ==1 || moyenneSemestre.getNote()>plusGrand)
				 		  				{
				 		  					plusGrand = moyenneSemestre.getNote();
				 		  				}
				 		  				// fin recherche plus grande moyenne
				 		  				
				 		  				// debut Recherche plus petite moyenne
				 		  				if(moySem ==1 || moyenneSemestre.getNote()<plusPetit)
				 		  				{
				 		  					plusPetit = moyenneSemestre.getNote();
				 		  				}
				 		  				// fin recherche plus petite moyenne
				 		  				
				 		  				// debut Recherche nombre >= 10
				 		  				if(moyenneSemestre.getNote()>=10)
				 		  				{
				 		  					cptSupDix = cptSupDix + 1;
				 		  				}
				 		  				// fin recherche nombre >= 10
				 		  				moySem++;
				 		  			}
				 		  			/*
				 		  			System.out.println("la somme moyenne est "+moySemSomme);
				 		  			System.out.println("le nombre moyenne est "+moySemNombre);
				 		  			System.out.println("la plus grande moyenne est "+plusGrand);
				 		  			System.out.println("la plus petit moyenne est "+plusPetit);
				 		  			System.out.println("nombre >= 10 est "+cptSupDix);
				 		  			*/
				 		  			// calculer le nombre de moyennes qui sont egales
				 		  			for (MoyenneSemestre moyenneSemestre: listeMoyenneSemestre) {
				 		  				if (moySemLaMoyenne == moyenneSemestre.getNote())
				 		  				{
				 		  					
				 		  					moySemCompteur = moySemCompteur +1;
				 		  				}			  						
				 		  				moySem2++;
				 		  			}	
				 		  			
				 		  			int[] moySemTab  = new int[moySemCompteur];
				 		  			int moySemJ = 1;
				 		  			int moySemJ2 = 0;
				 		  			for (MoyenneSemestre moyenneSemestre: listeMoyenneSemestre) {
				 		  				if (moySemLaMoyenne == moyenneSemestre.getNote())
				 		  				{			  					
				 		  					moySemTab[moySemJ2] = moySemJ;
				 		  					moySemJ2++;
				 		  				}			  						
				 		  				moySemJ++;
				 		  			}
				 		  					  			
				 		  			/* fin determiner rang general*/
				 		  			int conduite ;
				 		  			
				 		  			if (bulletinService.findConduiteByIdInscrip(idInscrip) == null)
								  		conduite = 0;
								  	else
								  		conduite = Integer.parseInt(bulletinService.findConduiteByIdInscrip(idInscrip));
						  	  	
				 		  			float moyenneSem1 = (totalMoyenne + conduite)/(somCoefficient+1);
				 		  			
				 		  			Bulletin bulletinExist = bulletinService.findBulletinByInscriptionAndSemestre(idInscrip, semestre);
				 		  			
					  	  			JSONObject entity = new JSONObject();
						  			entity.put("idEleve", inscriptionExist.getEleve().getIdEleve());
						  			entity.put("anneeScolaire", anneeScolaire);
						  			entity.put("matricule", matri);
						  			entity.put("nom", nom);
						  			entity.put("prenom", prenom);
						  			entity.put("sexe", sexe);
						  			entity.put("dateNaiss", dateNaiss);
						  			entity.put("tel", tel); 
						  			entity.put("effectif", effectif);		  			
					  	  		    entity.put("nomClasse", classe);
					  	  		    entity.put("conduite", conduite);
					  	  		    entity.put("conduiteClasse", detailClasseExist.getConduiteClasse());
					  	  		    entity.put("totalCoef", somCoefficient+1);
					  	  		    entity.put("totalCoefSur", 20*(somCoefficient+1));
					  	  		    entity.put("totalMoyenne",  df.format(totalMoyenne + conduite));
					  	  		    entity.put("moyenneSem1",  df.format(moyenneSem1));
					  	  		    entity.put("moyenneClasse",  df.format(moySemSomme/moySemNombre));
						  	  		entity.put("plusGrand",  df.format(plusGrand));
					  	  		    entity.put("plusPetit",  df.format(plusPetit));
					  	  		    entity.put("cptSupDix",  cptSupDix);
					  	  		   if (bulletinExist == null)
					  	  		    {
					  	  		    	entity.put("appreciation", "RAS");
					  	  		    	entity.put("tabHon", "");
					  	  		    	entity.put("assiduite", "RAS");
					  	  		    }
					  	  		    else
					  	  		    {
						  	  		    entity.put("tabHon", bulletinExist.getTableauHonneur());
						  	  		    entity.put("appreciation", bulletinExist.getAppreciation());
						  	  		    entity.put("assiduite", bulletinExist.getAssiduite());
						  	  		    entity.put("prof", bulletinExist.getProfesseur().getPrenom()+" "+bulletinExist.getProfesseur().getNom());System.out.println("nom "+bulletinExist.getProfesseur().getPrenom()+" "+bulletinExist.getProfesseur().getNom());
					  	  		    }
					  	  		    entity.put("listeMatiere", liste_matiere);
						  	  		if(moySemCompteur > 1)
						  			{
							  	  		if (moySemTab[0]==1)
							  	  			entity.put("moySemRang1", moySemTab[0]+"er ex");
							  	  		else
							  	  			entity.put("moySemRang1", moySemTab[0]+"e ex");
						  			}
						  	  		else
						  	  		{
						  	  			if (moySemRang==1)			  	  				
						  	  				entity.put("moySemRang1", moySemRang+"er");
						  	  			else
						  	  				entity.put("moySemRang1", moySemRang+"e");
						  	  		}
					  	  		    System.out.println("liste est: "+liste_matiere);
					  	  		    response.getWriter().println(entity);
				      			}
			  	  		  
				  	  		}
					  	  	
		  	  			} 
	  	  		   }
			}		
   	}
    
 
	// ******************* Fin Recherche***************************

  //************** Debut Liste ************** 

    @RequestMapping(value = "/liste-utilisateur", method = RequestMethod.GET)
	public String showUsers(ModelMap model, HttpSession session) {
		
		model.put("users", userService.getAllUsers());
		model.addAttribute("liste-utilisateur", new User());
		// model.put("todos", com.gescollege.service.retrieveTodos(name));
		return "liste-utilisateur";
	}
    
  //************** Fin Liste ************** 
    
  //************** Debut Modifier **************   

	@RequestMapping(value = "/modifierUtilisateur", method = RequestMethod.POST)
	public ResponseEntity<String> updateUser(@Valid User user, BindingResult result,ModelMap modelMap, @RequestParam(name = "hiddenPwd") String hiddenPwd, @RequestParam(name = "apwd") String apwd, @RequestParam(name = "npwd") String npwd) {

		long idUser = user.getIdUser();
		String nom = user.getNom();
		String prenom = user.getPrenom();
		String login = user.getLogin();		
		
		if (result.hasErrors()) {
			return new ResponseEntity<String>("Erreur survenue lors de l'enregistrement: " , HttpStatus.BAD_REQUEST);
		}
		
		User userExist = userService.findByLoginAndIdUserNot(login, idUser);
		
		if (userExist != null) {
					return new ResponseEntity<String>("Ce login existe déjà!!!", HttpStatus.BAD_REQUEST);
				} 
				else
				{					
					if(apwd.isEmpty() && npwd.isEmpty())
					{
						userService.updateUser( nom,  prenom,  login,  hiddenPwd, idUser);
						return new ResponseEntity<String>("ok", HttpStatus.OK);
					}
					else
					{				
						String pass = userService.findPwdById(idUser);
						
						if(!pass.equals(apwd))
						{
							return new ResponseEntity<String>("L'ancien mot de passe est erroné!!!", HttpStatus.BAD_REQUEST);

						}
						else
							userService.updateUser( nom,  prenom,  login, npwd, idUser);
						return new ResponseEntity<String>("ok", HttpStatus.OK);
					}				
				}				
	}
	
	@RequestMapping(value = "/modifierEleve", method = RequestMethod.POST)
	public ResponseEntity<String> updateEleve(@Valid Eleve eleve, ModelMap modelMap, @RequestParam(name = "idEleve") long idEleve, @RequestParam(name = "nom") String nom, @RequestParam(name = "prenom") String prenom, @RequestParam(name = "sexe") String sexe, @RequestParam(name = "jourNaiss") String jourNaiss, @RequestParam(name = "moisNaiss") String moisNaiss,@RequestParam(name = "anneeNaiss") String anneeNaiss, @RequestParam(name = "matricule") String matricule, @RequestParam(name = "tel") String tel) {
		

		Eleve eleveExist = eleveService.findByMatriculeAndIdEleveNot(matricule, idEleve);
		if (eleveExist != null) {
			return new ResponseEntity<String>("Ce matricule existe déjà!!!", HttpStatus.BAD_REQUEST);
		} 
		else
		{
			
			Date fecha;		
				String dateNaiss = anneeNaiss+"-"+moisNaiss+"-"+jourNaiss;
				try {
					fecha = new SimpleDateFormat("yyyy-MM-dd").parse(dateNaiss);
					eleveService.updateEleve(nom, prenom, sexe, fecha , tel, matricule, idEleve);
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		
			return new ResponseEntity<String>("ok", HttpStatus.OK);			
		}
	}

	@RequestMapping(value = "/modifierAnneeScolaire", method = RequestMethod.POST)
	public ResponseEntity<String> updateAnnee(@Valid AnneeScolaire annee, BindingResult result,ModelMap modelMap , @RequestParam(name = "idAnneeScolaire") long idAnneeScolaire) {

		String debut = annee.getDebut();
		String fin = annee.getFin();

		if (result.hasErrors()) {System.out.println("erreur ici: ");
			return new ResponseEntity<String>("Erreur survenue lors de l'enregistrement: " , HttpStatus.BAD_REQUEST);
			
		}
		
		AnneeScolaire anneeExist = anneeScolaireService.findByDebutAndFin(debut, fin);
		
		if (anneeExist != null) {
					return new ResponseEntity<String>("Cette année scolaire existe déjà!!!", HttpStatus.BAD_REQUEST);
				} 
				else
				{
					anneeScolaireService.updateAnneeScolaire(debut, fin, idAnneeScolaire);
					return new ResponseEntity<String>("ok", HttpStatus.OK);			
				}				
		}
	
	@RequestMapping(value = "/changerAnneeScolaire", method = RequestMethod.POST)
	public ResponseEntity<String> changerAnnee(@Valid AnneeScolaire annee, BindingResult result,ModelMap modelMap , @RequestParam(name = "debut2") String debut, @RequestParam(name = "fin2") String fin) {


		if (result.hasErrors()) {System.out.println("erreur ici: ");
			return new ResponseEntity<String>("Erreur survenue lors de l'enregistrement: " , HttpStatus.BAD_REQUEST);
			
		}
		
		AnneeScolaire anneeExist = anneeScolaireService.findByDebutAndFin(debut, fin);
		
		if (anneeExist == null) {
					return new ResponseEntity<String>("Cette année scolaire n'existe pas!!!", HttpStatus.BAD_REQUEST);
				} 
				else
				{
					long idAnneeScolaire = anneeExist.getIdAnneeScolaire();
					
					AnneeScolaire anneeEnCoursExist = anneeScolaireService.findAnneeEnCours();
			  		if(anneeEnCoursExist == null)
			  		{
			  			anneeScolaireService.setAnneeScolaireEnCours( idAnneeScolaire);
			  			return new ResponseEntity<String>("ok", HttpStatus.OK);
			  		}
			  		else
			  		{	
			  			if(debut.equals(anneeEnCoursExist.getDebut()) && fin.equals(anneeEnCoursExist.getFin()))
			  					{
			  					return new ResponseEntity<String>("Cette année académique est déjà en cours " , HttpStatus.BAD_REQUEST);
			  					}
			  			else
			  			{
			  				anneeScolaireService.removeAnneeScolaireEnCours( anneeEnCoursExist.getIdAnneeScolaire());
			  				anneeScolaireService.setAnneeScolaireEnCours( idAnneeScolaire);
							return new ResponseEntity<String>("ok", HttpStatus.OK);	
				  		}
			  			}
					
			
				}				
		}
	
	@RequestMapping(value = "/modifierCoefficient", method = RequestMethod.POST)
	public void updateCoefficient(@Valid Coefficient coefficient, BindingResult result,ModelMap modelMap , @RequestParam(name = "nouvelleVal") int val , @RequestParam(name = "idCoefficient") long idCoefficient, HttpServletResponse response)  throws ServletException, IOException{

		response.setContentType("text/html;charset=UTF-8");
		
		if (result.hasErrors()) {
			response.getWriter().println("Erreur survenue lors de l'enregistrement:");			
		}
		
		coefficientService.updateCoefficient(val, idCoefficient);
		
        AnneeScolaire anneeScolaireExist = anneeScolaireService.findAnneeEnCours();
    	
    	if (anneeScolaireExist == null) {
    		response.getWriter().println("Aucune année scolaire définie!!!");
		} 
		else
		{
			List<JSONObject> entities = new ArrayList<JSONObject>();
			List<Coefficient> coefficientList = coefficientService.getAllCoefficientsByAnnee(anneeScolaireExist.getIdAnneeScolaire());
         
	         if (coefficientList.isEmpty()) {
	  				response.getWriter().println("Aucun coefficient ajouté!!!");
				} 
				else
	         {
	             for (Coefficient coef : coefficientList) {
	            	 JSONObject entity = new JSONObject();
				    	 entity.put("idCoefficient", coef.getIdCoefficient());
				    	 entity.put("classe", coef.getClasse().getNomClasse());
				    	 entity.put("matiere", coef.getMatiere().getNomMatiere());
				    	 entity.put("coefficient", coef.getValeur());
				    	     			    	 
	            	 entities.add(entity);
	             }	
	             response.getWriter().println(Arrays.toString(entities.toArray()));
	         }
		}
		
	}
	
	@RequestMapping(value = "/modifierClasse", method = RequestMethod.POST)
	public ResponseEntity<String> updateClasse(@Valid Classe classe, BindingResult result,ModelMap modelMap,  @RequestParam(name = "idClasse") long idClasse) {

		String clas = classe.getNomClasse();

		if (result.hasErrors()) {System.out.println("erreur ici: ");
			return new ResponseEntity<String>("Erreur survenue lors de l'enregistrement: " , HttpStatus.BAD_REQUEST);
			
		}
		
		Classe classeExist = classeService.findByNomClasse(clas);
		
		if (classeExist != null) {
					return new ResponseEntity<String>("Cette classe existe déjà!!!", HttpStatus.BAD_REQUEST);
				} 
				else
				{
					classeService.updateClasse(clas, idClasse);
					return new ResponseEntity<String>("ok", HttpStatus.OK);			
				}				
		}
	
	
	@RequestMapping(value = "/modifierMatiere", method = RequestMethod.POST)
	public ResponseEntity<String> updateMatiere(@Valid Matiere matiere, BindingResult result,ModelMap modelMap, @RequestParam(name = "idMatiere") long idMatiere) {

		String nom = matiere.getNomMatiere();

		if (result.hasErrors()) {System.out.println("erreur ici: ");
			return new ResponseEntity<String>("Erreur survenue lors de l'enregistrement: " , HttpStatus.BAD_REQUEST);
			
		}
		
		Matiere matiereExist = matiereService.findByNomMatiere(nom);
		
		if (matiereExist != null) {
					return new ResponseEntity<String>("Cette matière existe déjà!!!", HttpStatus.BAD_REQUEST);
				} 
				else
				{
					matiereService.updateMatiere(nom, idMatiere);
					return new ResponseEntity<String>("ok", HttpStatus.OK);			
				}				
		}
	
	  
    @PostMapping("/modifierVersement")
  	public ResponseEntity<String> updateVersement(@Valid Classe classe, BindingResult result,ModelMap modelMap,@RequestParam(name = "idInscription3") long idInscription,@RequestParam(name = "mois1") String nouveauMois, @RequestParam(name = "mois3") String ancienMois, @RequestParam(name = "jourVersement1") String jourVersement,@RequestParam(name = "moisVersement1") String moisVersement,@RequestParam(name = "anneeVersement1") String anneeVersement,@RequestParam(name = "versement1") long versement) {

  		if (result.hasErrors()) {
  			return new ResponseEntity<String>("Erreur survenue lors de l'enregistrement: " , HttpStatus.BAD_REQUEST);
  		}
  		
  		Scolarite scolariteExist = scolariteService.findScolariteByInscriptionAndMois(idInscription, ancienMois);
			
  		if(nouveauMois.equals(ancienMois))
  		{  			
  			String dateV = anneeVersement+"-"+moisVersement+"-"+jourVersement;
	  		
	  			try {
				Date dateVersement = new SimpleDateFormat("yyyy-MM-dd").parse(dateV);
  	  			scolariteService.updateScolarite(dateVersement, ancienMois, versement, scolariteExist.getIdScolarite());

			} catch (ParseException e) {
				// TODO Auto-generated catch block
				return new ResponseEntity<String>("Erreur lors de la mise a jour!", HttpStatus.BAD_REQUEST);
			}
	  			return new ResponseEntity<String>("ok" + result, HttpStatus.OK);
  		}
  		else
  		{
  			Scolarite scolariteExist1 = scolariteService.findScolariteByInscriptionAndMois(idInscription, nouveauMois);
  			 
  			if (scolariteExist1 == null) {
  				String dateV = anneeVersement+"-"+moisVersement+"-"+jourVersement;
  		  		
	  			try {
				Date dateVersement = new SimpleDateFormat("yyyy-MM-dd").parse(dateV);
  	  			scolariteService.updateScolarite(dateVersement, nouveauMois, versement, scolariteExist.getIdScolarite());

			} catch (ParseException e) {
				// TODO Auto-generated catch block
				return new ResponseEntity<String>("Erreur lors de la mise a jour!", HttpStatus.BAD_REQUEST);
			}
	  			return new ResponseEntity<String>("ok" + result, HttpStatus.OK);
	  		} 
  			else
  			{
  				return new ResponseEntity<String>("le versement de "+nouveauMois+" a déjà été effectué!!!", HttpStatus.BAD_REQUEST);
  			}
  		}
  		/*
			if (scolariteExist == null) {
	  			return new ResponseEntity<String>("le versement de "+mois+" n'a pas été effectué!!!", HttpStatus.BAD_REQUEST);
	  		} 
	  		else
	  		{ 
	  			if(anneeVersement.equals("") || moisVersement.equals("") || jourVersement.equals(""))	
	  			{
	  				scolariteService.updateScolarite1( versement, scolariteExist.getIdScolarite());
	  			}
	  			else
	  			{
		  			String dateV = anneeVersement+"-"+moisVersement+"-"+jourVersement;
		  		
	  	  			try {
						Date dateVersement = new SimpleDateFormat("yyyy-MM-dd").parse(dateV);
		  	  			scolariteService.updateScolarite(dateVersement, versement, scolariteExist.getIdScolarite());
	
					} catch (ParseException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				
	  			}			
	  			return new ResponseEntity<String>("ok" + result, HttpStatus.OK);
	  		}*/
  	}
    
    
    @PostMapping("/modifierConduiteClasse")
  	public ResponseEntity<String> updateConduiteClasse(@Valid Classe classe, BindingResult result,ModelMap modelMap, @RequestParam(name = "idDetailClasse") long idDetailClasse, @RequestParam(name = "conduiteClasse") float conduiteClasse) {

  		//String date = java.time.LocalDate.now().toString();
    	DetailClasse detailClasseExist = detailClasseService.findDetailClasseByIdDetailClasse(idDetailClasse);
	  		
		if(detailClasseExist == null)
		{
			return new ResponseEntity<String>("Cette classe n'existe pas!!!", HttpStatus.BAD_REQUEST);
		}	
		else
		{
	  		  	
			detailClasseService.updateConduiteClasse(conduiteClasse, idDetailClasse);
	  			  	  			
  			return new ResponseEntity<String>("ok" + result, HttpStatus.OK);
	  		}  		
  	}
    
    @PostMapping("/modifierBulletin")
  	public ResponseEntity<String> updateBulletin(@Valid Classe classe, BindingResult result,ModelMap modelMap,@RequestParam(name = "idInscription7") long idInscription, @RequestParam(name = "semestre") int semestre, @RequestParam(name = "assiduite") String assiduite, @RequestParam(name = "profResponsable") long profResponsable, @RequestParam(name = "conduite") String conduite, @RequestParam(name = "tableauHonneur") String tableauHonneur,  @RequestParam(name = "appreciation") String appreciation) {

  		//String date = java.time.LocalDate.now().toString();
  		if (result.hasErrors()) {
  			return new ResponseEntity<String>("Erreur survenue lors de l'enregistrement: " , HttpStatus.BAD_REQUEST);
  		}
  		
  		Inscription inscriptionExist = inscriptionService.findByIdInscription(idInscription);
	  		
	  		if (inscriptionExist == null) {
	  			return new ResponseEntity<String>("Cette inscription n'existe pas!!!", HttpStatus.BAD_REQUEST);
	  		} 
	  		else
	  		{  	
	  			Bulletin bulletinExist = bulletinService.findBulletinByInscriptionAndSemestre(inscriptionExist.getIdInscription(), semestre);
	  			
	  			if(bulletinExist == null)
	  			{
  	  			Bulletin bulletin = new Bulletin();
  	  			Professeur professeurExist = new Professeur();
  	  			professeurExist.setIdProfesseur(profResponsable);

  	  			bulletin.setInscription(inscriptionExist);
  	  			bulletin.setProfesseur(professeurExist);
  	  			bulletin.setSemestre(semestre);
  	  			bulletin.setConduite(conduite);
  	  			bulletin.setTableauHonneur(tableauHonneur);
  	  			bulletin.setAssiduite(assiduite);
  	  			bulletin.setAppreciation(appreciation);
	  			bulletinService.saveBulletin(bulletin);
	  			}
	  			else
	  			{
	  			bulletinService.updateBulletin(semestre, conduite, tableauHonneur, assiduite, appreciation, bulletinExist.getIdBulletin());
	  			}
	  			  	  			
  			return new ResponseEntity<String>("ok" + result, HttpStatus.OK);
	  		}  		
  	}
    
    
    @PostMapping("/modifierNote")
  	public void updateNote(@Valid Note note, BindingResult result,ModelMap modelMap,@RequestParam(name = "idNote") long idNote, @RequestParam(name = "note2") String maNote, @RequestParam(name = "semestre") int semestre, HttpServletResponse response ) throws ServletException, IOException{
    	response.setContentType("text/html;charset=UTF-8");
    	

  		if (result.hasErrors()) {
  			response.getWriter().println("Erreur survenue lors de l'enregistrement: ");
  		}
  		
			Note noteExist = noteService.findNoteExist(idNote);
	  		maNote = maNote.replaceAll(",",".");
			Float maNote1 = new Float(maNote);
			
			noteService.updateNote( maNote1, idNote  );
	  		    
  	  		List<JSONObject> entities1 = new ArrayList<JSONObject>();
  			List<Note> noteList1 = noteService.getAllNoteByIdInscription(noteExist.getInscription().getIdInscription(), semestre);

  			if (noteList1.isEmpty()) {
  				response.getWriter().println("Aucune note ajoutée!!!");
			} 
			else
			{				
			    for (Note n : noteList1) {
			    	JSONObject entity = new JSONObject();
			    	entity.put("idNote", n.getIdNote());
			    	entity.put("matiere", n.getMatiere().getNomMatiere());
    		    	entity.put("typeNote", n.getTypeNote());
    		    	entity.put("note", n.getNote());
			        
    		    	entities1.add(entity);
			    }  
			    response.getWriter().println(Arrays.toString(entities1.toArray()));
			}	  
   	}
    
   /* 
    @PostMapping("/modifierNote")
  	public void updateNote(@Valid Note note, BindingResult result,ModelMap modelMap,@RequestParam(name = "idNote") long idNote, @RequestParam(name = "idEleve9") long idEleve,@RequestParam(name = "semestre1") String semestre, @RequestParam(name = "matiere1") String matiere, @RequestParam(name = "typeNote1") String typeNote, @RequestParam(name = "note1") float maNote, @RequestParam(name = "ancienTypeNote") String ancienTypeNote, HttpServletResponse response ) throws ServletException, IOException{

    	response.setContentType("text/html;charset=UTF-8");
    	
  		if (result.hasErrors()) {
  			response.getWriter().println("Erreur survenue lors de l'enregistrement: ");
  		}
  		
  		Eleve eleveExist = eleveService.findByIdEleve(idEleve);
  		
  		if (eleveExist == null) {
  			response.getWriter().println("Cet élève n'existe pas!!!");
  		} 
  		else
  		{ 
  	  		Inscription inscriptionExist = inscriptionService.findByIdEleveAndAnneeEnCours(idEleve);
  	  		  		
  	  		if (inscriptionExist == null) {
  	  		response.getWriter().println("Cette inscription n'existe pas!!!");
  	  		} 
  	  		else
  	  		{   
  	  			long idMatiere = matiereService.findIdMatiereByNom(matiere);
  	  			Note noteExist = noteService.findNoteCompo1Exist(inscriptionExist.getIdInscription(), idMatiere);
  	  			
	  	  		if(typeNote.equals("composition") )
	  			{
	  	  			if (!ancienTypeNote.equals("composition"))
  	  					{
			  	  			
				  			if (noteExist != null) {
				  				response.getWriter().println("Cette note de composition existe déjà!!!");	
				  			}
				  			else
				  			{
				  				noteService.updateNote(semestre, typeNote, maNote, idMatiere, idNote  );
				  	  		    
					  	  		List<JSONObject> entities = new ArrayList<JSONObject>();
					  			List<Note> noteList = noteService.getAllNote1ByIdInscription(inscriptionExist.getIdInscription());
					
					  			if (noteList.isEmpty()) {
					  				response.getWriter().println("Aucune note ajoutée!!!");
								} 
								else
								{				
								    for (Note n : noteList) {
								    	JSONObject entity = new JSONObject();
								    	entity.put("idNote", n.getIdNote());
								    	entity.put("matiere", n.getMatiere().getNomMatiere());
					    		    	entity.put("typeNote", n.getTypeNote());
					    		    	entity.put("note", n.getNote());
								        
					    		    	entities.add(entity);
								    }   System.out.println("ici 1");
								    response.getWriter().println(Arrays.toString(entities.toArray()));
								}
				  			}
  	  					}
			  	  		else
			  			{System.out.println("note modifiee est "+maNote);
			  				noteService.updateNote(semestre, typeNote, maNote, idMatiere, idNote  );
			  	  		    
				  	  		List<JSONObject> entities1 = new ArrayList<JSONObject>();
				  			List<Note> noteList1 = noteService.getAllNote1ByIdInscription(inscriptionExist.getIdInscription());
				
				  			if (noteList1.isEmpty()) {
				  				response.getWriter().println("Aucune note ajoutée!!!");
							} 
							else
							{				
							    for (Note n : noteList1) {
							    	JSONObject entity = new JSONObject();
							    	entity.put("idNote", n.getIdNote());
							    	entity.put("matiere", n.getMatiere().getNomMatiere());
				    		    	entity.put("typeNote", n.getTypeNote());
				    		    	entity.put("note", n.getNote());
				    		    	System.out.println("note est: "+n.getNote());
							        
				    		    	entities1.add(entity);
							    }   System.out.println("ici meme");
							    response.getWriter().println(Arrays.toString(entities1.toArray()));
							}
			  			}
	  			}
		  	  	else
	  			{
		  			noteService.updateNote(semestre, typeNote, maNote, idMatiere, idNote  );
	  	  		    
		  	  		List<JSONObject> entities = new ArrayList<JSONObject>();
		  			List<Note> noteList = noteService.getAllNote1ByIdInscription(inscriptionExist.getIdInscription());
		
		  			if (noteList.isEmpty()) {
		  				response.getWriter().println("Aucune note ajoutée!!!");
					} 
					else
					{				
					    for (Note n : noteList) {
					    	JSONObject entity = new JSONObject();
					    	entity.put("idNote", n.getIdNote());
					    	entity.put("matiere", n.getMatiere().getNomMatiere());
		    		    	entity.put("typeNote", n.getTypeNote());
		    		    	entity.put("note", n.getNote());
					        
		    		    	entities.add(entity);
					    }   System.out.println("ici 3");
					    response.getWriter().println(Arrays.toString(entities.toArray()));
					}
	  			}
	  	  			
  	  			/*long idMatiere = matiereService.findIdMatiereByNom(matiere);
  	  		 	
  	  		  	if(typeNote.equals("composition") && !ancienTypeNote.equals("composition"))
	  			{
  	  				System.out.println("id inscription est: "+inscriptionExist.getIdInscription());
		  			Note noteExist = noteService.findNoteCompo1Exist(inscriptionExist.getIdInscription(), idMatiere);
		  			if (noteExist != null) {
		  				response.getWriter().println("Cette note de composition existe déjà!!!");	
		  			}
		  			else
		  			{
		  				noteService.updateNote(semestre, typeNote, maNote, idMatiere, idNote  );
		  	  		    
			  	  		List<JSONObject> entities = new ArrayList<JSONObject>();
			  			List<Note> noteList = noteService.getAllNote1ByIdInscription(inscriptionExist.getIdInscription());
			
			  			if (noteList.isEmpty()) {
			  				response.getWriter().println("Aucune note ajoutée!!!");
						} 
						else
						{				
						    for (Note n : noteList) {
						    	JSONObject entity = new JSONObject();
						    	entity.put("idNote", n.getIdNote());
						    	entity.put("matiere", n.getMatiere().getNomMatiere());
			    		    	entity.put("typeNote", n.getTypeNote());
			    		    	entity.put("note", n.getNote());
						        
			    		    	entities.add(entity);
						    }   
						    response.getWriter().println(Arrays.toString(entities.toArray()));
						}
		  			}
  	  			
	  			}
  	  			else
  	  			{System.out.println("autre matiere");
  	  				noteService.updateNote(semestre, typeNote, maNote, idMatiere, idNote  );
  	  		    
	  	  		List<JSONObject> entities = new ArrayList<JSONObject>();
	  			List<Note> noteList = noteService.getAllNote1ByIdInscription(inscriptionExist.getIdInscription());
	
	  			if (noteList.isEmpty()) {
	  				response.getWriter().println("Aucune note ajoutée!!!");
				} 
				else
				{				
				    for (Note n : noteList) {
				    	JSONObject entity = new JSONObject();
				    	entity.put("idNote", n.getIdNote());
				    	entity.put("matiere", n.getMatiere().getNomMatiere());
	    		    	entity.put("typeNote", n.getTypeNote());
	    		    	entity.put("note", n.getNote());
				        
	    		    	entities.add(entity);
				    }   
				    response.getWriter().println(Arrays.toString(entities.toArray()));
				}
  	  		
  			  }
  	  		
  	  		    
  	  		}
  		}	
  		
  	}
 */
	// ***************** fin Modification ***************************
	
	// ****************** Debut Suppression
	
	@RequestMapping(value = "/supprimerEleve", method = RequestMethod.POST)
	public ResponseEntity<String> deleteEleve(@Valid Eleve eleve, ModelMap modelMap, BindingResult result, @RequestParam(name = "idEleve12") long idEleve) {
		
		if (result.hasErrors()) {System.out.println("erreur ici: ");
		return new ResponseEntity<String>("Erreur survenue lors de l'enregistrement: " , HttpStatus.BAD_REQUEST);
		
		}
		
		Eleve eleveExist = eleveService.findByIdEleve(idEleve);
		
		if (eleveExist == null) {
			return new ResponseEntity<String>("Cet élève n'existe pas!!!", HttpStatus.BAD_REQUEST);
  		} 
  		else
  		{ 
  	  		Inscription inscriptionExist = inscriptionService.findByIdEleveAndAnneeEnCours(idEleve);
  	  		  		
  	  		if (inscriptionExist == null) {
	  	  		eleveService.deleteEleveById(idEleve);
	  			
	  			return new ResponseEntity<String>("ok" , HttpStatus.OK);
  	  		} 
  	  		else
  	  		{  
  	  			bulletinService.deleteBulletinByIdInscription(inscriptionExist.getIdInscription());
  	  			moyenneService.deleteMoyenneByIdInscription(inscriptionExist.getIdInscription());
  	  			moyenneSemestreService.deleteMoyenneSemestreByIdInscription(inscriptionExist.getIdInscription());
	  	  		scolariteService.deleteScolariteByIdInscription(inscriptionExist.getIdInscription());
	  	  		noteService.deleteNoteByIdInscription(inscriptionExist.getIdInscription());
	  	  		inscriptionService.deleteInscriptionByIdEleve(idEleve);
	  	  		eleveService.deleteEleveById(idEleve);
  	  			/*
  	  			List<Scolarite> scolariteList = scolariteService.getAllScolariteByIdInscription(inscriptionExist.getIdInscription());
  	  			
  	  			if (!scolariteList.isEmpty()) {
  	  				scolariteService.deleteScolariteByIdInscription(inscriptionExist.getIdInscription());
  	  			}
  	  			
  	  			List<Note> noteList = noteService.getAllNoteByIdInscription(inscriptionExist.getIdInscription());  	  			

  	  			if (!noteList.isEmpty()) {
  	  				noteService.deleteNoteByIdInscription(inscriptionExist.getIdInscription());
  	  			}
  	  			*/
  			
  			return new ResponseEntity<String>("ok" , HttpStatus.OK);
  	  		}
  		}
		
					
	}
	
	@RequestMapping(value = "/supprimerUtilisateur", method = RequestMethod.POST)
	public ResponseEntity<String> deleteUtilisateur( ModelMap modelMap, BindingResult result, @RequestParam(name = "idUser2") long idUser) {
		
		if (result.hasErrors()) {System.out.println("erreur ici: ");
		return new ResponseEntity<String>("Erreur survenue lors de l'enregistrement: " , HttpStatus.BAD_REQUEST);
		
		}
		
		userService.deleteUserById(idUser);
		
		return new ResponseEntity<String>("ok" , HttpStatus.OK);			
	}
	
	@RequestMapping(value = "/supprimerAnneeScolaire", method = RequestMethod.POST)
	public ResponseEntity<String> deleteAnneeScolaire( ModelMap modelMap, @RequestParam(name = "idAnneeScolaire1") long idAnneeScolaire) {
		
		coefficientService.deleteAllCoefficientById(idAnneeScolaire);
		
		anneeScolaireService.deleteAnneeScolaireById(idAnneeScolaire);
		
		return new ResponseEntity<String>("ok" , HttpStatus.OK);			
	}
	
	@RequestMapping(value = "/supprimerClasse", method = RequestMethod.POST)
	public ResponseEntity<String> deleteClasse( ModelMap modelMap, @RequestParam(name = "idClasse1") long idClasse) {
		
		classeService.deleteClasseById(idClasse);
		
		return new ResponseEntity<String>("ok" , HttpStatus.OK);			
	}
	
	@RequestMapping(value = "/supprimerMatiere", method = RequestMethod.POST)
	public ResponseEntity<String> deleteMatiere( ModelMap modelMap, @RequestParam(name = "idMatiere1") long idMatiere) {
		
		matiereService.deleteMatiereById(idMatiere);
		
		return new ResponseEntity<String>("ok" , HttpStatus.OK);			
	}
	
	@RequestMapping(value = "/supprimerMatiereEnseignee", method = RequestMethod.POST)
	public ResponseEntity<String> deleteMatiereEnseignee( ModelMap modelMap, @RequestParam(name = "idMatiere1") long idMatiere) {
		
		matiereEnseigneeService.deleteMatiereEnseigneeById(idMatiere);
		
		return new ResponseEntity<String>("ok" , HttpStatus.OK);			
	}
	
	@RequestMapping(value = "/supprimerCategorie", method = RequestMethod.POST)
	public ResponseEntity<String> deleteCategorie( ModelMap modelMap, @RequestParam(name = "idCategorieClasse1") long idCategorieClasse) {
		
		categorieService.deleteCategorieById(idCategorieClasse);
		
		return new ResponseEntity<String>("ok" , HttpStatus.OK);			
	}
	
	   
    @PostMapping("/supprimerVersement")
  	public ResponseEntity<String> supprimerVersement(@Valid Classe classe, BindingResult result,ModelMap modelMap,@RequestParam(name = "idScolarite") long idScolarite) {

  		if (result.hasErrors()) {
  			return new ResponseEntity<String>("Erreur survenue lors de l'enregistrement: " , HttpStatus.BAD_REQUEST);
  		}
  		
  		Scolarite scolariteExist = scolariteService.findScolariteByIdScolarite(idScolarite);
			
			if (scolariteExist == null) {
	  			return new ResponseEntity<String>("Ce versement n'existe pas!!!", HttpStatus.BAD_REQUEST);
	  		} 
	  		else
	  		{ 
	  			scolariteService.deleteScolariteById(scolariteExist.getIdScolarite());			
	  			return new ResponseEntity<String>("ok" + result, HttpStatus.OK);
	  		}
	
	}
    
    
    @PostMapping("/supprimerNote")
  	public void deleteNote(@Valid Note note, BindingResult result,ModelMap modelMap,@RequestParam(name = "idNote1") long idNote, @RequestParam(name = "idEleve10") long idEleve, @RequestParam(name = "semestre") int semestre, HttpServletResponse response ) throws ServletException, IOException{

    	response.setContentType("text/html;charset=UTF-8");
    	
  		if (result.hasErrors()) {
  			response.getWriter().println("Erreur survenue lors de l'enregistrement: ");
  		}
  		
  		Eleve eleveExist = eleveService.findByIdEleve(idEleve);
  		
  		if (eleveExist == null) {
  			response.getWriter().println("Cet élève n'existe pas!!!");
  		} 
  		else
  		{ 
  	  		Inscription inscriptionExist = inscriptionService.findByIdEleveAndAnneeEnCours(idEleve);
  	  		  		
  	  		if (inscriptionExist == null) {
  	  		response.getWriter().println("Cette inscription n'existe pas!!!");
  	  		} 
  	  		else
  	  		{   
  	  		noteService.deleteNoteById(idNote);
	  		    
  	  		List<JSONObject> entities = new ArrayList<JSONObject>();
  			List<Note> noteList = noteService.getAllNoteByIdInscription(inscriptionExist.getIdInscription(), semestre);

  			if (noteList.isEmpty()) {
  				response.getWriter().println("Aucune note ajoutée!!!");
			} 
			else
			{				
			    for (Note n : noteList) {
			    	JSONObject entity = new JSONObject();
			    	entity.put("idNote", n.getIdNote());
			    	entity.put("matiere", n.getMatiere().getNomMatiere());
    		    	entity.put("typeNote", n.getTypeNote());
    		    	entity.put("note", n.getNote());
			        
    		    	entities.add(entity);
			    }   
			    response.getWriter().println(Arrays.toString(entities.toArray()));
			}
  	  		}
  		}	
  		
  	}
    
    
    @PostMapping("/supprimerCoefficient")
  	public ResponseEntity<String> deleteCoefficient(@Valid Coefficient coefficient, BindingResult result,ModelMap modelMap,@RequestParam(name = "idCoefficient1") long idCoefficient, HttpServletResponse response ) throws ServletException, IOException{

    	response.setContentType("text/html;charset=UTF-8");
    	
  		if (result.hasErrors()) {
  			response.getWriter().println("Erreur survenue lors de l'enregistrement: ");
  		}
  		
  		coefficientService.deleteCoefficientById(idCoefficient);
		    
  		return new ResponseEntity<String>("ok" + result, HttpStatus.OK);
  		
  	}   
 // ******************* Fin suppression***************************
    
    
    public String appreciation(float moyenne)
    {
    	String appreciation = null;
    	
    	if(moyenne < 10)
    		appreciation = "Médiocre";
    	else if (moyenne >= 10 && moyenne <= 11)
    		appreciation = "Passable";
    	else
    		appreciation = "Bien";
    	return appreciation;
    }
}
