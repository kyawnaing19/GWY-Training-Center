

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
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


public class feedback extends HttpServlet {
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
    
    
    public feedback() {
        super();
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		
		try {
			Class.forName("com.mysql.jdbc.Driver");

			connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/gwy","root","root");
			System.out.print("Connection with Database");
			
			 PreparedStatement prep=connection.prepareStatement("select * from feedback where feedback_ID=(select max(feedback_ID) from feedback)");
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
		        	rid="F_001";
		        }
		        else{
		        	rid=idIncresement(rid);
		        }
		        
				String name=request.getParameter("name");
				String email=request.getParameter("email");
				
				String comment=request.getParameter("feedback");
				
			
					try {
						
						String s="insert into feedback values(?,?,?,?)";
						st=connection.prepareStatement(s);
						st.setString(1, rid);
						st.setString(2, name);
						st.setString(3, email);
						st.setString(4, comment);
						st.executeUpdate();
						System.out.print("OKOKOK!");
						request.getRequestDispatcher("Home.jsp").forward(request, response);
					}
					catch (Exception e) {
						System.out.println(e);
					}
					
				

		        
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
