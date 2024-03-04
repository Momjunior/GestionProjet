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
@Table(name = "NOTE")
public class Note {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID_NOTE", updatable = false, nullable = false)
	private long idNote;
	
    @ManyToOne
    @JoinColumn(name="ID_INSCRIPTION", nullable=false)
    private Inscription inscription;
    
    @ManyToOne
    @JoinColumn(name="ID_MATIERE", nullable=false)
    private Matiere matiere;
    
	@Column(name = "DATE_EPREUVE",  insertable=true, updatable=true, nullable=false)
	@Temporal(TemporalType.DATE)
	private Date dateEpreuve;
	
	@Column(name = "SEMESTRE",  insertable=true, updatable=true, nullable=false)
	private int semestre;
	
	@Column(name = "TYPE_NOTE",  insertable=true, updatable=true, nullable=false)
	private String typeNote;
	
	@Column(name = "NOTE",  insertable=true, updatable=true, nullable=false)
	private float note;

	
	public Note() {
		super();
	}

	public Note( int semestre, String typeNote, float note, Date dateEpreuve, boolean isDone) {
		super();
		//this.dateVersement = dateVersement;
		this.semestre = semestre;
		this.typeNote = typeNote;
		this.dateEpreuve = dateEpreuve;
		this.note = note;
	}


	public Date getDateEpreuve() {
		return dateEpreuve;
	}

	public void setDateEpreuve(Date dateEpreuve) {
		this.dateEpreuve = dateEpreuve;
	}

	public String getTypeNote() {
		return typeNote;
	}

	public void setTypeNote(String typeNote) {
		this.typeNote = typeNote;
	}

	public float getNote() {
		return note;
	}

	public void setNote(float note) {
		this.note = note;
	}

	public long getIdNote() {
		return idNote;
	}

	public void setIdNote(long idNote) {
		this.idNote = idNote;
	}	
	/*
	public Date getDateVersement() {
		return dateVersement;
	}

	public void setDateVersement(Date dateVersement) {
		this.dateVersement = dateVersement;
	}
	*/
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