<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="instructor.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<title>Manage Courses</title>
<style>
  @import url('https://fonts.googleapis.com/css2?family=Anton&family=PT+Serif:ital,wght@1,700&display=swap');
</style>
</head>
<body>


 <%@ include file="sidebar.jsp" %>
 

 <div class="main">
            <h1 style="font-family: 'Anton', sans-serif;
font-family: 'PT Serif', serif;">Manage Course</h1>
            <div class="right">
            <div class="toggle-icon">
                            <i class="fas fa-bars"></i>
                        </div>
                        
                       
                        </div>
                        
            
             
              <%Connection con;
                        java.sql.Statement st;
                        %>
                 
                	 <% try {
             			Class.forName("com.mysql.jdbc.Driver");
             			System.out.println("Driver Connection OK!");
             			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/gwy","root","root");
             			System.out.print("Connection with Dataabase");
             			st=con.createStatement();
             			String sql= "select*from course";
             			ResultSet rs=st.executeQuery(sql);              	 
                	 %>   
                	 	<table border=1 width=60% height=20%>
						<tr><th>Course_ID</th>
						<th>Course_Name</th>
						<th>Instructor_ID</th>
						
						<th>Duration</th>
						<th>Course Price</th>
						<th>Location</th>
						<th>Limit Student</th>
						<th>Course Img</th>
						<th>Day</th>
						<th>Class time</th>
						<th>Course Info</th>
						<th colspan="2">Manage</th></tr>  
                 	  <%
                 	  while (rs.next()) {
				%>
				<tr>
				<td><%=rs.getString(1) %></td>
				<td><%=rs.getString(2) %></td>
				<td><%=rs.getString(3) %></td>
				
				<td><%=rs.getString(4) %></td>
				<td><%=rs.getString(5) %></td>
				<td><%=rs.getString(6) %></td>
				<td><%=rs.getString(7) %></td>
				<td><img src="Course_img/<%=rs.getString("course_img") %>" style="width:200px;height:100px;"></td>
				<td><%=rs.getString(9) %></td>
				<td><%=rs.getString(10) %></td>
				<td><textarea rows="5" cols="50"><%=rs.getString(11) %></textarea></td>
             	
             	<td><a class="mbtn1" style="width: 70px; height: 30px;  background-color: transparent;padding: 5px 20px 5px 20px;border-radius: 5px;" href="course.jsp?cid=<%=rs.getString(1)%>&name=<%=rs.getString(2)%>&iid=<%=rs.getString(3)%>&duration=<%=rs.getString(4)%>&price=<%=rs.getString(5)%>&location=<%=rs.getString(6)%>&limit=<%=rs.getString(7)%>&img=<%=rs.getString(8)%>&day=<%=rs.getString(9)%>&time=<%=rs.getString(10)%>&info=<%=rs.getString(11)%>">
             	<span class="material-symbols-outlined" style="color:blue;">
save_as
</span></a></td><td>
             	<a class="mbtn2" style="width: 70px; height: 30px; background-color: transparent;padding: 5px 20px 5px 20px; border-radius: 5px;"  href="deletecourse?tId=<%=rs.getString(1)%>"><span class="material-symbols-outlined" style="color:red;">
delete
</span></a></td></tr>
             	
             	<%}}catch (Exception e) {
    				System.out.println(e);
    			} %>
    			</table>
    			
    			
    			<%@ include file="addcourse.jsp" %>
    			<%@ include file="updatecourse.jsp" %>
             
             <footer>
                <div class="copyright">
                    copyright &copy; 2022. all right reserved.
                </div>
            </footer>
</div>

<div class="switcher-container">
        <div class="switcher-icon">
            <i class="fas fa-cog"></i>
        </div>
        <div class="switcher-close">
            <i class="fas fa-times"></i>
        </div>
        <div class="switcher-header">
            <h3>theme customizer</h3>
            <h4>theme styles</h4>
        </div>
        <div class="switcher-body">
            <ul>
                <li data-color="#f7f7f7" class="active"></li>
                <li data-color="#212529"></li>
            </ul>
        </div>
    </div>
    <a href="#top" class="scroll-top">
        <i class="fas fa-arrow-up"></i>
    </a>
    <script src="main.js"></script>
    <script src="https://kit.fontawesome.com/9e5ba2e3f5.js" crossorigin="anonymous"></script>
</body>
</html>