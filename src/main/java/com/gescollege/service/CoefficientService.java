package com.gescollege.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.gescollege.model.Coefficient;
import com.gescollege.repository.CoefficientRepository;



@Service
public class CoefficientService implements ICoefficientService {

	@Autowired
	private CoefficientRepository coefficientRepository;

	@Override
	public Coefficient findCoefficient(long idAnneeScolaire, long idClasse, long idMatiere) {
		Coefficient coefficientFound  = coefficientRepository.findCoefficient(idAnneeScolaire, idClasse, idMatiere);
		return coefficientFound;
	}

	
	@Override
	public void saveCoefficient(Coefficient coefficient) {
		coefficientRepository.save(coefficient);
	}


	@Override
	public List<Coefficient> getAllCoefficientsByAnnee(long idAnnee) {
		// TODO Auto-generated method stub
		return coefficientRepository.getAllCoefficientsByAnnee( idAnnee);
	}

	@Override
	public void updateCoefficient( int valeur, long idCoefficient) {
		coefficientRepository.updateCoefficient(valeur, idCoefficient);
		
	}


	@Override
	public void deleteCoefficientById(long id) {
		Optional<Coefficient> Coefficient = coefficientRepository.findById(id);
		if (Coefficient.isPresent()) {
			coefficientRepository.deleteCoefficientById(id);
		}
	}


	@Override
	public int findCoefficientAnglais(long id) {
		int coef = coefficientRepository.findCoefficientAnglais(id);
		return coef;
	}


	@Override
	public int findCoefficientPC(long id) {
		int coef = coefficientRepository.findCoefficientPC(id);
		return coef;
	}


	@Override
	public int findCoefficientFr(long id) {
		int coef = coefficientRepository.findCoefficientFr(id);
		return coef;
	}


	@Override
	public int findCoefficientHG(long id) {
		int coef = coefficientRepository.findCoefficientHG(id);
		return coef;
	}


	@Override
	public int findCoefficientMath(long id) {
		int coef = coefficientRepository.findCoefficientMath(id);
		return coef;
	}


	@Override
	public int findCoefficientSvt(long id) {
		int coef = coefficientRepository.findCoefficientSvt(id);
		return coef;
	}


	@Override
	public int findCoefficientEfs(long id) {
		int coef = coefficientRepository.findCoefficientEfs(id);
		return coef;
	}


	@Override
	public int findCoefficientEps(long id) {
		int coef = coefficientRepository.findCoefficientEps(id);
		return coef;
	}


	@Override
	public void deleteAllCoefficientById(long id) {
		coefficientRepository.deleteAllCoefficientById(id);
		
	}


	@Override
	public List<Coefficient> getAllCoefficients(long idAnnee, long idClasse, long idMatiere) {
		// TODO Auto-generated method stub
		return coefficientRepository.getAllCoefficients( idAnnee, idClasse,  idMatiere);
	}


	@Override
	public int findSommeCoefficient(long idAnnee, long idClasse) {
		int coef = coefficientRepository.findSommeCoefficient(idAnnee, idClasse);
		return coef;
	}

}