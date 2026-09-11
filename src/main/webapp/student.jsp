<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="student.css">
<title>Manage Students</title>
<style>
  @import url('https://fonts.googleapis.com/css2?family=Anton&family=PT+Serif:ital,wght@1,700&display=swap');
</style>
</head>
<body>


 <%@ include file="sidebar.jsp" %>

 <div class="main">
            <h1 style="font-family: 'Anton', sans-serif;
font-family: 'PT Serif', serif;">Manage students</h1>
           
            
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
             			String sql= "select*from student";
             			ResultSet rs=st.executeQuery(sql);              	 
                	 %>   
                	 	<table border=1 width=60% height=20%>
						<tr><th>Student_ID</th>
						<th>Name</th>
						<th>Phone Number</th>
						<th>Email</th>
						<th>Course Name</th>
						<th>Enroll_ID</th></tr>  
                 	  <%
                 	  while (rs.next()) {
				%>
				<tr><td><%=rs.getString(1)%></td>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getString(3)%></td>
				<td><%=rs.getString(4)%></td>
				<td><%=rs.getString(5)%></td>
				<td><%=rs.getString(6) %></td>
             	
             	</tr>
             	
             	<%}}catch (Exception e) {
    				System.out.println(e);
    			} %>
    			</table>
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