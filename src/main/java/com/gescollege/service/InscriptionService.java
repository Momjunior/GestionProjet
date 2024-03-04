package com.gescollege.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gescollege.model.Inscription;
import com.gescollege.repository.InscriptionRepository;



@Service
public class InscriptionService implements IInscriptionService {

	@Autowired
	private InscriptionRepository inscriptionRepository;

	
	@Override
	public void saveInscription(Inscription inscription) {
		inscriptionRepository.save(inscription);
	}


	@Override
	public List<Inscription> getAllInscriptions() {
		// TODO Auto-generated method stub
		return inscriptionRepository.findAll();
	}


	@Override
	public void updateInscription(String date, long montant, long IdEleve, long idDetailClasse, long idInscription) {
		inscriptionRepository.updateInscription(  date, montant,  IdEleve,  idDetailClasse,  idInscription);
		
	}


	@Override
	public void deleteInscriptionById(long id) {
		Optional<Inscription> Inscription = inscriptionRepository.findById(id);
		if (Inscription.isPresent()) {
			inscriptionRepository.deleteInscriptionById(id);
		}
	}

	@Override
	public List<Inscription> getAllInscriptionByIdEleve(long idEleve) {
		// TODO Auto-generated method stub
		return inscriptionRepository.getAllInscriptionByIdEleve(idEleve);
	}


	@Override
	public List<Inscription> getAllInscriptionByIdEleveAndIdDetailClasse(long idEleve, long idDetailClasse) {
		// TODO Auto-generated method stub
		return inscriptionRepository.getAllInscriptionByIdEleveAndIdDetailClasse(idEleve, idDetailClasse);
	}


	@Override
	public Inscription findByIdEleveAndAnneeEnCours(long idEleve) {
		Inscription inscripFound = inscriptionRepository.findByIdEleveAndAnneeEnCours(idEleve);
		return inscripFound;
	}

/*
	@Override
	public long findIdClasseByIdEleveAndIdAnneeScolaire(long idEleve, long idAnneeScolaire) {
		long idClasse = inscriptionRepository.findIdClasseByIdEleveAndIdAnneeScolaire(idEleve, idAnneeScolaire);
		return idClasse;
	}
*/

	@Override
	public String findDateByIdEleveAndDetailClasse(long idEleve) {
		String date = inscriptionRepository.findDateByIdEleveAndDetailClasse(idEleve);
		return date;
	}


	@Override
	public long findMontantByIdEleveAndIdAnneeScolaireAndIdClasse(long idEleve, long idDetailClasse) {
		long montant = inscriptionRepository.findMontantByIdEleveAndIdAnneeScolaireAndIdClasse(idEleve, idDetailClasse);
		return montant;
	}


	@Override
	public long findIdInscriptionByIdEleveAndIdDetailClasse(long idEleve, long idDetailClasse) {
		long id = inscriptionRepository.findIdInscriptionByIdEleveAndIdDetailClasse(idEleve, idDetailClasse);
		return id;
	}


	@Override
	public long findIdInscriptionByIdEleveAndAnneeEnCours(long idEleve) {
		long id = inscriptionRepository.findIdInscriptionByIdEleveAndAnneeEnCours(idEleve);
		return id;
	}


	@Override
	public int findEffectifClasse( long idDetailClasse) {
		int id = inscriptionRepository.findEffectifClasse(idDetailClasse);
		return id;
	}


	@Override
	public List<Inscription> listInscriptionByClasse(long idDetailClasse) {
		// TODO Auto-generated method stub
		return inscriptionRepository.listInscriptionByClasse(idDetailClasse);
	}


	@Override
	public void deleteInscriptionByIdEleve(long id) {
		inscriptionRepository.deleteInscriptionByIdEleve(id);
		
	}


	@Override
	public int findEffectifGarcon(long idDetailClasse) {
		int effectif = inscriptionRepository.findEffectifGarcon(idDetailClasse);
		return effectif;
	}


	@Override
	public int findEffectifFille(long idDetailClasse) {
		int effectif = inscriptionRepository.findEffectifFille(idDetailClasse);
		return effectif;
	}


	@Override
	public Inscription findByIdInscription(long idInscription) {
		Inscription inscripFound = inscriptionRepository.findByIdInscription(idInscription);
		return inscripFound;
	}


	@Override
	public int findEffectifTotal() {
		int effectif = inscriptionRepository.findEffectifTotal();
		return effectif;
	}


	@Override
	public int findEffectifTotalGarcon() {
		int effectif = inscriptionRepository.findEffectifTotalGarcon();
		return effectif;
	}


	@Override
	public int findEffectifTotalFille() {
		int effectif = inscriptionRepository.findEffectifTotalFille();
		return effectif;
	}

}