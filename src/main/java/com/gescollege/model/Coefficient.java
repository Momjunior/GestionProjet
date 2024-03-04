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
@Table(name = "COEFFICIENT")
public class Coefficient {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID_COEFFICIENT", updatable = false, nullable = false)
	private long idCoefficient;
		
    @ManyToOne
    @JoinColumn(name="ID_ANNEE_SCOLAIRE", nullable=false)
    private AnneeScolaire anneeScolaire;

    @ManyToOne
    @JoinColumn(name="ID_CLASSE", nullable=false)
    private Classe classe;
    
    @ManyToOne
    @JoinColumn(name="ID_MATIERE", nullable=true)
    private Matiere matiere;
	
	@Column(name = "VALEUR",  insertable=true, updatable=true, nullable=true)
	private int valeur;

	
	public Coefficient() {
		super();
	}

	public Coefficient(int valeur, boolean isDone) {
		super();
		this.valeur = valeur;
	
	}
	
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

	public long getIdCoefficient() {
		return idCoefficient;
	}

	public void setIdCoefficient(long idCoefficient) {
		this.idCoefficient = idCoefficient;
	}	

	
	public int getValeur() {
		return valeur;
	}

	public void setValeur(int valeur) {
		this.valeur = valeur;
	}

	public Matiere getMatiere() {
		return matiere;
	}

	public void setMatiere(Matiere matiere) {
		this.matiere = matiere;
	}

	
}