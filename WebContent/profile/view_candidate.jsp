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
%>
<%
	String email = request.getParameter("seeker_email");
	String job_title = request.getParameter("jt");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>Candidate Details</title>
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
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

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
                <div class="manage-candidate-container">
                  <table class="table">
                    <thead>
                      <tr>
                        <th>Candidate Profile</th>
                        
                      </tr>
                    </thead>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
String sql = "select * from signup where email = ?";
String sql2 = "update applied_jobs set status = 'Under Review' where seeker_email = ? and job_title = ?";
ps=connection.prepareStatement(sql);
ps.setString(1, email);
resultSet = ps.executeQuery();
ps2 = connection.prepareStatement(sql2);
ps2.setString(1, email);
ps2.setString(2, job_title);
ps2.executeUpdate();
while(resultSet.next()){	
%>
<tbody>
                      <tr class="candidates-list">
                        <td class="title">
                           <div class="body">
                            <h4>First Name  : <%=resultSet.getString("first") %></h4>
                          </div>
                        </td>
                        <td class="title">
                           <div class="body">
                            <h4>Last Name  : <%=resultSet.getString("last") %></h4>
                          </div>
                        </td>
                        <td class="title">
                           <div class="body">
                            <h4>Username  : <%=resultSet.getString("username") %></h4>
                          </div>
                        </td>
                        <td class="title">
                           <div class="body">
                            <h4>Email address  : <%=resultSet.getString("email") %></h4>
                          </div>
                        </td>
                        <td class="title">
                           <div class="body">
                            <h4>Contact No.  :<%=resultSet.getString("contact") %></h4>
                          </div>
                        </td>
                        <td class="title">
                           <div class="body">
                            <h4>Gender  : <%=resultSet.getString("gender") %></h4>
                          </div>
                        </td>
                        <td class = "title">
                        
                      	<a href="candidates_resume.jsp?candidate_email=<%=resultSet.getString("email")%>" class="btn btn-primary">View Resume</a>
                      	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <button type="button" class="btn btn-success">Shortlist</button> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      	<a href="delete_candidate.jsp?candidateemail=<%=resultSet.getString("email")%>&jobtitle=<%=job_title%>" class="btn btn-danger">Reject</a>
                        </td>
                      </tr>
                      
                      
                    </tbody>
<% 
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
                  </table>
                  
                </div>
              </div>
              <div class="dashboard-sidebar">
                <div class="company-info">
                  
                  <div class="company-body">
                    <h5>Candidate</h5>
                  </div>
                </div>
                <div class="profile-progress">
                  <div class="progress-item">
                    <div class="progress-head">
                      <p class="progress-on">Profile</p>
                    </div>
                    
                </div>
                <div class="dashboard-menu">
                  <ul>
                    <li><i class="fas fa-home"></i><a href="employer-dashboard.jsp">Dashboard</a></li>
                    <li><i class="fas fa-user"></i><a href="employer-dashboard-edit-profile.jsp">Edit Profile</a></li>
                    <li><i class="fas fa-briefcase"></i><a href="employer-dashboard-jobs.jsp">Jobs</a></li>
                    <li class="active"><i class="fas fa-users"></i><a href="view_candidate.jsp">Candidates</a></li>
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
