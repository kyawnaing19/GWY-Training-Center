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
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<title>Manage Enrollment</title>
<style>
  @import url('https://fonts.googleapis.com/css2?family=Anton&family=PT+Serif:ital,wght@1,700&display=swap');
</style>
</head>
<body>


 <%@ include file="sidebar.jsp" %>

 <div class="main">
            <h1 style="font-family: 'Anton', sans-serif;
font-family: 'PT Serif', serif;">Manage Enrollment</h1>
           
            
            <div class="right">
            <div class="toggle-icon">
                            <i class="fas fa-bars"></i>
                        </div>
                       
                           
                        </div>
                        
                        
     <%
if(session.getAttribute("limit")!=null){
	%>
	<div class="alert" style="position: absolute; background-color: gold; margin-top: 70px;
	width: 80%;height:80px;padding:30px;text-align: center;font-size:2em;padding-right:50px; 
	"><%=session.getAttribute("limit") %>
	<%session.setAttribute("limit", null); %></div>
	<%
}
%>
 

                       
                        
            <%Connection con;
                        java.sql.Statement st;
                        %>
                 
                	 <% try {
             			Class.forName("com.mysql.jdbc.Driver");
             			System.out.println("Driver Connection OK!");
             			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/gwy","root","root");
             			System.out.print("Connection with Dataabase");
             			st=con.createStatement();
             			String sql= "select*from enrollment";
             			ResultSet rs=st.executeQuery(sql);              	 
                	 %>   
                	 	<table border=1 width=60% height=20%>
						<tr><th>enroll_ID</th>
						<th>Student Name</th>
						<th>Course_ID</th>
						<th>Course Name</th>
						
						<th>Enroll Date</th>
						<th>Register_ID</th>
						<th colspan="2">Manage</th></tr>  
                 	  <%
                 	  while (rs.next()) {
				%>
				<tr><td><%=rs.getString(1)%></td>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getString(3)%></td>
				<td><%=rs.getString(4)%></td>
				<td><%=rs.getString(5) %></td>
				<td><%=rs.getString(6)%></td>
				
             	
             	<td><% if(rs.getString("status")==null){
             		%>
             		<button  style="background-color: transparent;border:none;"><a class="mbtn1"  style="width: 70px; height: 30px;  background-color: transparent; padding: 5px 20px 5px 20px;border-radius: 5px;"href="confirm?enrollid=<%=rs.getString(1)%>&regid=<%=rs.getString(6) %>&coursename=<%=rs.getString(4) %>" ><span class="material-symbols-outlined" style="color:blue;">
select_check_box
</span></a></button><%
             	}else{
             		%>
             		Confirmed
             		<%
             	} %></td><td>
             	<a class="mbtn2" style="width: 70px; height: 30px; background-color: transparent;padding: 5px 20px 5px 20px; border-radius: 5px;" href="deleteenroll?instId=<%=rs.getString(1)%>" ><span class="material-symbols-outlined" style="color:red;">
delete
</span></a></td></tr>
             	
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
    <script type="text/javascript">
    function fun(){
    	alert("ok");
    	let btn5=document.getElementById("#btn5");
    	btn5.disabled=true;
    }
    
    </script>
    <script src="main.js"></script>
    <script src="https://kit.fontawesome.com/9e5ba2e3f5.js" crossorigin="anonymous"></script>
     <script src="bootstrap/js/jquery.js"></script>
<script src="bootstrap/js/bootstrap.js"></script>
 <script>
    $(function(){
      setTimeout(function(){
          $(".alert").fadeOut();
        }, 2000)
    })
</script>
</body>
</html>