package com.gescollege.service;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.gescollege.model.Inscription;


public interface IInscriptionService {
		
	void saveInscription(Inscription inscription);
	
//	long findIdClasseByIdEleveAndIdAnneeScolaire( long idEleve, long idAnneeScolaire);
	
	long findIdInscriptionByIdEleveAndAnneeEnCours( long idEleve);
	
	int findEffectifTotal();
	
	int findEffectifTotalGarcon();

	int findEffectifTotalFille();
	
	int findEffectifClasse(long idDetailClasse);
	
	int findEffectifGarcon(long idDetailClasse);
	
	int findEffectifFille(long idDetailClasse);
	
	Inscription findByIdEleveAndAnneeEnCours(long idEleve);
	
	Inscription findByIdInscription(long idInscription);
	
	long findIdInscriptionByIdEleveAndIdDetailClasse( long idEleve, long idDetailClasse);
	
	String findDateByIdEleveAndDetailClasse( long idEleve);
	
	long findMontantByIdEleveAndIdAnneeScolaireAndIdClasse( long idEleve, long idDetailClasse);
	
	List <Inscription> getAllInscriptions();
		
	void updateInscription( String date, long montant, long IdEleve, long idDetailClasse, long idInscription);
	
	void deleteInscriptionById(long id);	
	
	void deleteInscriptionByIdEleve(long id);
	
	List <Inscription> getAllInscriptionByIdEleve(long idEleve);
	
	List <Inscription> listInscriptionByClasse(long idDetailClasse);
	
	List <Inscription> getAllInscriptionByIdEleveAndIdDetailClasse(long idEleve, long idDetailClasse);
	
}