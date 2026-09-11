<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>


<meta charset="ISO-8859-1">
<title>Enrollment Form</title>

 <link rel="stylesheet" href="css/bootstrap.css"></link>
<style>
    body{
        background-color: ;
        font-size: 1.3em;
    }
    * {
    margin: 20px;
    padding: 0;
    box-sizing: border-box;
    font-family: "Time New Roman", sans-serif;
}

#cvform{
margin-left:450px;
margin-top: 120px;
padding-right:50px;


}
td{
 color:black;
margin-left:50px;
}

    td input{
        width:280px;
        height:30px;
        font-size: 0.8em;
        
    }
      select{
        width:300px;
        height:30px;
        font-size: 0.8em;
    
    
    }
    form{
        background-color: #fff;
        border-radius: 10px;
        max-height: 800px;
        width:600px;
        margin-top: 50px;
        
      
    }
    h2{
        margin-top: 20%;
        margin-bottom: 10px;
       
    }
     
   .b1{
    width:150px;
    height:40px;
    color:white;
    border-radius: 15px;
    background-color: black;
   } 
   
   
   #kpay img {
   width:100%;
   height:300px;
   
   }
   
</style>

    <link rel="stylesheet" href="source/css/style.css">
</head>
<body>


<%
String email=(String)session.getAttribute("email");
if(email!=null){
%>
    <nav style="top:0; position: absolute;">
  <div id="logo">
     <img src="source\img\glogo.png" style="width:80px;height:70px;">
     <div id="letter"><h1 style="font-size:1.15em;"><b>GWY Training Centre</h1></div>
    </div>

        <div class="navigation">
        <ul>
          <li><a href="#home">Home</a></li>
          <li><a href="#course">Courses</a>     
          </li>
          <li><a href="about.jsp">About </a></li>
          <li><a href="#contact">Contact Us</a></li>
          <li><a href="myacc.jsp">My Account</a></li>
          <li><a href="logout.jsp">Logout</a></li>
        </ul>
      </div>
      </nav>
<%
}else{
%>
 <nav>
  <div id="logo">
     <img src="source/img/glogo.png" style="width:80px;height:70px;">
     <div id="letter"><h1>GWY Training Centre</h1></div>
    </div>
        <div class="navigation">
        <ul>
          <li><a href="#home">Home</a></li>
          <li><a href="#course">Courses</a>     
          </li>
          <li><a href="about.jsp">About </a></li>
          <li><a href="#contact1">Contact Us</a></li>
          <li><a href="Login.jsp">Login</a></li>
        </ul>
      </div>
      </nav>
     <%} %>





<%

	Connection con;

String email1=(String)session.getAttribute("email");
if(email1!=null){
	
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		System.out.println("Driver Connection OK!");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/gwy","root","root");
		System.out.print("Connection with Database");
		PreparedStatement prep1=con.prepareStatement("select * from register where email='"+email+"'");
		
		
		try {
			ResultSet rs1=prep1.executeQuery();
			
			
			
			if(rs1.next()){
				%>
			
		<div id="cvform" >
		<form>
		<center><h2 style="color: black;">Enrollment Form</h2></center>
		<center>
		<table>

		<tr><td>Name:</td><td><input value="<%=rs1.getString("name") %>"  readonly="readonly" name="name"></td></tr>
		<tr><td>Email:</td><td><input value="<%=rs1.getString("email") %>"  readonly="readonly" name="email"></td></tr>
		<tr><td>Phone No:</td><td><input value="<%=rs1.getString("ph_no") %>"  readonly="readonly"></td></tr>
		<input type="hidden" value="<%=rs1.getString("reg_ID") %>" name="regid">
	<%}
                	 }catch (Exception e) {
         				System.out.println(e);
         			} %>
         			<%
                	 }catch (Exception e) {
         				System.out.println(e);
         			} %>
         			
         			 <% try {
             			Class.forName("com.mysql.jdbc.Driver");
             			System.out.println("Driver Connection OK!");
             			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/gwy","root","root");
             			System.out.print("Connection with Dataabase");
             			PreparedStatement prep=con.prepareStatement("SELECT * FROM course where course_ID=?");
             			prep.setString(1, request.getParameter("tId"));
             			ResultSet rs=prep.executeQuery(); 
             			
                	 %>  
       
      <%if(rs.next()){ %>	
      	<tr><td>Course Name:</td><td><input value="<%=rs.getString("course_name") %>" name="course1"   readonly="readonly"></td></tr>
		<tr><td>Course Duration:</td><td><input value="<%=rs.getString("duration") %>" name="duration"   readonly="readonly"></td></tr>
		<tr><td>Day:</td><td><input value="<%=rs.getString("day") %>" name="day"   readonly="readonly"></td></tr>
		<tr><td>Class Time:</td><td><input value="<%=rs.getString("time") %>" name="time"   readonly="readonly"></td></tr>
	    <tr><td>Course Fees:</td><td id="p"><input value="<%=rs.getString("course_price") %>" name="price" readonly="readonly" ></td></tr>
	    <input type="hidden" value="<%=rs.getString("course_ID") %>" name="cid">
	    
<% 		
		
	}} catch (Exception e) {
		System.out.println("Driver Error : "+e);
	}
	

