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
	String email = (String) session.getAttribute("email"); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Profile</title>
</head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<br>
<h2> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Applied Jobs</h2><br>

<div class="container">
	<div class="row">
		<div class="col-md-3 ">
		     <div class="list-group ">
		      <a href="user.jsp" class="list-group-item list-group-item-action">Home</a>
              <a href="user_profile.jsp" class="list-group-item list-group-item-action">My Profile</a>
              <a href="user_applied_jobs.jsp" class="list-group-item list-group-item-action active">Applied Jobs</a>
              <a href="resume.jsp" class="list-group-item list-group-item-action">Resume</a>
              <a href="change_password.jsp" class="list-group-item list-group-item-action">Change Password</a>
              <a href="../../Login_page/logout.jsp" class="list-group-item list-group-item-action">Logout</a>
             </div> 
	    </div>
		<div class="col-md-9">
		    <div class="card">
		        <div class="card-body">
		            <div class="row">
		                <div class="col-md-12">
		                    <h4>Job Role &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Company&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Status</h4> 
		                    <hr>
		                </div>
		            </div>
<% 
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
String sql ="select job_title,company,status from applied_jobs where seeker_email = ?";
ps = connection.prepareStatement(sql);
ps.setString(1,email);
resultSet = ps.executeQuery();
while(resultSet.next()){
%>					
		            <div class="row">
		                <div class="col-md-9"> 
                              <div class="form-group row">
                                <h4 class="col-4 col-form-label"><%=resultSet.getString("job_title")%></h4>
                                <div class="col-8">
                                <h6 class="col-4 col-form-label">&nbsp;<%=resultSet.getString("company") %></h6>
                                </div>
                                <div class="col-8">
                                <h6 style="position:absolute; left:400px; bottom:0px;" class="col-4 col-form-label">&nbsp;<%=resultSet.getString("status")%></h6>
                                </div>
                                
                              </div>
                         </div>
                   	</div>
                   	
                              
                               
<% 
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
		            
		        </div>
		    </div>
		</div>
	</div>
</div>
</html>