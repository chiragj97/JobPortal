<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<
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
String c_name=request.getParameter("c_name"); 
String comp_email=request.getParameter("comp_email");
String c_pass=request.getParameter("c_pass");
String cc_pass=request.getParameter("cc_pass");
String c_website=request.getParameter("c_website");
String c_address=request.getParameter("c_address");
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demo","root","chirag"); 
Statement st= con.createStatement(); 
ResultSet rs; 
String sql = "delete from temporary where company_email = ?";
PreparedStatement st1 = con.prepareStatement(sql);
st1.setString(1,comp_email);
st1.executeUpdate();
int i=st.executeUpdate("insert into company values ('"+c_name+"','"+comp_email+"','"+c_pass+"','"+cc_pass+"','"+c_website+"','"+c_address+"')"); 
%>
<h1>Your have been registered to the portal successfully...</h1>
</body>
</html>