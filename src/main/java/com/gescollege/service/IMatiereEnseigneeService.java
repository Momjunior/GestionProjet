package com.gescollege.service;

import java.util.List;

import org.springframework.data.repository.query.Param;

import com.gescollege.model.MatiereEnseignee;


public interface IMatiereEnseigneeService {
		
	void saveMatiereEnseignee(MatiereEnseignee matiereEnseignee);
	
	List <MatiereEnseignee> getAllMatiereEnseigneesByProfAndAnnee(long idProf, long idAnnee);
	
	MatiereEnseignee findMatiereEnseignee(long idAnneeScolaire, long idMatiere, long idClasse, long idProf) ;
	
	void deleteMatiereEnseigneeById(long id);
	/*
	long findIdMatiereEnseigneeByAnneeEnCours(long idMatiere, long idCategorieMatiere);
	
	List <MatiereEnseignee> getAllMatiereEnseignees();
		
	void updateMatiereEnseignee( int conduiteMatiere, long idAnneeScolaire , long idMatiere , long idCategorieMatiere , long idProfesseur , long idMatiereEnseignee);
	
	void updateConduiteMatiere( float conduiteMatiere, long idMatiereEnseignee);
	
		
	
	MatiereEnseignee findMatiereEnseigneeByNomAndAnnee(long idAnneeScolaire, long idMatiere, long idCategorie) ;
				
	MatiereEnseignee findMatiereEnseigneeByIdMatiereEnseignee(long IdMatiereEnseignee) ;
	*/
}