package com.gescollege.service;

import java.util.List;

import com.gescollege.model.User;


public interface IUserService {
		
	void saveUser(User user);
	
	List <User> getAllUsers();
	
	User findByLoginAndIdUserNot(String login, long idUser);
	
	void updateUser(String nom, String prenom, String login,String password, long idUser);
	
	void deleteUserById(long id);	
	
	String findPwdById(long idUser);
		
	User findByLoginAndPassword(String login, String pwd) ;


}