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

import model.Student;

@WebServlet("/StudentProfileServlet")
public class StudentProfileServlet extends HttpServlet {
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

				ArrayList<Student> studentList = new ArrayList<Student>();

				try {
					Class.forName("oracle.jdbc.driver.OracleDriver");
					Connection c = DriverManager.getConnection("jdbc:oracle:thin:system/helloall@localhost:1521:XE");
					Statement st = c.createStatement();
					
					String emailid=request.getParameter("email_id");
					ResultSet rs = st.executeQuery("Select * from Student where email_id='"+emailid+"'");
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
						String stream_type = rs.getString(12);
						int session_id1 = rs.getInt(13);
						int session_id2 = rs.getInt(14);
						String email_id= rs.getString(15);
						String pass = rs.getString(16);
						String cpass = rs.getString(17);
						float perc10 = rs.getFloat(18);
						float perc12 = rs.getFloat(19);

						Student s = new Student();
						s.setFname(fname);
						s.setMname(mname);
						s.setLname(lname);
						s.setDob_d(dob_d);
						s.setDob_m(dob_m);
						s.setDob_y(dob_y);
						s.setAge(age);
						s.setGender(gender);
						s.setPhno(phno);
						s.setAddress(address);
						s.setPin(pin);
						s.setStream_type(stream_type);
						s.setSession_id1(session_id1);
						s.setSession_id2(session_id2);
						s.setEmail_id(email_id);
						s.setPass(pass);
						s.setCpass(cpass);
						s.setPerc10(perc10);
						s.setPerc12(perc12);

						studentList.add(s);
					}
					request.setAttribute("STUDENT_LIST", studentList);
					RequestDispatcher rd=request.getRequestDispatcher("viewStudentMyProfile.jsp");
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
