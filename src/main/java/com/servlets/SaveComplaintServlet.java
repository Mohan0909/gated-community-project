package com.servlets;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.Dao.ComplaintDao;
import com.entity.Complaint;

@WebServlet("/complaintServlet")
@MultipartConfig(
	    fileSizeThreshold = 1024 * 1024,  // 1 MB
	    maxFileSize = 5 * 1024 * 1024,    // 5 MB
	    maxRequestSize = 10 * 1024 * 1024 // 10 MB
	)
public class SaveComplaintServlet extends HttpServlet {
		
	 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		    
	        // Add debug logging
	        System.out.println("=== COMPLAINTSERVLET CALLED ===");
	        
	        // Get residentId from session instead of parameter (more reliable)
	        HttpSession session = request.getSession();
	        Integer residentId = (Integer) session.getAttribute("residentId");
	        
	        // Fallback to parameter if session is null
	        if (residentId == null) {
	            try {
	                residentId = Integer.parseInt(request.getParameter("residentId"));
	                System.out.println("Got residentId from parameter: " + residentId);
	            } catch (NumberFormatException e) {
	                System.out.println("❌ ERROR: No residentId found in session or parameter!");
	                response.sendRedirect("login.jsp");
	                return;
	            }
	        }
	        
	        String category = request.getParameter("category");
	        String subject = request.getParameter("subject");
	        String description = request.getParameter("description");
	        String imagePath = null;

	        // Handle file upload
	        Part filePart = request.getPart("image");
	        if (filePart != null && filePart.getSize() > 0) {
	            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

	            // Directory to save uploaded files
	            String uploadDir = getServletContext().getRealPath("") + File.separator + "uploads";
	            File uploadFolder = new File(uploadDir);
	            if (!uploadFolder.exists()) {
	                uploadFolder.mkdir();
	            }

	            // Save file to server
	            filePart.write(uploadDir + File.separator + fileName);

	            // Save relative path in DB
	            imagePath = "uploads/" + fileName;
	        }
	        
	        System.out.println("Submitting complaint - Resident: " + residentId + 
	                          ", Category: " + category + ", Subject: " + subject);

	        Complaint complaint = new Complaint();
	        
	        complaint.setResidentId(residentId);
	        complaint.setCategory(category);
	        complaint.setSubject(subject);
	        complaint.setDescription(description);
	        complaint.setStatus("Pending");
	        complaint.setImagePath(imagePath);
	      
	        
	        ComplaintDao dao = new ComplaintDao();
	        Boolean isSaved = dao.saveComplaint(complaint);
	        
	        if (isSaved) {
	            System.out.println("✅ Complaint saved successfully! Redirecting to viewComplaints...");
	            
	            // ✅ IMPORTANT: Use redirect, NOT forward
	            // This will call the ViewComplaintsServlet which will load fresh data
	            response.sendRedirect("viewComplaints");
	            
	        } else {
	            System.out.println("❌ Failed to save complaint");
	            request.setAttribute("error", "Failed to submit complaint! Please try again.");
	            request.getRequestDispatcher("complaint-form.jsp").forward(request, response);
	        }
	    }
	
	
	
	
	
	
	
	
	
	
	
	
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//	
//	int residentId = Integer.parseInt(request.getParameter("residentId"));
//	String category = request.getParameter("category");
//	String subject = request.getParameter("subject");
//	String description = request.getParameter("description");
//	String status = request.getParameter("status");
//	
//	Complaint complaint = new Complaint();
//	
//	complaint.setResidentId(residentId);
//	complaint.setCategory(category);
//	complaint.setSubject(subject);
//	complaint.setDescription(description);
//	complaint.setStatus("Pending"); // ✅ set default status
//	
//	
//	ComplaintDao dao = new ComplaintDao();
//	Boolean isSaved = dao.saveComplaint(complaint);
//	
//	if (isSaved) {
//        // ✅ Fetch updated complaints list
//        List<Complaint> complaints = dao.getComplaintsByResidentId(residentId);
//        request.setAttribute("complaints", complaints);
//
//        // Forward to JSP to display all complaints
//        response.sendRedirect("viewComplaints");
//    } else {
//        // fallback if save failed
//        request.setAttribute("error", "Failed to submit complaint!");
//        request.getRequestDispatcher("view-My-Complaint.jsp").forward(request, response);
//    }
//	
// }
	

}
