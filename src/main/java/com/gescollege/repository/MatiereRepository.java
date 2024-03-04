package com.gescollege.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.gescollege.model.Matiere;


public interface MatiereRepository extends JpaRepository<Matiere, Long>{

	List<Matiere> findAll();
	
	 @Query("SELECT COALESCE(a.idMatiere,0) from Matiere a WHERE a.nomMatiere = :nomMatiere")
	 long findIdMatiereByNom(@Param("nomMatiere") String nom);
	
	Matiere findByNomMatiere( @Param("nomMatiere") String nomMatiere);
	 
	@Transactional
	 @Modifying
	 @Query("UPDATE Matiere SET nomMatiere = :nomMatiere where idMatiere = :idMatiere")
	 void updateMatiere(@Param("nomMatiere") String nomMatiere, @Param("idMatiere") long idMatiere);
	 
	 @Transactional
	 @Modifying
	 @Query("DELETE from Matiere WHERE idMatiere = :idMatiere")
	 void deleteMatiereById( @Param("idMatiere") long idMatiere );

}
