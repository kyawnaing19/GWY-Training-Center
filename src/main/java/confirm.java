

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.cj.Session;
import com.mysql.cj.xdevapi.Statement;


public class confirm extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection connection;
    PreparedStatement st;
    
    public String idIncresement(String id) {
        String cutOff[]=id.split("_",2);
        int toIncrese=Integer.parseInt(cutOff[1]);
        toIncrese+=1;
        String incresed=String.format("%02d", toIncrese);
        id="";
        id=cutOff[0]+"_"+incresed;
        return id;
      }
    
    
    public confirm() {
        super();
        try{
			Class.forName("com.mysql.jdbc.Driver");

			connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/gwy","root","root");
			System.out.print("Connection with Database");
					        
		} catch (Exception e) {
			// TODO: handle exception
		}
        
        
        
       
       
    }
    
    public ResultSet getRegInfo(String reg_id) throws SQLException {
    	PreparedStatement stmt=connection.prepareStatement("select * from register where reg_ID='"+reg_id+"'");
    	return stmt.executeQuery();
    }
    
    public ResultSet getEnrollInfo(String enroll_id) throws SQLException {
    	PreparedStatement stmt=connection.prepareStatement("select * from enrollment where enroll_ID='"+enroll_id+"'");
    	return stmt.executeQuery();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			Class.forName("com.mysql.jdbc.Driver");

			connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/gwy","root","root");
			System.out.print("Connection with Database");
			String cname=request.getParameter("coursename");
			
					
				
			
		PreparedStatement prep2=connection.prepareStatement("select limit_student from course where course_name='"+cname+"'");
		ResultSet rs2=prep2.executeQuery();
		if(rs2.next()) {
			int limit=Integer.parseInt(rs2.getString(1));
		
		PreparedStatement prep1=connection.prepareStatement("select count(course_name) from student where course_name='"+cname+"'");
		ResultSet rs3=prep1.executeQuery();
		if(rs3.next()) {
			
			
			int count=Integer.parseInt(rs3.getString(1));
		
		if(count<limit) {
			
			
		
		
		
		String enid=request.getParameter("enrollid");
		String updateQuery = "UPDATE enrollment SET status = '1' WHERE enroll_ID = '"+enid+"'";
		try {
			connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/gwy","root","root");	
		java.sql.Statement statement=connection.createStatement();
		
		statement.executeUpdate(updateQuery);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String query="insert into student (`name`,`ph_no`,`email`,`course_name`,`enroll_ID`) values(?,?,?,?,?)";
		
		try {
			PreparedStatement stmt=connection.prepareStatement(query);
			ResultSet rs=getEnrollInfo(request.getParameter("enrollid"));
			if(rs.next()) {
				stmt.setString(4, rs.getString(4));
			}
			ResultSet rs1=getRegInfo(request.getParameter("regid"));
			if(rs1.next()) {
				stmt.setString(1, rs1.getString(2));
				stmt.setString(2, rs1.getString(5));
				stmt.setString(3, rs1.getString(3));
			}
			stmt.setString(5, request.getParameter("enrollid"));
			stmt.execute();
			response.sendRedirect("enroll.jsp");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		}
		
		else {
			HttpSession session=request.getSession();
			session.setAttribute("limit","Unsuccessful!  The student limit have reached in this class.");
			
			response.sendRedirect("enroll.jsp");
		}
		
		
		}}}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
