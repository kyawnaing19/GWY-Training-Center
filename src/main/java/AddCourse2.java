

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
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
/**
 * Servlet implementation class AddCourse2
 */
public class AddCourse2 extends HttpServlet {
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
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCourse2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		 String rid=null;
			try {
				Class.forName("com.mysql.jdbc.Driver");

				connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/gwy","root","root");
				System.out.print("Connection with Database");
				
				 PreparedStatement prep=connection.prepareStatement("select * from course where course_ID=(select max(course_ID) from course)");
			       
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
			        	rid="C_01";
			        }
			        else{
			        	rid=idIncresement(rid);
			        }
			        
					
		          
				
						
						
					

			        
			} catch (Exception e) {
				// TODO: handle exception
			}
			
			String name=request.getParameter("name");
			String iid=request.getParameter("iid");				
			System.out.println(name);
			String duration=request.getParameter("duration");
			String price=request.getParameter("price");
			String location=request.getParameter("location");
			String stu=request.getParameter("stu");
			Part part = request.getPart("img");
			String filename=part.getSubmittedFileName();
			String savepath="C:\\Users\\MCC-DeLL\\Desktop\\GWY(eclipse)\\GoldenWuttyi\\src\\main\\webapp\\Course_img\\"+filename;
			
			part.write(savepath);
			try {
				Thread.sleep(2000);
			} catch (InterruptedException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			String day=request.getParameter("day");
			String time=request.getParameter("time");
			String info=request.getParameter("info");
			
			try {
				
				String s="insert into course values(?,?,?,?,?,?,?,?,?,?,?)";
				st=connection.prepareStatement(s);
				st.setString(1, rid);
				st.setString(2, name);
				st.setString(3, iid);						
				st.setString(4, duration);
				st.setString(5, price);
				st.setString(6, location);
				st.setString(7, stu);
				st.setString(8, filename);
				st.setString(9, day);
				st.setString(10, time);
				st.setString(11, info);
				
				st.executeUpdate();
				System.out.print("OKOKOK!");
				request.getRequestDispatcher("course.jsp").forward(request, response);
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
