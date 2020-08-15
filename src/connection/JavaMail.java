package connection;

import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.AddressException;
import javax.mail.internet.MimeMessage;

public class JavaMail {
	public static void sendMail(String recepient) throws Exception{
		System.out.println("Preparing to send mail...");
		Properties properties = new Properties();
		properties.put("mail.smtp.auth","true");
		properties.put("mail.smtp.starttls.enable","true");
		properties.put("mail.smtp.host","smtp.gmail.com");
		properties.put("mail.smtp.port","587");
		
		String myEmail = "chiragj97.cj@gmail.com";
		String password = "something";
		
		Session session = Session.getInstance(properties, new Authenticator(){
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(myEmail, password);
			}
		});
		Message message = prepareMessage(session, myEmail, recepient);
		Transport.send(message);
		System.out.println("Message sent Successfully !!");
	}
	
	private static Message prepareMessage(Session session, String myEmail, String recepient) {
		try{
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(myEmail));
			message.setRecipient(Message.RecipientType.TO, new InternetAddress(recepient));
			message.setSubject("Application Under Review");
			message.setText("Your Application is under review. We'll get back to you shortly \n Have a nice day");
			return message;
		}catch(Exception ex) {
			Logger.getLogger(JavaMail.class.getName()).log(Level.SEVERE, null, ex);
		}
			return null;
		
	}
}
