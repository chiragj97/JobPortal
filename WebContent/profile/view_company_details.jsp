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
	String company_email = request.getParameter("company_email");
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>Admin</title>

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
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
              <h1>Admin's Dashboard</h1>
              <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item active" aria-current="page">Admin's Dashboard</li>
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
                        <th>Company List</th>
                      </tr>
                    </thead>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
String sql = "select * from temporary where company_email = ?";
ps=connection.prepareStatement(sql);
ps.setString(1,company_email);
resultSet = ps.executeQuery();
while(resultSet.next()){
%>
<tbody>
                      <tr class="candidates-list">
                        <td class="title">
                          <div class="body">
                            <h5><a href="#"><%=resultSet.getString("company_name") %></a></h5>
                          </div>
                        </td>
                        <td class="title">
                          <div class="body">
                            <h5><a href="#"><%=resultSet.getString("company_email") %></a></h5>
                          </div>
                        </td>
                        <td class="title">
                          <div class="body">
                            <h5><a href="#"><%=resultSet.getString("company_website") %></a></h5>
                          </div>
                        </td>
                        <td class="title">
                          <div class="body">
                            <h5><a href="#"><%=resultSet.getString("company_address") %></a></h5>
                          </div>
                        </td>
                        <td class = "title">
                        	<div class = "body">
                        		<a href="approve_company.jsp?comp_email=<%=company_email%>&c_name=<%=resultSet.getString("company_name")%>&c_pass=<%=resultSet.getString("company_password")%>&cc_pass=<%=resultSet.getString("confirm_c_password")%>&c_website=<%=resultSet.getString("company_website")%>&c_address=<%=resultSet.getString("company_address") %>" class="btn btn-success">Approve Request</a>
                        		<a href="reject_company.jsp" class="btn btn-primary">Reject Request</a>
                        	</div>
                         
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
                    <h5>Admin</h5>
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
                    <li><i class="fas fa-home"></i><a href="admin.jsp">Company Requests</a></li>
                    <li><i class="fas fa-home"></i><a href="view_company_details.jsp">Company Details</a></li>
                  </ul>
                  <ul class="delete">
                    <li><i class="fas fa-power-off"></i><a href="admin_logout.jsp">Logout</a></li>
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