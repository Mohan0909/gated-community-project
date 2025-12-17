<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Solved Complaints</title>
</head>
<body>
	<h2>Solved complaints.</h2>
	
	<c:choose>
	
		<c:when test="${not empty solvedComplaints }">
		
		 <table border = "1">
		
			<tr>			
				<th>Complaint Id</th>
				<th>Resident Id</th>
				<th>Category</th>
				<th>Subject</th>
				<th>Description</th>
				<th>Status</th>				
			</tr>
			
			<c:forEach var = "c" items ="${solvedComplaints}">
			
				<tr>				
					<td>${c.complaintId}</td>
					<td>${c.residentId}</td>
					<td>${c.category}</td>
					<td>${c.subject}</td>
					<td>${c.description}</td>
					<td>${c.status}</td>
				
				</tr>
			
			</c:forEach>		
		</table>		
	 </c:when>
	 
	 <c:otherwise>
	 
	 	<p style = "text-align: center; color:red"> No Complaints Found</p>
	 
	 </c:otherwise>
	
	</c:choose>

</body>
</html>