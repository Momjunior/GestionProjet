package com.gescollege.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.gescollege.model.User;
import com.gescollege.repository.UserRepository;



@Service
public class UserService implements IUserService {

	@Autowired
	private UserRepository userRepository;

	
	@Override
	public void saveUser(User user) {
		userRepository.save(user);
	}


	@Override
	public List<User> getAllUsers() {
		// TODO Auto-generated method stub
		return userRepository.findAll();
	}


	@Override
	public User findByLoginAndIdUserNot( String login, long idUser) {
		// TODO Auto-generated method stub
		return userRepository.findByLoginAndIdUserNot(login, idUser);
	}

	@Override
	public void updateUser(String nom, String prenom, String login, String password,
			long idUser) {
		userRepository.updateUser( nom,  prenom,  login,  password, idUser);
		
	}


	@Override
	public void deleteUserById(long id) {
		Optional<User> User = userRepository.findById(id);
		if (User.isPresent()) {
			userRepository.deleteUserById(id);
		}
	}


	@Override
	public String findPwdById(long idUser) {
		String pwd = userRepository.findPwdById(idUser);
		return pwd;
	}


	@Override
	public User findByLoginAndPassword(String login, String pwd) {
		User UserFound = userRepository.findByLoginAndPassword(login, pwd);
		return UserFound;
	}

}