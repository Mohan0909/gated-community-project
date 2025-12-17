package com.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name = "complaints")
public class Complaint {
	
	

	  @Id
	  @GeneratedValue(strategy = GenerationType.IDENTITY)
	  private int complaintId;

	  @Column(nullable = false)
	  private int residentId;
	  
	  @Column(nullable = false, length = 50)
	  private String category;

	  @Column(length = 300)
	  private String subject;
	  
	  @Column(length = 500)
	  private String description;
	  
	  @Column(nullable = false, length = 20)
	  private String status;
	  
	  
	  private String imagePath;
	  
	 
	  public String getImagePath() {
		return imagePath;
	}

	  public void setImagePath(String imagePath) {
		  this.imagePath = imagePath;
	  }

	  public int getComplaintId() {
		return complaintId;
	}

	  public void setComplaintId(int complaintId) {
		  this.complaintId = complaintId;
	  }

	  public int getResidentId() {
		  return residentId;
	  }

	  public void setResidentId(int residentId) {
		  this.residentId = residentId;
	  }

	  public String getCategory() {
		  return category;
	  }

	  public void setCategory(String category) {
		  this.category = category;
	  }

	  public String getSubject() {
		  return subject;
	  }

	  public void setSubject(String subject) {
		  this.subject = subject;
	  }

	  public String getDescription() {
		  return description;
	  }

	  public void setDescription(String description) {
		  this.description = description;
	  }

	  public String getStatus() {
		  return status;
	  }

	  public void setStatus(String status) {
		  this.status = status;
	  }

	  
	  
	  public Complaint() {
		super();
	}

	  public Complaint(int residentId, String category, String subject, String description, String status) {
		super();
		this.residentId = residentId;
		this.category = category;
		this.subject = subject;
		this.description = description;
		this.status = status;
	}

	  public Complaint(int complaintId, int residentId, String category, String subject, String description,
			String status) {
		super();
		complaintId = complaintId;
		this.residentId = residentId;
		this.category = category;
		this.subject = subject;
		this.description = description;
		this.status = status;
	}

	  
	  
	  @Override
	public String toString() {
		return "Complaint [ComplaintId=" + complaintId + ", userId=" + residentId + ", category=" + category + ", subject="
				+ subject + ", description=" + description + ", status=" + status + "]";
	}

	}