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
	String pass = request.getParameter("pass");
	String firstname=request.getParameter("firstname");
	String lastname=request.getParameter("lastname");
	String contact=request.getParameter("contact");
	String username=request.getParameter("username");
%>
<%
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
String sql ="select * from signup where email = ?";
ps = connection.prepareStatement(sql);
ps.setString(1,email);
resultSet = ps.executeQuery();
resultSet.next();

if((resultSet.getString("password").equals(pass))){
	String sqlupdate="Update signup set username=?,first=?,last=?,contact=? where email = ?" ;
	ps = connection.prepareStatement(sqlupdate);	
	ps.setString(1,username);
	ps.setString(2,firstname);
	ps.setString(3,lastname);
	ps.setString(4,contact);
	ps.setString(5,email);
	int i = ps.executeUpdate();
	if(i > 0){
%> <h1>Your Profile has been Updated Successfully!</h1><% 
	}else{
		System.out.println("Could not Update");
	}	
}
else{
	response.sendRedirect("user_profile.jsp");
    }
%>
