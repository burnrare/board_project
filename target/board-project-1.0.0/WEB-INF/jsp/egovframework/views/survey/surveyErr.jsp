<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<title>error</title>
</head>
<style>
	div {
		width: 80%;
		margin: 10% auto;
	}
</style>
<body>
	<div>
	<c:choose>
		<c:when test="${compare > 0}">
			<p>참여할 수 없는 기간의 설문조사입니다.</p>
			<a class="btn btn-dark" href="/survey/surveyList.do">메인으로 이동하기</a>
		</c:when>
		<c:when test="${compare2 < 0}">
			<p>참여기간이 지난 설문조사입니다.</p>
			<a class="btn btn-dark" href="/survey/surveyList.do">메인으로 이동하기</a>
		</c:when>
		<c:when test="${login == null}">
			<p>로그인이 필요한 설문조사입니다.</p>
			<a class="btn btn-dark" href="/survey/surveyList.do">메인으로 이동하기</a>
		</c:when>
	</c:choose>
	</div>
</body>
<script src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</html>