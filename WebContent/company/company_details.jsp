<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Company Details</title>
</head>
<body>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
String c_name=request.getParameter("company_name"); 
String c_email=request.getParameter("company_email");
String c_pass=request.getParameter("c_password");
String cc_pass=request.getParameter("cc_password");
String c_website=request.getParameter("company_website");
String c_address=request.getParameter("company_address");
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demo","root","chirag"); 
Statement st= con.createStatement(); 
ResultSet rs; 
int i=st.executeUpdate("insert into temporary values ('"+c_name+"','"+c_email+"','"+c_pass+"','"+cc_pass+"','"+c_website+"','"+c_address+"')"); 
%>
<h1>Your request has been submitted successfully...</h1>
<a href="company_login.jsp">Click here to login</a>
</body>
</html>