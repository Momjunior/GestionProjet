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
@Table(name = "MATIERE_ENSEIGNEE")
public class MatiereEnseignee {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID_MATIERE_ENSEIGNEE", updatable = false, nullable = false)
	private long idMatiereEnseignee;
	
    @ManyToOne
    @JoinColumn(name="ID_ANNEE_SCOLAIRE", nullable=false)
    private AnneeScolaire anneeScolaire;
	
    @ManyToOne
    @JoinColumn(name="ID_MATIERE", nullable=true)
    private Matiere matiere;
    
    @ManyToOne
    @JoinColumn(name="ID_CLASSE", nullable=true)
    private Classe classe;
    
    @ManyToOne
    @JoinColumn(name="ID_PROFESSEUR", nullable=true)
    private Professeur professeur;
 

	public MatiereEnseignee() {
		super();
	}

	public MatiereEnseignee( boolean isDone) {
		super();
	}
	
	public long getIdMatiereEnseignee() {
		return idMatiereEnseignee;
	}

	public void setIdMatiereEnseignee(long idMatiereEnseignee) {
		this.idMatiereEnseignee = idMatiereEnseignee;
	}
	
	public Professeur getProfesseur() {
		return professeur;
	}

	public void setProfesseur(Professeur professeur) {
		this.professeur = professeur;
	}

	public AnneeScolaire getAnneeScolaire() {
		return anneeScolaire;
	}
	public void setAnneeScolaire(AnneeScolaire anneeScolaire) {
		this.anneeScolaire = anneeScolaire;
	}
	
	public Matiere getMatiere() {
		return matiere;
	}
	public void setMatiere(Matiere matiere) {
		this.matiere = matiere;
	}
	
	public Classe getClasse() {
		return classe;
	}
	public void setClasse(Classe classe) {
		this.classe = classe;
	}
	
	
}