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
import javax.persistence.Transient;

import org.springframework.format.annotation.DateTimeFormat;



@Entity
@Table(name = "DETAIL_CLASSE")
public class DetailClasse {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID_DETAIL_CLASSE", updatable = false, nullable = false)
	private long idDetailClasse;
	
	
	@Column(name = "CONDUITE_CLASSE",  insertable=true, updatable=true, nullable=false)
	private float conduiteClasse;
	
    @ManyToOne
    @JoinColumn(name="ID_PROFESSEUR", nullable=true)
    private Professeur professeur;
	/*
    @ManyToOne
    @JoinColumn(name="ID_INSCRIPTION", nullable=true)
    private Inscription inscription;*/
    
    @ManyToOne
    @JoinColumn(name="ID_ANNEE_SCOLAIRE", nullable=false)
    private AnneeScolaire anneeScolaire;
	
    @ManyToOne
    @JoinColumn(name="ID_CLASSE", nullable=true)
    private Classe classe;
    
    @ManyToOne
    @JoinColumn(name="ID_CATEGORIE", nullable=true)
    private CategorieClasse categorieClasse;
    
	@Transient
	private int effectifGarcon;
	
	@Transient
	private int effectifFille;
	
	@Transient
	private int effectif;
	
	public int getEffectifGarcon() {
		return effectifGarcon;
	}

	public void setEffectifGarcon(int effectifGarcon) {
		this.effectifGarcon = effectifGarcon;
	}

	public int getEffectifFille() {
		return effectifFille;
	}

	public void setEffectifFille(int effectifFille) {
		this.effectifFille = effectifFille;
	}

	public int getEffectif() {
		return effectif;
	}

	public void setEffectif(int effectif) {
		this.effectif = effectif;
	}

	public DetailClasse() {
		super();
	}

	public DetailClasse( float conduiteClasse, boolean isDone) {
		super();
		this.conduiteClasse = conduiteClasse;
	}
	
	public long getIdDetailClasse() {
		return idDetailClasse;
	}

	public void setIdDetailClasse(long idDetailClasse) {
		this.idDetailClasse = idDetailClasse;
	}

	public float getConduiteClasse() {
		return conduiteClasse;
	}

	public void setConduiteClasse(float conduiteClasse) {
		this.conduiteClasse = conduiteClasse;
	}
	
	public Professeur getProfesseur() {
		return professeur;
	}
	public void setProfesseur(Professeur professeur) {
		this.professeur = professeur;
	}
	/*
	public Inscription getInscription() {
		return inscription;
	}
	public void setInscription(Inscription inscription) {
		this.inscription = inscription;
	}
	*/
	public AnneeScolaire getAnneeScolaire() {
		return anneeScolaire;
	}
	public void setAnneeScolaire(AnneeScolaire anneeScolaire) {
		this.anneeScolaire = anneeScolaire;
	}
	
	public Classe getClasse() {
		return classe;
	}
	public void setClasse(Classe classe) {
		this.classe = classe;
	}

	public CategorieClasse getCategorieClasse() {
		return categorieClasse;
	}

	public void setCategorieClasse(CategorieClasse categorieClasse) {
		this.categorieClasse = categorieClasse;
	}
	
	
	
}