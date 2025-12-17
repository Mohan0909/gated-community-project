package com.Dao;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.entity.Resident;
import com.utils.HibernateUtils;

public class ResidentDao {
	
	public Resident getResidentByUsernameAndPassword(String username, String password){
		
		 Transaction transaction = null;
	        Resident resident = null;

	        try (Session session = HibernateUtils.getSession()) {
	            transaction = session.beginTransaction();

	            // Correct HQL: Entity name should match the class name 'Resident'
	            Query<Resident> query = session.createQuery(
	                "FROM Resident WHERE userName = :username AND password = :password",
	                Resident.class
	            );

	            query.setParameter("username", username);
	            query.setParameter("password", password);
	       

	            resident = query.uniqueResult();

	            transaction.commit();
	        } catch (Exception e) {
	            if (transaction != null) transaction.rollback();
	            e.printStackTrace();
	        }

	        return resident;
	    
	}
	
	
	public boolean saveResident(Resident resident) {
		
		  try (Session session = HibernateUtils.getSession()) {
		        Transaction tx = session.beginTransaction();
		        session.save(resident);
		        tx.commit();
		        return true;
		    } catch (Exception e) {
		        e.printStackTrace();
		        return false;
		    }
		
	}
	
	
	
}

