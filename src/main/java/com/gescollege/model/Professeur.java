package com.gescollege.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;


@Entity
@Table(name = "PROFESSEUR")
public class Professeur {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID_PROFESSEUR", updatable = false, nullable = false)
	private long idProfesseur;
	
	@Column(name = "NOM",  insertable=true, updatable=true, nullable=false)
	private String nom;
	
	@Column(name = "PRENOM",  insertable=true, updatable=true, nullable=false)
	private String prenom;
	
	@Column(name = "SEXE",  insertable=true, updatable=true, nullable=false)
	private String sexe;
	
	@Column(name = "DATE_NAISS", insertable=true, updatable=true, nullable=true)
	@Temporal(TemporalType.DATE)
	private Date dateNaiss;	
	
	@Column(name = "TEL", insertable=true, updatable=true, nullable=true)
	private String tel;
	
	
	public Professeur() {
		super();
	}

	public Professeur(String nom, String prenom, String sexe, Date dateNaiss, String tel,  boolean isDone) {
		super();
		this.nom = nom;
		this.prenom = prenom;
		this.sexe = sexe;		
		this.dateNaiss = dateNaiss;
		this.tel = tel;
	}
	
	public long getIdProfesseur() {
		return idProfesseur;
	}

	public void setIdProfesseur(long idProfesseur) {
		this.idProfesseur = idProfesseur;
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
	
	public String getSexe() {
		return sexe;
	}

	public void setSexe(String sexe) {
		this.sexe = sexe;
	}
	
	public Date getDateNaiss() {
		return dateNaiss;
	}

	public void setDateNaiss(Date dateNaiss) {
		this.dateNaiss = dateNaiss;
	}
	
	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}	

}