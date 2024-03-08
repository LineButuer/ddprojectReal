<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<title>Test Home</title>
<link rel="stylesheet" href="resources/css/home.css">
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
      <div class="TitleLogo">
      <img src="resources/images/TitleLogo.png" class="drawDance">
      </div>
      <div class="video-container">
         <video id="video1" autoplay muted loop>
            <!-- autoplay : 자동재생, muted : 음소거, loop : 끝난 후 반복재생 <video>요소 기능 -->
            <source src="resources/video/TestHome.MP4" type="video/mp4">
         </video>
      </div>

      
      <div class="bottominfo">
      
      <div class="aboutAcademy">
      <img src="resources/images/infoBlack.png" class="infoblack">
      <div class="aboutAcademyText">
      <p><a href ="about">학원소개 ▶</a></p>
      </div>
      </div>
      
      <div class="TodayClassInfo">
      <img src="resources/images/todayClass.PNG" class="TodayClass">
      <div class="TodayClassText">
      <p><a href ="class1">오늘의 수업 ▶</a></p>
      </div>
      </div>
      
      <div class="mapInfo">
      <img src="resources/images/Map.png" class="map">
      <div class="comeText">
      <p><a href ="about#mapSection">오시는 길 ▶</a></p>
     </div>
     </div>
     
     
     
     
      </div>
      
      </div>
   
  
</body>
<script>
$(document).ready(function() {
	  var rectangle = $("#rectangle");
	  var menuButton = $("#menuButton");
	  var iconContainer = $("#icon-container");
	  var isRectangleVisible = false;

	  menuButton.on('click', function() {
	    if (!isRectangleVisible) {
	      rectangle.show();
	      iconContainer.hide();
	      isRectangleVisible = true;
	    } else {
	      rectangle.hide();
	      iconContainer.show();
	      isRectangleVisible = false;
	    }
	  });
	});
</script>
<script>
$(document).ready(function() {
	  var loginBtn = $("#loginBtn");
	  var logoutForm = $("#logoutForm");
	  var signupBtn = $("#signupBtn");
	  var myPageBtn = $("#myPage");

	  var loggedInMember = '<%= session.getAttribute("login") %>';
	  console.log("세션에 저장된 값: " + loggedInMember);

	  // 여기서 로그인 여부를 확인하고 그에 따라 버튼을 표시하거나 숨깁니다.
	  var isLoggedIn = loggedInMember !== 'null' && loggedInMember !== '';

	  if (isLoggedIn) {
	    loginBtn.hide();
	    logoutForm.show();
	    signupBtn.hide();
	    myPageBtn.show();
	  } else {
	    loginBtn.show();
	    logoutForm.hide();
	    signupBtn.show();
	    myPageBtn.hide();
	  }
	});
</script>
</html>