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
PreparedStatement ps2 = null;
ResultSet resultSet = null;
ResultSet resultSet2 = null;
%>
<%
	String email = request.getParameter("candidateemail"); 
	String job_title = request.getParameter("jobtitle");	
	String c_email = (String) session.getAttribute("c_email");	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
String sql = "select company_name from company where company_email = ?";
String sql2 = "delete from applied_jobs where seeker_email = ? and job_title = ? and company = ?";
ps=connection.prepareStatement(sql);
ps.setString(1, c_email);
resultSet = ps.executeQuery();
resultSet.next();
ps2=connection.prepareStatement(sql2);
ps2.setString(1, email);
ps2.setString(2, job_title);
ps2.setString(3, resultSet.getString("company_name"));
int i = ps2.executeUpdate();
if(i > 0){
	out.println("<h1>Rejected !!</h1>");
	out.println("<a href = 'applicants.jsp'>View other candidates</a>");
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</body>
</html>