package com.gescollege.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.gescollege.model.Inscription;


public interface InscriptionRepository extends JpaRepository<Inscription, Long>{

	List<Inscription> findAll();
	/*
	@Query("select a.classe.idClasse from Inscription a where a.eleve.idEleve = :idEleve AND  a.anneeScolaire.idAnneeScolaire = :idAnneeScolaire")
	long findIdClasseByIdEleveAndIdAnneeScolaire(@Param("idEleve") long idEleve, @Param("idAnneeScolaire") long idAnneeScolaire);*/
	
	@Query("SELECT count(*) from Inscription a where a.detailClasse.idDetailClasse IN (select a.idDetailClasse from DetailClasse a where a.anneeScolaire.idAnneeScolaire IN (select idAnneeScolaire from AnneeScolaire where statut = 'en cours' )) ")
	int findEffectifTotal();
	
	@Query("SELECT count(*) from Inscription a where a.eleve.sexe = 'Masculin' AND a.detailClasse.idDetailClasse IN (select a.idDetailClasse from DetailClasse a where a.anneeScolaire.idAnneeScolaire IN (select idAnneeScolaire from AnneeScolaire where statut = 'en cours' )) ")
	int findEffectifTotalGarcon();
	
	@Query("SELECT count(*) from Inscription a where a.eleve.sexe = 'Féminin' AND a.detailClasse.idDetailClasse IN (select a.idDetailClasse from DetailClasse a where a.anneeScolaire.idAnneeScolaire IN (select idAnneeScolaire from AnneeScolaire where statut = 'en cours' )) ")
	int findEffectifTotalFille();
	
	@Query("SELECT count(*) from Inscription a where a.detailClasse.idDetailClasse = :idDetailClasse ")
	int findEffectifClasse(@Param("idDetailClasse") long idDetailClasse);
	
	@Query("SELECT count(*) from Inscription a where a.eleve.sexe = 'Masculin' AND a.detailClasse.idDetailClasse = :idDetailClasse ")
	int findEffectifGarcon(@Param("idDetailClasse") long idDetailClasse);
	
	@Query("SELECT count(*) from Inscription a where a.eleve.sexe = 'Féminin' AND a.detailClasse.idDetailClasse = :idDetailClasse ")
	int findEffectifFille(@Param("idDetailClasse") long idDetailClasse);
	
	@Query("From Inscription a where a.detailClasse.idDetailClasse = :idDetailClasse")
	List<Inscription> listInscriptionByClasse(@Param("idDetailClasse") long idDetailClasse);
	
	@Query("select idInscription from Inscription a where a.eleve.idEleve = :idEleve AND a.detailClasse.idDetailClasse IN (select a.idDetailClasse from DetailClasse a where a.anneeScolaire.idAnneeScolaire IN (select idAnneeScolaire from AnneeScolaire where statut = 'en cours' ))")
	long findIdInscriptionByIdEleveAndAnneeEnCours(@Param("idEleve") long idEleve);
	
	@Query("select idInscription from Inscription a where a.eleve.idEleve = :idEleve AND a.detailClasse.idDetailClasse = :idDetailClasse")
	long findIdInscriptionByIdEleveAndIdDetailClasse(@Param("idEleve") long idEleve, @Param("idDetailClasse") long idDetailClasse);	
	
	@Query("select dateInscription from Inscription a where a.eleve.idEleve = :idEleve AND a.detailClasse.idDetailClasse IN (select a.idDetailClasse from DetailClasse a where a.anneeScolaire.idAnneeScolaire IN (select idAnneeScolaire from AnneeScolaire where statut = 'en cours' ))")
	String findDateByIdEleveAndDetailClasse(@Param("idEleve") long idEleve);
	
	@Query("select montant from Inscription a where a.eleve.idEleve = :idEleve AND a.detailClasse.idDetailClasse = :idDetailClase")
	long findMontantByIdEleveAndIdAnneeScolaireAndIdClasse(@Param("idEleve") long idEleve, @Param("idDetailClase") long idDetailClase);
	
	@Query("FROM Inscription a WHERE a.eleve.idEleve = :idEleve AND a.detailClasse.idDetailClasse IN (select a.idDetailClasse from DetailClasse a where a.anneeScolaire.idAnneeScolaire IN (select idAnneeScolaire from AnneeScolaire where statut = 'en cours' ))")
	Inscription findByIdEleveAndAnneeEnCours(@Param("idEleve") long idEleve);
	
	@Query("FROM Inscription WHERE idInscription = :idInscription")
	Inscription findByIdInscription(@Param("idInscription") long idInscription);
		
	 @Query("FROM Inscription a WHERE a.eleve.idEleve = :idEleve")
	 List<Inscription> getAllInscriptionByIdEleve( @Param("idEleve") long idEleve);
	 
	 @Query("FROM Inscription a WHERE a.eleve.idEleve = :idEleve AND a.detailClasse.idDetailClasse = :idDetailClase")
	 List<Inscription> getAllInscriptionByIdEleveAndIdDetailClasse( @Param("idEleve") long idEleve, @Param("idDetailClase") long idDetailClase);
	 
	 @Transactional
	 @Modifying
	 @Query("UPDATE Inscription a SET date = :date, montant = :montant, a.eleve.idEleve = :idEleve, a.detailClasse.idDetailClasse = :idDetailClasse where idInscription = :idInscription")
	 void updateInscription(@Param("date") String date, @Param("montant") long montant, @Param("idEleve") long idEleve, @Param("idDetailClasse") long idDetailClasse, @Param("idInscription") long idInscription);
	 
	 @Transactional
	 @Modifying
	 @Query("DELETE from Inscription WHERE idInscription = :idInscription")
	 void deleteInscriptionById( @Param("idInscription") long idInscription );
	 
	 @Transactional
	 @Modifying
	 @Query("DELETE from Inscription i WHERE i.eleve.idEleve = :idEleve")
	 void deleteInscriptionByIdEleve( @Param("idEleve") long idEleve );

}
