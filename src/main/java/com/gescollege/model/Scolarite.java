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
@Table(name = "SCOLARITE")
public class Scolarite {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID_SCOLARITE", updatable = false, nullable = false)
	private long idScolarite;
	
    @ManyToOne
    @JoinColumn(name="ID_INSCRIPTION", nullable=false)
    private Inscription inscription;
	
    
	@Column(name = "DATE_VERSEMENT",  insertable=true, updatable=true, nullable=false)
	@Temporal(TemporalType.DATE)
	private Date dateVersement;
	
	@Column(name = "MOIS",  insertable=true, updatable=true, nullable=false)
	private String mois;
	
	@Column(name = "MONTANT_VERSEMENT",  insertable=true, updatable=true, nullable=false)
	private long montantVersement;

	
	public Scolarite() {
		super();
	}

	public Scolarite(Date dateVersement, String mois, long montantVersement, boolean isDone) {
		super();
		this.dateVersement = dateVersement;
		this.mois = mois;
		this.montantVersement = montantVersement;
	}
	
	public long getIdScolarite() {
		return idScolarite;
	}

	public void setIdScolarite(long idScolarite) {
		this.idScolarite = idScolarite;
	}	
	
	public Date getDateVersement() {
		return dateVersement;
	}

	public void setDateVersement(Date dateVersement) {
		this.dateVersement = dateVersement;
	}
	
	public String getMois() {
		return mois;
	}

	public void setMois(String mois) {
		this.mois = mois;
	}
	
	public long getMontantVersement() {
		return montantVersement;
	}

	public void setMontantVersement(long montantVersement) {
		this.montantVersement = montantVersement;
	}
	
	public Inscription getInscription() {
		return inscription;
	}
	public void setInscription(Inscription inscription) {
		this.inscription = inscription;
	}
	
}