<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<title>Test Home</title>
<link rel="stylesheet" href="resources/css/login.css">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"
   integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
   crossorigin="anonymous"></script>
<script>
   $(function() {
      let m = "${msg}";
      if (m != "") {
         alert(m);
      }
   });
</script>
</head>
<!--<h1> Home Page</h1>   -->
<body>
   <div class="bodyMain">
      <div class="headerMenu">
         <button class="Home-btn" onclick="location.href='./'">
            <img src="resources/images/lg.png" class="logo">
         </button>
      </div>
      <div id="menu-container">
         <img src="resources/images/menu.png" id="menuButton">
         <div id="rectangle">
            <br> <br>
            <button class="Home-btn" onclick="location.href='./'">
               <p>HOME</p>
            </button>
            <br> <br> <br>
            <button class="ABOUT-btn" onclick="location.href='./about'">
               <p>ABOUT</p>
            </button>
            <br> <br> <br>
            <button class="INSTRUCTORS-btn"
               onclick="location.href='./instructors'">
               <p>INSTRUCTORS</p>
            </button>
            <br> <br> <br>
            <button class="CLASS-btn" onclick="location.href='./classpage'">
               <p>CLASS</p>
            </button>
            <br> <br> <br>
              <button class="CONTACT-btn" onclick="location.href='./qboard'">
               <p>FAQ</p>
            </button>
            <br> <br> <br> <br> <br> <br> <br>
            <br> <br> <br> <br> <br> <br> <br>
            <div class="smallWord">
               <button id="loginBtn" class="LOGIN-btn" onclick="location.href='./login'">
                  <small>LOGIN</small>
               </button>
               <form id="logoutForm" action="logout" method="get">
                <button class="LOGIN-btn" onclick="location.href='./'">
                  <small>LOGOUT</small>
               </button>
               </form>
               <button id="signupBtn" class="SIGNUP-btn" onclick="location.href='./signUp'">
                  <small>SIGN UP</small>
               </button>
               <button id="myPage" class="MYPAGE-btn" onclick="location.href='./mypage'">
            	<small>MY PAGE</small>
         		</button>
            </div>
            <br> <br> <br>
            <div id="icon-container2">
               <a href="https://www.facebook.com"> <img
                  src="resources/images/facebookIcon.png" class="facebook">
               </a> <a href="https://www.youtube.com"> <img
                  src="resources/images/youtubeIcon.png" class="youtube">
               </a> <a href="https://www.instagram.com"> <img
                  src="resources/images/instagramIcon.png" class="instagram">
               </a>
            </div>
         </div>
      </div>
      <div id="icon-container">
         <a href="https://www.facebook.com"> <img
            src="resources/images/facebookIcon.png" class="facebook">
         </a> <a href="https://www.youtube.com"> <img
            src="resources/images/youtubeIcon.png" class="youtube">
         </a> <a href="https://www.instagram.com"> <img
            src="resources/images/instagramIcon.png" class="instagram">
         </a>
      </div>
      <div class="video-container">
       <div class="login-container">
   <div class="login-box">
      <h2>Login</h2>
      <form action="loginProc" method="post">
         <div class="user-box">
            <input type="text" id="email" name="m_email" required=""> <label
               for="email">Username</label>
         </div>
         <div class="user-box">
            <input type="password" id="password" name="m_password" required="">
            <label for="password">Password</label>
         </div>
         
		<div class="button-container">
         <button type="submit">
            <span></span>
            <span></span> 
            <span></span> 
            <span></span> 
            LOGIN
         </button>
         
           <button onclick="location.href='./signUp'">
          <span></span>
         <span></span>
         <span></span>
         <span></span>
         SIGN UP
        </button>
      </div>
      </form>
   </div>
   </div>
   </div>
   </div>
</body>
<script>
  $(document).ready(function() {
    var rectangle = $('#rectangle');
    var menuButton = $('#menuButton');
    var iconContainer = $('#icon-container');
    var isRectangleVisible = false;

    menuButton.on('click', function() {
      isRectangleVisible = !isRectangleVisible;
      rectangle.toggle(isRectangleVisible);
      iconContainer.toggle(!isRectangleVisible);
    });

    // 로그인 여부에 따른 버튼 표시
    var loggedInMember = '<%= session.getAttribute("login") %>';
    console.log("세션에 저장된 값: " + loggedInMember);
    var isLoggedIn = loggedInMember !== 'null' && loggedInMember !== '';

    $("#loginBtn, #signupBtn").toggle(!isLoggedIn);
    $("#logoutForm, #myPage").toggle(isLoggedIn);
  });
</script>
</html>