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
<div class="container">
	<div class="row">
		<div class="col-md-3 ">
		     <div class="list-group ">
		      <a href="user.jsp" class="list-group-item list-group-item-action">Home</a>
              <a href="user_profile.jsp" class="list-group-item list-group-item-action active">My Profile</a>
              <a href="user_applied_jobs.jsp" class="list-group-item list-group-item-action">Applied Jobs</a>
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
		                    <h4>Your Profile</h4>
		                    <hr>
		                </div>
		            </div>
<% 
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
String sql ="select * from signup where email = ?";
ps = connection.prepareStatement(sql);
ps.setString(1,email);
resultSet = ps.executeQuery();
while(resultSet.next()){
%>
		            <div class="row">
		                <div class="col-md-12"> 
		                    <form action = "user_profile_update.jsp" method = "post">
                              <div class="form-group row">
                                <h3 for="username" class="col-4 col-form-label">User Name</h3> 
                                <div class="col-8">
                                  <input id="username" name="username" placeholder="Username" value="<%=resultSet.getString("username")%>" class="form-control here" required="required" type="text">
                                </div>
                              </div>
                              <div class="form-group row">
                                <h3 for="name" class="col-4 col-form-label">First Name</h3> 
                                <div class="col-8">
                                  <input id="name" name="firstname" placeholder="First Name" value="<%=resultSet.getString("first")%>" class="form-control here" type="text">
                                </div>
                              </div>
                              <div class="form-group row">
                                <h3 for="lastname" class="col-4 col-form-label">Last Name</h3> 
                                <div class="col-8">
                                  <input id="lastname" name="lastname" placeholder="Last Name" value="<%=resultSet.getString("last")%>" class="form-control here" type="text">
                                </div>
                              </div>
                              
                              <div class="form-group row">
                                <h3 for="email" class="col-4 col-form-label">Email</h3> 
                                <div class="col-8">
                                  <input id="email" name="email" placeholder="Email" value="<%=resultSet.getString("email")%>" class="form-control here" type="text" readonly/>
                                </div>
                              </div>
							
							 <div class="form-group row">
                                <h3 for="contact" class="col-4 col-form-label">Contact Detail</h3> 
                                <div class="col-8">
                                  <input id="contact" name="contact" placeholder="Contact Detail" value="<%=resultSet.getString("contact")%>" class="form-control here" type="text">
                                </div>
                              </div>
							  
							  <div class="form-group row">
                                <h3 for="oldpass" class="col-4 col-form-label">Password</h3> 
                                <div class="col-8">
                                  <input id="pass" name="pass" placeholder="Password" class="form-control here" type="password">
                                </div>
                              </div>
                               
<% 
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
                              <div class="form-group row">
                                <div class="offset-4 col-8">
                                   <button name="submit" type="submit" class="btn btn-primary">Update My Profile</button>
                                </div>
                              </div>
                            </form>
		                </div>
		            </div>
		            
		        </div>
		    </div>
		</div>
	</div>
</div>
</html>