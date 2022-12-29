<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<title>Insert title here</title>
<style>
	.wrap {
		width: 80%;
   		padding: 20px;
    	margin: auto;
    	background: #fff;
	}
	.wrap .mn_flex {
    font-size: 18px;
    padding: 5px;
    color: #393E46;
   border: 1px solid #393E46;
    border-radius: 4px;
    display: flex;
    flex-direction: row;
    justify-content: space-between;
    align-items: center;
	}
	.wrap .title {
    		font-size: 18px;
    		padding: 5px;
    		margin-right: 15px;
	}
	.wrap .title > a {
		text-decoration: none;
		color: #1C6758;
	}
	.wrap .title:hover {
		border-bottom: 1px solid #1C6758;
	}
	.wrap .content {
		width: 100%;
    	white-space: normal;
    	overflow: hidden;
    	text-overflow: ellipsis;
    	padding: 10px;
    	border: 1px solid #ccc;
	}
	.nosearch {width: 80%;margin: auto;padding: 50px;}
	.title-sty {display: flex;
    flex-direction: row;
    justify-content: flex-start;
    align-items: center;}
    .item_dt { font-size: 12px; }
</style>
</head>
<body>
	<!-- 제목에도 링크 걸어서 해당 post로 바로 이동하게 수정 OK -->
	<!-- 갤러리형일 경우 이미지 보여 주기 -->
	<!-- 총 몇 개의 게시글이 있는지 알려 주기 -->
	<%-- <c:forEach items="${searchList}" var="search" varStatus="stat">
			<h1><a href="${search.m_url}?m_seq=${search.m_seq}">${search.m_nm}</a></h1>
			<p>
				<c:choose>
					<c:when test="${search.ty_id == '1001'}">일반게시판</c:when>
					<c:when test="${search.ty_id == '1002'}">갤러리</c:when>
					<c:when test="${search.ty_id == '1003'}">설문지</c:when>
					<c:when test="${search.ty_id == '1004'}">링크형</c:when>
				</c:choose>
			</p>
		<c:forEach items="${search.boardList }" var="items">
			제목 : <c:out value="${items.b_title }"/>
			<br>
			내용 : <c:out value="${items.b_content}" />
		</c:forEach>
			<hr/>
	</c:forEach> --%>
			<c:if test="${empty menuList}">
				<div class="nosearch">
					<h1>검색한 <strong>${AllsearchVal}</strong>에 대한 결과가 없습니다.</h1>
				</div>
			</c:if>
			 <c:forEach items="${menuList}" var="menuItem">
			 <div class="wrap">
			 	<div class="mn_flex">
			 	<div class="mn">${menuItem.m_nm}</div>
			 	<div class="mn_tyid">
			 		<c:choose>
			 			<c:when test="${menuItem.ty_id == '1002'}">갤러리형</c:when>
			 			<c:when test="${menuItem.ty_id == '1001'}">일반게시판</c:when>
			 			<c:when test="${menuItem.ty_id == '1003'}">설문지</c:when>
			 		</c:choose>
			 	</div>
			 	</div>
				<c:forEach items="${searchList}" var="board">
						 <c:forEach items="${board}" var="boardItem" varStatus="item">
							<c:if test="${menuItem.m_seq == boardItem.m_seq}">
								<c:if test="${item.index < 3}">
								<div class="title-sty">
									<div class="title"><a href="<c:choose><c:when test="${boardItem.b_type eq '1002'}">/gallery/galleryPost.do?board_id=${boardItem.board_id}&m_seq=${boardItem.m_seq}</c:when><c:when test="${boardItem.b_type eq '1001'}">/board/boardPost.do?board_id=${boardItem.board_id}&m_seq=${boardItem.m_seq}</c:when></c:choose>"><i class="xi-arrow-right xi-x"></i>${boardItem.b_title}
									
									<span style="font-size: 12px;">댓글(${boardItem.b_rcount})</span></a>
									</div>
									<div class="item_dt">${boardItem.b_regist_dt}</div>
								</div>
									<div class="content">${boardItem.b_content}</div>
								</c:if>
								<c:if test="${item.index == 3}">
									<div style="float: right;"><a style="padding-top: 20px; font-size: 13px; margin-bottom: 20px;" href="<c:choose><c:when test="${boardItem.b_type eq '1002'}">/gallery/galleryList.do?m_seq=${boardItem.m_seq}&searchKey=title&searchVal=${AllsearchVal}</c:when><c:when test="${boardItem.b_type eq '1001'}">/board/boardList.do?m_seq=${boardItem.m_seq}&searchKey=title&searchVal=${AllsearchVal}</c:when></c:choose>">더 보러 가기</a></div>
								</c:if>
								</c:if>
						 </c:forEach>
				</c:forEach>
				<c:forEach items="${searchList2}" var="survey" begin="0" end="3">
					<c:if test="${not empty searchList2}">
						<c:forEach items="${survey}" var="surveyItem">
							<c:if test="${menuItem.m_seq == surveyItem.m_seq}">
								<div class="title"><a href="/survey/surveyList.do?m_seq=${surveyItem.m_seq}"><i class="xi-arrow-right xi-x"></i>${surveyItem.sur_title}</a></div>
							</c:if>
						</c:forEach>
					</c:if>
				</c:forEach>
			</div>
		 	</c:forEach>		
</body>
<script src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<script type="text/javascript">
$(document).ready(function () { 
	
/* 	var length = ${fn:length(boardItem)}
	console.log(length);
	 */
})
</script>
</html>