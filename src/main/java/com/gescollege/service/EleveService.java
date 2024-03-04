package com.gescollege.service;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.gescollege.model.Eleve;
import com.gescollege.repository.EleveRepository;



@Service
public class EleveService implements IEleveService {

	@Autowired
	private EleveRepository eleveRepository;

	
	@Override
	public void saveEleve(Eleve eleve) {
		eleveRepository.save(eleve);
	}


	@Override
	public List<Eleve> getAllEleves() {
		// TODO Auto-generated method stub
		return eleveRepository.findAll();
	}


	@Override
	public Eleve findByTel( String tel) {
		// TODO Auto-generated method stub
		return eleveRepository.findByTel(tel);
	}

	@Override
	public void updateEleve(String nom, String prenom, String sexe, Date dateNaiss, String tel, String matricule, long idEleve) {
		eleveRepository.updateEleve( nom,  prenom,  sexe,  dateNaiss, tel, matricule, idEleve);		
	}


	@Override
	public void deleteEleveById(long id) {
		Optional<Eleve> Eleve = eleveRepository.findById(id);
		if (Eleve.isPresent()) {
			eleveRepository.deleteEleveById(id);
		}
	}


	@Override
	public Eleve findByMatricule(String matricule) {
		Eleve EleveFound  = eleveRepository.findByMatricule(matricule);
		return EleveFound;
	}


	@Override
	public void updateMatricule(String matricule, long idEleve) {
		eleveRepository.updateMatricule(matricule, idEleve);
		
	}


	@Override
	public long findIdByMatricule(String matricule) {
		long id = eleveRepository.findIdByMatricule(matricule);
		return id;
	}

	
	@Override
	public String findMatriculeById(long idEleve) {
		String mat = eleveRepository.findMatriculeById(idEleve);
		return mat;
	}

	@Override
	public Eleve findByIdEleve(long idEleve) {
		Eleve eleveFound  = eleveRepository.findByIdEleve(idEleve);
		return eleveFound;
	}


	@Override
	public Eleve findByMatriculeAndIdEleveNot(String matricule, long idEleve) {
		Eleve eleveFound  = eleveRepository.findByMatriculeAndIdEleveNot(matricule, idEleve);
		return eleveFound;
	}
}