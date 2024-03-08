jsp : 

<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/instructors.css">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"
   integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
   crossorigin="anonymous"></script>

</head>
<body>
   <div class="bodyMain">
   <img src="resources/images/demitasse3.PNG" class=demitasse>
      <div class="title">INSTRUCTORS</div>
      <div class="middle-part">
         <p>DRAW DANCE에서</p>
         <p>같이 춤을 그려갈 강사진을 소개합니다.</p>
      </div>
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
            <div class="smallWord">
               <button id="loginBtn" class="LOGIN-btn"
                  onclick="location.href='./login'">
                  <small>LOGIN</small>
               </button>
               <form id="logoutForm" action="logout" method="get">
                  <button class="LOGIN-btn" onclick="location.href='./'">
                     <small>LOGOUT</small>
                  </button>
               </form>
               <button id="signupBtn" class="SIGNUP-btn"
                  onclick="location.href='./signUp'">
                  <small>SIGN UP</small>
               </button>
               <button id="myPage" class="MYPAGE-btn"
                  onclick="location.href='./mypage'">
                  <small>MY PAGE</small>
               </button>
            </div>
            <br> <br>
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
      <div class="instructor-container">
         <div class="instructor1">
            <form action="class1" method="get"> <img src="resources/images/강사 프로필 사진.PNG"
               alt="강사1">
               <button type="submit">
               <div class="overlay">
                  - 2020 icia대학 실용무용 전공<br>
                  - 2022 icia댄스아카데미 강사<br>
                  - 2024 icia댄스아카데미 부원장
               </div>
               </button>
            </form>
         </div>
         <div class="instructor2">
            <a href="class2"> <img src="resources/images/강사 프로필 사진.PNG"
               alt="강사2">
               <div class="overlay">
                  - 2020 icia대학 실용무용 전공<br>
                  - 2022 icia댄스아카데미 강사<br>
                  - 2024 icia댄스아카데미 부원장
               </div>
            </a>
         </div>
         <div class="instructor3">
            <a href="class3"> <img src="resources/images/강사 프로필 사진.PNG"
               alt="강사3">
               <div class="overlay">
                  - 2020 icia대학 실용무용 전공<br>
                  - 2022 icia댄스아카데미 강사<br>
                  - 2024 icia댄스아카데미 부원장
               </div>
            </a>
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

	  var loggedInMember = '<%=session.getAttribute("login")%>';
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

	  $('.instructor1').on('mouseover', function() {
	    // 마우스 오버되었을 때 실행되는 코드
	    // 예를 들어, 추가적인 동작이 필요하다면 여기에 작성
	  });
	});
</script>
</html>