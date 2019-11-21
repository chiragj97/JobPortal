<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Change Password</title>
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
              <a href="resume.jsp" class="list-group-item list-group-item-action">Resume</a>
              <a href="change_password.jsp" class="list-group-item list-group-item-action active">Change Password</a>
              <a href="../../Login_page/logout.jsp" class="list-group-item list-group-item-action">Logout</a>
              
             </div> 
      </div>
    <div class="col-md-9">
        <div class="card">
            <div class="card-body">
                <div class="row">
                    <div class="col-md-12">
                        <h4>Change Password</h4>
                        <hr>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12"> 
                        <form action = "update_password.jsp" method = "post">
                              
                              <div class="form-group row">
                                <h3 for="oldpass" class="col-4 col-form-label">Current Password</h3> 
                                <div class="col-8">
                                  <input id="oldpass" name="oldpass" placeholder="Current Password" class="form-control here" type="password"><br>
                                </div>
                              </div>
                              
                              <div class="form-group row">
                                <h3 for="newpass" class="col-4 col-form-label">New Password</h3> 
                                <div class="col-8">
                                  <input id="newpass" name="newpass" placeholder="New Password" class="form-control here" type="password">
                                </div>
                              </div>                       
                              
                              <div class="form-group row">
                                <h3 for="c_newpass" class="col-4 col-form-label">Confirm New Password</h3> 
                                <div class="col-8">
                                  <input id="c_newpass" name="c_newpass" placeholder="Confirm New Password" class="form-control here" type="password">
                                </div>
                              </div> 

                              <div class="form-group row">
                                <div class="offset-4 col-8">
                                   <button name="submit" type="submit" class="btn btn-primary">Change Password</button>
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