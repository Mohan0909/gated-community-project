<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Resident Dashboard</title>

<style>
    .welcome-section {
        text-align: center;
        margin-bottom: 30px;
        padding: 20px;
        background: rgba(255, 255, 255, 0.1);
        border-radius: 10px;
        margin: 20px auto;
        width: 80%;
        max-width: 500px;
    }
    
    .welcome-section h1 {
        color: #4ADE80; /* Green color for the name */
        margin: 0;
        font-size: 2.5em;
    }
    
    .welcome-section p {
        margin: 10px 0 0 0;
        opacity: 0.9;
        font-size: 1.1em;
    }

    ul {
        margin: 20px auto;
        width: 300px;
        padding: 0;
        list-style: none;
    }

    ul li {
        margin: 15px 0; /* Spacing between list items */
    }
    
    ul li a {
        color: white; /* Link font color */
        text-decoration: none; /* Remove underline */
        font-size: 18px;
        display: block;
        padding: 15px;
        border-radius: 5px;
        transition: background 0.3s;
        background: rgba(255, 255, 255, 0.1);
        border: 1px solid rgba(255, 255, 255, 0.2);
        text-align: center;
    }
    
    ul li a:hover {
        background: rgba(255, 255, 255, 0.2);
        transform: translateY(-2px);
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.3);
    }
    
    .user-info {
        text-align: center;
        margin: 10px auto;
        color: #E5E7EB;
        font-size: 14px;
        opacity: 0.8;
    }

</style>

</head>
<body style="
            background-color: #1E3A8A; /* Deep blue */
            color: white;
            font-family: 'Segoe UI', Tahoma, sans-serif;
            margin: 0;
            padding: 0;
            min-height: 100vh;
        ">

    <!-- Welcome Section with User's Name -->
    <div class="welcome-section">
        <h1>Hello, ${sessionScope.resident.userName}!</h1>
        <p>Welcome to your Resident Dashboard</p>
    </div>
    
    <!-- User Info -->
    <div class="user-info">
        <p>Resident ID: ${sessionScope.residentId} | Email: ${sessionScope.resident.email}</p>
    </div>

    <!-- Navigation Menu -->
    <ul>
        <li><a href="raise-complaint.jsp">📝 Raise Complaint</a></li>
        <li><a href="viewComplaints">📋 View My Complaints</a></li>
        <li><a href="residentSolvedComplaints">✅ Resolved Complaints</a></li>
        
    </ul>

</body>
</html>