<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Complaint</title>
<style>
    body { font-family: Arial; background: #f5f5f5; padding: 20px; }
    .form-container { background: white; padding: 20px; border-radius: 5px; max-width: 500px; margin: auto; }
    .form-group { margin-bottom: 15px; }
    label { display: block; margin-bottom: 5px; font-weight: bold; }
    input, textarea { width: 100%; padding: 8px; border: 1px solid #ddd; border-radius: 4px; }
    button { background: #007bff; color: white; padding: 10px 20px; border: none; border-radius: 4px; cursor: pointer; margin-right: 10px; }
    button:hover { background: #0056b3; }
    .cancel-btn { background: #6c757d; }
    .cancel-btn:hover { background: #545b62; }
</style>
</head>
<body>

<div class="form-container">
    <h2>Update Complaint</h2>
    
    <form action="updateComplaint" method="post">
        <input type="hidden" name="complaintId" value="${complaint.complaintId}" />
        
        <div class="form-group">
            <label>Category:</label>
            <input type="text" name="category" value="${complaint.category}" required>
        </div>
        
        <div class="form-group">
            <label>Subject:</label>
            <input type="text" name="subject" value="${complaint.subject}" required>
        </div>
        
        <div class="form-group">
            <label>Description:</label>
            <textarea name="description" rows="5" required>${complaint.description}</textarea>
        </div>
        
        <div class="form-group">
            <label>Status:</label>
            <input type="text" value="${complaint.status}" readonly style="background:#f8f9fa;">
        </div>
        
        <button type="submit">Update Complaint</button>
        <a href="viewComplaints" class="cancel-btn" style="text-decoration:none; padding:10px 20px; background:#6c757d; color:white; border-radius:4px;">Cancel</a>
    </form>
</div>

</body>
</html>