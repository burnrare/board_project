<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<title>설문지 게시판(목록)</title>
</head>
<body>
	<main class="mt-5 pt-5">
	<div class="container-fluid px-4">
		<h1 class="mt-4">설문지 게시판</h1>
		<div class="card mb-4">
			<div class="card-body">
				<table class="table table-hover table-striped">
					<thead>
						<tr>
							<th>글번호</th>
							<th>제목</th>
							<th>시작일</th>
							<th>마감일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${surveyList}" var="survey">
							<tr>
								<td>${survey.sur_num}</td>
								<td><a href="/survey/surveyMain.do?sur_id=${survey.sur_id} ">${survey.sur_title}</a></td>
								<td>
								<fmt:parseDate value="${survey.sur_start_dt}"  var="date" pattern="yyyy-MM-dd"/>
								<fmt:formatDate value="${date}" pattern="yyyy-MM-dd" />
								</td>
								<td>
								<fmt:parseDate value="${survey.sur_end_dt}"  var="date" pattern="yyyy-MM-dd"/>
								<fmt:formatDate value="${date}" pattern="yyyy-MM-dd" />
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	</main>
</body>
<script src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<script type="text/javascript">
	$(document).ready(function() {
		
	});
</script>
</html>