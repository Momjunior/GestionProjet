package com.gescollege.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name = "CLASSE")
public class Classe {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID_CLASSE", updatable = false, nullable = false)
	private long idClasse;
	
	@Column(name = "NOM_CLASSE",  insertable=true, updatable=true, nullable=false)
	private String nomClasse;

	public Classe() {
		super();
	}

	public Classe(String nomClasse, boolean isDone) {
		super();
		this.nomClasse = nomClasse;
	}
	
	public long getIdClasse() {
		return idClasse;
	}

	public void setIdClasse(long idClasse) {
		this.idClasse = idClasse;
	}
	
	
	public String getNomClasse() {
		return nomClasse;
	}

	public void setNomClasse(String nomClasse) {
		this.nomClasse = nomClasse;
	}
	
}