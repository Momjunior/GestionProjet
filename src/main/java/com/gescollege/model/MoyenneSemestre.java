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
@Table(name = "MOYENNE_SEMESTRE")
public class MoyenneSemestre {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID_MOYENNE_SEMESTRE", updatable = false, nullable = false)
	private long idMoyenneSemestre;
	
    @ManyToOne
    @JoinColumn(name="ID_INSCRIPTION", nullable=false)
    private Inscription inscription;
    
	@Column(name = "SEMESTRE",  insertable=true, updatable=true, nullable=false)
	private int semestre;
 
	@Column(name = "NOTE",  insertable=true, updatable=true, nullable=false)
	private float note;

	public MoyenneSemestre() {
		super();
	}

	public MoyenneSemestre(int semestre, float note, boolean isDone) {
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

	public long getIdMoyenneSemestre() {
		return idMoyenneSemestre;
	}

	public void setIdMoyenneSemestre(long idMoyenneSemestre) {
		this.idMoyenneSemestre = idMoyenneSemestre;
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

}