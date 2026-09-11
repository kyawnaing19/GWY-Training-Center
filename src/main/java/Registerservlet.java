

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
import java.sql.ResultSet;
import java.sql.SQLException;

public class Registerservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection connection;
    PreparedStatement st;
    
    public String idIncresement(String id) {
        String cutOff[]=id.split("_",2);
        int toIncrese=Integer.parseInt(cutOff[1]);
        toIncrese+=1;
        String incresed=String.format("%03d", toIncrese);
        id="";
        id=cutOff[0]+"_"+incresed;
        return id;
      }
    
    
    public Registerservlet() {
        super();
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		
		if(request.getParameter("submit").equals("Register")) {
			String email=request.getParameter("email");
			try {
				Class.forName("com.mysql.jdbc.Driver");

				connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/gwy","root","root");
				System.out.print("Connection with Database");
				String sql= "select email from register where email='"+email+"'";
	 			st=connection.prepareStatement(sql);
	 			
	 			ResultSet rst=st.executeQuery(sql);
			
	 			if(rst.next()) {
	 				request.getRequestDispatcher("Login.jsp").forward(request, response);
	 			}
			
	 			else {
			
		try {
			Class.forName("com.mysql.jdbc.Driver");

			connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/gwy","root","root");
			System.out.print("Connection with Database");
			
			 PreparedStatement prep=connection.prepareStatement("select * from register where reg_ID=(select max(reg_ID) from register)");
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
		        
		        if(rid.equals(null)) {
		        	rid="R_001";
		        }
		        else{
		        	rid=idIncresement(rid);
		        }
		        
				String name=request.getParameter("name");
				
				String pw=request.getParameter("pw");
				String ph=request.getParameter("ph");
			
					try {
						
						String s="insert into register value(?,?,?,?,?)";
						st=connection.prepareStatement(s);
						st.setString(1, rid);
						st.setString(2, name);
						st.setString(3, email);
						st.setString(4, pw);
						st.setString(5, ph);
						st.executeUpdate();
						System.out.print("OKOKOK!");
						response.sendRedirect("Login.jsp");
						}
		catch (Exception e) {
						System.out.println(e);
					}
					
	 			}
				catch (Exception e) {
					System.out.println(e);
				}		
	 			}
		        
		} catch (Exception e) {
			// TODO: handle exception
		}
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
