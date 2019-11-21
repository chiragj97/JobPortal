
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
 
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ViewResume")
public class ViewResume extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String email = (String)session.getAttribute("email");
		ServletOutputStream sos;
        Connection  con=null;
        PreparedStatement pstmt=null;
         
        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "inline");

        sos = response.getOutputStream();
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demo","root","chirag");
       } catch (Exception e) {
                  System.out.println(e);
                  System.exit(0); 
                       }
        
        ResultSet rs = null;
        try {
        	pstmt = con.prepareStatement("select resume from signup where email = ?");
        	pstmt.setString(1,email);
        	rs = pstmt.executeQuery();
        	
        	if(rs.next()) {
        		sos.write(rs.getBytes("resume"));
            }else
        		return;
        }catch(SQLException e) {
        	e.printStackTrace();
        }
        sos.flush();
        sos.close();
	}

}
