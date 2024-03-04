package com.gescollege.repository;

import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.gescollege.model.Bulletin;
import com.gescollege.model.Note;


public interface BulletinRepository extends JpaRepository<Bulletin, Long>{

	List<Bulletin> findAll();
		
	 @Query("FROM Bulletin a WHERE a.inscription.idInscription = :idInscription")
	 List<Bulletin> getAllBulletinByIdInscription( @Param("idInscription") long idInscription);
	 
	 @Query("FROM Bulletin a WHERE a.inscription.idInscription = :idInscription AND semestre = :semestre")
	 Bulletin findBulletinByInscriptionAndSemestre(@Param("idInscription") long idInscription, @Param("semestre") int semestre);
	 
	 @Transactional
	 @Modifying
	 @Query("UPDATE Bulletin a SET semestre = :semestre, conduite = :conduite, tableauHonneur = :tableauHonneur, assiduite = :assiduite, appreciation = :appreciation where idBulletin = :idBulletin")
	 void updateBulletin(@Param("semestre") int semestre, @Param("conduite") String conduite, @Param("tableauHonneur") String tableauHonneur,  @Param("assiduite") String assiduite, @Param("appreciation") String appreciation,  @Param("idBulletin") long idBulletin);
		 
	 @Transactional
	 @Modifying
	 @Query("DELETE from Bulletin WHERE idBulletin = :idBulletin")
	 void deleteBulletinById( @Param("idBulletin") long idBulletin );
	 
	 @Query("SELECT COALESCE(a.conduite,0) from Bulletin a WHERE a.inscription.idInscription = :idInscription")
	 String findConduiteByIdInscrip(@Param("idInscription") long idInscription);
	 
	 @Transactional
	 @Modifying
	 @Query("DELETE from Bulletin n WHERE n.inscription.idInscription = :idInscription")
	 void deleteBulletinByIdInscription( @Param("idInscription") long idInscription );


}
