package com.Dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.entity.Complaint;
import com.utils.HibernateUtils;

public class ComplaintDao {
	
	
	public boolean saveComplaint(Complaint complaint) {
		
		try(Session session = HibernateUtils.getSession()){
			
			Transaction trans = session.beginTransaction();
			
			session.save(complaint);
			
			trans.commit();
			return true;
			
		} catch (Exception e) {
	        e.printStackTrace();
	        return false;
	    }
		
	}
	
	// Get complaints by residentId
    public List<Complaint> getComplaintsByResidentId(Integer residentId) {
    	
        List<Complaint> complaints = null;

        try (Session session = HibernateUtils.getSessionFactory().openSession()) {
        	Transaction trans = session.beginTransaction();
        	
            Query<Complaint> query = session.createQuery(
                "from Complaint where residentId = :rid", Complaint.class);
            
            query.setParameter("rid", residentId);
            
            complaints = query.getResultList();
            
            System.out.println("DAO → complaints found = " + complaints.size());
            
            trans.commit();
            
        } catch (Exception e) {
            e.printStackTrace();
        }

        return complaints;
    }

	public List<Complaint> getSolvedComplaints(Integer residentId) {
		
		 List<Complaint> complaints = null;

	        try (Session session = HibernateUtils.getSessionFactory().openSession()) {
	        	Transaction trans = session.beginTransaction();
	        	
	            Query<Complaint> query = session.createQuery(
	                "from Complaint where residentId = :rid AND status = 'Solved'", Complaint.class);
	            
	            query.setParameter("rid", residentId);
	            
	            complaints = query.getResultList();
	            
	            System.out.println("DAO → complaints found = " + complaints.size());
	            
	            trans.commit();
	            
	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	        return complaints;		
		
	}
	
	
	
	
	public boolean updateComplaint(Complaint complaint) {
		
		Transaction transaction = null;
		boolean updated = false;
		
		try(Session session = HibernateUtils.getSession()){
			
			transaction = session.beginTransaction();
			
			session.update(complaint);  // Hibernate automatically updates based on complaintId
			
			transaction.commit();
		        
			updated = true;

		    System.out.println("Complaint updated successfully: " + complaint.getComplaintId());
		
		} catch(Exception e) {
			
			if(transaction != null) {
				transaction.rollback();				
			}
			
			e.printStackTrace();
		}
		
		return updated;
	}

	public Complaint getComplaintById(int complaintId) {
        try (Session session = HibernateUtils.getSessionFactory().openSession()) {
            return session.get(Complaint.class, complaintId);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

	public List<Complaint> getAllComplaints() {
		
		List<Complaint> complaints = null;
        Transaction transaction = null;

		try(Session session = HibernateUtils.getSession()) {
			
		    transaction = session.beginTransaction();
			
			Query<Complaint> query = session.createQuery("FROM Complaint ORDER BY complaintId DESC"
					,Complaint.class);
			
			complaints = query.getResultList();
			
			transaction.commit();
		} catch (Exception e) {
			if(transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		return complaints;
	}

	public boolean updateComplaintStatus(int  complaintId, String newStatus) {
		  Transaction tx = null;
		    try (Session session = HibernateUtils.getSession()) {
		        tx = session.beginTransaction();

		        // Fetch the complaint entity from DB
		        Complaint complaint = session.get(Complaint.class, complaintId);

		        if (complaint != null) {
		            // ✅ Update only the status
		            complaint.setStatus(newStatus);

		            session.update(complaint);
		            tx.commit();
		            return true;
		        } else {
		            System.out.println("Complaint not found with ID: " + complaintId);
		            return false;
		        }

		    } catch (Exception e) {
		        if (tx != null) {
		            tx.rollback();
		        }
		        e.printStackTrace();
		    }
		    return false;
	}
}
