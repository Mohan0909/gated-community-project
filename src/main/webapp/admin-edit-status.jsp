<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Complaint Status (Admin)</title>
<style>
    body {
        background: #e3f2fd;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }
    .container {
        background: white;
        padding: 30px 40px;
        border-radius: 10px;
        box-shadow: 0 4px 10px rgba(0,0,0,0.2);
        width: 400px;
        text-align: center;
    }
    h2 {
        color: #1565C0;
        margin-bottom: 20px;
    }
    label {
        display: block;
        margin-top: 15px;
        font-weight: bold;
        color: #333;
    }
    select {
        width: 100%;
        padding: 8px;
        border: 1px solid #90CAF9;
        border-radius: 5px;
        margin-top: 5px;
    }
    button {
        background-color: #1976D2;
        color: white;
        border: none;
        padding: 10px 20px;
        border-radius: 5px;
        margin-top: 20px;
        cursor: pointer;
    }
    button:hover {
        background-color: #0D47A1;
    }
    a {
        display: inline-block;
        margin-top: 10px;
        color: #1565C0;
        text-decoration: none;
    }
</style>
</head>
<body>
<div class="container">
    <h2>Update Complaint Status</h2>

    <form action="${pageContext.request.contextPath}/updateComplaint" method="Post">
        <!-- Hidden field to carry complaint ID -->
        <input type="hidden" name="complaintId" value="${complaint.complaintId}" />

        <p><strong>Category:</strong> ${complaint.category}</p>
        <p><strong>Subject:</strong> ${complaint.subject}</p>
        <p><strong>Description:</strong> ${complaint.description}</p>

        <label for="status">Status:</label>
        <select name="status" id="status">
            <option value="Pending" ${complaint.status == 'Pending' ? 'selected' : ''}>Pending</option>
            <option value="In Progress" ${complaint.status == 'In Progress' ? 'selected' : ''}>In Progress</option>
            <option value="Resolved" ${complaint.status == 'Resolved' ? 'selected' : ''}>Resolved</option>
        </select>

        <button type="submit">Update</button>
    </form>

    <a href="${pageContext.request.contextPath}/viewComplaints">⬅ Back to All Complaints</a>
</div>
</body>
</html>
