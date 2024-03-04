package com.gescollege.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name = "CATEGORIE_CLASSE")
public class CategorieClasse {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID_CATEGORIE_CLASSE", updatable = false, nullable = false)
	private long idCategorieClasse;
	
	@Column(name = "NOM_CATEGORIE",  insertable=true, updatable=true, nullable=false)
	private String nomCategorie;
	
	
	public CategorieClasse() {
		super();
	}

	public CategorieClasse(String nomCategorie, boolean isDone) {
		super();
		this.nomCategorie = nomCategorie;	
	}
	
	public long getIdCategorieClasse() {
		return idCategorieClasse;
	}

	public void setIdCategorieClasse(long idCategorieClasse) {
		this.idCategorieClasse = idCategorieClasse;
	}

	public String getNomCategorie() {
		return nomCategorie;
	}

	public void setNomCategorie(String nomCategorie) {
		this.nomCategorie = nomCategorie;
	}
	
	
}