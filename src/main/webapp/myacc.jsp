<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Account</title>
    <link rel="stylesheet" href="source\css\myacc.css">
</head>
<body>
<%@include file="Nav.jsp" %>

<%

	Connection con;

java.sql.Statement st;
	String email1=(String) session.getAttribute("email");
	if(email1!=null){
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		System.out.println("Driver Connection OK!");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/gwy","root","root");
		System.out.print("Connection with Database");
		PreparedStatement prep1=con.prepareStatement("select * from register where email='"+email+"'");
		
		
		try {
			ResultSet rs1=prep1.executeQuery();
			
			
		
			%>
			
			
		

    <div class="container">
        <form class="info" >
            <h1>My Account</h1>
          <% if(rs1.next()){
				%>
            <table >
            <div class="form-group">
                <tr><td>Name</td>
               <td><input value="<%=rs1.getString("name") %>" id="full-name" name="name" readonly="readonly"></td>
               </tr>
            </div>
            <div class="form-group">
            <tr>
                <td>Email</td>
                <td><input value="<%=rs1.getString("email") %>" id="email" name="email" readonly="readonly"></td>
                </tr>
            </div>
            <div class="form-group">
               <tr><td> Phone Number</td>
                <td><input value="<%=rs1.getString("ph_no") %>" id="ph" name="ph" readonly="readonly"></td></tr>
            </div>
          
            
           </table>
           <%} %>
           <%  } catch (Exception e) {
		System.out.println("Driver Error : "+e);
	}%>
            <br><b><h2 style="color:black;">History</h2></b>
         <% try {
             			Class.forName("com.mysql.jdbc.Driver");
             			System.out.println("Driver Connection OK!");
             			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/gwy","root","root");
             			System.out.print("Connection with Dataabase");
             			st=con.createStatement();
             			System.out.println(email);
             			
             			           
						String sql1="select * from register where email='"+email+"'";
						ResultSet rs3=st.executeQuery(sql1);
						String reg_id=null;
						if(rs3.next())
							reg_id=rs3.getString("reg_ID");
		System.out.print(reg_id);
						
						String sql= "select * from student natural join enrollment where email='"+email+"'";
						String sql2="SELECT * FROM enrollment where reg_ID='"+reg_id+"' and status is null";
		ResultSet rs2=st.executeQuery(sql);   
		%>
		
		<table>
		<tr><td><b>Course Name</td><td><b>Enrollment Date</td><td><b>Status</td></tr>
		<tr><td></td><td></td><td></td></tr>
		
		<%while(rs2.next()){
			System.out.print("ok");
			%>
		
		<tr><td><%=rs2.getString("course_name") %></td><td><%=rs2.getString("enroll_date") %></td>
		<td>Confirmed</td></tr><tr><td></td><td></td><td></td></tr>
		<%  
		
		
		}
		ResultSet rs4=st.executeQuery(sql2);
		while(rs4.next()){
			%>
			<tr><td><%=rs4.getString("course_name") %></td><td><%=rs4.getString("enroll_date") %></td>
		<td>Pending</td></tr>
			<%
		}
         
         } catch (Exception e) {
		System.out.println("Driver Error : "+e);
	}%>
		</table>
		
        </form>
    </div>
   
	<%  } catch (Exception e) {
		System.out.println("Driver Error : "+e);
	}}%>
</body>
</html>
