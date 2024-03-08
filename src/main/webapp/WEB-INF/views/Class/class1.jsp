<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/class1.css">
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
		<div class="title">TeacherName1</div>
		<img src="resources/images/demitasse2.PNG" class=demitasse>
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

			<div id="icon-container">
				<a href="https://www.facebook.com"> <img
					src="resources/images/facebookIcon.png" class="facebook">
				</a> <a href="https://www.youtube.com"> <img
					src="resources/images/youtubeIcon.png" class="youtube">
				</a> <a href="https://www.instagram.com"> <img
					src="resources/images/instagramIcon.png" class="instagram">
				</a>
			</div>
		</div>
		<div class="class1">
			<img src="resources/images/강사 프로필 사진.PNG" alt="강사1" class="teacher1">
			<p>
			<div class="classinfo">
				<span>| DATE: 3/19 |</span> <span>DAY: MON |</span> <span>TIME:
					19:30-20:30 |</span> <span>Class A </span> <span>${classLimitA}/20
					|</span>
				</p>
				<p>
					<span>| DATE: 3/20 |</span> <span>DAY: TUE |</span> <span>TIME:
						20:30-21:30 |</span> <span>Class B </span> <span>${classLimitB}/20
						|</span>
				</p>
				<p>
					<span>| DATE: 3/21 |</span> <span>DAY: WED |</span> <span>TIME:
						15:30-16:30 |</span> <span>Class C</span> <span>${classLimitC}/20
						|</span>
				</p>
				<p>
					<span>| DATE: 3/22 |</span> <span>DAY: THU |</span> <span>TIME:
						16:30-17:30 |</span> <span>Class D</span> <span>${classLimitD}/20
						|</span>
				</p>
				<p>
					<span>| DATE: 3/23 |</span> <span>DAY: FRI |</span> <span>TIME:
						18:30-19:30 |</span> <span>Class E</span> <span>${classLimitE}/20
						|</span>
				</p>
			</div>
			<div class="selectOption">
				<form action="class1proc" method="post" id="class1proc"
					onsubmit="return checkClass(event);">
					<label for="selectOption">수강신청 :</label> <select id="selectOption"
						class="selected" name="className">
						<option value="none" id="none" selected>선택</option>
						<option value="classA" id="classA">Class A</option>
						<option value="classB" id="classB">Class B</option>
						<option value="classC" id="classC">Class C</option>
						<option value="classD" id="classD">Class D</option>
						<option value="classE" id="classE">Class E</option>
					</select>
					<p>

						<span>Date: <input type="text" id="dateField" name="date"
							class="className" readonly></span> <br>
						<span>Day: <input type="text" id="dayField" name="day"
							class="className" readonly></span> <br>
						<span>Time: <input type="text" id="timeField" name="time"
							class="className" readonly></span> <input type="hidden"
							name="m_id" value="${m_id}">
					</p>
					<h3>내 수강신청 목록</h3>
					<ul>
						<c:forEach var="cl" items="${cList}" varStatus="loop">
							<input type="hidden" id="classCheck" value="${cl.className}">
							<li>${cl.className}</li>
						</c:forEach>
					</ul>


					<button type="submit">
						<span></span> <span></span> <span></span> <span></span> 수강신청
					</button>

				</form>
			</div>
		</div>
	</div>





</body>
<script>
   var rectangle = document.getElementById('rectangle');
   var menuButton = document.getElementById('menuButton');
   var iconContainer = document.getElementById('icon-container');
   var isRectangleVisible = false; // rectangle의 초기 상태를 정의 - 첫 메뉴 클릭 때 실행되지 않는 현상 해결

   menuButton.addEventListener('click', function() {
      if (!isRectangleVisible) {
         rectangle.style.display = 'block';
         iconContainer.style.display = 'none'; //메뉴 창이 나오면서 iconcontainer 사라지기
         isRectangleVisible = true; // rectangle이 보이는 상태로 설정
      } else {
         rectangle.style.display = 'none';
         iconContainer.style.display = 'flex';
         isRectangleVisible = false; // rectangle이 숨겨진 상태로 설정
      }
   });
   
</script>
<script>
$(document).ready(function () {
    // 아무 것도 선택하지 않았을 때 비활성화
    $("#dateField, #dayField, #timeField").prop("disabled", true);

    $("#selectOption").on('change', function () {
        var selectedClass = $(this).val();
        console.log("selectedClass:", selectedClass);

        // 이미 수강 중인 경우 필드를 비활성화하고 알림
        var isFieldDisabled = disableFieldsIfAlreadyEnrolled(selectedClass);
        if (isFieldDisabled) {
            alert("이미 수강신청한 CLASS입니다.");
            event.preventDefault();
            return;
        }

        // 선택된 클래스에 따라 필드 값 설정
        var classData = getClassData(selectedClass);
        setFieldValues(classData);

        // 필드를 활성화
        $("#dateField, #dayField, #timeField").prop("disabled", false);
    });

    // 이미 수강 중인 경우 필드를 비활성화하고 true를 반환
    function disableFieldsIfAlreadyEnrolled(selectedClass) {
        var classCheckElement = document.querySelectorAll("#classCheck");
        for (var classCheckItem of classCheckElement) {
            var classCheck = classCheckItem ? classCheckItem.value : null;
            if (classCheck == selectedClass || selectedClass === "none") {
                // 이미 중복되었다고 알리고 필드를 빈칸으로 비활성화
                $("#dateField, #dayField, #timeField").val("");
                return true;
            }
        }
        return false;
    }

    // 선택된 클래스에 따라 필드 값 설정
    function getClassData(selectedClass) {
        var classData = {
            "classA": { date: "3/19", day: "MON", time: "19:30-20:30" },
            "classB": { date: "3/20", day: "TUE", time: "20:30-21:30" },
            "classC": { date: "3/21", day: "WED", time: "15:30-16:30" },
            "classD": { date: "3/22", day: "THU", time: "16:30-17:30" },
            "classE": { date: "3/23", day: "FRI", time: "18:30-19:30" }
        };

        return classData[selectedClass] || {};
    }

    // 필드에 값을 설정
    function setFieldValues(classData) {
        $("#dateField").val(classData.date || "");
        $("#dayField").val(classData.day || "");
        $("#timeField").val(classData.time || "");
    }
});
</script>

<script>
function checkClass(event) {
    var selectedClass = $("#selectOption").val();
    var classLimits = {
        "classA": ${classLimitA},
        "classB": ${classLimitB},
        "classC": ${classLimitC},
        "classD": ${classLimitD},
        "classE": ${classLimitE}
    };

    console.log("선택한 클래스: " + selectedClass);
    console.log("클래스 정원: " + classLimits[selectedClass]);

    // 정원 초과 체크
    if (classLimits[selectedClass] >= 20) {
        alert(selectedClass + " 정원이 초과되었습니다. 수강신청이 불가합니다.");
        return false;
    }

    return true;
}
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
	});
</script>
</html>