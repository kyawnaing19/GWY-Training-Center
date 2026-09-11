<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<style type="text/css">

</style>
</head>
<body>
<%@include file="Nav.jsp" %>

<div id="#payment" style="top:20%;
 background-color: #83a0c9;
left:35%;
width:500px;
height:550px;
position:absolute;
display:block;
border-radius:20px;
border:1px solid red;">

<div  style="margin-top:0;height:70px;width:100%;padding-bottom:10px;">
<h1>Enrollment Success!</h1></div>




<div  style="width:100%;height:200px; line-height:40px;padding:10px;text-align: justify;">

<%Connection con; %>
<% try {
	
	String cid=request.getParameter("cid");
             			Class.forName("com.mysql.jdbc.Driver");
             			System.out.println("Driver Connection OK!");
             			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/gwy","root","root");
             			System.out.print("Connection with Dataabase");
             			PreparedStatement prep=con.prepareStatement("SELECT * FROM course where course_ID='"+cid+"'");
             			
             			ResultSet rs=prep.executeQuery(); 
             			
                	 %>  
       
      <%if(rs.next()){ %>	
      <%int price=Integer.parseInt(rs.getString("course_price"))/2; 
      %>



<p>We will confirm your course enrollment in 24 hours after we received
       your  <b style="color:red;">half pre-paid (<%=price %> MMK)</b>  payment transition.</p> 
       <p>Please deliver the screenshot of your payment transfer  details to 09261740981(viber)</p> 
      <% }} catch (Exception e) {
			System.out.println("Resultset Error : "+e);
		}%>
		
		</div>
<div style="width:300px;height:200px;border:1px solid;margin-left:80px;background-image: url('source/img/kpay.png');background-size: cover;background-repeat: no-repeat;border-radius:15px;"></div>


<div style="right:10px;position: absolute;"><a href="Home.jsp"><button style="border-radius:10px; width:100px; height:50px;"><b>Ok</b></button></a></div>



</div>
</body>
</html>