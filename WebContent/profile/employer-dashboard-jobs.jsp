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
	String c_email = (String) session.getAttribute("c_email");
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>Jobs</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">

    <!-- External Css -->
    <link rel="stylesheet" href="assets/css/fontawesome-all.min.css">
    <link rel="stylesheet" href="assets/css/themify-icons.css" />
    <link rel="stylesheet" href="assets/css/et-line.css" />
    <link rel="stylesheet" href="assets/css/bootstrap-select.min.css" />
    <link rel="stylesheet" href="assets/css/plyr.css" />
    <link rel="stylesheet" href="assets/css/flag.css" />
    <link rel="stylesheet" href="assets/css/slick.css" /> 
    <link rel="stylesheet" href="assets/css/owl.carousel.min.css" />
    <link rel="stylesheet" href="assets/css/jquery.nstSlider.min.css" />

    <!-- Custom Css -->
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <link rel="stylesheet" type="text/css" href="dashboard/css/dashboard.css">

    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Poppins:400,500,600%7CRoboto:300i,400,500" rel="stylesheet">

    <!-- Favicon -->
    <link rel="icon" href="images/favicon.png">
    <link rel="apple-touch-icon" href="images/apple-touch-icon.png">
    <link rel="apple-touch-icon" sizes="72x72" href="images/icon-72x72.png">
    <link rel="apple-touch-icon" sizes="114x114" href="images/icon-114x114.png">


    <!--[if lt IE 9]>
    <script src="assets/js/html5shiv.min.js"></script>
    <script src="assets/js/respond.min.js"></script>
    <![endif]-->

  </head>
  <body>

   
    <!-- Breadcrumb -->
    <div class="alice-bg padding-top-70 padding-bottom-70">
      <div class="container">
        <div class="row">
          <div class="col-md-6">
            <div class="breadcrumb-area">
              <h1>Employer Dashboard</h1>
              <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item active" aria-current="page">Employer Dashboard</li>
                </ol>
              </nav>
            </div>
          </div>
          <div class="col-md-6">
            <div class="breadcrumb-form">
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Breadcrumb End -->

    <div class="alice-bg section-padding-bottom">
      <div class="container no-gliters">
        <div class="row no-gliters">
          <div class="col">
            <div class="dashboard-container">
              <div class="dashboard-content-wrapper">
                <div class="manage-job-container">
                  <table class="table">
                    <thead>
                      <tr>
                        <th>Job Title</th>
                        <th>Applications</th>
                        <th>Deadline</th>
                        <th>Status</th>
                        <th class="action">Action</th>
                      </tr>
                    </thead>
                    </table>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
String sql = "select * from job_posts where company in (select company_name from company where company_email= ?)";
ps=connection.prepareStatement(sql);
ps.setString(1, c_email);
resultSet = ps.executeQuery();
while(resultSet.next()){
%>
				<table>
                    <tbody>
                      <tr class="job-items">
                        <td class="title">
                          <h5><a href="#"><%=resultSet.getString("job_title") %></a></h5>
                          <div class="info">
                            <span class="office-location"><a href="#"><i data-feather="map-pin"></i><%=resultSet.getString("location") %></a></span>
                            <span class="job-type"><a href="#"><i data-feather="clock"></i><%=resultSet.getString("job_type") %></a></span>
                          </div>
                        </td>
                        <td class="application"><a href="applicants.jsp?action=<%=resultSet.getString("job_title")%>">Application(s)</a></td>
                        <td class="deadline"><%=resultSet.getString("job_post_end") %></td>
                        <td class="status active">Active</td>
                        <td class="action">
                          <a href="#" class="preview" title="Preview"><i data-feather="eye"></i></a>
                          <a href="#" class="edit" title="Edit"><i data-feather="edit"></i></a>
                          <a href="#" class="remove" title="Delete"><i data-feather="trash-2"></i></a>
                        </td>
                      </tr>
                    </tbody>
                  </table>
<% 
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>

<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
String sql ="select * from company where company_email = ?";
ps=connection.prepareStatement(sql);
ps.setString(1, c_email);
resultSet = ps.executeQuery();
while(resultSet.next()){
%>

                </div>
              </div>
              <div class="dashboard-sidebar">
                <div class="company-info">
                  <div class="company-body">
                    <h5><%=resultSet.getString("company_name") %></h5>
                  </div>
                </div>
                <div class="profile-progress">
                  <div class="progress-item">
                    <div class="progress-head">
                      <p class="progress-on">Profile</p>
                    </div>
                    <div class="progress-body">
                    </div>
                  </div>
                </div>
                <div class="dashboard-menu">
                  <ul>
                    <li><i class="fas fa-home"></i><a href="employer-dashboard.jsp">Dashboard</a></li>
                    <li><i class="fas fa-user"></i><a href="employer-dashboard-edit-profile.jsp">Profile</a></li>
                    <li class="active"><i class="fas fa-briefcase"></i><a href="employer-dashboard-jobs.jsp">Jobs</a></li>
                    <li><i class="fas fa-plus-square"></i><a href="employer-dashboard-post-job.jsp">Post New Job</a></li>
                  </ul>
                  <ul class="delete">
                    <li><i class="fas fa-power-off"></i><a href="company_logout.jsp">Logout</a></li>
                  </ul>
                  <!-- Modal -->
                  
                </div>
              </div>
            </div>
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
    
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/popper.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/feather.min.js"></script>
    <script src="assets/js/bootstrap-select.min.js"></script>
    <script src="assets/js/jquery.nstSlider.min.js"></script>
    <script src="assets/js/owl.carousel.min.js"></script>
    <script src="assets/js/visible.js"></script>
    <script src="assets/js/jquery.countTo.js"></script>
    <script src="assets/js/chart.js"></script>
    <script src="assets/js/plyr.js"></script>
    <script src="assets/js/tinymce.min.js"></script>
    <script src="assets/js/slick.min.js"></script>
    <script src="assets/js/jquery.ajaxchimp.min.js"></script>

    <script src="js/custom.js"></script>
    <script src="dashboard/js/dashboard.js"></script>
    <script src="dashboard/js/datePicker.js"></script>
    <script src="dashboard/js/upload-input.js"></script>

    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC87gjXWLqrHuLKR0CTV5jNLdP4pEHMhmg"></script>
    <script src="js/map.js"></script>
  </body>
</html>