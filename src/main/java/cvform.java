

import jakarta.security.auth.message.callback.PrivateKeyCallback.Request;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.CacheRequest;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;

import org.apache.catalina.connector.Response;

import com.mysql.cj.Session;

public class cvform extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection connection,con;
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
    
    
    public cvform() {
        super();
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		
		
		if(request.getParameter("Enroll").equals("Enroll")) {
			
			try {
				Class.forName("com.mysql.jdbc.Driver");

				connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/gwy","root","root");
				System.out.print("Connection with Database");
				String course=request.getParameter("course1");
				String mail=request.getParameter("email");
				
				PreparedStatement prep4=connection.prepareStatement("select count(email) from student where email='"+mail+"' and course_name='"+course+"'");
				ResultSet rs4=prep4.executeQuery();
				HttpSession session=request.getSession();
				if(rs4.next()) {
					int limit1=Integer.parseInt(rs4.getString(1));
					System.out.println("rrrrrrrrrr"+limit1);
					if(limit1==1) {
						
						session.setAttribute("full","You already exist in this class.Your enrollment is unsuccessful!");
						response.sendRedirect("Home.jsp");
						
						
						
					}
					else {
					
				
			PreparedStatement prep2=connection.prepareStatement("select limit_student from course where course_name='"+course+"'");
			ResultSet rs2=prep2.executeQuery();
			if(rs2.next()) {
				int limit=Integer.parseInt(rs2.getString(1));
			
			PreparedStatement prep1=connection.prepareStatement("select count(course_name) from student where course_name='"+course+"'");
			ResultSet rs1=prep1.executeQuery();
			if(rs1.next()) {
				
				
				int count=Integer.parseInt(rs1.getString(1));
			
			if(count<limit) {
		try {
			
			Class.forName("com.mysql.jdbc.Driver");

			connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/gwy","root","root");
			System.out.print("Connection with Database");
			
			
			 PreparedStatement prep=connection.prepareStatement("select * from enrollment where enroll_ID=(select max(enroll_ID) from enrollment)");
		        String rid=null;
		        try {
		          ResultSet rs=prep.executeQuery();
		          if(rs.next()) {
		            rid=rs.getString(1);
		            System.out.println("Rid receive!");
		          }
		          else {
		            System.out.println("Rip bro!");
		          }
		        } catch (SQLException e) {
		          System.out.println("Can't get max id!");
		        }
		        
		        if(rid==null) {
		        	rid="En_01";
		        }
		        else{
		        	rid=idIncresement(rid);
		        }
		        
				
		        String name=request.getParameter("name");
				
				String email=request.getParameter("email");
				
				
				String regid=request.getParameter("regid");
				String cid=request.getParameter("cid");
				LocalDate localdate=LocalDate.now();
				String enrolldate=localdate.toString();
				
                 
				
			
					try {
						
						
						String s="insert into enrollment values(?,?,?,?,?,?,?)";
						st=connection.prepareStatement(s);
						st.setString(1, rid);
						st.setString(2, name);
						st.setString(3, cid);
						st.setString(4, course);
						
						st.setString(5, enrolldate);
						st.setString(6, regid);
						st.setString(7, null);
						st.executeUpdate();
						System.out.print("OKOKOK!");
						request.getRequestDispatcher("payment.jsp").forward(request, response);
					}
					catch (Exception e) {
						System.out.println(e);
					}
					
				

		        
		} catch (Exception e) {
			// TODO: handle exception
		}}
			
			else {
				session.setAttribute("limit","The student limit have reached. Please check other courses");
				response.sendRedirect("Home.jsp");
			}
			
			}}}}
				
				
			}
		
			
			catch (Exception e) {
				System.out.println(e);
			}}
					
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
