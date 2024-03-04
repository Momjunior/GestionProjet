package com.gescollege.repository;

import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.gescollege.model.Scolarite;


public interface ScolariteRepository extends JpaRepository<Scolarite, Long>{

	List<Scolarite> findAll();
	 
	 @Query("FROM Scolarite a WHERE a.inscription.idInscription = :idInscription")
	 List<Scolarite> getAllScolariteByIdInscription( @Param("idInscription") long idInscription);
	 
	 @Query("FROM Scolarite a WHERE a.inscription.idInscription = :idInscription AND mois = :mois")
	 Scolarite findScolariteByInscriptionAndMois(@Param("idInscription") long idInscription, @Param("mois") String mois);
	 
	 @Query("FROM Scolarite a WHERE idScolarite = :idScolarite")
	 Scolarite findScolariteByIdScolarite(@Param("idScolarite") long idScolarite);
	 
	 @Query("FROM Scolarite a WHERE a.inscription.idInscription = :idInscription")
	 Scolarite findScolariteByInscription(@Param("idInscription") long idInscription);
	 
	 @Transactional
	 @Modifying
	 @Query("UPDATE Scolarite a SET dateVersement = :dateVersement, mois = :mois, montantVersement = :montantVersement where idScolarite = :idScolarite")
	 void updateScolarite(@Param("dateVersement") Date dateVersement, @Param("mois") String mois, @Param("montantVersement") long montantVersement, @Param("idScolarite") long idScolarite);
	 
	 @Transactional
	 @Modifying
	 @Query("UPDATE Scolarite a SET montantVersement = :montantVersement where idScolarite = :idScolarite")
	 void updateScolarite1( @Param("montantVersement") long montantVersement, @Param("idScolarite") long idScolarite);
	
	 
	 @Transactional
	 @Modifying
	 @Query("DELETE from Scolarite WHERE idScolarite = :idScolarite")
	 void deleteScolariteById( @Param("idScolarite") long idScolarite );
	 
	 @Transactional
	 @Modifying
	 @Query("DELETE from Scolarite s WHERE s.inscription.idInscription = :idInscription")
	 void deleteScolariteByIdInscription( @Param("idInscription") long idInscription );
}
