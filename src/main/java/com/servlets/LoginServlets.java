package com.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Dao.ResidentDao;
import com.entity.Resident;

@WebServlet("/login")
public class LoginServlets extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userName = request.getParameter("username");
		String password = request.getParameter("password");
		
		
		ResidentDao dao = new ResidentDao();
		
		Resident resident = dao.getResidentByUsernameAndPassword(userName, password);
		
		if(resident != null) {
			
			//store user session
			request.getSession().setAttribute("resident", resident);
			request.getSession().setAttribute("role", resident.getRole());
			request.getSession().setAttribute("userName", resident.getUserName());
			request.getSession().setAttribute("residentId", resident.getResidentId());  // important
			
			//redirect page based on role			
			if("Admin".equalsIgnoreCase(resident.getRole())) {
				
				response.sendRedirect("admin-dashboard.jsp"); // Admin page
				
			} else if("Resident".equalsIgnoreCase(resident.getRole())){
				
				response.sendRedirect("resident-dashboard.jsp"); // User page
				
			} else {
				
				// fallback if role unknown
                response.sendRedirect("login.jsp");
                
			}
			
		} else {
			 request.setAttribute("error", "Invalid username or password");
	            request.getRequestDispatcher("login.jsp").forward(request, response);
		}
			
	}
		

}
