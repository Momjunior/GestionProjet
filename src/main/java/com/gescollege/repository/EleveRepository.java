package com.gescollege.repository;

import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.gescollege.model.Eleve;


public interface EleveRepository extends JpaRepository<Eleve, Long>{
	
	List<Eleve> findAll();
	
	Eleve findByMatriculeAndIdEleveNot( @Param("matricule") String matricule, @Param("idEleve") long idEleve );
	
	Eleve findByIdEleve( @Param("idEleve") long idEleve );
	
	Eleve findByTel( @Param("tel") String tel );
	
	Eleve findByMatricule(@Param("matricule") String matricule);
	
	 @Query("SELECT COALESCE(a.idEleve,0) from Eleve a WHERE a.matricule = :matricule")
	 long findIdByMatricule(@Param("matricule") String matricule);
	 
	 @Query("SELECT a.matricule from Eleve a WHERE a.idEleve = :idEleve")
	 String findMatriculeById(@Param("idEleve") long idEleve);

	@Transactional
	 @Modifying
	 @Query("UPDATE Eleve SET nom = :nom, prenom = :prenom, sexe = :sexe, dateNaiss = :dateNaiss, tel = :tel, matricule = :matricule where idEleve = :idEleve")
	 void updateEleve(@Param("nom") String nom, @Param("prenom") String prenom, @Param("sexe") String sexe, @Param("dateNaiss") Date dateNaiss, @Param("tel") String tel, @Param("matricule") String matricule, @Param("idEleve") long idEleve );
	 
	@Transactional
	 @Modifying
	 @Query("UPDATE Eleve SET matricule = :matricule where idEleve = :idEleve")
	 void updateMatricule(@Param("matricule") String matricule, @Param("idEleve") long idEleve );
	 
	
	 @Transactional
	 @Modifying
	 @Query("DELETE from Eleve WHERE idEleve = :idEleve")
	 void deleteEleveById( @Param("idEleve") long idEleve );


}
