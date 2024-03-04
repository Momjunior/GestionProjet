package com.gescollege.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.gescollege.model.DetailClasse;


public interface DetailClasseRepository extends JpaRepository<DetailClasse, Long>{

	 List<DetailClasse> findAll();
	 
	@Query("FROM DetailClasse a where a.classe.idClasse = :idClasse AND a.categorieClasse.idCategorieClasse = :idCategorieClasse AND a.anneeScolaire.idAnneeScolaire IN (select idAnneeScolaire from AnneeScolaire where statut = 'en cours')")
	DetailClasse findIdDetailClasseByAnneeEnCours(@Param("idClasse") long idClasse, @Param("idCategorieClasse") long idCategorieClasse);
	
	 @Query("FROM DetailClasse d WHERE d.anneeScolaire.idAnneeScolaire = :idAnneeScolaire AND d.classe.idClasse = :idClasse AND d.categorieClasse.idCategorieClasse = :idCategorieClasse")
	 DetailClasse findDetailClasseByNomAndAnnee( @Param("idAnneeScolaire") long idAnneeScolaire, @Param("idClasse") long idClasse, @Param("idCategorieClasse") long idCategorieClasse);

	 @Query("FROM DetailClasse WHERE idDetailClasse = :idDetailClasse")
	 DetailClasse findDetailClasseByIdDetailClasse( @Param("idDetailClasse") long idDetailClasse);
	 
	 @Transactional
	 @Modifying
	 @Query("UPDATE DetailClasse d SET conduiteClasse = :conduiteClasse, d.anneeScolaire.idAnneeScolaire = :idAnneeScolaire, d.classe.idClasse = :idClasse, d.categorieClasse.idCategorieClasse = :idCategorieClasse, d.professeur.idProfesseur = :idProfesseur where idDetailClasse = :idDetailClasse")
	 void updateDetailClasse(@Param("conduiteClasse") int conduiteClasse, @Param("idAnneeScolaire") long idAnneeScolaire , @Param("idClasse") long idClasse , @Param("idCategorieClasse") long idCategorieClasse , @Param("idProfesseur") long idProfesseur , @Param("idDetailClasse") long idDetailClasse);
	 
	 @Transactional
	 @Modifying
	 @Query("UPDATE DetailClasse d SET conduiteClasse = :conduiteClasse where idDetailClasse = :idDetailClasse")
	 void updateConduiteClasse(@Param("conduiteClasse") float conduiteClasse, @Param("idDetailClasse") long idDetailClasse);
	 
	 
	 @Transactional
	 @Modifying
	 @Query("DELETE from DetailClasse WHERE idDetailClasse = :idDetailClasse")
	 void deleteDetailClasseById( @Param("idDetailClasse") long idDetailClasse );

}
