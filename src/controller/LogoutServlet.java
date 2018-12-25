package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();

		HttpSession s = request.getSession(false);
		String val=(String)s.getAttribute("SECRET");
		
		if (val==null) {
			out.println("You are not within the session .Please Login");
		} else {
			s.removeAttribute("SECRET");
			s.removeAttribute("USERNAME");
			s.invalidate();
			out.println("You have been successfully logged out");
			
		}
		//response.sendRedirect("homepage.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
