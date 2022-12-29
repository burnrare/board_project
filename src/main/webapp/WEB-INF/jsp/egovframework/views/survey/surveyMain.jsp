<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<title>설문지</title>
<style>
	.style {
    padding: 50px;
    border: 1px solid #ddd;
    width: 80%;
    margin: auto;
	}
</style>
</head>
<body>
	<div class="navbar">
			<c:if test="${login == null}">
				<a class="btn btn-dark" href="/login.do">로그인</a>
			</c:if>
			<c:if test="${login != null}">
				<a class="btn btn-dark" href="/logout.do">로그아웃</a>
			</c:if>
	</div>
	<div class="card-body style">
		<p>퓨전소프트 회원분들을 대상으로 만족도 조사를 진행합니다.</p>
		<pre>  응답하신 내용은 통계법 33조(비밀의 보호)에 의거 비밀이 보장되며,
 서비스 개선을 위한 자료 외에 어떠한 목족으로도 사용되지 않음을 약속드립니다. 많은 참여 부탁드리며,
 앞으로도 교육정책 및 교육과정 정보를 보다 빠르게 활용하실 수 있도록 노력하겠습니다.</pre>
 		<ul>
 			<li>조사주관: 퓨전소프트</li>
 			<c:choose>
 				<c:when test="${fn:contains(login_yn, 'Y')}">
 					<li>참여대상: 회원(로그인 필요)</li>
 				</c:when>
 				<c:otherwise>
 					<li>참여대상: 회원/비회원</li>
 				</c:otherwise>
 			</c:choose>
 			<li>참여기간: `${surveyMain.startday}` ~ `${surveyMain.endday}` 총 <strong>${surveyMain.dt}</strong>일간</li>
 			<li>참여방법: 하단의 설문시작 버튼을 클릭하여 총 <strong>${surveyMain.sur_cnt}</strong>개의 문항에 답변을 마치면 응모 완료</li>
 			<li>당첨자 발표: `${surveyMain.endday_result}`, 퓨전소프트 공지사항 게시판</li>
 			<li>&#8903; 유의사항
 				<ul>
 					<li>당첨자 선정은 응답 내용의 성실성 등을 고려하여 선정됩니다.</li>
 					<c:if test="${login != null}">
 						<li>1인 ${surveyMain.sur_submit_cnt}회에 한하여 참여 가능합니다.</li>
 					</c:if>
 				</ul>
 			</li>
 		</ul>
		<c:choose>
			<c:when test="${login_yn eq 'Y'.charAt(0)}">
				<c:choose>
					<c:when test="${login != null}">
						<c:if test="${existSubmit == surveyMain.sur_submit_cnt}">
							<p style="font-size: 20px; color: red;">이미 참여 완료된 설문지입니다.</p>
							<a class="btn btn-dark" href="/survey/surveyModify.do?sur_id=${surveyMain.sur_id}">설문 수정</a>
						</c:if>
						<c:if test="${existSubmit < surveyMain.sur_submit_cnt}">
							<a class="btn btn-dark" href="/survey/surveyInsert.do?sur_id=${surveyMain.sur_id}">설문 참여</a>
						</c:if>
					</c:when>
				</c:choose>
			</c:when>
			<c:when test="${login_yn eq 'N'.charAt(0)}">
				<c:choose>
					<c:when test="${login != null}">
						<c:if test="${existSubmit == surveyMain.sur_submit_cnt}">
							<p style="font-size: 20px; color: red;">이미 참여 완료된 설문지입니다.</p>
							<a class="btn btn-dark" href="/survey/surveyModify.do?sur_id=${surveyMain.sur_id}">설문 수정</a>
						</c:if>
						<c:if test="${existSubmit < surveyMain.sur_submit_cnt}">
							<a class="btn btn-dark" href="/survey/surveyInsert.do?sur_id=${surveyMain.sur_id}">설문 참여</a>
						</c:if>
					</c:when>
					<c:when test="${login == null}">
							<a class="btn btn-dark" href="/survey/surveyInsert.do?sur_id=${surveyMain.sur_id}">설문 참여</a>
					</c:when>
				</c:choose>
			</c:when>
		</c:choose>
	</div>
</body>
<script src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous">
</script>
</html>