package com.gescollege.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.gescollege.model.Matiere;
import com.gescollege.repository.MatiereRepository;



@Service
public class MatiereService implements IMatiereService {

	@Autowired
	private MatiereRepository matiereRepository;

	
	@Override
	public void saveMatiere(Matiere matiere) {
		matiereRepository.save(matiere);
	}


	@Override
	public List<Matiere> getAllMatieres() {
		// TODO Auto-generated method stub
		return matiereRepository.findAll();
	}

	@Override
	public void updateMatiere( String nomMatiere, long idMatiere) {
		matiereRepository.updateMatiere(nomMatiere, idMatiere);
		
	}


	@Override
	public void deleteMatiereById(long id) {
		Optional<Matiere> Matiere = matiereRepository.findById(id);
		if (Matiere.isPresent()) {
			matiereRepository.deleteMatiereById(id);
		}
	}


	@Override
	public Matiere findByNomMatiere(String nomMatiere) {
		Matiere matiereFound = matiereRepository.findByNomMatiere(nomMatiere);
		return matiereFound;
	}


	@Override
	public long findIdMatiereByNom(String nom) {
		long id = matiereRepository.findIdMatiereByNom(nom);
		return id;
	}

}