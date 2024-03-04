package com.gescollege.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


@Entity
@Table(name = "MATIERE")
public class Matiere {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID_MATIERE", updatable = false, nullable = false)
	private long idMatiere;
	
	@Column(name = "NOM_MATIERE",  unique = true,  insertable=true, updatable=true, nullable=false)
	private String nomMatiere;
	
	public Matiere() {
		super();
	}

	public Matiere(String nomMatiere, boolean isDone) {
		super();
		this.nomMatiere = nomMatiere;
	}
	
	public long getIdMatiere() {
		return idMatiere;
	}

	public void setIdMatiere(long idMatiere) {
		this.idMatiere = idMatiere;
	}
	
	
	public String getNomMatiere() {
		return nomMatiere;
	}

	public void setNomMatiere(String nomMatiere) {
		this.nomMatiere = nomMatiere;
	}
	
}