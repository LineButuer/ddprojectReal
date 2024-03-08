<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강신청 사이트</title>
<link rel="stylesheet" href="resources/css/about.css">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"
   integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
   crossorigin="anonymous"></script>

</head>
<body>
   <div class="bodyMain">
   <img src="resources/images/demitasse project.PNG" class=demitasse>
      <div class="title">
         ABOUT
      </div>
      <div class="middle-part">
         <p>DRAW DANCE</p>
         <div class="low-part">
         <p>학원소개</p>
         </div>
         <div class="lowLow-part">
         <p>저희 DRAW DANCE ACADEMY는 현역으로 뛰고 있는 댄서들과 수많은 경력이 있는<br><br> 강사진으로
          이루어져 있어
         	한사람 한사람의 머리속에 있는 그림을 몸으로 표현할 수 있는<br><br> 마치 도화지에 본인의 생각들을 그릴 수 있는 
         	ACADEMY 입니다.</p>
         </div>
         <div class="low-part">
         <br>
         <br>
         <p>학원정보</p>
         </div>
         <div class="lowLow-part">
         <p>전화번호 : +82 32 123 4567</p>
         <p>이메일 : DrawDance@semiproject.com</p>
         <p>주소 : 인천광역시 0000번길 000 00빌딩 0층</p>
         </div>
      </div>
       <!-- 오시는길  -->
      <div id="mapSection" class="mapInfo">
      	<div class="mapInfoText">
      		<p>오시는 길</p>
      <img src="resources/images/Map.png" class="map">
      		<div class="mapInfoTextImport">
      		<p>신동아아파트에서 하차 후 파리바게트 기준으로 오른쪽 골목</p>
      		</div>
      	</div>
      </div>
      <!-- 오시는길  end-->
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