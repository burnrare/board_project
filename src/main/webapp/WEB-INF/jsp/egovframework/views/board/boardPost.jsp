<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<title>퓨전 게시판(상세보기)</title>
</head>
<style>
	.pt-5 {
		paddint-top: 0 !important;
	}
	.mt-5 {
		margin-top: 0 !important;
	}
</style>
<body>
<main class="mt-5 pt-5">
	<div class="container-fluid px-4">
		<p class="mt-4">게시글 조회</p>
	 <div class="card mb-4">
			<div class="card-body">
				<input type="hidden" id="board_id" name="board_id" value="${boardPost.board_id}" />
				<input type="hidden" id="user_id" name="user_id" value="${login.user_id}" />
				<div class="mb-3">
					<label for="nickname" class="form-label">작성자</label>
					<input type="text" class="form-control" id="nickname" name="nickname" value="${boardPost.nickname}" readOnly>
				</div> 
				<c:if test="${not empty boardPost.code_id}">
					<div class="mb-3">
						<label for="code_type" class="form-label">카테고리</label>
						<input type="text" class="form-control" id="code_type" name="code_type" value="<c:if test="${not empty boardPost.code_id}"><c:if test="${empty boardPost.code_mid_id}">${boardPost.code_main_nm}</c:if></c:if><c:if test="${not empty boardPost.code_mid_id}"><c:if test="${empty boardPost.code_sub_id}">${boardPost.code_mid_nm}</c:if></c:if><c:if test="${not empty boardPost.code_sub_id}">${boardPost.code_sub_nm}</c:if>" readOnly>
					</div>
				</c:if>
 				<div class="mb-3">
					<label for="b_title" class="form-label">제목</label>
					<input type="text" class="form-control" id="b_title" name="b_title" value="${boardPost.b_title}" readOnly>
				</div>
				<div class="mb-3">
					<label for="b_content" class="form-label">내용</label>
					<textarea class="form-control" id="b_content" name="b_content" style="resize: none;" rows="10" cols="50" readOnly>${boardPost.b_content}</textarea>
				</div>
				<c:if test="${login.user_id != null}">
					<c:if test="${login.user_id == boardPost.b_writer_id}">
					 	<button class="btn btn-outline-warning" onclick="location.href='/board/boardPostModify.do?board_id=${boardPost.board_id}&m_seq=${boardPost.m_seq}'">수정하기</button>
						<button class="btn btn-outline-danger" onclick="location.href='/board/boardPostDe.do?board_id=${boardPost.board_id}&m_seq=${boardPost.m_seq}'">삭제하기</button>
					</c:if>
					<span style="float: right;">총 <c:out value="${boardPost.b_rcount}" /> 개의 댓글</span>
					<c:if test="${boardPost.b_type ne '1000'}">
						<button class="btn btn-outline-info" onclick="location.href='/board/boardRePost.do?board_id=${boardPost.board_id}&m_seq=${boardPost.m_seq}'">답글 달기</button> 
					</c:if>
				</c:if>
			</div> 
	</div>
	
	<!-- 댓글 등록 -->
	<div class="card mb-4">
		<c:choose>
			<c:when test="${login.user_id == null}">
				<div class="card-body">
					<input type="text" id="nullUser" class="form-control" name="nullUser" value="로그인한 회원만 댓글을 달 수 있습니다." readOnly />
				</div> 
			</c:when>
			<c:otherwise>
				<div class="card-body">
					<form method="post" action="/board/replyInsertProc.do">
						<input type="hidden" id="board_id" name="board_id" value="${boardPost.board_id}" readOnly />
						<input type="hidden" id="r_user_id" name="r_user_id" value="${login.user_id}" readOnly />
						<input type="hidden" id="m_seq" name="m_seq" value="${boardPost.m_seq}" readOnly />
						<label for="u_ncnm" class="form-label">댓글 작성자</label>
						<input type="text" class="form-control" id="u_ncnm" name="u_ncnm" value="${login.u_ncnm}" readOnly>
						<label for="r_content" class="form-label">댓글 내용</label>
						<textarea class="form-control" id="r_content" name="r_content"></textarea>
						<button style="margin-top: 10px;" class="btn btn-outline-warning">등록하기</button>
					</form>
				</div> 
			</c:otherwise>
		</c:choose>
	</div>
	
	<!-- 댓글 리스트 -->
	<div class="card mb-4">
		<div class="card-body">
			<c:forEach items="${replyList}" var="reply">
				<c:choose>
					<c:when test="${reply.r_level > 1}">
						<div class="mb-3">
								<span style="padding-left: ${reply.r_level * 20}px;">
									&#32;
									<i class="xi-subdirectory-arrow"></i>
								</span>
							<label for="u_ncnm" class="form-label">댓글 작성자</label>
							<input type="text" id="u_ncnm" name="u_ncnm" value="${reply.r_writer}" readOnly />
							<p style="float: right">
							<fmt:parseDate value="${reply.r_regist_dt}"  var="date" pattern="yy-MM-dd"/>
							<fmt:formatDate value="${date}" pattern="yy-MM-dd" />
							</p>
						</div>
						<div class="mb-3" style="padding-left: ${reply.r_level * 20}px;">
							<label for="r_content" class="form-label">내용</label>
							<textarea class="form-control" id=r_content name="r_content" rows="5" cols="50" style="resize: none;" readOnly>${reply.r_content}</textarea>
						</div>
					</c:when>
					<c:otherwise>
						<div class="mb-3">
							<label for="u_ncnm" class="form-label">댓글 작성자</label>
							<input type="text" id="u_ncnm" name="u_ncnm" value="${reply.r_writer}" readOnly />
							<p style="float: right">
							<fmt:parseDate value="${reply.r_regist_dt}"  var="date" pattern="yy-MM-dd"/>
							<fmt:formatDate value="${date}" pattern="yy-MM-dd" />
							</p>
						</div>
						<div class="mb-3" style="padding-left: ${reply.r_level * 15}px;">
							<label for="r_content" class="form-label">내용</label>
							<textarea class="form-control" id=r_content name="r_content" style="resize: none;" rows="5" cols="50" readOnly>${reply.r_content}</textarea>
						</div>
					</c:otherwise>
				</c:choose>
				<c:if test="${login.user_id != null}">
					<span class="reply-insert btn btn-outline-info" style="margin-bottom: 10px;">리댓달기</span>
				</c:if>
					<!-- 리댓 등록 -->
					<div class="reply-box card-body" style="display: none; background: #D6E4E5;">
						<form method="post" action="/board/SecreplyInsertProc.do">
							<input type="hidden" id="r_par_no" name="r_par_no" value="${reply.r_par_no}">
							<input type="hidden" id="reply_id" name="reply_id" value="${reply.reply_id}">
							<input type="hidden" id="m_seq" name="m_seq" value="${boardPost.m_seq}" readOnly />
							<input type="hidden" id="board_id" name="board_id" value="${boardPost.board_id}" readOnly />
							<input type="hidden" id="r_user_id" name="r_user_id" value="${login.user_id}" readOnly />
							<div class="mb-3">
								<label for="r_writer" class="form-label">원래 댓글 작성자</label>
								<input type="text" class="form-control" id="r_writer" name="r_writer" value="${reply.r_writer}" readOnly>
							</div>
							<div class="mb-3">
								<label for="r_content" class="form-label">리댓글 내용</label>
								<textarea class="form-control" id="r_content" style="resize: none;" name="r_content"></textarea>
							</div>
							<button class="btn btn-warning">등록하기</button>
						</form>
					</div>
				<hr>
			</c:forEach>
		</div> 
	</div>
</div>
</main>
</body>
<script src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$(".reply-insert").click(function() {
			$(this).next().slideToggle().siblings(".reply-box").slideUp();
		});
	});
	
</script>
</html>