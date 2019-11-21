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
	String job_id = request.getParameter("job_id");
	
%>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>Job Description</title>

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
<% 
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
String sql ="select * from job_posts J NATURAL JOIN company C where J.job_id = ? and J.company = C.company_name";
ps = connection.prepareStatement(sql);
ps.setString(1,job_id);
resultSet = ps.executeQuery();
while(resultSet.next()){
%>
   
    <!-- Candidates Details -->
    <div class="alice-bg padding-top-60 section-padding-bottom">
      <div class="container">
        <div class="row">
          <div class="col">
            <div class="job-listing-details">
              <div class="job-title-and-info">
                <div class="title">
                  <div class="title-body">
                     <h4><%=resultSet.getString("job_title") %></h4>
                    <div class="info">
                      <span class="office-location"><a href="#"><i data-feather="map-pin"></i><%=resultSet.getString("location") %></a></span>
                      <span class="job-type full-time"><a href="#"><i data-feather="clock"></i><%=resultSet.getString("job_type") %></a></span>
                    </div>
                  </div>
                </div>
                
              </div>
              <div class="details-information section-padding-60">
                <div class="row">
                  <div class="col-xl-7 col-lg-8">
                    <div class="description details-section">
                      <h4><i data-feather="align-left"></i>Job Description</h4>
                      <p><%=resultSet.getString("job_description") %></p>
                    </div>
                    <div class="responsibilities details-section">
                      <h4><i data-feather="zap"></i>Responsibilities</h4>
                      <ul>
                        <li><%=resultSet.getString("responsibilities") %></li>
                       </ul>
                    </div>
                    
                    <div class="job-apply-buttons">
                      <a href="applied_jobs.jsp" class="apply"  data-toggle="modal" data-target="#apply-popup-id">Apply Now</a>
                    </div>
                  </div>
                  <div class="col-xl-4 offset-xl-1 col-lg-4">
                    <div class="information-and-share">
                      <div class="job-summary">
                        <h4>Job Summary</h4>
                        <ul>
                          <li><span>Published on:</span><%=resultSet.getString("job_post_date") %></li>
                          <li><span>Vacancy:</span> <%=resultSet.getString("vacancies") %></li>
                          <li><span>Employment Status:</span><%=resultSet.getString("job_type") %></li>
                          <li><span>Experience:</span><%=resultSet.getString("experience") %> year(s)</li>
                          <li><span>Job Location:</span><%=resultSet.getString("location") %></li>
                          <li><span>Salary:</span><%=resultSet.getString("salary") %></li>
                          <li><span>Application Deadline:</span><%=resultSet.getString("job_post_end") %></li>
                        </ul>
                      </div>
                                                                  
                    </div> 
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-xl-7 col-lg-8">
                  <div class="company-information details-section">
                    <h4><i data-feather="briefcase"></i>About the Company</h4>
                    <ul>
                      <li><span>Company Name:</span><%=resultSet.getString("company") %></li>
                      <li><span>Address:</span><%=resultSet.getString("company_address") %></li>
                      <li><span>Website:</span> <a href="#"><%=resultSet.getString("company_website") %></a></li>
                      </ul>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Candidates Details End -->
<%
session.setAttribute("jobtitle",resultSet.getString("job_title"));
session.setAttribute("company",resultSet.getString("company"));
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

    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC87gjXWLqrHuLKR0CTV5jNLdP4pEHMhmg"></script>
    <script src="js/map.js"></script>

  </body>
</html>