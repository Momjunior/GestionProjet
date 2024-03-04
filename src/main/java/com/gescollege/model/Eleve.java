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


@Entity
@Table(name = "ELEVE")
public class Eleve {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID_ELEVE", updatable = false, nullable = false)
	private long idEleve;
	
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
	
	@Column(name = "MATRICULE", insertable=true, unique = true, updatable=true, nullable=true)
	private String matricule;
	
	public Eleve() {
		super();
	}

	public Eleve(String nom, String prenom, String sexe, Date dateNaiss, String tel, String matricule, boolean isDone) {
		super();
		this.nom = nom;
		this.prenom = prenom;
		this.sexe = sexe;		
		this.dateNaiss = dateNaiss;
		this.tel = tel;
		this.matricule = matricule;		
	}
	
	public long getIdEleve() {
		return idEleve;
	}

	public void setIdEleve(long idEleve) {
		this.idEleve = idEleve;
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
	
	public String getMatricule() {
		return matricule;
	}

	public void setMatricule(String matricule) {
		this.matricule = matricule;
	}
}