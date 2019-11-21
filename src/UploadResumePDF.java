
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@WebServlet("/UploadResume")
@MultipartConfig
public class UploadResumePDF extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		final Part filePart = request.getPart("resume");
		InputStream pdfFileBytes = null;
		final PrintWriter writer = response.getWriter();
		 
		try {
			 
	          if (!filePart.getContentType().equals("application/pdf"))
	            {
	                       writer.println("<br/> Invalid File");
	                       return;
	            }
	 
	           else if (filePart.getSize()>1048576 ) { //2mb
	               {
	              writer.println("<br/> File size too big");
	              return;
	               }
	           }
	 
	            pdfFileBytes = filePart.getInputStream();  // to get the body of the request as binary data
	 
	            final byte[] bytes = new byte[pdfFileBytes.available()];
	             pdfFileBytes.read(bytes);  //Storing the binary data in bytes array.
	 
	            Connection con = null;
	 
	               try {
	                     Class.forName("com.mysql.jdbc.Driver");
	                     con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demo","root","chirag");
	                  } catch (Exception e) {
	                        System.out.println(e);
	                        System.exit(0);
	                              }
	 
	                int success=0;
	                PreparedStatement pstmt = con.prepareStatement("Update signup set resume = ? where email = ?");
	                pstmt.setBytes(1, bytes);
	                pstmt.setString(2,email);    
	                success = pstmt.executeUpdate();
	                if(success>=1)  System.out.println("Resume Uploaded !");
	                 con.close(); 
	 
	                 writer.println("<br/><h1>Resume Updated Successfully !</h1>");
	 
	        } catch (FileNotFoundException fnf) {
	            writer.println("You  did not specify a file to upload"); 
	            writer.println("<br/> ERROR: " + fnf.getMessage());
	 
	        } catch (SQLException e) {
	            
	            e.printStackTrace();
	        } finally {
	 
	            if (pdfFileBytes != null) {
	                pdfFileBytes.close();
	                
	            }
	            if (writer != null) {
	                writer.close();	                
	            }
	        }
	 
	}
}