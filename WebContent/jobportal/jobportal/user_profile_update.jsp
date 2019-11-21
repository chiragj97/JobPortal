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
	String email = (String)session.getAttribute("email");
	String username = request.getParameter("username");
	String firstname = request.getParameter("firstname");
	String lastname = request.getParameter("lastname");
	String contact = request.getParameter("contact");
	String pass = request.getParameter("pass");

%>
<% 
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
String sql ="select * from signup where email = ?";
ps = connection.prepareStatement(sql);
ps.setString(1,email);
resultSet = ps.executeQuery();
resultSet.next();

if((resultSet.getString("password").equals(pass))){
	String sqlupdate="Update signup set first = ?,last = ?,username = ?, contact = ? where email = ?" ;
	ps = connection.prepareStatement(sqlupdate);	
	ps.setString(1,firstname);
	ps.setString(2,lastname);
	ps.setString(3,username);
	ps.setString(4,contact);
	ps.setString(5,email);
	int i = ps.executeUpdate();
	
	if(i > 0){
		out.println("<h1>Profile Updated Successfully !!</h1>");
	}
	
}else{
	out.println("<h1>Incorrect Password</h1>");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

</body>
</html>