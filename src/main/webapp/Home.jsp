<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatile" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Course Registration Management</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <link rel="stylesheet" href="source/css/style.css">
    
  </head>
  <body>
  
  <%
if(session.getAttribute("full")!=null){
	%>
	<div class="alert" style="position: absolute; background-color: gold; margin-top: 100px;
	width: 100%;height:80px;padding:30px;text-align: center;font-size:1.2em; 
	"><%=session.getAttribute("full") %>
	<%session.setAttribute("full", null); %></div>
	<%
}
%>

  <%
if(session.getAttribute("limit")!=null){
	%>
	<div class="alert" style="position: absolute; background-color: gold; margin-top: 100px;
	width: 100%;height:80px;padding:30px;text-align: center;font-size:1.2em; 
	"><%=session.getAttribute("limit") %>
	<%session.setAttribute("limit", null); %></div>
	<%
}
%>
  
    <!--Navigation-->
   <%
String email=(String)session.getAttribute("email");
if(email!=null){
%>
    <nav>
  <div id="logo">
     <img src="source\img\glogo.png" style="width:80px;height:70px;">
     <div id="letter"><h1>GWY Training Centre</h1></div>
    </div>

        <div class="navigation">
        <ul>
          <li><a href="#home">Home</a></li>
          <li><a href="#course">Courses</a>     
          </li>
          <li><a href="about.jsp">About </a></li>
          <li><a href="#contact1">Contact Us</a></li>
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
</body>
   
          <!--Home-->
      <section id="home" style="background-image:url('source/img/pngwing32.com.png');background-size:cover;">
        <h2 style="padding-bottom: 50px;">Enhance Your Future with GWY</h2>
         <div class="btn">
          <a class="blue" href="about.jsp">Learn More</a>
         <a class="blue" href="#course">Visit Courses</a>
         </div>
      </section>
      <!--Courses-->
       <section id="course">
        <div id="contain">
      
      
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
             			PreparedStatement prep=con.prepareStatement("SELECT * FROM instructor join course where course.instructor_ID=instructor.instructor_ID");
             			ResultSet rs=st.executeQuery(sql);  
             			ResultSet rs1=prep.executeQuery();
                	 %> 
                	
                	 <div id="row"> 
                	   <%
                 	  while (rs.next()) {
				%>
         				<div id="card" style="background-image:url('source/img/pngwing6.com.png');">
         		
         		<div id="photoandinfo">		
         		
         		
         		<div id="photoandtable">
         		<div id="cname"><h3><%=rs.getString("course_name") %></h3><br></div>
              <div id="photo"><img src="Course_img/<%=rs.getString("course_img") %>" ></div>
              
              
              <div id="box">
              
              <h3>Course Information</h3>
      <table>	
      	<tr>
      	<td>Student limit:</td><td>Course Duration:</td></tr>
      	<tr><td><input value="<%=rs.getString("limit_student")+" persons" %>" name="course"   readonly="readonly"></td>
      	<td><input value="<%=rs.getString("duration") %>" name="duration"   readonly="readonly"></td></tr>
      	
      	
		<tr><td>Day:</td><td>Class Time:</td></tr>
		<tr> <td><input value="<%=rs.getString("day") %>" name="day"   readonly="readonly"></td>
		<td><input value="<%=rs.getString("time") %>" name="time"   readonly="readonly"></td></tr>
		
		
		<tr><td>Course Fees:</td><td>Instructor Name:</td></tr>
		
		<tr><td id="p"><input value="<%=rs.getString("course_price") %>" name="price" readonly="readonly" ></td>
		
       
         
         
<% if(rs1.next()){%>
<td><input value="<%=rs1.getString("name") %>(<%=rs1.getString("degree") %>)"readonly="readonly"></td></tr>
<%
}
		%>    
              
              </table>
              </div>
              
              
              
              
              </div>
                <% String info=rs.getString("info"); %>
              <div id="info">
              
             <h2 style="width:300px;height:50px;background-color: #000068;text-align: center;padding:10px;">Course Description</h2><br>
              <% try {
             			Class.forName("com.mysql.jdbc.Driver");
             			System.out.println("Driver Connection OK!");
             			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/gwy","root","root");
             			System.out.print("Connection with Dataabase");
             			st=con.createStatement();
             			String sql1= "select*from course";
             			
             			ResultSet rs2=st.executeQuery(sql1); %>
             			<%if(rs2.next()){ %>
             <p><%=info %></p><br>
               <a href="cvform1.jsp?tId=<%=rs.getString("course_ID")%>">Enroll Now</a>
             </div>
             
              <%
}
		} catch (Exception e) {
			System.out.println("Resultset Error : "+e);
		}%>  
              </div><br><br><br><br><br>
  </div>
             

       
          <%
                 	  }}  catch (Exception e) {
    				System.out.println(e);
    			} %>
       
       	
             
             </div> 
            
           
       </div>
        </section>
        
        
        
        <!-- about us -->
        <div id="about" class="about">
        <div class="contain1" id="contain1">
          <h1>Our Team Members</h1>
          <div class="row1">
          
          
            <div class="card1" >
              <img src="source/img/wy.jpg" alt="*">
              <h2  style="color:black;"> Shwe Wutt Yi Thin </h2><br>
              <p class="role">UCSTT(18-19)-048</p>
              <p>wuttyithin777@gmail.com</p>
              <a href="tel:+880123456789">Call</a>
            </div>
            
            <div class="card1" >
              <img src="source/img/kyawnaing.jpg" alt="*">
              <h2 style="color:black;">Kyaw Kyaw Naing</h2><br>
              <p class="role">UCSTT(19-20)-110</p>
              <p>kyawnaing22@gmail.com</p>
              <a href="tel:+880123456789">Call</a>
            </div>
            
            <div class="card1">
              <img src="source/img/hnl.jpg" alt="*">
              <h2 style="color:black;">Htoo Nay Lin</h2><br>
              <p class="role">UCSTT(19-20)-022</p>
              <p>htoonaylin022@gmail.com</p>
              <a href="tel:+880123456789">Call</a>
            </div>

            <div class="card1">
                <img src="source/img/linhtut.jpg" alt="*">
                <h2 style="color:black;">Lin Htut Win</h2><br>
                <p class="role">UCSTT(19-20)-068</p>
                <p>linhtwin25143@gmail.com</p>
                <a href="tel:+880123456789">Call</a>
              </div>

        </div>
        </div>
        
    </div>
  
      <%@ include file="contact.jsp" %>
      
     
   <footer>
        <p>&copy; 2023 GWY Training Centre</p>
    </footer>
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