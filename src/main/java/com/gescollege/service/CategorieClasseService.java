package com.gescollege.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gescollege.model.CategorieClasse;
import com.gescollege.model.Matiere;
import com.gescollege.repository.CategorieClasseRepository;



@Service
public class CategorieClasseService implements ICategorieClasseService {

	@Autowired
	private CategorieClasseRepository categorieClasseRepository;

	@Override
	public List<CategorieClasse> getAllCategories() {
		// TODO Auto-generated method stub
		return categorieClasseRepository.findAll();
	}

	@Override
	public long findIdByCategorie(String categorie) {
		long id = categorieClasseRepository.findIdByCategorie(categorie);
		return id;
	}

	@Override
	public String findCategorieByIdCategorie(long idCategorie) {
		String categorie = categorieClasseRepository.findCategorieByIdCategorie(idCategorie);
		return categorie;
	}

	@Override
	public CategorieClasse findByNomCategorie(String nomCategorie) {
		CategorieClasse categorieClasseFound = categorieClasseRepository.findByNomCategorie(nomCategorie);
		return categorieClasseFound;
	}

	@Override
	public void saveCategorieClasse(CategorieClasse categorieClasse) {
		categorieClasseRepository.save(categorieClasse);
		
	}

	@Override
	public void deleteCategorieById(long id) {
		Optional<CategorieClasse> categorieClasse = categorieClasseRepository.findById(id);
		if (categorieClasse.isPresent()) {
			categorieClasseRepository.deleteCategorieById(id);
		}
	}

	
	

}