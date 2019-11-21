<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>  
<%@page import="java.io.*" %>
<%@ page trimDirectiveWhitespaces="true" %>
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
%>
<%
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
String sql ="select resume from signup where email = ?";
ps = connection.prepareStatement(sql);
ps.setString(1,email);
resultSet = ps.executeQuery();
while(resultSet.next()){
	byte [] resumeBytes = resultSet.getBytes("resume");

%>
<!DOCTYPE html>
<html>
<head>
<title>Your Resume</title>
</head>
<body>
<%
	DataOutput dataOutput = new DataOutputStream(response.getOutputStream());	
	for(int i = 0; i < resumeBytes.length; i++){
	response.setContentType("application/pdf");
	dataOutput.write(resumeBytes[i]);	
	}
	

}	//response.getOutputStream().flush();
	//response.getOutputStream().close();
%>
</body>
</html>