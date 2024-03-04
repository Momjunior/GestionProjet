package com.gescollege.service;

import java.util.List;

import org.springframework.data.repository.query.Param;

import com.gescollege.model.Note;


public interface INoteService {
		
	void saveNote(Note note);
	
	Note findNoteExist( long idNote);
	
	Note findNoteCompoExist( long idInscription, long idMatiere, int semestre);
	
	Note findNoteCompoPC1Exist( long idInscription);
	
	List <Note> findListeNoteByClasseAndMatiere(int semestre, long idMatiere, String typeNote, long idDetailClasse);
	
	List <Note> findListeNoteCompo1Exist(long idInscription, long idMatiere);
		
	List <Note> getAllNotes();
	
	List <Note> getAllNoteNotCompo(long idInscription, int semestre, long idMatiere);
	
	List <Note> getAllNoteByIdInscription(long idInscription, int semestre);
	
	List <Note> getAllNotePC1(long idInscription);
	
	List <Note> getAllNoteAng1(long idInscription);
	
	List <Note> getAllNoteFr1(long idInscription);
	
	List <Note> getAllNoteHG1(long idInscription);
	
	List <Note> getAllNoteMath1(long idInscription);
	
	List <Note> getAllNoteSvt1(long idInscription);
	
	List <Note> getAllNoteEfs1(long idInscription);
	
	List <Note> getAllNoteEps1(long idInscription);
		
	void updateNote( float maNote,  long idNote);
	
	void deleteNoteById(long id);
	
	void deleteNoteByIdInscription(long id);
		
}