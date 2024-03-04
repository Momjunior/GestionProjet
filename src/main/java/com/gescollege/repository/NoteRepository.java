package com.gescollege.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.gescollege.model.Note;


public interface NoteRepository extends JpaRepository<Note, Long>{

	List<Note> findAll();
	/*
	 @Query("SELECT COALESCE(a.idNote,0) from Note a WHERE a.nomNote = :nomNote")
	 long findIdNoteByNom(@Param("nomNote") String nom);
	
	Note findByNomNote( @Param("nomNote") String nomNote);*/
	 
	 @Transactional
	 @Modifying
	 @Query("UPDATE Note a SET note =:note where idNote = :idNote")
	 void updateNote( @Param("note") float note, @Param("idNote") long idNote);
	 
	 /*
	 @Query("FROM Note a WHERE a.inscription.idInscription = :idInscription AND semestre = '1er' AND a.matiere.nomMatiere = 'pc' AND typeNote = 'composition'")
	 Note findByTypeNoteAndIdNoteNot( @Param("matricule") String matricule, @Param("idEleve") long idEleve );
	*/
	 
	 @Query("FROM Note a WHERE idNote = :idNote")
	 Note findNoteExist( @Param("idNote") long idNote);
	 
	 @Query("FROM Note a WHERE a.inscription.idInscription = :idInscription AND a.matiere.idMatiere = :idMatiere AND semestre = :semestre AND typeNote = 'composition'")
	 Note findNoteCompoExist( @Param("idInscription") long idInscription, @Param("idMatiere") long idMatiere , @Param("semestre") int semestre);
	 
	 @Query("FROM Note a WHERE a.inscription.idInscription = :idInscription AND semestre = '1er' AND a.matiere.nomMatiere = 'pc' AND typeNote = 'composition'")
	 Note findNoteCompoPC1Exist( @Param("idInscription") long idInscription);
	 
	 @Query("FROM Note a INNER JOIN a.inscription WHERE a.semestre = :semestre AND a.typeNote = :typeNote AND a.matiere.idMatiere = :idMatiere AND a.inscription.idInscription IN (select idInscription from Inscription a where a.detailClasse.idDetailClasse = :idDetailClasse)")
	 List<Note> findListeNoteByClasseAndMatiere( @Param("semestre") int semestre, @Param("idMatiere") long idMatiere, @Param("typeNote") String typeNote, @Param("idDetailClasse") long idDetailClasse);
	 
	 @Query("FROM Note a WHERE a.inscription.idInscription = :idInscription AND semestre = '1er' AND a.matiere.idMatiere = :idMatiere AND typeNote = 'composition'")
	 List<Note> findListeNoteCompo1Exist( @Param("idInscription") long idInscription, @Param("idMatiere") long idMatiere);
	
	 @Query("FROM Note a WHERE a.inscription.idInscription = :idInscription AND semestre = :semestre AND a.matiere.idMatiere = :idMatiere AND typeNote != 'composition'")
	 List<Note> getAllNoteNotCompo( @Param("idInscription") long idInscription,  @Param("semestre") int semestre, @Param("idMatiere") long idMatiere);
	 
	 @Query("FROM Note a WHERE a.inscription.idInscription = :idInscription AND semestre = :semestre")
	 List<Note> getAllNoteByIdInscription( @Param("idInscription") long idInscription,  @Param("semestre") int semestre);
	 
	 @Query("FROM Note a WHERE a.inscription.idInscription = :idInscription AND semestre = '1er' AND a.matiere.nomMatiere = 'PC' AND typeNote != 'composition'")
	 List<Note> getAllNotePC1( @Param("idInscription") long idInscription);
	 
	 @Query("FROM Note a WHERE a.inscription.idInscription = :idInscription AND semestre = '1er' AND a.matiere.nomMatiere = 'Anglais' AND typeNote != 'composition'")
	 List<Note> getAllNoteAng1( @Param("idInscription") long idInscription);
	 
	 @Query("FROM Note a WHERE a.inscription.idInscription = :idInscription AND semestre = '1er' AND a.matiere.nomMatiere = 'Français' AND typeNote != 'composition'")
	 List<Note> getAllNoteFr1( @Param("idInscription") long idInscription);
	 
	 @Query("FROM Note a WHERE a.inscription.idInscription = :idInscription AND semestre = '1er' AND a.matiere.nomMatiere = 'Histoire / Géo' AND typeNote != 'composition'")
	 List<Note> getAllNoteHG1( @Param("idInscription") long idInscription);
	 
	 @Query("FROM Note a WHERE a.inscription.idInscription = :idInscription AND semestre = '1er' AND a.matiere.nomMatiere = 'Maths' AND typeNote != 'composition'")
	 List<Note> getAllNoteMath1( @Param("idInscription") long idInscription);
	 
	 @Query("FROM Note a WHERE a.inscription.idInscription = :idInscription AND semestre = '1er' AND a.matiere.nomMatiere = 'SVT' AND typeNote != 'composition'")
	 List<Note> getAllNoteSvt1( @Param("idInscription") long idInscription);
	 
	 @Query("FROM Note a WHERE a.inscription.idInscription = :idInscription AND semestre = '1er' AND a.matiere.nomMatiere = 'EFS' AND typeNote != 'composition'")
	 List<Note> getAllNoteEfs1( @Param("idInscription") long idInscription);
	 
	 @Query("FROM Note a WHERE a.inscription.idInscription = :idInscription AND semestre = '1er' AND a.matiere.nomMatiere = 'EPS' AND typeNote != 'composition'")
	 List<Note> getAllNoteEps1( @Param("idInscription") long idInscription);
	 
	 @Transactional
	 @Modifying
	 @Query("DELETE from Note WHERE idNote = :idNote")
	 void deleteNoteById( @Param("idNote") long idNote );
	 
	 @Transactional
	 @Modifying
	 @Query("DELETE from Note n WHERE n.inscription.idInscription = :idInscription")
	 void deleteNoteByIdInscription( @Param("idInscription") long idInscription );

}
