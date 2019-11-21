<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>  
<%
String driver = "com.mysql.cj.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "demo";
String userid = "root";
String password = "chirag";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
PreparedStatement ps = null;
ResultSet resultSet = null;
%>
<%
  	String email = (String) session.getAttribute("email");
	String oldpass = request.getParameter("oldpass");
	String newpass=request.getParameter("newpass");
	String c_newpass=request.getParameter("c_newpass");
%>

<%
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
String sql ="select * from signup where email = ?";
ps = connection.prepareStatement(sql);
ps.setString(1,email);
resultSet = ps.executeQuery();
resultSet.next();

if((resultSet.getString("password").equals(oldpass))){
	if(newpass.equals(c_newpass)){
		String sqlupdate="Update signup set password = ?, cpassword = ? where email = ?" ;
		ps = connection.prepareStatement(sqlupdate);	
		ps.setString(1,newpass);
		ps.setString(2,newpass);
		ps.setString(3,email);
		int i = ps.executeUpdate();
		
		if(i > 0){
	%><h1> Your Password has been changed Successfully !!</h1> <% 
		}	
	}else{
		%><h1>New Password and Confirm Passwords did not matched !!</h1><% 
	}
	
}
else{
	%><h1>Incorrect Password Entered !!</h1><% 
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Password</title>
</head>
<body>
</body>
</html>