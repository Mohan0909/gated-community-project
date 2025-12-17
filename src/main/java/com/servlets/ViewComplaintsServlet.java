package com.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Dao.ComplaintDao;
import com.entity.Complaint;

@WebServlet("/viewComplaints")
public class ViewComplaintsServlet extends HttpServlet{

	 protected void doGet(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {

	      HttpSession session = request.getSession(false);
	      String role = (String) session.getAttribute("role");
	      Integer residentId = (Integer) session.getAttribute("residentId");

	      if (role == null) {
	            System.out.println("❌ No role found. Redirecting to login.");
	            response.sendRedirect("login.jsp");
	            return;
	        }
	      
	      ComplaintDao dao = new ComplaintDao();
	      List<Complaint> complaints = null;
	      String targetPage = "";
	      
	      try {
	    	  	  
	    	  	  if("admin".equalsIgnoreCase(role)) {
	    		  complaints = dao.getAllComplaints();
	    		  targetPage = "admin-complaints.jsp";
	    		  System.out.println("Admin viewing all complaints, total: " + complaints.size());
	    	  	  } 
	    	  	  
	    	  	  else if ("resident".equalsIgnoreCase(role)) {
	    	  		  // Resident sees only their own complaints
	    	  		  complaints = dao.getComplaintsByResidentId(residentId);
	    	  		  targetPage = "view-My-Complaint.jsp";
	    	  		  System.out.println("Resident viewing all complaints, total: " + complaints.size());
	    	  	  }
	    	  	  
	    	  	  	else {
	    	  	  	  System.out.println("❌ Invalid role or session expired.");
	                  response.sendRedirect("login.jsp");
	                  return;
	    	  	  	}
	    	  	  
	    	  	 // Pass complaints to JSP
	              request.setAttribute("complaints", complaints);

	              // Forward to correct JSP
	              request.getRequestDispatcher(targetPage).forward(request, response);

	          } catch (Exception e) {
	              e.printStackTrace();
	              response.sendError(500, "Error fetching complaints list");
	          }    	  	  
	    	  
	    }

	    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        doGet(request, response);
	    }
	
}
