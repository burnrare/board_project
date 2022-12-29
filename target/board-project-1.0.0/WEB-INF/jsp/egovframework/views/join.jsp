<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<validator:javascript formName="userVo" staticJavascript="false" xhtml="true" cdata="false"/>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
</head>
<style>
	.font {
		color: red;
		font-size: 13px;
		padding-left: 10px;
	}
</style>
<body>

<div class="container">	
	<h2>회원가입</h2>
	<form:form modelAttribute="userVo" action="/joinProc.do" name="form"  method="post" >
		<div class="mb-3">
			<label class="form-label" for="u_type">권한</label>
			<select id="u_type" name="u_type" class="form-control">
				<option value="0">일반사용자</option>
				<option value="1">관리자</option>
			</select> 
		</div>		
		<div class="mb-3">
			<label class="form-label" for="u_ncnm">닉네임</label> 
			<form:input path="u_ncnm" size="6" cssClass="form-control" type="text" name="u_ncnm" id="u_ncnm"/> 
			<form:errors path="u_ncnm" maxlength="6" cssClass="font"/>
		</div>
		<div class="mb-3">
			<label class="form-label" for="u_id">아이디</label> 
			<form:input path="u_id" size="12" cssClass="form-control" type="text" name="u_id" id="u_id"/>
			<form:errors path="u_id" maxlength="12" cssClass="font"/>
		</div>
		<div class="mb-3">
			<label class="form-label" for="u_pwd">비밀번호</label> 
			<form:input path="u_pwd" size="20" cssClass="form-control" type="password" name="u_pwd" id="u_pwd"/>
			<form:errors path="u_pwd" maxlength="20" cssClass="font"/>
		</div>
		<button class="btn btn-outline-primary btn-sm" type="submit" onclick="allCheck()">가입하기</button>
	</form:form>
</div>
<script src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<script type="text/javascript">
	$(document).ready(function() {

	});
	var idCheck = 0;
	
	function checkId() {
		var inputId = $("#u_id").val();
		$.ajax({
			data: {
				u_id : inputId
			},
			url: "checkId.do",
			success: function(data) {
				if(inputId == "" && data == '0') {
					$('.btn-sm').prop("disabled", true);
					$('#u_id').css("background", "#ffcece");
				} else if(data == '0') {
					$('#u_id').css("background", "#b0f6ac");
					idCheck = 1;
					if(idCheck == 1 && pwdCheck) {
						
					}
				}
			}
		})
	}
</script>
</body>
</html>