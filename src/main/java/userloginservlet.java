

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.beans.Statement;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;



public class userloginservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    Connection con;
    PreparedStatement st;
    public userloginservlet() {
        super();
       
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		String email=request.getParameter("email");
		String pass=request.getParameter("pass");
		try {
			Class.forName("com.mysql.jdbc.Driver");
 			System.out.println("Driver Connection OK!");
 			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/gwy","root","root");
 			System.out.print("Connection with Dataabase");
 			
 			String sql= "select * from register where email='"+email+"'";
 			st=con.prepareStatement(sql);
 			
 			ResultSet rs=st.executeQuery(sql);
		
 			if(rs.next()) {
 				String password=rs.getString("password");
 				if(pass.equals(password)) {
 					HttpSession session=request.getSession();
 					session.setAttribute("email", email);
 					request.getRequestDispatcher("Home.jsp").forward(request, response);
 				}
 				else {
 					request.getRequestDispatcher("Login.jsp").forward(request, response);
				}
 				}
 			else {
 				request.getRequestDispatcher("Login.jsp").forward(request, response);
			}
 			
 				
 		
		}
		catch (Exception e) {
			System.out.println(e);
		}

			
	
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
