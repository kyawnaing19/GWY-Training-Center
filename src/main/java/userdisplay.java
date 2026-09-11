

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.beans.Statement;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;

import javax.naming.spi.DirStateFactory.Result;


public class userdisplay extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con;
	java.sql.Statement st;
       

    public userdisplay() {
        super();
      
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		out.println("<html><body>");
		try {
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("Driver Connection OK!");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/gwy","root","root");
			System.out.print("Connection with Dataabase");
			st=con.createStatement();
			String sql= "select*from register";
			ResultSet rs=st.executeQuery(sql);
			out.println("<table border=1 width=50% height=20%>");
			out.println("<tr><th>reg_ID</th><th>Name</th><th>Email</th><th>Phone Number</th></tr>");
			while (rs.next()) {
				String id=rs.getString(1);
				String name=rs.getString(2);
				String email=rs.getString(3);
				String phone=rs.getString(5);
				out.println("<tr><td>"+id+"</td><td>"+name+"</td><td>"+email+"</td><td>"+phone+"</td></tr>");
			}
			out.println("</table></body></html>");
		}
			
			catch (Exception e) {
				System.out.println(e);
			}
			
		
		
	
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
