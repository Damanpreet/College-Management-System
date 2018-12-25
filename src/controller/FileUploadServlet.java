package controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.FileUpload;

import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.FileItemStream;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

@WebServlet("/FileUploadServlet")
public class FileUploadServlet extends HttpServlet {
	@Override
	
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		HttpSession s = request.getSession(false);
		String code = (String) s.getAttribute("SECRET");
		if (code == null) {
			out.println("You are not within the session .Please Login");
		} else {
			String username = (String) s.getAttribute("USERNAME");
		}
		
		response.setContentType("text/html");

		out.println("<html>");
		out.println("<body>");
		String value = "";

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection c = DriverManager.getConnection("jdbc:oracle:thin:system/helloall@localhost:1521:XE");
			Statement st = c.createStatement();
		
		boolean isMultiPart = ServletFileUpload.isMultipartContent(request);
		if (isMultiPart) {
			out.println("Yes Multipart data");

			ServletFileUpload upload = new ServletFileUpload();
			try {
				FileItemIterator itr = upload.getItemIterator(request);
				while (itr.hasNext()) {
					FileItemStream fileItemStream = itr.next();

					if (fileItemStream.isFormField()) {
						// do field related work
						String fieldName = fileItemStream.getFieldName();
						InputStream is = fileItemStream.openStream();
						byte[] b = new byte[is.available()];
						is.read(b);
						value = new String(b);
						out.println(fieldName + " : " + value);
					} else {
						String path = getServletContext().getRealPath("/");
										
						int r = st.executeUpdate("insert into Notice values('"+value+"','Notice/" + fileItemStream.getName()+"')");
						
						if(r>0){
							if (FileUpload.processFile(path, fileItemStream, value)) {
							out.println("File Uploaded Successfully");
							request.setAttribute("filePath", "Notice/" + fileItemStream.getName());
							RequestDispatcher gotoShowPage = request.getRequestDispatcher("showPage.jsp");
							gotoShowPage.forward(request, response);
							} else {
							out.println("File Uploading failed ");
						}}
						else{
							out.println("File not found!");
						}

					}

				}

			} catch (FileUploadException e) {
				e.printStackTrace();
			} catch (Exception e) {
			}
		} else {
			out.println("No Multipart data");
		}} catch (ClassNotFoundException e) {
			out.println("Driver Class Not Available " + e.getMessage());
			e.printStackTrace();
		} catch (SQLException e) {
			out.println("SQL Exception " + e.getMessage());
			e.printStackTrace();
		}


		out.println("</body>");
		out.println("</html>");
	}

	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
