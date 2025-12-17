<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Complaints</title>
<style>
    /* General styling */
    body {
        background: linear-gradient(to right, #E3F2FD, #BBDEFB);
        font-family: 'Segoe UI', Tahoma, sans-serif;
        margin: 0;
        padding: 0;
        display: flex;
        flex-direction: column;
        align-items: center;
        min-height: 100vh;
    }

    h1 {
        margin: 40px 0 20px 0;
        color: #1565C0;
        text-align: center;
        animation: fadeInDown 1s ease;
    }

    /* Table styling */
    table {
        width: 80%;
        border-collapse: collapse;
        background-color: #ffffff;
        box-shadow: 0 8px 16px rgba(0,0,0,0.2);
        animation: fadeInUp 1s ease;
    }

    th, td {
        border: 1px solid #ccc;
        padding: 12px 15px;
        text-align: center;
        transition: transform 0.3s;
    }

    th {
        background-color: #1976D2;
        color: white;
    }

    tr:hover td {
        transform: scale(1.02);
        background-color: #E3F2FD;
    }

    /* Animations */
    @keyframes fadeInDown {
        from {opacity: 0; transform: translateY(-50px);}
        to {opacity: 1; transform: translateY(0);}
    }

    @keyframes fadeInUp {
        from {opacity: 0; transform: translateY(50px);}
        to {opacity: 1; transform: translateY(0);}
    }

    /* No complaints message */
    .no-complaints {
        margin-top: 50px;
        color: #D32F2F;
        font-size: 1.2em;
        animation: fadeIn 1.5s ease;
    }

    @keyframes fadeIn {
        from {opacity: 0;}
        to {opacity: 1;}
    }
    .edit-btn { 
        background: #4CAF50; 
        color: white; 
        padding: 5px 10px; 
        text-decoration: none; 
        border-radius: 3px;
        display: inline-block;
    }
    .cancel-btn { 
        background: #f44336; 
        color: white; 
        padding: 5px 10px; 
        text-decoration: none; 
        border-radius: 3px;
        display: inline-block;
        margin-left: 5px;
    }
    .edit-btn:hover { background: #45a049; }
    .cancel-btn:hover { background: #da190b; }
</style>
</head>
<body>

<h1>My Complaints</h1>

<c:choose>
    <c:when test="${not empty complaints}">
        <table>
            <tr>
                <th>Complaint ID</th>
                <th>Category</th>
                <th>Subject</th>
                <th>Description</th>
                <th>Status</th>
                 <th>Image</th> <!-- ✅ NEW COLUMN -->
                <th>Actions</th>
                
            </tr>
          <c:forEach var="c" items="${complaints}">
    <c:choose>
        <c:when test="${c.status == 'Pending'}">
            <c:set var="statusColor" value="#F57C00"/>
        </c:when>
        <c:when test="${c.status == 'Resolved'}">
            <c:set var="statusColor" value="#388E3C"/>
        </c:when>
        <c:otherwise>
            <c:set var="statusColor" value="#1976D2"/>
        </c:otherwise>
    </c:choose>

    <tr>
        <td>${c.complaintId}</td>
        <td>${c.category}</td>
        <td>${c.subject}</td>
        <td>${c.description}</td>
        <td>
            <span style="color: ${statusColor};">${c.status}</span>
        </td>
        
        <!-- ✅ Image Cell -->
                    <td>
                        <c:choose>
                            <c:when test="${not empty c.imagePath}">
                                <img src="${pageContext.request.contextPath}/${c.imagePath}" 
                                     alt="Complaint Image" width="100" height="100">
                            </c:when>
                            <c:otherwise>
                                <span style="color:#888;">No Image</span>
                            </c:otherwise>
                        </c:choose>
                    </td>
        <td>
            <a href="${pageContext.request.contextPath}/loadUpdateComplaint?complaintId=${c.complaintId}" class="edit-btn">Edit</a>
            <a href="cancelComplaint?complaintId=${c.complaintId}" class="cancel-btn" 
             onclick="return confirm('Are you sure you want to cancel this complaint?')">Cancel</a>
        </td>
    </tr>
</c:forEach>
        </table>
    </c:when>
    <c:otherwise>
        <div class="no-complaints">No complaints found.</div>
    </c:otherwise>
</c:choose>

</body>
</html>