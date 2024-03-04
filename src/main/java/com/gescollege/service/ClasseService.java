package com.gescollege.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.gescollege.model.Classe;
import com.gescollege.repository.ClasseRepository;



@Service
public class ClasseService implements IClasseService {

	@Autowired
	private ClasseRepository classeRepository;

	
	@Override
	public void saveClasse(Classe classe) {
		classeRepository.save(classe);
	}


	@Override
	public List<Classe> getAllClasses() {
		// TODO Auto-generated method stub
		return classeRepository.findAll();
	}

	@Override
	public void updateClasse( String classe, long idClasse) {
		classeRepository.updateClasse(classe, idClasse);
		
	}


	@Override
	public void deleteClasseById(long id) {
		Optional<Classe> Classe = classeRepository.findById(id);
		if (Classe.isPresent()) {
			classeRepository.deleteClasseById(id);
		}
	}


	@Override
	public Classe findByNomClasse(String nomClasse ) {
		Classe classeFound = classeRepository.findByNomClasse(nomClasse);
		return classeFound;
	}


	@Override
	public long findIdByNomClasse(String classe) {
		long id = classeRepository.findIdByNomClasse(classe);
		return id;
	}


	@Override
	public String findNomClasseByIdClasse(long idClasse) {
		String classe = classeRepository.findNomClasseByIdClasse(idClasse);
		return classe;
	}

}