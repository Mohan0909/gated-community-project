package com.servlets;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Dao.ResidentDao;
import com.entity.Resident;



@WebServlet("/signup")
public class SignupServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			String userName = request.getParameter("username");
			String password = request.getParameter("password");
			String email = request.getParameter("email");
			String phone = request.getParameter("phone");
			String role = request.getParameter("role");
			                    
			Resident resident = new Resident();
			
			resident.setUserName(userName);
			resident.setPassword(password);
			resident.setEmail(email);
			resident.setPhone(phone);
			resident.setRole(role);
			
			
			ResidentDao dao = new ResidentDao();
			
			boolean success = dao.saveResident(resident);
			
			if(success) {
				 response.sendRedirect("index.jsp"); // login page
			} else {
			    request.getRequestDispatcher("signup.jsp").forward(request, response);
			}
		}

}