package com.gescollege.service;

import java.util.List;

import com.gescollege.model.AnneeScolaire;


public interface IAnneeScolaireService {
		
	void saveAnneeScolaire(AnneeScolaire anneeScolaire);
	
	List <AnneeScolaire> getAllAnneeScolaires();
		
	void updateAnneeScolaire( String debut, String fin, long idAnneeScolaire);
	
	void setAnneeScolaireEnCours(  long idAnneeScolaire);
	
	void removeAnneeScolaireEnCours(  long idAnneeScolaire);
	
	void deleteAnneeScolaireById(long id);	
	
	AnneeScolaire findByDebutAndFin(String debut, String fin) ;
	
	AnneeScolaire findAnneeEnCours() ;
		
	long findIdByStatutAnneeScolaire();
	
	String findDebutByStatutAnneeScolaire();
	
	String findFinByStatutAnneeScolaire();
	
}