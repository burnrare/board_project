<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<title>퓨전 게시판(작성)</title>
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
		<p class="mt-4">게시글 작성</p>
		<div class="card mb-4">
			<div class="card-body">
				<form method="post" action="/board/boardInsertProc.do">
				<input type="hidden" id="user_id" name="user_id" value="${login.user_id}" />
					<c:if test="${login.u_type eq '1'}">
						<div class="mb-3">
							<select id="ty_id" name="ty_id" class="form-control">
								<c:forEach items="${typeList}" var="type">
									<option value="${type.ty_id}">${type.tynm}</option>
								</c:forEach>
							</select>
						</div>
					</c:if>
					<div class="mb-3">
						<label for="b_title" class="form-label">제목</label>
						<input type="text" class="form-control" id="b_title" name="b_title" value="" required>
					</div>
					<div class="mb-3">
						<label for="b_content" class="form-label">내용</label>
						<textarea class="form-control" id="b_content" style="resize: none;" rows="20" cols="50" name="b_content" value="" required></textarea>
					</div>
					<!-- <div class="mb-3">
						<label for="writer" class="form-label">작성자</label>
						<input type="text" class="form-control" id="writer" name="writer" value="" disabled>
					</div> -->
					<%--   <div style="float: right; display: flex; flex-direction: row; align-items: center; ">
					<c:if test="${login.u_type eq '1'}">
					    <label class="form-check-label" for="b_ntc_yn" style="margin-right: 5px; font-size: 13px;">
					      팝업으로 띄우기
					    </label>
						<input type="checkbox" class="form-check-input" id="b_ntc_yn" name="b_ntc_yn" value="Y" style="margin-right: 10px;"/>
					</c:if> 
					</div> --%>
					<button class="btn btn-outline-warning">등록하기</button>
				</form>
			</div>
		</div>
	</div>
</main>
</body>
<script src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<script type="text/javascript">
	$(document).ready(function() {
		console.log($('#ckBox').prop('checked',true));
	});
</script>
</html>