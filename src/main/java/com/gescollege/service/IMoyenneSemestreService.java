package com.gescollege.service;

import java.util.List;

import org.springframework.data.repository.query.Param;

import com.gescollege.model.MoyenneSemestre;


public interface IMoyenneSemestreService {
		
	void saveMoyenneSemestre(MoyenneSemestre moyenne);
	
	void truncateTable();
		
	List <MoyenneSemestre> getAllMoyenneSemestre1();
	
	void deleteMoyenneSemestreByIdInscription(long id);
			
		
}