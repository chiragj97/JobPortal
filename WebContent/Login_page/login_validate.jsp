<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<% 
	String email=request.getParameter("email");
	String pwd=request.getParameter("password");
		
try{
	Class.forName("com.mysql.jdbc.Driver"); 
	java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demo","root","chirag"); 
	PreparedStatement ps = con.prepareStatement("select * from signup where email=? and password=?");
		ps.setString(1, email);
		ps.setString(2, pwd);
 		
		ResultSet rs = ps.executeQuery();
 	
		if(rs.next()) {
			session.setAttribute("email",email);
					response.sendRedirect("../jobportal/jobportal/user.jsp");
					return;					}
				
		else{
			response.sendRedirect("login.html");
			out.print("Incorrect Credentials");
		}
	
}catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}

%>
</body>
</html>