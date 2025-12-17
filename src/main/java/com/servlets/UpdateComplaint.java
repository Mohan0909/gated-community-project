package com.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;

import com.Dao.ComplaintDao;
import com.entity.Complaint;

@WebServlet("/updateComplaint")
public class UpdateComplaint extends HttpServlet{
	
	 protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {

	        HttpSession session = request.getSession(false);
	        String role = (String) session.getAttribute("role");

	        int complaintId = Integer.parseInt(request.getParameter("complaintId"));
	        ComplaintDao dao = new ComplaintDao();
	        boolean updated = false;

	        try {
	            if ("admin".equalsIgnoreCase(role)) {
	                // Admin updates only status
	                String status = request.getParameter("status");
	                updated = dao.updateComplaintStatus(complaintId, status);

	            } else if ("resident".equalsIgnoreCase(role)) {
	                // Resident updates other fields
	                String category = request.getParameter("category");
	                String subject = request.getParameter("subject");
	                String description = request.getParameter("description");

	                Complaint complaint = dao.getComplaintById(complaintId);
	                complaint.setCategory(category);
	                complaint.setSubject(subject);
	                complaint.setDescription(description);
	                updated = dao.updateComplaint(complaint);
	            }

	            if (updated) {
	                if ("admin".equalsIgnoreCase(role)) {
	                    response.sendRedirect("viewComplaints");
	                } else {
	                    response.sendRedirect("viewComplaints");
	                }
	            } else {
	                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to update complaint.");
	            }

	        } catch (Exception e) {
	            e.printStackTrace();
	            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An unexpected error occurred.");
	        }
	    }
	}