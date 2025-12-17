<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin DashBoard</title>
</head>
<body style = "
            background-color: #1E3A8A; /* Deep blue */
            color: white;
            font-family: 'Segoe UI', Tahoma, sans-serif;
            margin: 0;
            padding: 0;
        ">

	<h1 style = "text-align: center;">Hello, ${sessionScope.resident.userName}!</h1>
	<h2 style = "text-align: center;"> Welcome To Admin DashBoard</h2>
	
	<ul>
	
		<li><a href ="viewComplaints">View All Complaints</a></li>
		<li><a href ="index.jsp">Logout</a></li>
		
	</ul>
	
	
</body>
</html>