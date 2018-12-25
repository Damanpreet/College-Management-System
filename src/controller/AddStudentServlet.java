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


@WebServlet("/AddStudentServlet")
public class AddStudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String fn = request.getParameter("fname");
		String mn = request.getParameter("mname");
		String ln = request.getParameter("lname");
		int dd = Integer.parseInt(request.getParameter("dob_d"));
		int dm = Integer.parseInt(request.getParameter("dob_m"));
		int dy = Integer.parseInt(request.getParameter("dob_y"));
		int age = Integer.parseInt(request.getParameter("age"));
		String gn = request.getParameter("gender");
		Double pn = Double.parseDouble(request.getParameter("phno"));
		String add = request.getParameter("address");
		int pin = Integer.parseInt(request.getParameter("pin"));
		String stype = request.getParameter("stream_type");
		int sid1 = Integer.parseInt(request.getParameter("session_id1"));
		int sid2 = Integer.parseInt(request.getParameter("session_id2"));
		String em = request.getParameter("email_id");
		String pwd = request.getParameter("pass");
		String cpwd = request.getParameter("cpass");
		Float p10 = Float.parseFloat(request.getParameter("perc10"));
		Float p12 = Float.parseFloat(request.getParameter("perc12"));
		String secq=request.getParameter("secques");
		String seca=request.getParameter("secans");
		
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<body>");
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection c = DriverManager
					.getConnection("jdbc:oracle:thin:system/helloall@localhost:1521:XE");

			Statement st = c.createStatement();
			int r = st.executeUpdate("insert into Student values('"+fn+"','"+mn+"','"+ln+"',"+dd+","+dm+","+dy+","+age+",'"+gn+"',"+pn+",'"+add+"',"+pin+",'"+stype+"',"+sid1+","+sid2+",'"+em+"','"+pwd+"','"+cpwd+"',"+p10+","+p12+",'"+secq+"','"+seca+"')");
			if (r > 0) {
				 request.setAttribute("emailid", em);
				 request.setAttribute("pass", pwd);
				request.getRequestDispatcher("StudentFacultyRegSuccess.jsp").forward(request,response);
			} else {
				out.println("Record cannot be added ");
			}
		} catch (ClassNotFoundException e) {
			out.println("Driver Class Not Available " + e.getMessage());
			e.printStackTrace();
		} catch (SQLException e) {
			out.println("This Emailid has already been registered!");
			e.printStackTrace();
		}


		out.println("</body>");
		out.println("</html>");
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {	
	}
}
