<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/qupdate.css">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"
   integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
   crossorigin="anonymous"></script>
<script>
   $(function() {
      let m = "${msg2}";
      if (m != "") {
         alert(m);
      }
   });
</script>
</head>
<body>
<div class=qbord-title>게시물 수정</div>
   <header class="headerMenu">
      <button class="Home-btn" onclick="location.href='./'">
         <img src="resources/images/lg.png" class="logo">
      </button>
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
   </header>
   <div class="content">
      <!-- sessionScope."세션에 저장된 이름" <-- 세션에 저장된 모든 정보에 접촉 가능 -->
      <c:if test="${sessionScope.login.m_id eq qboard.m_id}">
         <form action="QBUpdateProc" method="post"
            enctype="multipart/form-data">
            <input type="hidden" name="b_code" value="${qboard.b_code}">
            <input type="hidden" name="m_id" value="${sessionScope.login.m_id}">
            <input type="text" class="write-input" value="${qboard.b_title}"
               name="b_title" autofocus placeholder="제목" required> 
               <textarea placeholder="내용" name="b_contents">${qboard.b_contents}</textarea>
            <button value="submit" class="submit-btn">
            <span></span><span></span>
            <span></span>
            <span></span>수정</button>
         </form>
      </c:if>
      <c:if test="${sessionScope.login.m_id ne qboard.m_id}">
         <p>게시물을 수정할 수 있는 권한이 없습니다.</p>
      </c:if>
   </div>
</body>
<script>
$(document).ready(function() {
   var rectangle = $('#rectangle');
   var menuButton = $('#menuButton');
   var iconContainer = $('#icon-container');
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