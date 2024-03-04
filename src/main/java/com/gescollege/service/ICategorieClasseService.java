package com.gescollege.service;

import java.util.List;
import com.gescollege.model.CategorieClasse;


public interface ICategorieClasseService {
	
	void saveCategorieClasse(CategorieClasse categorieClasse);
			
	List <CategorieClasse> getAllCategories();
	
	long findIdByCategorie(String categorie);
	
	String findCategorieByIdCategorie(long idCategorie);
	
	CategorieClasse findByNomCategorie(String nomCategorie) ;
	
	void deleteCategorieById(long id);
	
}