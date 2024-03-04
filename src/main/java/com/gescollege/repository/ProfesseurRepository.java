package com.gescollege.repository;

import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.gescollege.model.Professeur;


public interface ProfesseurRepository extends JpaRepository<Professeur, Long>{
	
	List<Professeur> findAll();
		
	Professeur findByIdProfesseur( @Param("idProfesseur") long idProfesseur );
	
	Professeur findByTel( @Param("tel") String tel );


	@Transactional
	 @Modifying
	 @Query("UPDATE Professeur SET nom = :nom, prenom = :prenom, sexe = :sexe, dateNaiss = :dateNaiss, tel = :tel where idProfesseur = :idProfesseur")
	 void updateProfesseur(@Param("nom") String nom, @Param("prenom") String prenom, @Param("sexe") String sexe, @Param("dateNaiss") Date dateNaiss, @Param("tel") String tel, @Param("idProfesseur") long idProfesseur );
	 
	@Transactional
	 @Modifying
	 @Query("UPDATE Professeur SET matricule = :matricule where idProfesseur = :idProfesseur")
	 void updateMatricule(@Param("matricule") String matricule, @Param("idProfesseur") long idProfesseur );
	 
	
	 @Transactional
	 @Modifying
	 @Query("DELETE from Professeur WHERE idProfesseur = :idProfesseur")
	 void deleteProfesseurById( @Param("idProfesseur") long idProfesseur );


}
