package com.gescollege.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.gescollege.model.CategorieClasse;


public interface CategorieClasseRepository extends JpaRepository<CategorieClasse, Long>{

	List<CategorieClasse> findAll();
	
	 @Query("SELECT idCategorieClasse from CategorieClasse WHERE nomCategorie = :nomCategorie")
	 long findIdByCategorie(@Param("nomCategorie") String nomCategorie);
	 
	 @Query("SELECT nomCategorie from CategorieClasse WHERE idCategorieClasse = :idCategorieClasse")
	 String findCategorieByIdCategorie(@Param("idCategorieClasse") long idCategorieClasse);
	 
	 CategorieClasse findByNomCategorie( @Param("nomCategorie") String nomCategorie);
	 
	 @Transactional
	 @Modifying
	 @Query("DELETE from CategorieClasse WHERE idCategorieClasse = :idCategorieClasse")
	 void deleteCategorieById( @Param("idCategorieClasse") long idCategorieClasse );

}