%>

<% try {
             			Class.forName("com.mysql.jdbc.Driver");
             			System.out.println("Driver Connection OK!");
             			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/gwy","root","root");
             			System.out.print("Connection with Dataabase");
             			
             			PreparedStatement prep=con.prepareStatement("SELECT * FROM instructor join course where course.instructor_ID=instructor.instructor_ID and course_ID=?");
             			prep.setString(1, request.getParameter("tId"));
             			ResultSet rs=prep.executeQuery(); 
             			
                	 %>  
<% if(rs.next()){%>
<tr><td>Instructor Name:</td><td><input value="<%=rs.getString("name") %>(<%=rs.getString("degree") %>)" disabled="disabled"></td></tr>
<tr><td colspan="2"><p style="font-size:0.7em;color:red;">Notes:You must transfer half of the course price to confirm your enrollment.</p></td></tr>
<%
}
		} catch (Exception e) {
			System.out.println("Resultset Error : "+e);
		}%>
<tr>
<td><center><button class="b1" name="Enroll" type="submit" formaction="Home.jsp">Not Now</button></center></td>
<td><center>

<button  class="btn b1" data-bs-toggle="modal" data-bs-target="#exampleModal"   name="Enroll" value="Enroll" type="submit" formaction="cvform">
  Enroll
</button></center></td></tr>
</table>
</center>
</form>
</div>
<%}else{
	response.sendRedirect("Login.jsp");
}
	%>

<!-- Button trigger modal -->

<%-- 
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true"  style="background-color:s;">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header" style="color:black;background-color:skyblue;">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Gwy Training Centre</h1>
        
      </div>
      <% try {
             			Class.forName("com.mysql.jdbc.Driver");
             			System.out.println("Driver Connection OK!");
             			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/gwy","root","root");
             			System.out.print("Connection with Dataabase");
             			PreparedStatement prep=con.prepareStatement("SELECT * FROM course where course_ID=?");
             			prep.setString(1, request.getParameter("tId"));
             			ResultSet rs=prep.executeQuery(); 
             			
                	 %>  
       
      <%if(rs.next()){ %>	
      <%int price=Integer.parseInt(rs.getString("course_price"))/2; 
      %>
      <p>We will confirm your course enrollment in 24 hours after we received
       your half pre-paid (<%=price%> MMK) payment transition</p> 
       <p>Please deliver the screenshot of your payment transfer  details to 09------ (viber)</p> 
       <%
}
		} catch (Exception e) {
			System.out.println("Resultset Error : "+e);
		}%>
      <div class="modal-body">
        <div id="kpay" style="border:1px solid ;background-size:cover;width:80%;height:300px;background-image:url('source/img/kkpay.jpg');">
       
        </div>
        
        
        
      </div>
      <div class="modal-footer">
        
        <button type="button" class="btn b1" style="color:black"><a href="Home.jsp">OK</a></button>
      </div>
    </div>
  </div>
</div>



<script src="js/bootstrap.min.js"></script>
<script src="js/bootstrap.bundle.js"></script> --%>
</body>
</html>