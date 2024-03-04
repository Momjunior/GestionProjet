package com.gescollege.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Service;


import com.gescollege.model.MatiereEnseignee;
import com.gescollege.model.Eleve;
import com.gescollege.model.Matiere;
import com.gescollege.repository.MatiereEnseigneeRepository;



@Service
public class MatiereEnseigneeService implements IMatiereEnseigneeService {

	@Autowired
	private MatiereEnseigneeRepository matiereEnseigneeRepository;

	
	@Override
	public void saveMatiereEnseignee(MatiereEnseignee matiereEnseignee) {
		matiereEnseigneeRepository.save(matiereEnseignee);
	}

	@Override
	public List<MatiereEnseignee> getAllMatiereEnseigneesByProfAndAnnee(long idProf, long idAnnee) {
		return matiereEnseigneeRepository.getAllMatiereEnseigneesByProfAndAnnee( idProf, idAnnee);
	}

	@Override
	public MatiereEnseignee findMatiereEnseignee(long idAnneeScolaire, long idMatiere, long idClasse, long idProf) {
		// TODO Auto-generated method stub
		MatiereEnseignee matiereFound = matiereEnseigneeRepository.findMatiereEnseignee( idAnneeScolaire,  idMatiere,  idClasse,  idProf);
		return matiereFound;
	}

	@Override
	public void deleteMatiereEnseigneeById(long id) {
		Optional<MatiereEnseignee> Matiere = matiereEnseigneeRepository.findById(id);
		if (Matiere.isPresent()) {
			matiereEnseigneeRepository.deleteMatiereEnseigneeById(id);
		}
	}
}