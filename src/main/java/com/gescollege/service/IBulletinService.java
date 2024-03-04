package com.gescollege.service;

import java.util.List;

import com.gescollege.model.Bulletin;


public interface IBulletinService {
		
	void saveBulletin(Bulletin bulletin);
	
	List <Bulletin> getAllBulletins();
	
	Bulletin findBulletinByInscriptionAndSemestre( long idInscription, int semestre);
		
	void updateBulletin( int semestre, String conduite,  String tableauHonneur,  String assiduite, String appreciation,  long idBulletin);
		
	void deleteBulletinById(long id);	
	
	List <Bulletin> getAllBulletinByIdInscription(long idInscription);
	
	String findConduiteByIdInscrip(long idInscrip);
	
	void deleteBulletinByIdInscription(long id);
	
}