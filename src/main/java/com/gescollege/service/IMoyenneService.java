package com.gescollege.service;

import java.util.List;

import org.springframework.data.repository.query.Param;

import com.gescollege.model.Moyenne;


public interface IMoyenneService {
		
	void saveMoyenne(Moyenne note);
	
	void truncateTable();
	
//	Moyenne findMoyenneCompo1Exist( long idInscription, long idMatiere);
	
//	Moyenne findMoyenneCompoPC1Exist( long idInscription);
		
	List <Moyenne> getAllMoyenneByIdMatiere(long idMatiere);
	
	void deleteMoyenneByIdInscription(long id);
		
}