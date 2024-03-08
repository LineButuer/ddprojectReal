<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/signup.css">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"
	integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
	crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$(function() {
		let msg = "${msg}";
		if(msg != ""){
			alert(msg);
		}
	});

</script>
<style>
  .white-text {
    color: white;
  }
</style>
</head>


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
   <form action="signUpProc" method="post" id="signUpForm"
     onsubmit="return validateForm()" class="joinForm">
      <h2>SIGN UP</h2>
      <div class="textForm">
         <input type="email" class="id" name="m_email" placeholder="E-mail" id="signUpEmail" required>
      <span id="emailCheckResult" class="checkResult"></span>
      </div>
      <div class="textForm">
         <input type="password" class="pw" name="m_password" placeholder="Password" required>
      </div>
      <div class="textForm">
         <input type="text" class="name" name="m_name" placeholder="이름" required>
      </div>
      <div class="textForm">
         <input type="text" class="phoneNumber" name="m_phoneNumber" id="phoneNumber" placeholder="전화번호 : 010-0000-0000 " required>
         <span id="phoneNumberCheck" class="checkResult"></span>
      </div>
      <div class="textForm">
         <input type="text" class="address" name="m_address" placeholder="주소" required>
      </div>
      <div class="textForm">
         <input type="text" id="birthdate" class="age" name="m_age" placeholder="생년월일" required>
      </div>
      <div class ="textForm">
             <select id="selectOption" name="sort">
              <option value="student">학생</option>
              <option value="teacher">선생님</option>
          </select>
      </div>

      <button type="submit">
         <span></span>
         <span></span>
         <span></span>
         <span></span>
         SIGN UP
      </button>
      
   </form>
   </div>
</body>
<script>
$(document).ready(function() {
    // 이메일 중복 체크
    $("#signUpEmail").on("blur", function() {
        var emailValue = $(this).val();

        // AJAX를 사용하여 중복 체크
        $.post("emailCheckResult", { m_email: emailValue }, function(result) {
            $("#emailCheckResult").text(result).addClass("white-text");

        });
    });

    // 폼 제출 막기
    $("#signUpForm").submit(function(event) {
        var emailResult = $("#emailCheckResult").text();
        if (emailResult === "중복된 이메일입니다.") {
            event.preventDefault();
            alert("중복된 이메일입니다. 이메일을 다시 확인하여 주십시오.");
        }
    });


    // 메뉴 토글
    var rectangle = $('#rectangle');
    var menuButton = $('#menuButton');
    var iconContainer = $('#icon-container');

    menuButton.on('click', function() {
      var isRectangleVisible = rectangle.toggle().is(":visible");
      iconContainer.toggle(!isRectangleVisible);
    });

    // 로그인 여부에 따른 버튼 표시
    var loginBtn = $("#loginBtn");
    var logoutForm = $("#logoutForm");
    var signupBtn = $("#signupBtn");
    var myPageBtn = $("#myPage");

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

    // 전화번호 검증
    $("#signUpForm").submit(function(event) {
      var phoneNumberInput = $('#phoneNumber');
      var errorMessage = $('#phoneNumberCheck');
      var phoneNumberPattern = /^010-\d{4}-\d{4}$/;

      if (!phoneNumberPattern.test(phoneNumberInput.val())) {
        errorMessage.text('(010-0000-0000 형식으로 입력해주세요)');
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