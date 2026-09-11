

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
import java.sql.PreparedStatement;

public class deleteenroll extends HttpServlet {
	private static final long serialVersionUID = 1L;
    Connection con;
    PreparedStatement st;
    public deleteenroll() {
        super();
       
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String iid=request.getParameter("t1");
		try {
		Class.forName("com.mysql.jdbc.Driver");
		System.out.print("Driver OK!");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/gwy","root","root");
		System.out.print("Connection with Dataabase");
		st=con.prepareStatement("delete from enrollment where enroll_ID=?");
		System.out.println("delete id "+ request.getParameter("instId"));
		st.setString(1, request.getParameter("instId"));
		st.executeUpdate();
		System.out.println("Successful");
		request.getRequestDispatcher("enroll.jsp").forward(request, response);
		}
		catch (Exception e) {
			System.out.println(e);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
