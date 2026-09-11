<!DOCTYPE html>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <title>Admin Dashboard</title>
    <style>
  @import url('https://fonts.googleapis.com/css2?family=PT+Serif:ital,wght@1,700&display=swap');
</style>
</head>

<body>
    <div class="container" id="top">
        <aside class="sidebar-wrapper">
            <div class="sidebar-header">
                <img src="source\img\glogo.png" alt="Logo">
                 <h5 style="font-size:1.5em;"><b>GWY Training Center</b></h5>
                <div class="close-menu">
                    <i class="fas fa-chevron-left"></i>
                </div>
            </div>
            <nav>
                <ul>
                    <li><a href="adminui.jsp">
                            <i class="fas fa-home"></i>
                            <div class="title">dashboard</div>
                        </a></li>
                        <li><a href="user.jsp">
                            <i class="fas fa-users"></i>
                            <div class="title">Users</div>
                        </a></li>
                    <li><a href="student.jsp">
                            <i class="fas fa-users"></i>
                            <div class="title">Students</div>
                        </a></li>
                        <li><a href="enroll.jsp">
                            <i class="fas fa-light fa-address-book"></i>
                            <div class="title">Enrollment</div>
                        </a></li>
                    <li><a href="instructor.jsp">
                            <i class="fas fa-light fa-chalkboard-user"></i>
                            <div class="title">Instructors</div>
                        </a></li>
                    <li><a href="course.jsp">
                            <i class="fas fa-tasks"></i>
                            <div class="title">Courses</div>
                        </a></li>
                        <li><a href="feedback.jsp">
                            <i class="fa-regular fa-envelope"></i>
                            <div class="title">View Feedback</div>
                        </a></li>
                                            
                    <li><a href="adminlogin.jsp">
                         <i class="fa-solid fa-right-from-bracket"></i>
                            <div class="title">Logout</div>
                        </a></li>
                </ul>
            </nav>
        </aside>
        <main class="content">
            <header>
                <div class="header-wrapper">
                    <div class="header-left">
                        <div class="toggle-icon">
                            <i class="fas fa-bars"></i>
                        </div>
                      <h1 style="font-family: 'PT Serif', serif;">GOLDEN WUTTYI Training Center</h1> 
                    </div>
                    
                </div>
            </header>
            <section class="main">
                
                <div class="box box-2">
                    <div class="box-details">
                    <%Connection con;
                        java.sql.Statement st;
                        %>
                 
                	 <% try {
             			Class.forName("com.mysql.jdbc.Driver");
             			System.out.println("Driver Connection OK!");
             			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/gwy","root","root");
             			System.out.print("Connection with Dataabase");
             			st=con.createStatement();
             			String sql= "select count(student_ID) count from student";
             			ResultSet rs=st.executeQuery(sql);
             			
             			
             		while(rs.next()){
             			%>
                        <h4><%=rs.getString("count") %></h4>
                        <%}}catch (Exception e) {
    				System.out.println(e);
    			} %>
                        <span>Students</span>
                    </div>
                    <div class="box-icon">
                        <i class="fas fa-users"></i>
                    </div>
                </div>
                <div class="box box-3">
                    <div class="box-details">
                    
                 
                	 <% try {
             			Class.forName("com.mysql.jdbc.Driver");
             			System.out.println("Driver Connection OK!");
             			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/gwy","root","root");
             			System.out.print("Connection with Dataabase");
             			st=con.createStatement();
             			String sql= "select count(course_ID) count from course";
             			ResultSet rs=st.executeQuery(sql);
             			
             			
             		while(rs.next()){
             			%>
                        <h4><%=rs.getString("count") %></h4>
                        <%}}catch (Exception e) {
    				System.out.println(e);
    			} %>
                       
                        <span>Courses</span>
                    </div>
                    <div class="box-icon">
                        <i class="fas fa-tasks"></i>
                    </div>
                </div>
                <div class="box box-4">
                    <div class="box-details">
                    <% try {
             			Class.forName("com.mysql.jdbc.Driver");
             			System.out.println("Driver Connection OK!");
             			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/gwy","root","root");
             			System.out.print("Connection with Dataabase");
             			st=con.createStatement();
             			String sql= "select count(instructor_ID) count from instructor";
             			ResultSet rs=st.executeQuery(sql);
             			
             			
             		while(rs.next()){
             			%>
                        <h4><%=rs.getString("count") %></h4>
                        <%}}catch (Exception e) {
    				System.out.println(e);
    			} %>
                        
                        <span>Instructor</span>
                    </div>
                    <div class="box-icon">
                        <i class="fas fa-light fa-chalkboard-user"></i>
                    </div>
                </div>
                <div class="box box-5">
                    <div class="box-details">
                        <h4>Mawlamyine</h4>
                        <span>Location</span>
                    </div>
                    <div class="box-icon">
                        <i class="fas fa-regular fa-location-dot fa-beat-fade"></i>
                    </div>
                </div>
                
                <div class="box box-2">
                    <div class="box-details">
                   
                	 <% try {
             			Class.forName("com.mysql.jdbc.Driver");
             			System.out.println("Driver Connection OK!");
             			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/gwy","root","root");
             			System.out.print("Connection with Dataabase");
             			st=con.createStatement();
             			String sql= "select count(reg_ID) count from register";
             			ResultSet rs=st.executeQuery(sql);
             			
             			
             		while(rs.next()){
             			%>
                        <h4><%=rs.getString("count") %></h4>
                        <%}}catch (Exception e) {
    				System.out.println(e);
    			} %>
                        <span>Registration</span>
                    </div>
                    <div class="box-icon">
                        <i class="fas fa-light fa-address-card"></i>
                    </div>
                </div>
                
                <div class="box box-3">
                    <div class="box-details">
                    
                 
                	 <% try {
             			Class.forName("com.mysql.jdbc.Driver");
             			System.out.println("Driver Connection OK!");
             			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/gwy","root","root");
             			System.out.print("Connection with Dataabase");
             			st=con.createStatement();
             			String sql= "select count(enroll_ID) count from enrollment";
             			ResultSet rs=st.executeQuery(sql);
             			
             			
             		while(rs.next()){
             			%>
                        <h4><%=rs.getString("count") %></h4>
                        <%}}catch (Exception e) {
    				System.out.println(e);
    			} %>
                       
                        <span>Enrollments</span>
                    </div>
                    <div class="box-icon">
                      <i class="fas fa-light fa-address-book"></i>
                    </div>
                </div>
                 <div class="box box-4">
                    <div class="box-details">
                   
                    <% try {
             			Class.forName("com.mysql.jdbc.Driver");
             			System.out.println("Driver Connection OK!");
             			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/gwy","root","root");
             			System.out.print("Connection with Dataabase");
             			st=con.createStatement();
             			String sql= "select count(feedback_ID) count from feedback";
             			ResultSet rs=st.executeQuery(sql);
             			
             			
             		while(rs.next()){
             			%>
                        <h4><%=rs.getString("count") %></h4>
                        <%}}catch (Exception e) {
    				System.out.println(e);
    			} %>
                        
                        <span>Feedback</span>
                    </div>
                    <div class="box-icon">
                       <i class="fa-regular fa-envelope"></i>
                    </div>
                </div>
                
                </div>
                
                </div>
                
            </section>
            <footer>
                <div class="copyright">
                    copyright &copy; 2022. all right reserved.
                </div>
            </footer>
        </main>
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