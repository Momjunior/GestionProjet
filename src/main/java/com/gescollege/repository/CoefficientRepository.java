package com.gescollege.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.gescollege.model.Coefficient;


public interface CoefficientRepository extends JpaRepository<Coefficient, Long>{

	List<Coefficient> findAll();
	/*
	 @Query("SELECT COALESCE(a.idCoefficient,0) from Coefficient a WHERE a.nomCoefficient = :nomCoefficient")
	 long findIdCoefficientByNom(@Param("nomCoefficient") String nom);
	
	Coefficient findByNomCoefficient( @Param("nomCoefficient") String nomCoefficient);
	 */
	 
	 @Query("SELECT SUM(a.valeur) from Coefficient a WHERE a.anneeScolaire.idAnneeScolaire = :idAnneeScolaire AND a.classe.idClasse = :idClasse")
	 int findSommeCoefficient( @Param("idAnneeScolaire") long idAnneeScolaire, @Param("idClasse") long idClasse);
	
	 @Query("FROM Coefficient a WHERE a.anneeScolaire.idAnneeScolaire = :idAnneeScolaire AND a.classe.idClasse = :idClasse AND a.matiere.idMatiere = :idMatiere")
	 Coefficient findCoefficient(  @Param("idAnneeScolaire") long idAnneeScolaire, @Param("idClasse") long idClasse, @Param("idMatiere") long idMatiere);
	
	 @Query("SELECT COALESCE(a.valeur,0) from Coefficient a WHERE a.matiere.idMatiere = '3' AND a.classe.idClasse = :idClasse")
	 int findCoefficientAnglais(@Param("idClasse") long idClasse);
	 
	 @Query("SELECT COALESCE(a.valeur,0) from Coefficient a WHERE a.matiere.idMatiere = '2' AND a.classe.idClasse = :idClasse")
	 int findCoefficientFr(@Param("idClasse") long idClasse);
	 
	 @Query("SELECT COALESCE(a.valeur,0) from Coefficient a WHERE a.matiere.idMatiere = '4' AND a.classe.idClasse = :idClasse")
	 int findCoefficientHG(@Param("idClasse") long idClasse);
	 
	 @Query("SELECT COALESCE(a.valeur,0) from Coefficient a WHERE a.matiere.idMatiere = '5' AND a.classe.idClasse = :idClasse")
	 int findCoefficientMath(@Param("idClasse") long idClasse);
	 
	 @Query("SELECT COALESCE(a.valeur,0) from Coefficient a WHERE a.matiere.idMatiere = '6' AND a.classe.idClasse = :idClasse")
	 int findCoefficientSvt(@Param("idClasse") long idClasse);
	 
	 @Query("SELECT COALESCE(a.valeur,0) from Coefficient a WHERE a.matiere.idMatiere = '7' AND a.classe.idClasse = :idClasse")
	 int findCoefficientEfs(@Param("idClasse") long idClasse);
	 
	 @Query("SELECT COALESCE(a.valeur,0) from Coefficient a WHERE a.matiere.idMatiere = '8' AND a.classe.idClasse = :idClasse")
	 int findCoefficientEps(@Param("idClasse") long idClasse);
	 
	 @Query("SELECT COALESCE(a.valeur,0) from Coefficient a WHERE a.matiere.idMatiere = '1' AND a.classe.idClasse = :idClasse")
	 int findCoefficientPC(@Param("idClasse") long idClasse);
	
	 @Query("FROM Coefficient a WHERE a.anneeScolaire.idAnneeScolaire = :idAnneeScolaire ORDER BY a.classe.nomClasse DESC, a.matiere.idMatiere")
	 List<Coefficient> getAllCoefficientsByAnnee( @Param("idAnneeScolaire") long idAnneeScolaire );
	 
	 @Query("FROM Coefficient a WHERE a.anneeScolaire.idAnneeScolaire = :idAnneeScolaire AND a.classe.idClasse = :idClasse AND a.matiere.idMatiere = :idMatiere")
	 List<Coefficient> getAllCoefficients( @Param("idAnneeScolaire") long idAnneeScolaire, @Param("idClasse") long idClasse, @Param("idMatiere") long idMatiere );
	
	 @Transactional
	 @Modifying
	 @Query("UPDATE Coefficient SET valeur = :valeur where idCoefficient = :idCoefficient")
	 void updateCoefficient(@Param("valeur") int valeur, @Param("idCoefficient") long idCoefficient);
	 
	 @Transactional
	 @Modifying
	 @Query("DELETE from Coefficient WHERE idCoefficient = :idCoefficient")
	 void deleteCoefficientById( @Param("idCoefficient") long idCoefficient );
	 
	 @Transactional
	 @Modifying
	 @Query("DELETE from Coefficient a WHERE a.anneeScolaire.idAnneeScolaire = :idAnneeScolaire")
	 void deleteAllCoefficientById( @Param("idAnneeScolaire") long idAnneeScolaire );

}
