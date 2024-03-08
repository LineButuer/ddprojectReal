<%@page import="com.icia.drawAcademy.dto.QboardDto"%>
<%@page import="com.icia.drawAcademy.dao.Qboarddao.QboardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 작성</title>
<link rel="stylesheet" href="resources/css/qwrite.css">
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
<body>
   <div class=title>게시물 등록</div>
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

   <div class="write">
      <form action="qwriteProc" method="post">
         <input type="hidden" value="${sessionScope.login.m_id}" name="m_id">
         <input type="hidden" value="${sessionScope.login.m_name}"
            name="m_name"> <input type="text" placeholder="제목"
            name="b_title">
         <textarea placeholder="내용" name="b_contents"></textarea>
         <div class="btn-con">
            <button value="submit" class="submit-btn">
               <span></span> <span></span> <span></span> <span></span> 등록
            </button>
         </div>
      </form>
   <%
   System.out.println("qboard_m_id: " + request.getAttribute("qboard_m_id"));
   %>
   <%
   System.out.println("session.login: " + session.getAttribute("login"));
   %>
   </div>

</body>
<script>
<!-- 메뉴 버튼 기능 -->
$(document).ready(function() {
   var rectangle = $('#rectangle');
   var menuButton = $('#menuButton');
   var iconContainer = $('#icon-container');
   var isRectangleVisible = false; // rectangle의 초기 상태를 정의 - 첫 메뉴 클릭 때 실행되지 않는 현상 해결

   menuButton.on('click', function() {
      if (!isRectangleVisible) {
         rectangle.show();
         iconContainer.hide(); //메뉴 창이 나오면서 iconcontainer 사라지기
         isRectangleVisible = true; // rectangle이 보이는 상태로 설정
      } else {
         rectangle.hide();
         iconContainer.show();
         isRectangleVisible = false; // rectangle이 숨겨진 상태로 설정
      }
   });

   //엔터 기능 막기 
   document.on('DOMContentLoaded', function() {
      var contentInput = document
            .querySelector('.write input[name="b_contents"]');

      contentInput.addEventListener('keydown', function(event) {
         if (event.key === 'Enter') {
            event.preventDefault(); // 기본 엔터 기능 막기
            var contentValue = this.value;
            var selectionStart = this.selectionStart;
            var selectionEnd = this.selectionEnd;
            this.value = contentValue.slice(0, selectionStart) + '\n'
                  + contentValue.slice(selectionEnd);
            this.selectionStart = this.selectionEnd = selectionStart + 1; // 커서 이동
         }
      });
   });

   $("#backbtn").click(function() {
      location.href = `./detail?b_code=${qboard.b_code}`;
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