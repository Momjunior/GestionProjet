package com.gescollege.service;

import java.util.Date;
import java.util.List;

import org.springframework.data.repository.query.Param;

import com.gescollege.model.Professeur;


public interface IProfesseurService {
		
	void saveProfesseur(Professeur eleve);
	
	List <Professeur> getAllProfesseurs();
		
	Professeur findByTel(String tel);
	
	Professeur findByIdProfesseur(long idProfesseur);
		
	void updateProfesseur(String nom, String prenom, String sexe, Date dateNaiss, String tel, long idProfesseur);
	
	void deleteProfesseurById(long id);	
}