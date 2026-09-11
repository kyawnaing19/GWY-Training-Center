<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatile" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <link rel="stylesheet" href="source/css/style.css">
</head>
<body>
 <!--Navigation-->
<%
String email=(String)session.getAttribute("email");
if(email!=null){
%>
    <nav style="top:0;position:absolute;">
  <div id="logo">
     <img src="source/img/glogo.png" style="width:80px;height:70px;">
     <div id="letter"><h1>GWY Training Centre</h1></div>
    </div>

        <div class="navigation">
        <ul>
          <li><a href="Home.jsp">Home</a></li>
          <li><a href="#course">Courses</a>     
          </li>
          <li><a href="about.jsp">About</a></li>
          <li><a href="#">Contact Us</a></li>
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
     <div id="letter"><h1>Training Centre</h1></div>
    </div>
        <div class="navigation">
        <ul>
          <li><a href="Home.jsp">Home</a></li>
          <li><a href="#course">Courses</a>     
          </li>
          <li><a href="about.jsp">About Us</a></li>
          <li><a href="#">Contact Us</a></li>
          <li><a href="Login.jsp">Login</a></li>
        </ul>
      </div>
      </nav>
     <%} %>
</body>
</html>