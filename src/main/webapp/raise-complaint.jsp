<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Raise Complaint</title>
<style>
    body {
        background-color: #E0F7FA;
        font-family: 'Segoe UI', Tahoma, sans-serif;
        margin: 0;
        padding: 0;
    }
    h1 {
        text-align: center;
        color: #006064;
    }
    form {
        width: 50%;
        margin: auto;
        background: #fff;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }
    label {
        font-weight: bold;
    }
    input[type=text], textarea, select {
        width: 100%;
        padding: 8px;
        margin: 8px 0 15px 0;
        border: 1px solid #ccc;
        border-radius: 5px;
    }
    input[type=submit] {
        background-color: #00796B;
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }
    input[type=submit]:hover {
        background-color: #004D40;
    }
</style>
</head>
<body>

<h1>Raise a Complaint</h1>


<form action="${pageContext.request.contextPath}/complaintServlet" method="post"enctype="multipart/form-data">
    
    <!-- ✅ hidden resident ID (automatically from session) -->
    <input type="hidden" name="residentId" value="${sessionScope.residentId}">
    
    <label for="category">Complaint Category:</label>
    <ul style="list-style:none; padding-left:0;">
        <li><input type="radio" name="category" value="Maintenance" required> Maintenance</li>
        <li><input type="radio" name="category" value="Water Supply"> Water Supply</li>
        <li><input type="radio" name="category" value="Electricity"> Electricity</li>
        <li><input type="radio" name="category" value="Security"> Security</li>
        <li><input type="radio" name="category" value="Cleanliness"> Cleanliness</li>
        <li><input type="radio" name="category" value="Parking"> Parking</li>
    </ul>

    <label for="subject">Subject:</label>
    <input type="text" name="subject" placeholder="Short title of your complaint" required>

    <label for="description">Description:</label>
    <textarea name="description" rows="5" placeholder="Describe your complaint in detail..." required></textarea>

 <!-- 🖼️ New: Image Upload Field -->
    <label for="image">Attach Image (optional):</label>
    <input type="file" name="image" accept="image/*">	

    <input type="submit" value="Submit Complaint">
</form>

</body>
</html>