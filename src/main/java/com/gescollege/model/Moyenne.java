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
@Table(name = "MOYENNE")
public class Moyenne {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID_MOYENNE", updatable = false, nullable = false)
	private long idMoyenne;
	
    @ManyToOne
    @JoinColumn(name="ID_INSCRIPTION", nullable=false)
    private Inscription inscription;
    
	@Column(name = "SEMESTRE",  insertable=true, updatable=true, nullable=true)
	private int semestre;
    
    @ManyToOne
    @JoinColumn(name="ID_MATIERE", nullable=false)
    private Matiere matiere;
 
	@Column(name = "NOTE",  insertable=true, updatable=true, nullable=false)
	private float note;

	public Moyenne() {
		super();
	}

	public Moyenne(int semestre, float note, boolean isDone) {
		super();
		this.semestre = semestre;
		this.note = note;
	}

	public float getNote() {
		return note;
	}

	public void setNote(float note) {
		this.note = note;
	}

	public long getIdMoyenne() {
		return idMoyenne;
	}

	public void setIdMoyenne(long idMoyenne) {
		this.idMoyenne = idMoyenne;
	}	
	
	public int getSemestre() {
		return semestre;
	}

	public void setSemestre(int semestre) {
		this.semestre = semestre;
	}
	
	public Inscription getInscription() {
		return inscription;
	}
	public void setInscription(Inscription inscription) {
		this.inscription = inscription;
	}
	
	public Matiere getMatiere() {
		return matiere;
	}

	public void setMatiere(Matiere matiere) {
		this.matiere = matiere;
	}
}