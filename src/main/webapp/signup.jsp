<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body style ="background-color: #ADD8E6";>
  <h1 style = "text-align : center; color : blue">Welcome To SignUp </h1>
  
  <h3>SignUp</h3>

<form action = "${pageContext.request.contextPath}/signup" method ="post" style ="margin-left: 20px">

	 UserName : <input type="text" name ="username" id ="username"><br><br>
	 Password : <input type="password" name ="password" id ="password"><br><br>
	 Email : <input type="email" name ="email" id ="email"><br><br>
	 PhoneNum : <input type="text" name ="phone" id ="phone"><br><br>
	   
	 Role :  <input type="radio" name="role" value="admin" required> Admin
	 		 <input type="radio" name="role" value="resident" required> Resident  <br><br>

       <input type="submit" value="Sign Up">

<p>Are you an Existing User ? <a href ="index.jsp">Login</a> </p>


</form>
 
</body>
</html>