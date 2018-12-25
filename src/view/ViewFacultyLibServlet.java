package view;

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

@WebServlet("/ViewFacultyLibServlet")
public class ViewFacultyLibServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		
		HttpSession s = request.getSession(false);

		String code = (String) s.getAttribute("SECRET");
		if (code == null) {
			out.println("You are not within the session .Please Login");
		} else {
			String username = (String) s.getAttribute("USERNAME");
		}

		ArrayList<Books> bookList = new ArrayList<Books>();

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection c = DriverManager.getConnection("jdbc:oracle:thin:system/helloall@localhost:1521:XE");

			Statement st = c.createStatement();
			ResultSet rs = st.executeQuery("Select * from Books where btype='Teacher Copy'");
			while (rs.next()) {
				String btype = rs.getString(1);
				String bname = rs.getString(2);
				String bauthor = rs.getString(3);
				int nocopies = rs.getInt(4);

				Books b = new Books();
				b.setbtype(btype);
				b.setbname(bname);
				b.setbauthor(bauthor);
				b.setnocopies(nocopies);

				bookList.add(b);
			}
			request.setAttribute("BOOK_LIST", bookList);
			RequestDispatcher rd=request.getRequestDispatcher("viewBooks1.jsp");
			rd.forward(request,response);
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

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
