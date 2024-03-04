package com.gescollege.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.gescollege.model.MoyenneSemestre;


public interface MoyenneSemestreRepository extends JpaRepository<MoyenneSemestre, Long>{

	List<MoyenneSemestre> findByOrderByNoteDesc();
	
	@Query("FROM MoyenneSemestre a WHERE a.semestre = '1er' ORDER BY note DESC")
	 List<MoyenneSemestre> getAllMoyenneSemestre1();
	
	@Modifying
    @Transactional
    @Query(value = "TRUNCATE TABLE moyenne_semestre", nativeQuery = true)
    void truncateTable();
	
	@Transactional
	 @Modifying
	 @Query("DELETE from MoyenneSemestre n WHERE n.inscription.idInscription = :idInscription")
	 void deleteMoyenneSemestreByIdInscription( @Param("idInscription") long idInscription );
	/*
	 @Query("SELECT COALESCE(a.idMoyenneSemestre,0) from MoyenneSemestre a WHERE a.nomMoyenneSemestre = :nomMoyenneSemestre")
	 long findIdMoyenneSemestreByNom(@Param("nomMoyenneSemestre") String nom);
	
	MoyenneSemestre findByNomMoyenneSemestre( @Param("nomMoyenneSemestre") String nomMoyenneSemestre);*/
	 
	

}
