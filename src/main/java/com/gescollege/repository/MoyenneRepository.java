package com.gescollege.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.gescollege.model.Moyenne;


public interface MoyenneRepository extends JpaRepository<Moyenne, Long>{

	List<Moyenne> findByOrderByNoteDesc();
	
	@Query("FROM Moyenne a WHERE a.matiere.idMatiere = :idMatiere ORDER BY note DESC")
	 List<Moyenne> getAllMoyenneByIdMatiere( @Param("idMatiere") long idMatiere );
	
	@Modifying
    @Transactional
    @Query(value = "TRUNCATE TABLE moyenne", nativeQuery = true)
    void truncateTable();
	
	@Transactional
	 @Modifying
	 @Query("DELETE from Moyenne n WHERE n.inscription.idInscription = :idInscription")
	 void deleteMoyenneByIdInscription( @Param("idInscription") long idInscription );
	/*
	 @Query("SELECT COALESCE(a.idMoyenne,0) from Moyenne a WHERE a.nomMoyenne = :nomMoyenne")
	 long findIdMoyenneByNom(@Param("nomMoyenne") String nom);
	
	Moyenne findByNomMoyenne( @Param("nomMoyenne") String nomMoyenne);*/
	 
	

}
