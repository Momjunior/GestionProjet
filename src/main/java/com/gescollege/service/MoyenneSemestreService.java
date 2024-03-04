package com.gescollege.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.gescollege.model.MoyenneSemestre;
import com.gescollege.repository.MoyenneSemestreRepository;



@Service
public class MoyenneSemestreService implements IMoyenneSemestreService {

	@Autowired
	private MoyenneSemestreRepository moyenneSemestreRepository;

	
	@Override
	public void saveMoyenneSemestre(MoyenneSemestre moyenneSemestre) {
		moyenneSemestreRepository.save(moyenneSemestre);
	}


	@Override
	public List<MoyenneSemestre> getAllMoyenneSemestre1() {
		// TODO Auto-generated method stub
		return moyenneSemestreRepository.getAllMoyenneSemestre1();
	}


	@Override
	public void truncateTable() {
		moyenneSemestreRepository.truncateTable();
		
	}


	@Override
	public void deleteMoyenneSemestreByIdInscription(long id) {
		moyenneSemestreRepository.deleteMoyenneSemestreByIdInscription(id);
		
	}

/*	@Override
	public void updateMoyenneSemestre( long idMoyenneSemestre) {
		moyenneSemestreRepository.updateMoyenneSemestre(idMoyenneSemestre);		
	}
*/
	

}