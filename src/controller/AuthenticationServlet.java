package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Books;
@WebServlet("/AuthenticationServlet")
public class AuthenticationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out=response.getWriter();
		
		String uname=request.getParameter("username");
		String upass=request.getParameter("userpass");
		
		String types=request.getParameter("type1");
		
		if(types.equals("Admin")){
			if(uname.equals("Admin")&&upass.equals("admin123")){
				HttpSession s=request.getSession(true);
				s.setAttribute("SECRET", upass);
				s.setAttribute("USERNAME", uname);
								
				RequestDispatcher rd=request.getRequestDispatcher("Admin.jsp");
				rd.forward(request,response);
			}
			else{
				out.println("Invalid Username or Password");
			}
		}
		
		if(types.equals("Student")){
				try {
					String passw="",fname="";
					Class.forName("oracle.jdbc.driver.OracleDriver");
					Connection c = DriverManager.getConnection("jdbc:oracle:thin:system/helloall@localhost:1521:XE");

					Statement st = c.createStatement();
					ResultSet rs = st.executeQuery("Select fname,pass from Student where email_id= '"+uname+"'");
						while (rs.next()) {
							fname=rs.getString(1);
							passw= rs.getString(2);						
						}
						
					if(upass.equals(passw)){
						HttpSession s=request.getSession(true);
						s.setAttribute("SECRET", upass);
						s.setAttribute("USERNAME", fname);
						s.setAttribute("mailid", uname);
						
						RequestDispatcher rd=request.getRequestDispatcher("Student.jsp");
						rd.forward(request,response);
					} 
					else{
						out.println("Invalid Username or Password");
					}
				}
				catch (ClassNotFoundException e) {
					out.println("Driver Class Not Available " + e.getMessage());
					e.printStackTrace();  
				} 
				catch (SQLException e) {
					out.println("SQL Exception " + e.getMessage());
					e.printStackTrace();
				}
		}
		
		if(types.equals("Faculty")){
			try {
				String passw="",fname="";
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection c = DriverManager.getConnection("jdbc:oracle:thin:system/helloall@localhost:1521:XE");

				Statement st = c.createStatement();
				ResultSet rs = st.executeQuery("Select fname,pass from Faculty where email_id= '"+uname+"'");
				while (rs.next()) {
					fname=rs.getString(1);
					passw= rs.getString(2);						
				}
				
				if(upass.equals(passw)){
					HttpSession s=request.getSession(true);
					s.setAttribute("SECRET", upass);
					s.setAttribute("USERNAME", fname);
					s.setAttribute("mailid", uname);
					
					RequestDispatcher rd=request.getRequestDispatcher("Faculty.jsp");
					rd.forward(request,response);	
				} 
				else{
					out.println("Invalid Username or Password");
				}
			}
			catch (ClassNotFoundException e) {
				out.println("Driver Class Not Available " + e.getMessage());
				e.printStackTrace();  
			} 
			catch (SQLException e) {
				out.println("SQL Exception " + e.getMessage());
				e.printStackTrace();
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
