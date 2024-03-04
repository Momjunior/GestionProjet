package com.gescollege.service;

import java.util.Date;
import java.util.List;

import org.springframework.data.repository.query.Param;

import com.gescollege.model.Eleve;


public interface IEleveService {
		
	void saveEleve(Eleve eleve);
	
	List <Eleve> getAllEleves();
	
	Eleve findByMatriculeAndIdEleveNot(String matricule, long idEleve );
	
	Eleve findByTel(String tel);
	
	Eleve findByIdEleve(long idEleve);
	
	Eleve findByMatricule(String matricule);
		
	void updateEleve(String nom, String prenom, String sexe, Date dateNaiss, String tel, String matricule, long idEleve);
	
	void updateMatricule(String matricule, long idEleve);
	
	long findIdByMatricule (String matricule);
	
	String findMatriculeById (long idEleve);
	
	void deleteEleveById(long id);	
}