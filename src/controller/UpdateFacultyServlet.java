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

import model.Faculty;;

@WebServlet("/UpdateFacultyServlet")
public class UpdateFacultyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				PrintWriter out = response.getWriter();
				
				HttpSession ses = request.getSession(false);

				String code = (String) ses.getAttribute("SECRET");
				if (code == null) {
					out.println("You are not within the session .Please Login");
				} else {
					String username = (String) ses.getAttribute("USERNAME");
				}

				ArrayList<Faculty> FacultyList = new ArrayList<Faculty>();

				try {
					Class.forName("oracle.jdbc.driver.OracleDriver");
					Connection c = DriverManager.getConnection("jdbc:oracle:thin:system/helloall@localhost:1521:XE");

					Statement st = c.createStatement();
					ResultSet rs = st.executeQuery("Select * from Faculty");
					while (rs.next()) {
						String fname = rs.getString(1);
						String mname = rs.getString(2);
						String lname = rs.getString(3);
						int dob_d = rs.getInt(4);
						int dob_m = rs.getInt(5);
						int dob_y = rs.getInt(6);
						String age = rs.getString(7);
						String gender = rs.getString(8);
						String phno = rs.getString(9);
						String address = rs.getString(10);
						String pin = rs.getString(11);
						String deptt = rs.getString(12);
						String email_id= rs.getString(13);
						String educ = rs.getString(16);
						

						Faculty f = new Faculty();
						f.setFname(fname);
						f.setMname(mname);
						f.setLname(lname);
						f.setDob_d(dob_d);
						f.setDob_m(dob_m);
						f.setDob_y(dob_y);
						f.setAge(age);
						f.setGender(gender);
						f.setPhno(phno);
						f.setAddress(address);
						f.setPin(pin);
						f.setDeptt(deptt);
						f.setEmail_id(email_id);
						f.setEduc(educ);

						FacultyList.add(f);
					}
					request.setAttribute("FACULTY_LIST", FacultyList);
					RequestDispatcher rd=request.getRequestDispatcher("UpdateFaculty.jsp");
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

		protected void doPost(HttpServletRequest request,
				HttpServletResponse response) throws ServletException, IOException {
		}
}
