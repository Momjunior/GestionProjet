package com.gescollege.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Service;


import com.gescollege.model.DetailClasse;
import com.gescollege.model.Eleve;
import com.gescollege.repository.DetailClasseRepository;



@Service
public class DetailClasseService implements IDetailClasseService {

	@Autowired
	private DetailClasseRepository detailClasseRepository;

	
	@Override
	public void saveDetailClasse(DetailClasse detailClasse) {
		detailClasseRepository.save(detailClasse);
	}


	@Override
	public List<DetailClasse> getAllDetailClasses() {
		// TODO Auto-generated method stub
		return detailClasseRepository.findAll();
	}

	@Override
	public void updateDetailClasse(  int conduiteClasse, long idAnneeScolaire , long idClasse , long idCategorieClasse , long idProfesseur , long idDetailClasse) {
		detailClasseRepository.updateDetailClasse(conduiteClasse, idAnneeScolaire, idClasse , idCategorieClasse, idProfesseur, idDetailClasse);
		
	}


	@Override
	public void deleteDetailClasseById(long id) {
		Optional<DetailClasse> DetailClasse = detailClasseRepository.findById(id);
		if (DetailClasse.isPresent()) {
			detailClasseRepository.deleteDetailClasseById(id);
		}
	}


	@Override
	public DetailClasse findDetailClasseByNomAndAnnee(long idAnneeScolaire, long idClasse, long idCategorie) {
		DetailClasse detailClasseFound  = detailClasseRepository.findDetailClasseByNomAndAnnee(idAnneeScolaire, idClasse, idCategorie);
		return detailClasseFound;
	}


	@Override
	public DetailClasse findIdDetailClasseByAnneeEnCours(long idClasse, long idCategorieClasse) {
		DetailClasse detailClasseFound = detailClasseRepository.findIdDetailClasseByAnneeEnCours(idClasse, idCategorieClasse);
		return detailClasseFound;
	}


	@Override
	public DetailClasse findDetailClasseByIdDetailClasse(long idDetailClasse) {
		DetailClasse detailClasseFound  = detailClasseRepository.findDetailClasseByIdDetailClasse(idDetailClasse);
		return detailClasseFound;
	}


	@Override
	public void updateConduiteClasse(float conduiteClasse, long idDetailClasse) {
		detailClasseRepository.updateConduiteClasse(conduiteClasse, idDetailClasse);
	}


}