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
	String c_email=request.getParameter("company_email");
	String pwd=request.getParameter("c_password");
		
try{
	Class.forName("com.mysql.jdbc.Driver"); 
	java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demo","root","chirag"); 
	PreparedStatement ps = con.prepareStatement("select * from company where company_email=? and company_password=?");
		ps.setString(1, c_email);
		ps.setString(2, pwd);
 		
		ResultSet rs = ps.executeQuery();
 	
		if(rs.next()) {
					session.setAttribute("c_email",c_email);
					response.sendRedirect("../profile/employer-dashboard.jsp");
					return;					}
				
		else{
			response.sendRedirect("company_login.jsp");
			out.print("Incorrect Credentials");
		}
	
	 
}catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}

%>
</body>
</html>