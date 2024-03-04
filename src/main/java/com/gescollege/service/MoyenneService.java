package com.gescollege.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.gescollege.model.Moyenne;
import com.gescollege.repository.MoyenneRepository;



@Service
public class MoyenneService implements IMoyenneService {

	@Autowired
	private MoyenneRepository moyenneRepository;

	
	@Override
	public void saveMoyenne(Moyenne moyenne) {
		moyenneRepository.save(moyenne);
	}


	@Override
	public List<Moyenne> getAllMoyenneByIdMatiere(long idMatiere) {
		// TODO Auto-generated method stub
		return moyenneRepository.getAllMoyenneByIdMatiere(idMatiere);
	}


	@Override
	public void truncateTable() {
		moyenneRepository.truncateTable();
		
	}


	@Override
	public void deleteMoyenneByIdInscription(long id) {
		moyenneRepository.deleteMoyenneByIdInscription(id);
		
	}
	
	

/*	@Override
	public void updateMoyenne( long idMoyenne) {
		moyenneRepository.updateMoyenne(idMoyenne);		
	}
*/
	

}