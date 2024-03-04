package com.gescollege.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name = "USER")
public class User {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID_USER", updatable = false, nullable = false)
	private long idUser;
	
	@Column(name = "NOM",  insertable=true, updatable=true, nullable=false)
	private String nom;
	
	@Column(name = "PRENOM",  insertable=true, updatable=true, nullable=false)
	private String prenom;
	
	@Column(name = "LOGIN",  insertable=true, updatable=true, nullable=false)
	private String login;
	
	@Column(name = "PASSWORD", insertable=true, updatable=true, nullable=true)
	private String password;	
	
	
	public User() {
		super();
	}

	public User(String nom, String prenom, String login,  String password,  boolean isDone) {
		super();
		this.nom = nom;
		this.prenom = prenom;
		this.login = login;		
		this.password = password;
		
	}
	
	public long getIdUser() {
		return idUser;
	}

	public void setIdUser(long idUser) {
		this.idUser = idUser;
	}
	
	
	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}
	
	public String getPrenom() {
		return prenom;
	}

	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}
	
	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}
	

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
}