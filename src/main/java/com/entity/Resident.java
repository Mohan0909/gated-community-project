package com.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "residents")
public class Resident {

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int residentId;

    @Column(name = "username", nullable = false, length = 100)
    private String userName;
    
    @Column(name = "password", nullable = false, length = 100)
    private String password;

    @Column(name = "email", nullable = false, unique = true, length = 100)
    private String email;

    @Column(name = "phone", length = 15)
    private String phone;
    
    @Column(name = "role", nullable = false, length = 100)
    private String role;
    
    
    
    public Resident() {
    	
    }  
    
	@Override
	public String toString() {
		return "Resident [residentId=" + residentId + ", userName=" + userName + ", password=" + password + ", email="
				+ email + ", phone=" + phone + ", role=" + role + "]";
	}

	public Resident(String userName, String password, String email, String phone, String role) {
		super();
		this.userName = userName;
		this.password = password;
		this.email = email;
		this.phone = phone;
		this.role = role;
	}


	public Resident(int residentId, String userName, String password, String email, String phone, String role) {
		super();
		this.residentId = residentId;
		this.userName = userName;
		this.password = password;
		this.email = email;
		this.phone = phone;
		this.role = role;
	}


	public int getResidentId() {
		return residentId;
	}

	public void setResidentId(int residentId) {
		this.residentId = residentId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}
       
}
