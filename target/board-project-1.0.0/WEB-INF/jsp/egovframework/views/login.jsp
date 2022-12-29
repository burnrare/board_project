<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<body>
<div class="container">	
	<h2>로그인</h2>
<form action="/loginProc.do" method="post"> 
		<div class="mb-3">
			<label class="form-label" for="u_id">아이디</label> 
			<input class="form-control" type="text" name="u_id" id="u_id"  maxlength="25"/>
		</div>
		<div class="mb-3">
			<label class="form-label" for="u_pwd">비밀번호</label> 
			<input class="form-control" type="password" name="u_pwd" id="u_pwd" maxlength="30"/>
		</div>
		<button class="btn btn-outline-primary btn-sm" id="login-btn" type="submit">로그인</button>
		<button class="btn btn-outline-primary btn-sm" type="button" id="join-btn" onclick="location.href='/join.do'">회원가입</button>
</form> 
</div>
</body>
<script src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<script type="text/javascript">
	$(document).ready(function() {
		
		/* $('#login-btn').click(function() {
			var loginData = {"u_id" : $('#u_id').val(), "u_pwd" : $('#u_pwd').val()};
			
			if($('#u_id').val() == '') {
				alert("아이디가 입력되지 않았습니다. 확인해 주세요.");
				return;
			}
			if($('#u_pwd').val() == '') {
				alert("비밀번호가 입력되지 않았습니다. 확인해 주세요.");
				return;
			}
			
			console.log(loginData);
			 $.ajax({
				url: '/loginProc.do',
				data: JSON.stringify(loginData),
				type: 'POST',
				contentType: 'application/json; charset=utf-8',
				success: function(re) {
					if(re == 0) {
						alert("로그인되었습니다. 확인을 눌러 주세요.");
						location.href="/survey/surveyList.do";						
					} else if(re == 2) {
						alert("입력한 아이디와 비밀번호를 다시 확인해 주세요.");
						return false;
					}
				}
			}) // ajax 끝
		}) */
	});
</script>
</html>