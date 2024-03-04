package com.gescollege.service;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.gescollege.model.Professeur;
import com.gescollege.repository.ProfesseurRepository;



@Service
public class ProfesseurService implements IProfesseurService {

	@Autowired
	private ProfesseurRepository professeurRepository;

	
	@Override
	public void saveProfesseur(Professeur professeur) {
		professeurRepository.save(professeur);
	}


	@Override
	public List<Professeur> getAllProfesseurs() {
		// TODO Auto-generated method stub
		return professeurRepository.findAll();
	}


	@Override
	public Professeur findByTel( String tel) {
		// TODO Auto-generated method stub
		return professeurRepository.findByTel(tel);
	}

	@Override
	public void updateProfesseur(String nom, String prenom, String sexe, Date dateNaiss, String tel,long idProfesseur) {
		professeurRepository.updateProfesseur( nom,  prenom,  sexe,  dateNaiss, tel, idProfesseur);		
	}


	@Override
	public void deleteProfesseurById(long id) {
		Optional<Professeur> Professeur = professeurRepository.findById(id);
		if (Professeur.isPresent()) {
			professeurRepository.deleteProfesseurById(id);
		}
	}


	@Override
	public Professeur findByIdProfesseur(long idProfesseur) {
		Professeur ProfesseurFound  = professeurRepository.findByIdProfesseur(idProfesseur);
		return ProfesseurFound;
	}

}