package com.gescollege.service;

import java.util.List;

import org.springframework.data.repository.query.Param;

import com.gescollege.model.DetailClasse;


public interface IDetailClasseService {
		
	void saveDetailClasse(DetailClasse detailClasse);
	
	DetailClasse findIdDetailClasseByAnneeEnCours(long idClasse, long idCategorieClasse);
	
	List <DetailClasse> getAllDetailClasses();
		
	void updateDetailClasse( int conduiteClasse, long idAnneeScolaire , long idClasse , long idCategorieClasse , long idProfesseur , long idDetailClasse);
	
	void updateConduiteClasse( float conduiteClasse, long idDetailClasse);
	
	void deleteDetailClasseById(long id);	
	
	DetailClasse findDetailClasseByNomAndAnnee(long idAnneeScolaire, long idClasse, long idCategorie) ;
				
	DetailClasse findDetailClasseByIdDetailClasse(long IdDetailClasse) ;
	
}