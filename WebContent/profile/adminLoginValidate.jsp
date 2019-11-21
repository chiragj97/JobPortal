<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%
	String adminUsername = request.getParameter("adminUsername");
	String adminPassword = request.getParameter("adminPassword");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	if((adminUsername.equals("admin")) && (adminPassword.equals("admin123"))){
		response.sendRedirect("admin.jsp");
	}else{
		response.sendRedirect("admin_login.jsp");
	}
	
%>
</body>
</html>