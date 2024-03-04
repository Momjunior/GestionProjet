package com.gescollege.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.gescollege.model.User;


public interface UserRepository extends JpaRepository<User, Long>{
	List<User> findByLogin(String user);

	List<User> findAll();
	
	User findByLoginAndIdUserNot( @Param("login") String login, @Param("idUser") long idUser );
	 
	@Transactional
	 @Modifying
	 @Query("UPDATE User SET nom = :nom, prenom = :prenom, login = :login, password = :password where idUser = :idUser")
	 void updateUser(@Param("nom") String nom, @Param("prenom") String prenom, @Param("login") String login, @Param("password") String password, @Param("idUser") long idUser );
	 
	 @Transactional
	 @Modifying
	 @Query("DELETE from User WHERE idUser = :idUser")
	 void deleteUserById( @Param("idUser") long idUser );
	 
	 @Query("SELECT a.password from User a WHERE a.idUser = :idUser")
	 String findPwdById(@Param("idUser") long idUser);

	 User findByLoginAndPassword(@Param("login") String login, @Param("password") String password);

}
