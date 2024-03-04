package com.gescollege.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Service;


import com.gescollege.model.Note;
import com.gescollege.repository.NoteRepository;



@Service
public class NoteService implements INoteService {

	@Autowired
	private NoteRepository noteRepository;

	
	@Override
	public void saveNote(Note note) {
		noteRepository.save(note);
	}


	@Override
	public List<Note> getAllNotes() {
		// TODO Auto-generated method stub
		return noteRepository.findAll();
	}

/*	@Override
	public void updateNote( long idNote) {
		noteRepository.updateNote(idNote);		
	}
*/
	@Override
	public void deleteNoteById(long id) {
		Optional<Note> Note = noteRepository.findById(id);
		if (Note.isPresent()) {
			noteRepository.deleteNoteById(id);
		}
	}


	@Override
	public List<Note> getAllNoteNotCompo(long idInscription, int semestre, long idMatiere) {
		return noteRepository.getAllNoteNotCompo(idInscription, semestre, idMatiere);
	}


	@Override
	public Note findNoteCompoExist(long idInscription, long idMatiere, int semestre) {
		return noteRepository.findNoteCompoExist(idInscription, idMatiere, semestre);
	}

	@Override
	public Note findNoteCompoPC1Exist(long idInscription ) {
		return noteRepository.findNoteCompoPC1Exist(idInscription);
	}

	
	@Override
	public void updateNote(float maNote,long idNote) {
		 noteRepository.updateNote( maNote, idNote);
		
	}



	@Override
	public List<Note> getAllNotePC1(long idInscription) {
		return noteRepository.getAllNotePC1(idInscription);
	}


	@Override
	public List<Note> getAllNoteAng1(long idInscription) {
		// TODO Auto-generated method stub
		return noteRepository.getAllNoteAng1(idInscription);
	}


	@Override
	public List<Note> getAllNoteFr1(long idInscription) {
		// TODO Auto-generated method stub
		return noteRepository.getAllNoteFr1(idInscription);
	}


	@Override
	public List<Note> getAllNoteHG1(long idInscription) {
		// TODO Auto-generated method stub
		return noteRepository.getAllNoteHG1(idInscription);
	}


	@Override
	public List<Note> getAllNoteMath1(long idInscription) {
		// TODO Auto-generated method stub
		return noteRepository.getAllNoteMath1(idInscription);
	}


	@Override
	public List<Note> getAllNoteSvt1(long idInscription) {
		// TODO Auto-generated method stub
		return noteRepository.getAllNoteSvt1(idInscription);
	}


	@Override
	public List<Note> getAllNoteEfs1(long idInscription) {
		// TODO Auto-generated method stub
		return noteRepository.getAllNoteEfs1(idInscription);
	}


	@Override
	public List<Note> getAllNoteEps1(long idInscription) {
		// TODO Auto-generated method stub
		return noteRepository.getAllNoteEps1(idInscription);
	}


	@Override
	public List<Note> getAllNoteByIdInscription(long idInscription, int semestre) {
		return noteRepository.getAllNoteByIdInscription(idInscription, semestre);
	}


	@Override
	public void deleteNoteByIdInscription(long id) {
		noteRepository.deleteNoteByIdInscription(id);
		
	}


	@Override
	public List<Note> findListeNoteCompo1Exist( long idInscription,long idMatiere) {
		// TODO Auto-generated method stub
		return noteRepository.findListeNoteCompo1Exist(idInscription, idMatiere);
	}


	@Override
	public List<Note> findListeNoteByClasseAndMatiere(int semestre, long idMatiere, String typeNote,
			long idDetailClasse) {
		// TODO Auto-generated method stub
		return noteRepository.findListeNoteByClasseAndMatiere(semestre, idMatiere, typeNote, idDetailClasse);
	}


	@Override
	public Note findNoteExist(long idNote) {
		// TODO Auto-generated method stub
		return noteRepository.findNoteExist(idNote);
	}


}