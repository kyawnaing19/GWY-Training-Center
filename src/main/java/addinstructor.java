

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
@MultipartConfig(
	      fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
	      maxFileSize = 1024 * 1024 * 10,      // 10 MB
	      maxRequestSize = 1024 * 1024 * 100   // 100 MB
	    )

public class addinstructor extends HttpServlet {
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
    
    
    public addinstructor() {
        super();
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		if(request.getParameter("Add").equals("Add")) {
		try {
			Class.forName("com.mysql.jdbc.Driver");

			connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/gwy","root","root");
			System.out.print("Connection with Database");
			
			 PreparedStatement prep=connection.prepareStatement("select * from instructor where instructor_ID=(select max(instructor_ID) from instructor)");
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
		        	rid="I_01";
		        }
		        else{
		        	rid=idIncresement(rid);
		        }
		        
				String name=request.getParameter("name");
				String ph=request.getParameter("ph");
				Part part = request.getPart("img");
				String filename=part.getSubmittedFileName();
				String savepath="C:\\Users\\MCC-DeLL\\Desktop\\GWY(eclipse)\\GoldenWuttyi\\src\\main\\webapp\\Course_img\\"+filename;
				
				part.write(savepath);
				Thread.sleep(2000);
				String degree=request.getParameter("degree");
				String salary=request.getParameter("salary");
			
					try {
						
						String s="insert into instructor values(?,?,?,?,?,?)";
						st=connection.prepareStatement(s);
						st.setString(1, rid);
						st.setString(2, name);
						st.setString(3, ph);
						st.setString(4, filename);
						st.setString(5, degree);
						st.setString(6, salary);
						st.executeUpdate();
						System.out.print("OKOKOK!");
						request.getRequestDispatcher("instructor.jsp").forward(request, response);
					}
					catch (Exception e) {
						System.out.println(e);
					}
					
				

		        
		} catch (Exception e) {
			// TODO: handle exception
		}
		}System.out.println("Driver Connection OK!");
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
