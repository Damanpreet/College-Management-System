package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;

import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.mail.internet.MimeMultipart;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/SendMailServlet")
public class SendMailServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		HttpSession s = request.getSession(false);

		String code = (String) s.getAttribute("SECRET");
		if (code == null) {
			out.println("You are not within the session .Please Login");
		} else {
			String username = (String) s.getAttribute("USERNAME");
		}
		
		
		String email = request.getParameter("email");
		String msg = request.getParameter("msg");
		try {
			Properties prop;
			prop = System.getProperties();
			prop.put("mail.smtp.host", "smtp.gmail.com");
			prop.put("mail.smtp.port", "587");
			prop.put("mail.smtp.starttls.enable", "true");
			prop.put("mail.smtp.auth", "true");
			MyAuthenticator ma = new MyAuthenticator("hacked.fused@gmail.com","hackingisnotpersonal");
			Session ses = Session.getInstance(prop, ma);
			MimeMessage m = new MimeMessage(ses);
			m.setRecipient(RecipientType.TO, new InternetAddress(email));
			m.setSubject("GTBIT");
			MimeMultipart mp = new MimeMultipart();
			MimeBodyPart bp = new MimeBodyPart();
			bp.setText(msg);
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

		} catch (Exception e) {
			out.println("ëxception" + e.getMessage());
			e.printStackTrace();
		}

	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
