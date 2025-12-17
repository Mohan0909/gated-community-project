package com.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Dao.ComplaintDao;
import com.entity.Complaint;

@WebServlet("/loadUpdateComplaint")
public class LoadUpdateComplaint extends HttpServlet{

	 protected void doGet(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {

	        int complaintId = Integer.parseInt(request.getParameter("complaintId"));
	        HttpSession session = request.getSession(false);
	        String role = (String) session.getAttribute("role");

	        ComplaintDao dao = new ComplaintDao();
	        Complaint complaint = dao.getComplaintById(complaintId);

	        if (complaint == null) {
	            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Complaint not found.");
	            return;
	        }

	        request.setAttribute("complaint", complaint);

	        if ("admin".equalsIgnoreCase(role)) {
	            request.getRequestDispatcher("admin-edit-status.jsp").forward(request, response);
	        } else if ("resident".equalsIgnoreCase(role)) {
	            request.getRequestDispatcher("resident-edit-complaint.jsp").forward(request, response);
	        } else {
	            response.sendRedirect("login.jsp");
	        }
	    }
}
