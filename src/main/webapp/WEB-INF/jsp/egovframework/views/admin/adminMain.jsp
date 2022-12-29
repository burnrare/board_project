<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div style="width: 70%; margin: auto;">
	<h1>관리자 페이지입니다.</h1>
	<c:if test="${login.u_type == 1 || login.u_type == 2}">
			<a href="/admin/menuRegist.do" class="btn btn-dark">메뉴관리</a>
			<a href="/admin/menuLog.do" class="btn btn-dark">메뉴통계</a>
			<a href="/admin/codeInfo.do" class="btn btn-dark">코드관리</a>
	</c:if>
	</div>
</body>
</html>