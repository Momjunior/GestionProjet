package com.gescollege.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name = "ANNEE_SCOLAIRE")
public class AnneeScolaire {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID_ANNEE_SCOLAIRE", updatable = false, nullable = false)
	private long idAnneeScolaire;
	
	@Column(name = "DEBUT", unique = true, insertable=true, updatable=true, nullable=false)
	private String debut;
	
	@Column(name = "FIN", unique = true, insertable=true, updatable=true, nullable=false)
	private String fin;
	
	@Column(name = "STATUT", insertable=true, updatable=true, nullable=true)
	private String statut;
	
	
	public AnneeScolaire() {
		super();
	}

	public AnneeScolaire(String debut, String fin, String statut, boolean isDone) {
		super();
		this.debut = debut;
		this.fin = fin;	
		this.statut = statut;	
	}
	
	public long getIdAnneeScolaire() {
		return idAnneeScolaire;
	}

	public void setIdAnneeScolaire(long idAnneeScolaire) {
		this.idAnneeScolaire = idAnneeScolaire;
	}
	
	
	public String getDebut() {
		return debut;
	}

	public void setDebut(String debut) {
		this.debut = debut;
	}
	
	public String getFin() {
		return fin;
	}

	public void setFin(String fin) {
		this.fin = fin;
	}
	
	public String getStatut() {
		return statut;
	}

	public void setStatut(String statut) {
		this.statut = statut;
	}	
}