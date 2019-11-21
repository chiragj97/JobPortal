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
<!DOCTYPE html>
<html>
<head>
 <title>JobPortal</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Nunito+Sans:200,300,400,600,700,800,900" rel="stylesheet">

    <link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="css/animate.css">
    
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">
    <link rel="stylesheet" href="css/magnific-popup.css">

    <link rel="stylesheet" href="css/aos.css">

    <link rel="stylesheet" href="css/ionicons.min.css">

    <link rel="stylesheet" href="css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="css/jquery.timepicker.css">

    
    <link rel="stylesheet" href="css/flaticon.css">
    <link rel="stylesheet" href="css/icomoon.css">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<h1 align = "center">Jobs</h1>
<%
String job_title = request.getParameter("job_title");
String job_type = request.getParameter("job_type");
String location = request.getParameter("location");
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
String sql ="select * from job_posts where job_title = ? and job_type = ? or location = ?";
ps = connection.prepareStatement(sql);
ps.setString(1,job_title);
ps.setString(2,job_type);
ps.setString(3,location);
resultSet = ps.executeQuery();
while(resultSet.next()){
%>

<div class="row">
		<div class="fixed-rectangle">
		  <div class="col-md-12 ftco-animate">
            <div class="job-post-item bg-white p-4 d-block d-md-flex align-items-center">
              <div class="mb-4 mb-md-0 mr-5">
                <div class="job-post-item-header d-flex align-items-center">
                  <h2 class="mr-3 text-black h3"><%=resultSet.getString("job_title") %></h2>
                  <div class="badge-wrap">
                   <span class="bg-primary text-white badge py-2 px-3"><%=resultSet.getString("job_type") %></span>
                  </div>
                </div>
                <div class="job-post-item-body d-block d-md-flex">
                  <div class="mr-3"><span class="icon-layers"></span> <a href="#"><%=resultSet.getString("company") %></a></div>
                  <div><span class="icon-my_location"></span> <span><%=resultSet.getString("location") %></span></div>
                </div>
              </div>
              
              <div class="ml-auto d-flex">
                <a href="../../Login_page/login.html" class="btn btn-primary py-2 mr-1">Apply Job</a>
                
              </div>
            </div>
            </div>
          </div><!-- end -->
</div>
          
<% 
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
		<div class="row mt-5">
          <div class="col text-center">
            <div class="block-27">
              <ul>
                <li><a href="#">&lt;</a></li>
                <li class="active"><span>1</span></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#">5</a></li>
                <li><a href="#">&gt;</a></li>
              </ul>
            </div>
          </div>
        </div>

</body>
</html>



