package connection;

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class reg extends HttpServlet {
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String n=request.getParameter("fname");		
		String s=request.getParameter("lname");	
		String u=request.getParameter("user");
		String e=request.getParameter("email");
		String ph=request.getParameter("contact");		
		int j=Integer.parseInt(ph);
		String g=request.getParameter("gender");
		String p=request.getParameter("pwd");
		String r=request.getParameter("cpwd");
		System.out.println(n + s);
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");	
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/demo",
"root","chirag");
			PreparedStatement ps=con.prepareStatement("insert into signup values('"+ n +"','"+ s +"','"+ u +"','"+ e +"','"+ j +"','"+ g +"','"+ p +"','"+ r +"')");
			System.out.println("Before execution");
			int i=0;
			i=ps.executeUpdate();
			if(i>0)
			{
			System.out.print("<p>Registered successfully!</p>");			
			request.getRequestDispatcher("/Demo/WebContent/Login_v19/login.html").include(request, response);
			}
		}
			catch(Exception e2)
			{
				System.out.println("error!");
			}
		System.out.close();
	}
	}