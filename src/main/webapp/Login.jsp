<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="source/css/login.css" />
    <link
      rel="stylesheet"
      href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
    />
    
    <title>GWY Training Center</title>
    <link rel="stylesheet" href="source/css/style.css">
</head>
<body>
  
  <%
String email=(String)session.getAttribute("email");
if(email!=null){
%>
    <nav style="top:0;position: absolute;">
  <div id="logo">
     <img src="source/img/glogo.png" style="width:80px;height:70px;">
     <div id="letter"><h1 style="color: black;">GWY Training Center</h1></div>
    </div>

        <div class="navigation">
        <ul>
          <li><a href="Home.jsp">Home</a></li>
          
          <li><a href="about.jsp">About</a></li>
          <li><a href="Homepage.jsp">Contact Us</a></li>
          <li><a href="myacc.jsp">My Account</a></li>
          <li><a href="logout.jsp">Logout</a></li>
        </ul>
      </div>
      </nav>
<%
}else{
%>
 <nav style="top:0;position: absolute;">
  <div id="logo">
     <img src="source/img/glogo.png" style="width:80px;height:70px;">
     <div id="letter"><h1 style="color: black;">GWY Training Center</h1></div>
    </div>
        <div class="navigation">
        <ul>
          <li><a href="Home.jsp">Home</a></li>
          
          <li><a href="about.jsp">About</a></li>
          <li><a href="Home.jsp">Contact Us</a></li>
          <li><a href="Login.jsp">Login</a></li>
        </ul>
      </div>
      </nav>
     <%} %>
  
<div class="container" id="container">
      <div class="form-container sign-up-container">
        <form action="Registerservlet">
          <h1 id="vit">Register Now!</h1><br>

          <input type="text" placeholder="Name" id="name" name="name" required="required"/>
          <input type="email" placeholder="Email" id="mail" name="email" required="required"/>
          <input type="password" placeholder="Password" id="pass" name="pw" required="required"/>
          <input type="text" placeholder="Phone Number" id="phone" name="ph" required="required"/>
          <button type="submit" name="submit" value="Register">Register</button>
          <br /><br /><br /><br />

          <div class="social-container">
            <a href="https:www.facebook.com" class="social" id="fb">
              <i class="fab fa-facebook"></i>
            </a>
            <a href="https:www.instagram.com" class="social" id="ins">
              <i class="fab fa-instagram"> </i>
            </a>
            <a href="https://www.gmail.com" class="social" id="gm">
              <i class="fas fa-envelope"></i>
            </a>
            <a href="https://www.twitter.com" class="social" id="tw">
              <i class="fab fa-twitter"></i>
            </a>
          </div>
          
        </form>
      </div>
      <div class="form-container sign-in-container">
        <form >
          <h1>Login</h1>

          <input type="email" placeholder="Email" id="mail" name="email" required="required"/>
          <input type="password" placeholder="Password" id="pass" name="pass" required="required"/>         
          <button type="submit" name="submit" value="Login" formaction="userloginservlet">Login</button>
          <br /><br /><br /><br /><br /><br />

          <div class="social-container">
            <a href="https:www.facebook.com" class="social" id="fb">
              <i class="fab fa-facebook"></i>
            </a>
            <a href="https:www.instagram.com" class="social" id="ins">
              <i class="fab fa-instagram"> </i>
            </a>
            <a href="https://www.gmail.com" class="social" id="gm">
              <i class="fas fa-envelope"></i>
            </a>
            <a href="https://www.twitter.com" class="social" id="tw">
              <i class="fab fa-twitter"></i>
            </a>
          </div>
        </form>
      </div>
      <div class="overlay-container">
        <div class="overlay">
          <div class="overlay-panel overlay-left">
            <h1>Welcome</h1>
            <p>
              Enhance With GWY
            </p>
            <br />
            <p style="color: rgb(0, 68, 255)">Already have an account?</p>
            <button class="press" id="signIn">Login</button>
          </div>
          <div class="overlay-panel overlay-right">
            <h1>GWY Training Center</h1>
            <p>Passion for excellence. Compassion for people.</p>
            <br />
            <p style="color: rgb(0, 68, 255)">Don't have an account?</p>
            <button class="press" id="signUp" style="color: rgb(57, 49, 5)">
              Register
            </button>
          </div>
        </div>
      </div>
    </div>
    <script type="text/javascript">
      const signUpButton = document.getElementById("signUp");
      const signInButton = document.getElementById("signIn");
      const container = document.getElementById("container");

      signUpButton.addEventListener("click", () => {
        container.classList.add("right-panel-active");
      });

      signInButton.addEventListener("click", () => {
        container.classList.remove("right-panel-active");
      });
    </script>
</body>
</html>