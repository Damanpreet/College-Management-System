package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import model.Student;
import model.Faculty;

@WebServlet("/PasswordRetrieve")
public class PasswordRetrieve extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		String types=request.getParameter("type1");
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection c = DriverManager.getConnection("jdbc:oracle:thin:system/helloall@localhost:1521:XE");
			String pwd="";
			Statement st = c.createStatement();
			Properties prop;
			prop = System.getProperties();
				
			out.println("<html>");
			out.println("<body>");
	
			if(types.equals("Faculty")){
				String em = request.getParameter("email");
				String sq = request.getParameter("secques");
				String sa = request.getParameter("secans");
		
				try{
					ResultSet r = st.executeQuery("select pass from Faculty where email_id='"+em+"' and secques='"+sq+"' and secans='"+sa+"'");
			
					prop.put("mail.smtp.host", "smtp.gmail.com");
					prop.put("mail.smtp.port", "587");
					prop.put("mail.smtp.starttls.enable", "true");
					prop.put("mail.smtp.auth", "true");
			
					MyAuthenticator ma = new MyAuthenticator("hacked.fused@gmail.com","hackingisnotpersonal");
					Session ses = Session.getInstance(prop, ma);
					MimeMessage m = new MimeMessage(ses);
					m.setRecipient(RecipientType.TO, new InternetAddress(em));
					m.setSubject("GTBIT");
					MimeMultipart mp = new MimeMultipart();
					MimeBodyPart bp = new MimeBodyPart();
			
					while (r.next()) {
						pwd=r.getString(1);  
					}
					bp.setText("Your password is "+pwd);
			// MimeBodyPart bpAttach=new MimeBodyPart();
			// bpAttach.attachFile(new
			// file("C:\\Users\\8orn_70_#4x\\Desktop\\abc.txt"));
			// mp.addBodyPart(bpAttach);
					mp.addBodyPart(bp);
					m.setContent(mp);
					Transport.send(m);
					out.println("Mail sent successfully");
				} catch (AddressException e) {
					out.println("äddress exception" + e.getMessage());
					e.printStackTrace();
				} catch (MessagingException e) {
					out.println("messagingException" + e.getMessage());
					e.printStackTrace();
				} 
			}
			if(types.equals("Student")){
				ArrayList<Student> studentList = new ArrayList<Student>();
				String em = request.getParameter("email");
				String sq = request.getParameter("secques");
				String sa = request.getParameter("secans");
			
				try {
					ResultSet r = st.executeQuery("select pass from Student where email_id='"+em+"' and secques='"+sq+"' and secans='"+sa+"'");
			
					prop.put("mail.smtp.host", "smtp.gmail.com");
					prop.put("mail.smtp.port", "587");
					prop.put("mail.smtp.starttls.enable", "true");
					prop.put("mail.smtp.auth", "true");
			
					MyAuthenticator ma = new MyAuthenticator("hacked.fused@gmail.com","hackingisnotpersonal");
					Session ses = Session.getInstance(prop, ma);
					MimeMessage m = new MimeMessage(ses);
					m.setRecipient(RecipientType.TO, new InternetAddress(em));
					m.setSubject("GTBIT");
					MimeMultipart mp = new MimeMultipart();
					MimeBodyPart bp = new MimeBodyPart();
			
					while (r.next()) {
						pwd=r.getString(1);  
					}
					bp.setText("Your password is "+pwd);
			// MimeBodyPart bpAttach=new MimeBodyPart();
			// bpAttach.attachFile(new
			// file("C:\\Users\\8orn_70_#4x\\Desktop\\abc.txt"));
			// mp.addBodyPart(bpAttach);
				mp.addBodyPart(bp);
				m.setContent(mp);
				Transport.send(m);
				out.println("Mail sent successfully");
				} catch (AddressException e) {
					out.println("äddress exception" + e.getMessage());
					e.printStackTrace();
				} catch (MessagingException e) {
					out.println("messagingException" + e.getMessage());
					e.printStackTrace();
				} 
			}
			out.println("</body>");
			out.println("</html>");
		}catch (Exception e) {
			out.println("Exception: " + e.getMessage());
			e.printStackTrace();
		}
	}
		
		
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
