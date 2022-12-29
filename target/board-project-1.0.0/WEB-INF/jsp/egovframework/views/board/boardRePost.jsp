<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<title>퓨전 게시판(작성)</title>
<style>
	.pt-5 {
		paddint-top: 0 !important;
	}
	.mt-5 {
		margin-top: 0 !important;
	}
</style>
</head>
<body>
	<main class="mt-5 pt-5">
	<div class="container-fluid px-4">
		<p class="mt-4">답글 작성</p>
		<div class="card mb-4">
			<div class="card-body">
				<form method="post" action="/board/boardRePostProc.do">
				<input type="hidden" name="board_id" value="${boardPost.board_id}" />
				<input type="hidden" name="b_writer_id" value="${login.user_id}" />
					<div class="mb-3">
						<label for="b_title" class="form-label">제목</label>
						<input type="text" class="form-control" id="b_title" name="b_title" value="">
					</div>
					<div class="mb-3">
						<label for="b_content" class="form-label">내용</label>
						<textarea class="form-control" id="b_content" style="resize: none;" rows="20" cols="50" name="b_content" value=""></textarea>
					</div>
					<a href="/board/boardPost.do?board_id=${boardPost.board_id}" class="btn btn-outline-secondary">뒤로 가기</a>
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
		
	});
</script>
</html>