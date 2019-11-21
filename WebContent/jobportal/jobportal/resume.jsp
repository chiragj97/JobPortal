<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>  
<%@ page import="java.io.*" %>
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

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Resume</title>
</head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<div class="container">
  <div class="row">
    <div class="col-md-3 ">
         <div class="list-group ">
         	  <a href="user.jsp" class="list-group-item list-group-item-action">Home</a>
              <a href="user_profile.jsp" class="list-group-item list-group-item-action">My Profile</a>
              <a href="user_applied_jobs.jsp" class="list-group-item list-group-item-action">Applied Jobs</a>
              <a href="resume.jsp" class="list-group-item list-group-item-action active">Resume</a>
              <a href="change_password.jsp" class="list-group-item list-group-item-action">Change Password</a>
              <a href="../../Login_page/logout.jsp" class="list-group-item list-group-item-action">Logout</a>
              
             </div> 
      </div>
    <div class="col-md-9">
        <div class="card">
            <div class="card-body">
                <div class="row">
                    <div class="col-md-12">
                        <h4>Your Resume</h4>
                        <hr>
                    </div>
                </div>

<%
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
String sql ="select resume from signup where email = ?";
ps = connection.prepareStatement(sql);
ps.setString(1,email);
resultSet = ps.executeQuery();
while(resultSet.next()){
	byte [] resumeBytes = resultSet.getBytes("resume");
	System.out.println(resumeBytes);
	if(resumeBytes == null){
%>
                <div class="row">
                    <div class="col-md-12"> 
                        <form action = "../../UploadResume" method = "post" enctype="multipart/form-data">
                              
                              <div class="form-group row">
                                <div class="offset-4 col-8">
                                <input name="resume" type="file">                                  
                                   <button name="submit" type="submit" class="btn btn-primary">Upload Resume</button>
                                </div>
                              </div>
                            </form>
                    </div>
                </div>
<% 
	}else{
		out.println("<form action='../../profile/view_resume.jsp' method='post'>");
		out.println("<button name='submit' type='submit' class='btn btn-primary'>View Resume</button>");
		out.println("</form><br/><br/><br/><br/>");
		out.println("<h4>Update Your Resume</h4>");
		out.println("<hr>");
		out.print("<form action = '../../UploadResume' method = 'post' enctype='multipart/form-data'>");
		out.print("<input name='resume' type='file'>");
		out.print("<button name='submit' type='submit' class='btn btn-primary'>Update Resume</button>");
		out.print("</form>");
		}	
}
%>
            </div>
        </div>
    </div>
  </div>
</div>
</html>