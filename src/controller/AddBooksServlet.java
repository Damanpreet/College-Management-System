package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/AddBooksServlet")
public class AddBooksServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

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


		String bt = request.getParameter("btype");
		String bn = request.getParameter("bname");
		String ba = request.getParameter("bauthor");
		int noc = Integer.parseInt(request.getParameter("nocopies"));

		
		out.println("<html>");
		out.println("<body>");
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection c = DriverManager
					.getConnection("jdbc:oracle:thin:system/helloall@localhost:1521:XE");

			Statement st = c.createStatement();
			int r = st.executeUpdate("insert into Books values('"+bt+"','"+bn+"','"+ba+"',"+noc+")");
			if (r > 0) {
				request.getRequestDispatcher("ViewLibServlet").forward(request,response);
			} else {
				out.println("Book cannot be added ");
			}
		} catch (ClassNotFoundException e) {
			out.println("Driver Class Not Available " + e.getMessage());
			e.printStackTrace();
		} catch (SQLException e) {
			out.println("SQL Exception " + e.getMessage());
			e.printStackTrace();
		}


		out.println("</body>");
		out.println("</html>");
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
	}

}
