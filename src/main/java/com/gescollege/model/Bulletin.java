package com.gescollege.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;



@Entity
@Table(name = "BULLETIN")
public class Bulletin {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID_BULLETIN", updatable = false, nullable = false)
	private long idBulletin;
	
    @ManyToOne
    @JoinColumn(name="ID_INSCRIPTION", nullable=false)
    private Inscription inscription;
    
	@Column(name = "SEMESTRE",  insertable=true, updatable=true, nullable=false)
	private int semestre;	
    
    @ManyToOne
    @JoinColumn(name="ID_PROFESSEUR", nullable=false)
    private Professeur professeur;
	
	@Column(name = "CONDUITE",  insertable=true, updatable=true, nullable=true)
	private String conduite;
	
	@Column(name = "TABLEAU_HONNEUR",  insertable=true, updatable=true, nullable=true)
	private String tableauHonneur;
	
	@Column(name = "ASSIDUITE",  insertable=true, updatable=true, nullable=true)
	private String assiduite;

	@Column(name = "APPRECIATION",  insertable=true, updatable=true, nullable=true)
	private String appreciation;

	
	public Bulletin() {
		super();
	}

	public Bulletin(int semestre, String conduite, String tableauHonneur, String assiduite, String appreciation, boolean isDone) {
		super();
		this.semestre = semestre;
		this.conduite = conduite;
		this.tableauHonneur = tableauHonneur;
		this.assiduite = assiduite;
		this.appreciation = appreciation;
	}
	
	public long getIdBulletin() {
		return idBulletin;
	}

	public void setIdBulletin(long idBulletin) {
		this.idBulletin = idBulletin;
	}	

	public int getSemestre() {
		return semestre;
	}

	public void setSemestre(int semestre) {
		this.semestre = semestre;
	}
	
	
	public String getConduite() {
		return conduite;
	}

	public void setConduite(String conduite) {
		this.conduite = conduite;
	}

	public Inscription getInscription() {
		return inscription;
	}
	public void setInscription(Inscription inscription) {
		this.inscription = inscription;
	}

	public Professeur getProfesseur() {
		return professeur;
	}

	public void setProfesseur(Professeur professeur) {
		this.professeur = professeur;
	}

	public String getTableauHonneur() {
		return tableauHonneur;
	}

	public void setTableauHonneur(String tableauHonneur) {
		this.tableauHonneur = tableauHonneur;
	}

	public String getAssiduite() {
		return assiduite;
	}

	public void setAssiduite(String assiduite) {
		this.assiduite = assiduite;
	}

	public String getAppreciation() {
		return appreciation;
	}

	public void setAppreciation(String appreciation) {
		this.appreciation = appreciation;
	}	
}