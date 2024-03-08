<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="resources/css/test.css">

    <style>
       
    </style>
</head>
<body>

	 <div class="classCancle">
            <a action="setting" method="get">
                <button type="submit">
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                    회원정보수정
                </button>
            </a>
       	 </div>

        <div class="classCancle">
            <form action="memout" method="get">
                <button type="submit" onclick="memoutBtn()">
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                    회원탈퇴
                </button>
            </form>
        </div>
</body>
</html>