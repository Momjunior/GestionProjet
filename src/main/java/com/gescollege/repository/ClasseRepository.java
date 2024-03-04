package com.gescollege.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.gescollege.model.Classe;


public interface ClasseRepository extends JpaRepository<Classe, Long>{

	List<Classe> findAll();
	
	Classe findByNomClasse( @Param("nomClasse") String nomClasse);

	@Transactional
	 @Modifying
	 @Query("UPDATE Classe SET nomClasse = :nomClasse where idClasse = :idClasse")
	 void updateClasse(@Param("nomClasse") String nomClasse, @Param("idClasse") long idClasse);
	 
	 @Transactional
	 @Modifying
	 @Query("DELETE from Classe WHERE idClasse = :idClasse")
	 void deleteClasseById( @Param("idClasse") long idClasse );
	 
	 @Query("SELECT COALESCE(idClasse,0) from Classe WHERE nomClasse = :nomClasse")
	 long findIdByNomClasse(@Param("nomClasse") String nomClasse);
	 
	 @Query("SELECT nomClasse from Classe WHERE idClasse = :idClasse")
	 String findNomClasseByIdClasse(@Param("idClasse") long idClasse);

}
