

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class updateinstructor extends HttpServlet {
	private static final long serialVersionUID = 1L;
		Connection con;
		PreparedStatement st;
    public updateinstructor() {
        super();


    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		String old=request.getParameter("t1");
		String name=request.getParameter("t2");
		String phone=request.getParameter("t3");
		String image=request.getParameter("t4");
		String degree=request.getParameter("t5");
		String salary=request.getParameter("t6");
		try {
			Class.forName("com.mysql.jdbc.Driver");
			System.out.print("Driver OK!");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/gwy","root","root");
			System.out.print("Connection with Dataabase");
			String s=("update instructor set name=?,ph_no=?,image=?,degree=?,salary=? where instructor_ID=?");
			st=con.prepareStatement(s);
			
			st.setString(1, name);
			st.setString(2, phone);
			st.setString(3, image);
			st.setString(4, degree);
			st.setString(5, salary);
			st.setString(6, old);
			st.executeUpdate();
			System.out.print("Update Successful!!");
			request.getRequestDispatcher("instructor.jsp").forward(request, response);
		}
		catch (Exception e) {
			System.out.println(e);
			System.out.println("Error");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
