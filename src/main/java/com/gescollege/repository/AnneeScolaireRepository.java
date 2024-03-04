package com.gescollege.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.gescollege.model.AnneeScolaire;


public interface AnneeScolaireRepository extends JpaRepository<AnneeScolaire, Long>{

	List<AnneeScolaire> findAll();
	
	AnneeScolaire findByDebutAndFin( @Param("debut") String debut, @Param("fin") String fin);
	
	@Query("from AnneeScolaire WHERE statut = 'en cours'")
	AnneeScolaire findAnneeEnCours();
	 
	@Transactional
	 @Modifying
	 @Query("UPDATE AnneeScolaire SET debut = :debut, fin = :fin where idAnneeScolaire = :idAnneeScolaire")
	 void updateAnneeScolaire(@Param("debut") String debut, @Param("fin") String fin, @Param("idAnneeScolaire") long idAnneeScolaire);
	
	@Transactional
	 @Modifying
	 @Query("UPDATE AnneeScolaire SET statut = '' where idAnneeScolaire = :idAnneeScolaire")
	 void removeAnneeScolaireEnCours( @Param("idAnneeScolaire") long idAnneeScolaire);
	
	@Transactional
	 @Modifying
	 @Query("UPDATE AnneeScolaire SET statut = 'en cours' where idAnneeScolaire = :idAnneeScolaire")
	 void setAnneeScolaireEnCours( @Param("idAnneeScolaire") long idAnneeScolaire);
	 
	 @Transactional
	 @Modifying
	 @Query("DELETE from AnneeScolaire WHERE idAnneeScolaire = :idAnneeScolaire")
	 void deleteAnneeScolaireById( @Param("idAnneeScolaire") long idAnneeScolaire );
	 
    @Query("SELECT idAnneeScolaire from AnneeScolaire WHERE statut = 'en cours'")
	long findIdByStatutAnneeScolaire();
    
    @Query("SELECT debut from AnneeScolaire WHERE statut = 'en cours'")
	String findDebutByStatutAnneeScolaire();
    
    @Query("SELECT fin from AnneeScolaire WHERE statut = 'en cours'")
	String findFinByStatutAnneeScolaire();

}
