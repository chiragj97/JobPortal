<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date" %>
<%@page import="java.sql.PreparedStatement"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
PreparedStatement ps = null;
String c_email = (String) session.getAttribute("c_email");
String job_title = request.getParameter("jobtitle"); 
String company = request.getParameter("company_name");
String str = request.getParameter("job_type");
String location = request.getParameter("job_location");
String jd = request.getParameter("job_description");
String str_from = request.getParameter("experience_from");
String str_to = request.getParameter("experience_to");
String salary = request.getParameter("salary");
String vacancies = request.getParameter("vacancies");
String apply_before = request.getParameter("apply_before");
String responsibilities = request.getParameter("responsibilities");
String job_type;
String experience_from;
String experience_to;
String experience;

if(str_from.equals("0")){
	experience_from = "0";
}
else if(str_from.equals("1")){
	experience_from = "1";
}
else if(str_from.equals("2")){
	experience_from = "2";
}
else if(str_from.equals("3")){
	experience_from = "3";
}
else if(str_from.equals("4")){
	experience_from = "4";
}
else if(str_from.equals("5")){
	experience_from = "5";
}
else if(str_from.equals("6")){
	experience_from = "6";
}
else{
	experience_from = "7";
}

 
if(str_to.equals("1")){
	experience_to = "1";
}
else if(str_to.equals("2")){
	experience_to = "2";
}
else if(str_to.equals("3")){
	experience_to = "3";
}
else if(str_to.equals("4")){
	experience_to = "4";
}
else if(str_to.equals("5")){
	experience_to = "5";
}
else if(str_to.equals("6")){
	experience_to = "6";
}
else{
	experience_to = "7";
}

experience = experience_from +" to "+ experience_to;

if(str.equals("fulltime")){
	job_type = "Full time";
}
else if(str.equals("part_time")){
	job_type = "Part time";
}
else if(str.equals("freelance")){
	job_type = "Freelance";
}
else if(str.equals("internship")){
	job_type = "Internship";
}
else {
	job_type = "Temporary";
}

DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd");
LocalDate localDate = LocalDate.now();
String today = dtf.format(localDate);

Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demo","root","chirag"); 
String sql = "insert into job_posts (job_title,company,job_type,location,job_description,experience,salary,responsibilities,vacancies,job_post_date,job_post_end) values(?,?,?,?,?,?,?,?,?,?,?)";
ps = con.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
ps.setString(1,job_title);
ps.setString(2,company);
ps.setString(3,job_type);
ps.setString(4,location);
ps.setString(5,jd);
ps.setString(6,experience);
ps.setString(7,salary);
ps.setString(8,responsibilities);
ps.setString(9,vacancies);
ps.setString(10,today);
ps.setString(11,apply_before);
ps.executeUpdate();
%>
<h1>Your Job has been posted Successfully !!</h1>
</body>
</html>