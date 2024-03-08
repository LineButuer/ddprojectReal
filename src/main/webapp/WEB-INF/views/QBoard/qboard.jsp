<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 목록</title>
<link rel="stylesheet" href="resources/css/qboard.css">
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
	<div class=title>FAQ</div>
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
	
	<div class="middle-box">
	<div class="header-title">
	<div>
	<div class="frequent-title">자주 묻는 질문
	<form action="searchProc" method="get"
         onsubmit="return validateSearch()">
         <input class="inputS" type="text" id="searchText" name="searchText"
            placeholder="게시물검색">
         <div class=btn-con>
            <button class="searchB" type="submit">
               <span></span> <span></span> <span></span> <span></span> 검색
            </button>
         </div>
      </form>
      </div>
				
				
	</div>
	</div>
	<div class="boarder-box">
	
	
		<div class="frequent-question">
			<div class="faqCard">
				<div class="question">
					Q: 개인 레슨은 가능한가요?
					<button class="downButton">+</button>
				</div>
				<div class="answer">A: 강사님과 조율하면 개인 레슨이 가능합니다.</div>
			</div>
			<div class="faqCard">
				<div class="question">
					Q: 춤이 처음인데 수강을 들을 수 있나요?
					<button class="downButton">+</button>
				</div>
				<div class="answer">A: 네, 처음 하시는 분을 위한 클래스도 준비되어 있습니다.
				</div>
			</div>
			<div class="faqCard">
				<div class="question">
					Q: 수업 별 가격은 어떻게 되나요?
					<button class="downButton">+</button>
				</div>
				<div class="answer">A: k-pop 25,000원, newbie 20,000원, hip-hop
					25,000원입니다.</div>
			</div>
		</div>
	</div>
		<!-- 검색 목록 -->
		<div class="search">
		<div class="searchList1">
			<h4 class="searchList">검색 목록</h4>
			</div>
			<c:if test="${not empty searchResult}">
				<c:forEach var="search" items="${searchResult}">
					<div class="search-item">
						<ul>
							<li>
							<a href="./detail?b_code=${search.b_code}">제목 :
								${search.b_title}</a>
							</li>
						</ul>
					</div>
				</c:forEach>
			</c:if>
		</div>
		<!-- 게시물 -->
		<div class="content-box">
			<div class="commentList">
				<div class="test1">
					<p class="test">게시물 목록</p>
					<button id="cklogin" class= "searchB" onclick="location.href='./qwrite'">
					<span></span>
					<span></span>
					<span></span>
					<span></span>
					질문등록</button>
				</div>


				<c:if test="${empty qList}">
					<div class="qboard-item">
						<span class="none-content">등록된 게시물이 없습니다.</span>
					</div>
				</c:if>

				<c:if test="${qList ne null}">
					<c:forEach var="qqq" items="${qList}">
						<div class="qboard-item">
						<ul>
							<li>
							<a id="qlist" href="./detail?b_code=${qqq.b_code}">제목 :
								"${qqq.b_title}" </a>
								</li>
						</ul>
						</div>
					</c:forEach>
				</c:if>
				<!-- 페이지 기능 -->
			</div>
			
			<div class="paging-area">
				<div class="paging">${paging}</div>
			</div>
		</div>
	</div>


</body>
<!-- 메뉴 버튼 기능 -->
<script>
$(document).ready(function() {
   var rectangle = $('#rectangle');
   console.log("rectangle", rectangle);
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

<script>
$(document).ready(function() {
    $('#searchBtn').on('click', function() {
        return validateSearch();
    });
});

function validateSearch() {
    var searchText = $("#searchText").val().trim();
    if (searchText === "") {
        return false;
    }
    return true;
}
</script>

<script>
$(document).ready(function() {
   $('.downButton').on('click', function() {
      var question = $(this).closest('.question');
      var answer = question.next();

      if (answer.css('display') === 'block') {
         answer.hide();
         $(this).text('+');
      } else {
         answer.show();
         $(this).text('-');
      }
   });
});
</script>
</html>