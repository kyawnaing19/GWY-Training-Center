<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="sidebar.css">
<title>Insert title here</title>

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
        </div>
</body>
</html>