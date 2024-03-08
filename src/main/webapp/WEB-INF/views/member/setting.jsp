<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<title>Test Home</title>
<link rel="stylesheet" href="resources/css/setting.css">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"
   integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
   crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

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
      <form action="updateMember" method="post" class="joinForm" id="settingForm">
      <h2>개인 정보 수정</h2>
      <div class="textForm">
      <p> 이메일 (수정이 불가합니다.)
         <input type="email" class="id" name="m_email" value="${loggedInMember.m_email}" required readonly>
      </p>
      </div>
      <div class="textForm">
      	<p> 비밀번호
         <input type="text" class="pw" name="m_password" placeholder="${loggedInMember.m_password}" required>
         </p>
         </div>
      <div class="textForm">
      <p> 이름
         <input type="text" class="name" name="m_name" placeholder="${loggedInMember.m_name}" required>
         </p>
      </div>
      <div class="textForm">
      <p> 휴대전화 번호
        <input type="text" class="phoneNumber" name="m_phoneNumber" id="phoneNumber" placeholder="전화번호 : 010-0000-0000 " required>
         <span id="phoneNumberCheck" class="checkResult"></span>
         </p>
      </div>
      <div class="textForm">
      <p> 주소
         <input type="text" class="address" name="m_address" placeholder="${loggedInMember.m_address}" required>
         </p>
      </div>
      <div class="textForm">
      	<p> 생년월일
         <input type="text" id="birthdate" class="age" name="m_age" placeholder="${loggedInMember.m_age}" required>
         <p>
      </div>
		
      <button type="submit">
         <span></span>
         <span></span>
         <span></span>
         <span></span>
         회원 정보 수정
      </button>
   </form>
      <!-- 
      <div class="menuName">
         <a href="signUp">[회원가입 이동]</a> <a href="login">[로그인 이동]</a> <a
            href="mypage">[마이페이지]</a>
      </div> 
      -->
   </div>
   
</body>
<script>
  $(document).ready(function() {
    var rectangle = $('#rectangle');
    var menuButton = $('#menuButton');
    var iconContainer = $('#icon-container');
    var loginBtn = $('#loginBtn');
    var logoutForm = $('#logoutForm');
    var signupBtn = $('#signupBtn');
    var myPageBtn = $('#myPage');
    var phoneNumberInput = $('#phoneNumber');
    var errorMessage = $('#phoneNumberCheck');

    // Rectangle 토글
    menuButton.on('click', function() {
      rectangle.toggle();
      iconContainer.toggle();
    });

    // 로그인 여부에 따라 버튼 표시
    var loggedInMember = '<%= session.getAttribute("login") %>';
    var isLoggedIn = loggedInMember !== 'null' && loggedInMember !== '';
    
    loginBtn.toggle(!isLoggedIn);
    logoutForm.toggle(isLoggedIn);
    signupBtn.toggle(!isLoggedIn);
    myPageBtn.toggle(isLoggedIn);

    // Datepicker 적용
    $("#birthdate").datepicker({
      dateFormat: 'yy-mm-dd',
      changeYear: true,
      yearRange: '1900:2024',
      changeMonth: true,
      showMonthAfterYear: true,
      currentText: '오늘',
      closeText: '닫기',
      showDay: true
    });

    // 전화번호 검증 함수
    $("#settingForm").submit(function(event) {
      var phoneNumberPattern = /^010-\d{4}-\d{4}$/;

      if (!phoneNumberPattern.test(phoneNumberInput.val())) {
        errorMessage.text('(형식 : 010-0000-0000)');
        alert("전화번호 형식을 다시 확인해주세요.");
        errorMessage.css('color', 'white');
        event.preventDefault();
        return false;
      } else {
        errorMessage.text('');
        return true;
      }
    });
  });
</script>
</html>