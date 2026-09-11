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
<title>Insert title here</title>
</head>
<body>


 <%@ include file="sidebar.jsp" %>

 <div class="main">
            <h1>Manage Time-Table</h1>
            <div class="right">
            <div class="toggle-icon">
                            <i class="fas fa-bars"></i>
                        </div>
                        <input type="text" placeholder="Search...">
                         <i class="fas fa-search"></i>&nbsp&nbsp&nbsp&nbsp
                          <button style="width: 60px;
	height: 30px;
	width:100px;
	border-radius:10px;
	background-color:#047386;
	font-size: 1.2em;
	color: white;
	margin-right: 60px;">Add</button>
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
             			String sql= "select*from time_table";
             			ResultSet rs=st.executeQuery(sql);              	 
                	 %>   
                	 	<table border=1 width=60% height=20%>
						<tr><th>Day_ID</th><th> Day Name</th><th>Class Time</th><th colspan="2">Manage</th></tr>  
                 	  <%
                 	  while (rs.next()) {
				%>
				<tr><td><%=rs.getString(1)%></td>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getString(3)%></td>
             	
             	<td><button class="mbtn1" style="width: 70px; height: 30px;  background-color: skyblue;padding: 5px 20px 5px 20px;border-radius: 5px;">Edit</button></td><td>
             	<a class="mbtn2" style="width: 70px; height: 30px; background-color: skyblue;padding: 5px 20px 5px 20px; border-radius: 5px;" href="deletetime?tId=<%=rs.getString(1)%>">Delete</a></td></tr>
             	
             	<%}}catch (Exception e) {
    				System.out.println(e);
    			} %>
    			</table>
    			
    			
    			<%@ include file="addtimetable.jsp" %>
    			<%@ include file="updatetime.jsp" %>
    			
             
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