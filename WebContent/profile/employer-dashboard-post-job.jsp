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

    <title>Post a Job</title>

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
    <link rel="stylesheet" href="assets/css/html5-simple-date-input-polyfill.css" />

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
                  <li class="breadcrumb-item"><a href="#">Home</a></li>
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
                <form action="new_post.jsp" class="dashboard-form job-post-form">
                  <div class="dashboard-section basic-info-input">
                    <h4><i data-feather="user-check"></i>Post A Job</h4>
                    <div class="form-group row">
                      <label class="col-md-3 col-form-label">Job Title</label>
                      <div class="col-md-9">
                        <input type="text" name="jobtitle" class="form-control" placeholder="Your job title here">
                      </div>
                    </div>
                    <div class="row">
                      <label class="col-md-3 col-form-label">Job Summery</label>

                      <div class="col-md-9">
                        <div class="row">
                          
                          <div class="col-md-6">
                            <div class="form-group">
                              <input type="text" name="job_location" class="form-control" placeholder="Job Location">
                            </div>
                          </div>
                          <div class="col-md-6">
                            <div class="form-group">
                              <select name="job_type" class="form-control">
                                <option>Job Type</option>
                                <option value="part_time">Part Time</option>
                                <option value="fulltime">Full Time</option>
                                <option value="internship">Internship</option>
                                <option value="temporary">Temporary</option>
                                <option value="freelance">Freelance</option>
                              </select>
                              <i class="fa fa-caret-down"></i>
                            </div>
                          </div>
                          <label class="col-md-3 col-form-label" style="top: 60px;position: absolute;left: -200px;">Experience Required(in yrs)</label>
                          <div class="col-md-6">
                            <div class="form-group">
                              <select name="experience_from" class="form-control">
                                <option>From</option>
                                <option value="0">0</option>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                                <option value="6">6</option>
                                <option value="7">7</option>
                              </select>
                              <i class="fa fa-caret-down"></i>
                            </div>                            
                          </div>
<!-- 
                          <div class="form-group">
                            <label>to</label>
                          </div> -->

                          <div class="col-md-6">
                            <div class="form-group">
                              <select name="experience_to" class="form-control">
                                <option>To</option>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                                <option value="6">6</option>
                                <option value="7">7</option>
                              </select>
                              <i class="fa fa-caret-down"></i>
                            </div>                            
                          </div>

                          <div class="col-md-6">
                            <div class="form-group">
                              <input type="text" name="salary" class="form-control" placeholder="Salary Range">
                            </div>
                          </div>
                          
						<div class="col-md-6">
                            <div class="form-group">
                              <input type="text" name="vacancies" class="form-control" placeholder="Vacancies">
                            </div>
                          </div>
                          
                          <div class="col-md-6">
                            <div class="form-group">
                              <label class="col-md-3 col-form-label" style = "position: relative; left: -215px;">Apply before</label>
                              <input type="text" name="apply_before" class="form-control" placeholder="(YYYY/MM/DD)" style="position: absolute;top: 5px;">
                            </div>
                          </div>
						
                        </div>
                      </div>
                    </div>
                    <br>
                    <div class="row">
                      <label class="col-md-3 col-form-label">Job Description</label>
                      <div class="col-md-9">
                        <div class="form-group">
                        <textarea class="form-control" name="job_description" placeholder="Job Description"></textarea>
                      </div>
                    </div>
                    </div>
                    <div class="row">
                      <label class="col-md-3 col-form-label">Responsibilities</label>
                      <div class="col-md-9">
                        <div class="form-group">
                        <textarea class="form-control" name="responsibilities" placeholder="Roles & Responsibilities (Optional)"></textarea>
                      </div>
                      </div>
                    </div>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
String sql ="select * from company where company_email = ?";
ps=connection.prepareStatement(sql);
ps.setString(1, c_email);
resultSet = ps.executeQuery();
while(resultSet.next()){
%>
        
                    <div class="row">
                      <label class="col-md-3 col-form-label">About Company</label>
                      <div class="col-md-9">
                        <div class="row">
                          <div class="col-md-6">
                            <div class="form-group">
                              <input type="text" name="company_name" value="<%=resultSet.getString("company_name") %>" class="form-control" placeholder="Company Name" readonly/>
                            </div>
                          </div>
                          <div class="col-md-6">
                            <div class="form-group">
                              <input type="text" name="company_website" value="<%=resultSet.getString("company_website") %>" class="form-control" placeholder="Web Address" readonly/>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                                        <div class="form-group row">
                      <label class="col-md-3 col-form-label"></label>
                      <div class="col-md-9">
                        <button class="button">Post Your Job</button>
                      </div>
                    </div>
                  </div>
                </form>
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
                    
                  </div>
                </div>
                <div class="dashboard-menu">
                  <ul>
                    <li><i class="fas fa-home"></i><a href="employer-dashboard.jsp">Dashboard</a></li>
                    <li><i class="fas fa-user"></i><a href="employer-dashboard-edit-profile.jsp">Profile</a></li>
                    <li><i class="fas fa-briefcase"></i><a href="employer-dashboard-jobs.jsp">Jobs</a></li>
                    <li class="active"><i class="fas fa-plus-square"></i><a href="employer-dashboard-post-job.jsp">Post New Job</a></li>
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
    <script src="assets/js/html5-simple-date-input-polyfill.min.js"></script>
    <script src="js/custom.js"></script>
    <script src="dashboard/js/dashboard.js"></script>
    <script src="dashboard/js/datePicker.js"></script>
    <script src="dashboard/js/upload-input.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC87gjXWLqrHuLKR0CTV5jNLdP4pEHMhmg"></script>
    <script src="js/map.js"></script>

  </body>
</html>