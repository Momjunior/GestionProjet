package com.gescollege.service;

import java.util.List;

import org.springframework.data.repository.query.Param;

import com.gescollege.model.Coefficient;


public interface ICoefficientService {
	
	Coefficient findCoefficient( long idAnneeScolaire, long idClasse, long idMatiere) ;
		
	void saveCoefficient(Coefficient coefficient);
	
	void updateCoefficient( int valeur, long idCoefficient);
	
	void deleteCoefficientById(long id);
	
	void deleteAllCoefficientById(long id);
	
	List <Coefficient> getAllCoefficientsByAnnee(long idAnnee);
	
	List <Coefficient> getAllCoefficients(long idAnnee, long idClasse, long idMatiere);
	
	int findSommeCoefficient(long idAnnee, long idClasse);
		
	int findCoefficientAnglais(long idClasse);
	
	int findCoefficientPC(long idClasse);
	
	int findCoefficientFr(long idClasse);
	
	int findCoefficientHG(long idClasse);
	
	int findCoefficientMath(long idClasse);
	
	int findCoefficientSvt(long idClasse);
	
	int findCoefficientEfs(long idClasse);
	
	int findCoefficientEps(long idClasse);
		
/*	long findIdCoefficientByNom(String nom);
	
	

	Coefficient findByNomCoefficient(String nomCoefficient) ;
	*/
}