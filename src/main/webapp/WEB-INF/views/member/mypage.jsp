<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>MyPage</title>
    <link rel="stylesheet" href="resources/css/mypage.css">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"
   integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
   crossorigin="anonymous"></script>
    
</head>

<body>
	<div class="bodyMain">
	<img src="resources/images/mypage.demitasse.PNG" class=demitasse>
    <div class="headerMenu">
        <button class="Home-btn" onclick="location.href='./'">
            <img src="resources/images/lg.png" class="logo">
        </button>
    </div>
    <div class="title">
        My Page
        
    </div>
    <div class="middle-part">
        <p>내 정보</p>
     
        <div class="middlemiddle-part">
        <div class="low-part">
            <form action="mypage" method="get">
                <p>이름 : ${memberDto.m_name}</p> 
                <p>이메일 : ${memberDto.m_email}</p>
                <p>전화번호 : ${memberDto.m_phoneNumber}</p>
                <p>생년월일 : ${memberDto.m_age}</p>
                <p>주소 : ${memberDto.m_address}</p>
                <p>구분 : ${memberDto.sort}</p>
            </form>
    </div><!-- low-part-->
    
    <div class="cancel-part">
            	   <p>내 수강신청 목록</p>
        <c:forEach var="cl" items="${cList}">
           <div class="classCancle">
            <form action="classCancelProc" method="post">
                <li>${cl.className} : ${cl.day} ${cl.date} ${cl.time}
                    <button type="submit">
                     <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                    취소
                    </button>
                </li>
                
                <input type="hidden" value="${sessionScope.login.m_id}" name="m_id">
                <input type="hidden" value="${cl.c_id}" name="c_id">
                <input type="hidden" value="${cl.className}" name="className">
                <input type="hidden" value="${cl.day}" name="day">
                <input type="hidden" value="${cl.date}" name="date">
                <input type="hidden" value="${cl.time}" name="time">
            </form>
            </div>
        </c:forEach>
    </div><!-- cancel-part -->
    
   </div>
        
        <div class="classCancle">
            <form action="setting" method="get" class="settingBtn">
                <button type="submit">
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                    회원정보수정
                </button>
            </form>
       	 </div>

        <div class="classCancle">
            <form action="memout" method="get" class="memoutBtn">
                <button type="submit" onclick="memoutBtn()" id="memout">
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                    회원탈퇴
                </button>
            </form>
        </div>
	
       	 
   
    </div> <!-- bodymain -->
      
   
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
<script type="text/javascript">
let msg = "${msg}";
if(msg != ""){
	alert(msg);
}	

</script>
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
<script>
  $(document).ready(function() {
    function memoutBtn() {
      // 확인 창을 띄우고 사용자의 선택에 따라 동작을 수행
      var memBtn = confirm("정말 회원탈퇴를 하시겠습니까?");
      
      if (memBtn) {
        // 사용자가 확인을 선택한 경우, 실제 회원탈퇴 동작 수행
        alert("회원탈퇴가 완료되었습니다.");
        // 여기에 실제 회원탈퇴 동작을 수행하는 코드를 추가할 수 있습니다.
      } else {
        // 사용자가 취소를 선택한 경우
        alert("회원탈퇴가 취소되었습니다.");
        event.preventDefault();
      }
    }

    // 버튼 클릭 이벤트에 memoutBtn 함수 바인딩
    $('#memout').on('click', memoutBtn);
  });
</script>

</html>