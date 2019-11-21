<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
	String email = (String) session.getAttribute("email");
	String job_title = (String) session.getAttribute("jobtitle");
	String company = (String) session.getAttribute("company");
	String status = "Applied";
	Class.forName("com.mysql.jdbc.Driver"); 
	java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demo","root","chirag"); 
	Statement st= con.createStatement(); 
	ResultSet rs; 
	try{
	int i=st.executeUpdate("insert into applied_jobs values ('"+email+"','"+job_title+"','"+company+"','"+status+"')"); 
	if(i > 0){
		out.println("<h1>Applied Successfully !!</h1>");
	}
	}catch(Exception e){
		out.println("<h1>You already applied for this job !!</h1>");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Applied Jobs</title>
</head>
<body>

<%
session.removeAttribute("job_title");
session.removeAttribute("company");
%>
<a href = "../jobportal/jobportal/user.jsp">Apply for more jobs</a>
</body>
</html>