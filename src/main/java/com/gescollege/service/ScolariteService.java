package com.gescollege.service;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gescollege.model.AnneeScolaire;
import com.gescollege.model.Scolarite;
import com.gescollege.repository.ScolariteRepository;



@Service
public class ScolariteService implements IScolariteService {

	@Autowired
	private ScolariteRepository scolariteRepository;

	
	@Override
	public void saveScolarite(Scolarite scolarite) {
		scolariteRepository.save(scolarite);
	}


	@Override
	public List<Scolarite> getAllScolarites() {
		// TODO Auto-generated method stub
		return scolariteRepository.findAll();
	}


	@Override
	public void updateScolarite(Date dateVersement, String mois, long montantVersement, long idScolarite) {
		scolariteRepository.updateScolarite(  dateVersement, mois, montantVersement,  idScolarite);		
	}


	@Override
	public void deleteScolariteById(long id) {
		Optional<Scolarite> Scolarite = scolariteRepository.findById(id);
		if (Scolarite.isPresent()) {
			scolariteRepository.deleteScolariteById(id);
		}
	}

	@Override
	public List<Scolarite> getAllScolariteByIdInscription(long idInscription) {
		// TODO Auto-generated method stub
		return scolariteRepository.getAllScolariteByIdInscription(idInscription);
	}


	@Override
	public Scolarite findScolariteByInscriptionAndMois(long idInscription, String mois) {
		return scolariteRepository.findScolariteByInscriptionAndMois(idInscription, mois);
	}


	@Override
	public void updateScolarite1(long montantVersement, long idScolarite) {
		scolariteRepository.updateScolarite1(  montantVersement,  idScolarite);		
	}


	@Override
	public void deleteScolariteByIdInscription(long id) {
		scolariteRepository.deleteScolariteByIdInscription(id);
		
	}


	@Override
	public Scolarite findScolariteByIdScolarite(long idScolarite) {
		Scolarite scolariteFound = scolariteRepository.findScolariteByIdScolarite(idScolarite);
		return scolariteFound;
	}

}