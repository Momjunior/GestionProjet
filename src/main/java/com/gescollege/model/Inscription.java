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
@Table(name = "INSCRIPTION")
public class Inscription {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID_INSCRIPTION", updatable = false, nullable = false)
	private long idInscription;
	
	@Column(name = "DATE_INSCRIPTION",  insertable=true, updatable=true, nullable=false)
	@Temporal(TemporalType.DATE)
	private Date dateInscription;
	
	@Column(name = "MONTANT",  insertable=true, updatable=true, nullable=false)
	private long montant;
	
    @ManyToOne
    @JoinColumn(name="ID_ELEVE", nullable=false)
    private Eleve eleve;
    
    @ManyToOne
    @JoinColumn(name="ID_DETAIL_CLASSE", nullable=false)
    private DetailClasse detailClasse;
	/*
    @ManyToOne
    @JoinColumn(name="ID_ANNEE_SCOLAIRE", nullable=false)
    private AnneeScolaire anneeScolaire;
	
    @ManyToOne
    @JoinColumn(name="ID_CLASSE", nullable=false)
    private Classe classe;
    
    @ManyToOne
    @JoinColumn(name="ID_CATEGORIE", nullable=false)
    private CategorieClasse categorieClasse;
	*/
	public Inscription() {
		super();
	}

	public Inscription(Date dateInscription, long montant, boolean isDone) {
		super();
		this.dateInscription = dateInscription;
		this.montant = montant;
	}
	
	public long getIdInscription() {
		return idInscription;
	}

	public void setIdInscription(long idInscription) {
		this.idInscription = idInscription;
	}
	
	public Date getDateInscription() {
		return dateInscription;
	}

	public void setDateInscription(Date dateInscription) {
		this.dateInscription = dateInscription;
	}

	public long getMontant() {
		return montant;
	}

	public void setMontant(long montant) {
		this.montant = montant;
	}
	
	public Eleve getEleve() {
		return eleve;
	}
	public void setEleve(Eleve eleve) {
		this.eleve = eleve;
	}
	
	public DetailClasse getDetailClasse() {
		return detailClasse;
	}
	public void setDetailClasse(DetailClasse detailClasse) {
		this.detailClasse = detailClasse;
	}

	/*
	public AnneeScolaire getAnneeScolaire() {
		return anneeScolaire;
	}
	public void setAnneeScolaire(AnneeScolaire anneeScolaire) {
		this.anneeScolaire = anneeScolaire;
	}
	
	
	public CategorieClasse getCategorieClasse() {
		return categorieClasse;
	}

	public void setCategorieClasse(CategorieClasse categorieClasse) {
		this.categorieClasse = categorieClasse;
	}
	*/
	
	
}