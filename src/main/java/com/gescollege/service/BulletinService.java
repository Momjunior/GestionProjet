package com.gescollege.service;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Service;

import com.gescollege.model.Bulletin;
import com.gescollege.repository.BulletinRepository;



@Service
public class BulletinService implements IBulletinService {

	@Autowired
	private BulletinRepository bulletinRepository;

	
	@Override
	public void saveBulletin(Bulletin bulletin) {
		bulletinRepository.save(bulletin);
	}


	@Override
	public List<Bulletin> getAllBulletins() {
		// TODO Auto-generated method stub
		return bulletinRepository.findAll();
	}


	@Override
	public void updateBulletin( int semestre, String conduite,  String tableauHonneur,  String assiduite, String appreciation,  long idBulletin) {
		bulletinRepository.updateBulletin(  semestre, conduite, tableauHonneur, assiduite, appreciation, idBulletin);		
	}


	@Override
	public void deleteBulletinById(long id) {
		Optional<Bulletin> Bulletin = bulletinRepository.findById(id);
		if (Bulletin.isPresent()) {
			bulletinRepository.deleteBulletinById(id);
		}
	}

	@Override
	public List<Bulletin> getAllBulletinByIdInscription(long idInscription) {
		// TODO Auto-generated method stub
		return bulletinRepository.getAllBulletinByIdInscription(idInscription);
	}


	@Override
	public Bulletin findBulletinByInscriptionAndSemestre(long idInscription, int semestre) {
		return bulletinRepository.findBulletinByInscriptionAndSemestre(idInscription, semestre);
	}


	@Override
	public String findConduiteByIdInscrip(long idInscrip) {
		String conduite = bulletinRepository.findConduiteByIdInscrip(idInscrip);
		return conduite;
	}


	@Override
	public void deleteBulletinByIdInscription(long id) {
		bulletinRepository.deleteBulletinByIdInscription(id);
		
	}

}