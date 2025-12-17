package com.servlets;

import java.io.IOException;
import java.util.List;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Dao.ComplaintDao;
import com.entity.Complaint;

@WebServlet("/residentSolvedComplaints")
public class ResidentSolvedComplaints extends HttpServlet{
	
	 private static final Logger logger = Logger.getLogger(ResidentSolvedComplaints.class.getName());

	
	 protected void doGet(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	
	        HttpSession session = request.getSession();
	        
	        if(session == null | session.getAttribute("residentId") == null) 
	        {
	        	response.sendRedirect("login.jsp");
	        	return ;
	        }
	        
	        int residentId = (int) session.getAttribute("residentId"); 
	        
	        ComplaintDao dao = new ComplaintDao();
	        
	       List<Complaint> solvedComplaints = dao.getSolvedComplaints(residentId);
	       
	       logger.info("Number of solved complaints retrieved: " + solvedComplaints.size());
	       
	       request.setAttribute("solvedComplaints", solvedComplaints);
	     
	       
	       request.getRequestDispatcher("myResolvedComplaints.jsp").forward(request, response);
	 }
	 
	 
	  protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        doGet(request, response);
	    }

}
