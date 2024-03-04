package com.gescollege.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.gescollege.model.Matiere;
import com.gescollege.model.MatiereEnseignee;


public interface MatiereEnseigneeRepository extends JpaRepository<MatiereEnseignee, Long>{
	
	 @Query("FROM MatiereEnseignee a WHERE a.professeur.idProfesseur = :idProfesseur AND a.anneeScolaire.idAnneeScolaire = :idAnneeScolaire")
	 List<MatiereEnseignee> getAllMatiereEnseigneesByProfAndAnnee(@Param("idProfesseur") long idProfesseur, @Param("idAnneeScolaire") long idAnneeScolaire );
	
	 @Query("FROM MatiereEnseignee a WHERE a.anneeScolaire.idAnneeScolaire = :idAnneeScolaire AND a.matiere.idMatiere = :idMatiere AND a.classe.idClasse = :idClasse AND a.professeur.idProfesseur = :idProfesseur")
	 MatiereEnseignee findMatiereEnseignee( @Param("idAnneeScolaire") long idAnneeScolaire, @Param("idMatiere") long idMatiere, @Param("idClasse") long idClasse, @Param("idProfesseur") long idProfesseur);
	 
	 @Transactional
	 @Modifying
	 @Query("DELETE from MatiereEnseignee WHERE idMatiereEnseignee = :idMatiereEnseignee")
	 void deleteMatiereEnseigneeById( @Param("idMatiereEnseignee") long idMatiereEnseignee );

}
