package com.gescollege.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.gescollege.model.AnneeScolaire;
import com.gescollege.model.User;
import com.gescollege.repository.AnneeScolaireRepository;



@Service
public class AnneeScolaireService implements IAnneeScolaireService {

	@Autowired
	private AnneeScolaireRepository anneeScolaireRepository;

	
	@Override
	public void saveAnneeScolaire(AnneeScolaire anneeScolaire) {
		anneeScolaireRepository.save(anneeScolaire);
	}


	@Override
	public List<AnneeScolaire> getAllAnneeScolaires() {
		// TODO Auto-generated method stub
		return anneeScolaireRepository.findAll();
	}

	@Override
	public void updateAnneeScolaire( String debut, String fin, long idAnneeScolaire) {
		anneeScolaireRepository.updateAnneeScolaire(debut, fin, idAnneeScolaire);
		
	}


	@Override
	public void deleteAnneeScolaireById(long id) {
		Optional<AnneeScolaire> AnneeScolaire = anneeScolaireRepository.findById(id);
		if (AnneeScolaire.isPresent()) {
			anneeScolaireRepository.deleteAnneeScolaireById(id);
		}
	}


	@Override
	public AnneeScolaire findByDebutAndFin(String debut, String fin) {
		AnneeScolaire anneeScolaireFound = anneeScolaireRepository.findByDebutAndFin(debut, fin);
		return anneeScolaireFound;
	}


	@Override
	public long findIdByStatutAnneeScolaire() {
		long id = anneeScolaireRepository.findIdByStatutAnneeScolaire();
		return id;
	}


	@Override
	public String findDebutByStatutAnneeScolaire() {
		String debut = anneeScolaireRepository.findDebutByStatutAnneeScolaire();
		return debut;
	}


	@Override
	public String findFinByStatutAnneeScolaire() {
		String fin = anneeScolaireRepository.findFinByStatutAnneeScolaire();
		return fin;
	}


	@Override
	public AnneeScolaire findAnneeEnCours() {
		AnneeScolaire anneeScolaireFound = anneeScolaireRepository.findAnneeEnCours();
		return anneeScolaireFound;
	}


	@Override
	public void setAnneeScolaireEnCours(long idAnneeScolaire) {
		anneeScolaireRepository.setAnneeScolaireEnCours( idAnneeScolaire);
		
	}


	@Override
	public void removeAnneeScolaireEnCours(long idAnneeScolaire) {
		anneeScolaireRepository.removeAnneeScolaireEnCours( idAnneeScolaire);
		
	}

}