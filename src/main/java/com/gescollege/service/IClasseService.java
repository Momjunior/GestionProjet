package com.gescollege.service;

import java.util.List;
import com.gescollege.model.Classe;


public interface IClasseService {
		
	void saveClasse(Classe classe);
	
	List <Classe> getAllClasses();
		
	void updateClasse( String classe, long idClasse);
	
	void deleteClasseById(long id);	
	
	Classe findByNomClasse(String classe) ;
		
	String findNomClasseByIdClasse(long idClasse);
		
	long findIdByNomClasse(String classe);
	
}