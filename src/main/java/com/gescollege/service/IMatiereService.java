package com.gescollege.service;

import java.util.List;

import com.gescollege.model.Matiere;


public interface IMatiereService {
		
	void saveMatiere(Matiere matiere);
	
	long findIdMatiereByNom(String nom);
	
	List <Matiere> getAllMatieres();
		
	void updateMatiere( String nomMatiere, long idMatiere);
	
	void deleteMatiereById(long id);	
	
	Matiere findByNomMatiere(String nomMatiere) ;
	
}