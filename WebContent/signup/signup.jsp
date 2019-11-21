<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC ">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration</title>
</head>
<body>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
String fname=request.getParameter("first"); 
String lname=request.getParameter("last");
String user=request.getParameter("username");
String email=request.getParameter("email");
String contact=request.getParameter("contact");
String gender=request.getParameter("gender");
String pwd=request.getParameter("password");   
String cpwd=request.getParameter("confirm_password");   
Blob resume = null;

Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demo","root","chirag"); 
Statement st= con.createStatement(); 
ResultSet rs; 
int i=st.executeUpdate("insert into signup values ('"+fname+"','"+lname+"','"+user+"','"+email+"','"+contact+"','"+gender+"','"+pwd+"','"+cpwd+"','"+resume+"')"); 
%>
<h1>Successfully Registered !!</h1>
<a href = "../Login_page/login.html">Click here to Login</a>
</body>
</html>