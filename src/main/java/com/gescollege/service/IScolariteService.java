package com.gescollege.service;

import java.util.Date;
import java.util.List;

import org.springframework.data.repository.query.Param;

import com.gescollege.model.Scolarite;


public interface IScolariteService {
		
	void saveScolarite(Scolarite scolarite);
	
	List <Scolarite> getAllScolarites();
		
	Scolarite findScolariteByInscriptionAndMois( long idInscription, String mois);
	
	Scolarite findScolariteByIdScolarite( long idScolaritex);
			
	void updateScolarite( Date dateVersement, String mois, long montantVersement, long idScolarite);
	
	void updateScolarite1(long montantVersement, long idScolarite);
	
	void deleteScolariteById(long id);	
	
	void deleteScolariteByIdInscription(long id);
	
	List <Scolarite> getAllScolariteByIdInscription(long idInscription);
	
}