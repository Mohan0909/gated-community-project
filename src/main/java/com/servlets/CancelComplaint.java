package com.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Dao.ComplaintDao;
import com.entity.Complaint;

@WebServlet("/cancelComplaint")
public class CancelComplaint extends HttpServlet {
	
	 protected void doGet(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {

	        try {
	            int complaintId = Integer.parseInt(request.getParameter("complaintId"));

	            ComplaintDao dao = new ComplaintDao();
	            Complaint complaint = dao.getComplaintById(complaintId);

	            if (complaint != null) {
	                // ✅ Only allow cancel if not already resolved or cancelled
	                if (!"Resolved".equalsIgnoreCase(complaint.getStatus()) &&
	                    !"Cancelled".equalsIgnoreCase(complaint.getStatus())) {

	                    complaint.setStatus("Cancelled");
	                    boolean isUpdated = dao.updateComplaint(complaint);

	                    if (isUpdated) {
	                        System.out.println("✅ Complaint cancelled successfully!");
	                        response.sendRedirect("viewComplaints");
	                        return;
	                    } else {
	                        request.setAttribute("error", "Failed to cancel complaint!");
	                    }
	                } else {
	                    request.setAttribute("error", "Cannot cancel resolved or already cancelled complaints!");
	                }
	            } else {
	                request.setAttribute("error", "Complaint not found!");
	            }

	            request.getRequestDispatcher("view-My-Complaint.jsp").forward(request, response);

	        } catch (Exception e) {
	            e.printStackTrace();
	            response.sendError(500, "Error while cancelling complaint");
	        }
	    }

}
