<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
 <style type="text/css">
 
 
 
 
 /* Contact */

#contact {
  background-color: #ffdde6;
  padding: 60px 0;
  
 
}

.contact-content {
  max-width: 1200px;
  margin: 0 auto;
}

.developer-team {
	margin-left:150px;
  paddind-left:50px;
  padding: 20px;
  background-color: #ffffff;
  border-radius: 10px;
  box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
   top:1400px;
  position:absolute;
}
.row{
paddidding:50px;
margin-left:50px;
display:flex;
flex-wrap:wrap;
width:1350px;
gap:50px;
}
.team-card {
border:1px solid;
  text-align: center;
  padding: 20px;
  border-radius: 10px;
  box-shadow: 0 3px 6px rgba(0, 0, 0, 0.1);
  transition: transform 0.2s ease;
}

.team-card:hover {
  transform: translateY(-5px);
}

.team-card img {
  max-width: 100%;

  border-radius: 50%;
}

.team-card h5 {
  margin-top: 10px;
  font-size: 1.2em;
  color: #333;
}

.team-card p {
  margin: 5px 0;
  color: #777;
}

.team-card ul {
  list-style: none;
  padding: 0;
  margin: 0;
  color: #555;
}

.contact-content {
  display: flex;

  

  justify-content: space-between;
  max-width: 1200px;
  margin: 0 auto;
}

.developer-team,
.address,
.feedback-form {
  flex: 1;
  margin: 15px;
  padding: 20px;
  background-color: #ffffff;
  border-radius: 10px;
  box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
  text-align: center;
  overflow: hidden; /* Hide any overflow content */
}

.address .map-container {
  margin-bottom: 15px;
  height: 400px; /* Limit the map container's height */
  overflow: hidden; /* Hide any map overflow */
}

.address iframe {
  width: 100%;
  height: 100%; /* Use the full available height */
  border: none; /* Remove the border */
}

.feedback-form form {
  margin-top: 15px;
  display: block;
}

.feedback-form label,
.feedback-form textarea,
.feedback-form input,
.feedback-form button {
  display: inline-block;
  width: 100%;
  margin-bottom: 10px;
  text-align: left;
}

.feedback-form textarea,
.feedback-form input {
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 5px;
  width: 100%; /* Use the full available width */
  box-sizing: border-box; /* Include padding and border in width calculation */
}

.feedback-form button {
  background-color: #3498db;
  color: #ffffff;
  border: none;
  padding: 10px 15px;
  cursor: pointer;
  transition: background-color 0.3s ease;
}

.feedback-form button:hover {
  background-color: #2980b9;
}
 
 #courseabout{
 margin-left:100px;
 
 width:100%;
 height:auto;
 top:600px;
 position:absolute;
 
 }
 footer{
 position: absolute;
 }
 
 
 </style>
<meta charset="UTF-8">
<title>Java Beginner Class</title>
 <link rel="stylesheet" href="about.css">
 <link rel="stylesheet" href="source/css/style.css">
</head>
<body style="background-color: #474e5d;">
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
          <li><a href="Home.jsp">Home</a></li>
          <li><a href="Home.jsp">Courses</a>     
          </li>
          <li><a href="#">About </a></li>
          <li><a href="Home.jsp">Contact Us</a></li>
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
     <img src="source\img\glogo.png" style="width:80px;height:70px;">
     <div id="letter"><h1>GWY Training Centre</h1></div>
    </div>
        <div class="navigation">
        <ul>
          <li><a href="Home.jsp">Home</a></li>
          <li><a href="Home.jsp">Courses</a>     
          </li>
          <li><a href="#">About </a></li>
          <li><a href="Home.jsp">Contact Us</a></li>
          <li><a href="Login.jsp">Login</a></li>
        </ul>
      </div>
      </nav>
     <%} %>
      
      <!-- Content -->
      
       <div id="content" style="background-image: url('source/img/php1.png');">
       <div id="d1">
       <div id="dlogo">
       <img id="ll" src="source/img/glogo.png">       
       </div>
      <div id="dletter"> <h2>GOLDEN WUTTYI TRAINING CENTER </h2>
      </div>
       
       </div>
       
       <h1 style="color:#fff"></h1>
       
      
       </div>
       
        </div>
        <p style="color:white;">         
 <br><br><br>
 <div id="courseabout">
 
 <p style="font-size:1.2em;color:skyblue;line-height:45px">
 GWY Training Center is not just a place to learn; <br>
 it's an environment where students thrive, driven by exceptional instructors and 
 captivating courses that make the learning experience truly enjoyable.<br>
 We offer a comprehensive range of courses, workshops, and resources designed to cater 
 to both beginners and experienced programmers.<br> Students at our institute 
 learn how to code, debug, and optimize software, gaining proficiency in languages 
 like Java, PhP, and more.<br><br>


Our institute also staffed with expert instructors who bring real-world experience
to the classroom, <br>helping students grasp the intricacies of various programming languages
and frameworks.<br> Hands-on projects, assignments, and coding challenges are 
integral parts of the learning process, <br>allowing students to apply what they've learned 
in practical scenarios. <br><br>


GWY Training Center is more than just a place 
to acquire technical skills; <br>it's an institution that fosters a love for programming, 
nurtures talent, and creates a supportive community of tech enthusiasts. <br>
The combination of expert instructors, interactive courses,<br> and a commitment 
to staying at the forefront of technology makes these institutes a hub of both education 
and entertainment for aspiring programmers.<br><br></p>

 <p style="font-size:1.2em;color:skyblue;line-height:45px; 
 border:1.5px solid white;width:55%;padding-left:15px;background-color:black;">
<b>Notes:You have to half prepaid the price of course that you enrolled in 24Hours. </b></p>


 
 </div>
 
<div class="developer-team">
      <h1>Course Instructor</h1>
      <%Connection con;
                        java.sql.Statement st;
                        %>
                 
                	 <% try {
             			Class.forName("com.mysql.jdbc.Driver");
             			System.out.println("Driver Connection OK!");
             			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/gwy","root","root");
             			System.out.print("Connection with Dataabase");
             			st=con.createStatement();
             			String sql= "select*from instructor";
             			ResultSet rs=st.executeQuery(sql);  
             			
                	 %> 
      
      <div class="row">
       <%
                 	  while (rs.next()) {
				%>
        <div class="col-md-6 col-lg-4">
          <div class="team-card">
            <img src="Course_img/<%=rs.getString("image") %>"  style="height:14vw; 
           width:13vw;">
            <div class="card-body">
              <h5 class="card-title"><%=rs.getString("name") %></h5>
              
              <ul class="list-unstyled">
                <li><strong>Degree:</strong> <%=rs.getString("degree") %></li>
                <li><strong>Phone Number:</strong><%=rs.getString("ph_no") %></li>
              </ul>
            </div>
          </div>
          </div>
          
         <% } } catch (Exception e) {
			System.out.println("Resultset Error : "+e);
		}%> 
          
          
        </div></div>

</div>




            
            <footer style="margin-top:1900px;">
        <p>&copy; 2023 GWY Training Centre</p>
    </footer>
           
</body>
</html>
