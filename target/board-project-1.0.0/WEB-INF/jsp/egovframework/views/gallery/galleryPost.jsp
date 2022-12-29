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
	.span > a > span {
	    border: 1px solid #ddd;
	    border-radius: 5px;
	    padding: 5px;
	    font-size: 5px;
	    background: #aeaeae;
	    color: #fff;
    }
    img {
        width: 20%;
   	}
</style>
<body>
<main class="mt-5 pt-5">
	<div class="container-fluid px-4">
		<p class="mt-4">게시글 조회</p>
	 <div class="card mb-4">
			<div class="card-body">
				<input type="hidden" id="board_id" name="board_id" value="${gPost.board_id}" />
				<input type="hidden" id="user_id" name="user_id" value="${login.user_id}" />
				<div class="mb-3">
					<label for="nickname" class="form-label">작성자</label>
					<input type="text" class="form-control" id="nickname" name="nickname" value="${gPost.nickname}" readOnly>
				</div>  
 				<div class="mb-3">
					<label for="b_title" class="form-label">제목</label>
					<input type="text" class="form-control" id="b_title" name="b_title" value="${gPost.b_title}" readOnly>
				</div>
				<div class="mb-3">
					<c:forEach items="${imgList}" var="img">
						<c:if test="${img.f_del_yn eq 'N'}">
							<img src="/fileUpload/${img.f_uuid}"/>
						</c:if>
					</c:forEach> 
				</div>
				<div class="mb-3">
					<label for="b_content" class="form-label">내용</label>
					<textarea class="form-control" id="b_content" name="b_content" style="resize: none;" rows="10" cols="50" readOnly>${gPost.b_content}</textarea>
				</div>
				<div class="mb-3">
					<a class="heart btn btn-outline-dark">
						<span id="heart"></span>
					</a>
				</div>
				<form name="searchForm" id="search" method="GET">
	 				<div class="mb-3 span">
						<c:forEach items="${tagList}" var="tag">
							<a href="/gallery/galleryList.do?pageIndex=1&searchKey=tag&searchVal=${tag.tag_name}" style="text-decoration: none; color: #000; font-size: 12px;">
								&#35; 
								<span class="tag_val">${tag.tag_name}</span>
							</a>
						</c:forEach>
					</div>
				</form>
				<div class="mb-3">
					<div class="data_file_txt" id="data_file_txt" style="margin-top:40px;">
					<input type="hidden" id="f_size" name="f_size" value="${img.f_size}" />
						<span>첨부 파일</span>
							<div id="articlefileChange">
								<c:forEach items="${imgList}" var="img" varStatus="stat">
									<c:if test="${img.f_del_yn eq 'N'}">
										<input type="hidden" id="f_num" name="f_num" value="${img.f_num}" />
										<div id='file${stat.count}'>
											<a href='/downloadImg.do?f_uuid=${img.f_uuid}&f_num=${img.f_num}' style="font-size: 12px;">
												${img.f_name}
											</a>
											<span style="font-size: 10px; padding-left: 5px;">${img.f_size}kb</span>
											<span style="font-size: 10px; padding-left: 5px;">다운로드 수${img.f_cnt}</span>
										</div>
									</c:if>
								</c:forEach> 
							</div>
					</div>
				</div>
				 	<button class="btn btn-outline-warning" onclick="location.href='/gallery/galleryModify.do?board_id=${gPost.board_id}'">수정하기</button>
					<button class="btn btn-outline-danger" onclick="location.href='/board/boardPostDe.do?board_id=${gPost.board_id}'">삭제하기</button>
			</div> 
	</div>
</main>
</body>
<script src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<script type="text/javascript">
	$(document).ready(function() {
		
		var heartVal = ${heart};
		var board_id = $("#board_id").val();
		console.log(heartVal);
		
		if(heartVal > 0) {
			console.log(heartVal);
            $("#heart").append('<i class="xi-heart"></i>');
            $(".heart").prop('name', heartVal);
		} else {
			console.log(heartVal);
            $("#heart").append('<i class="xi-heart-o"></i>');
            $(".heart").prop('name', heartVal);
		}
		
		$(".heart").on("click",function() {
			var that = $(".heart");
			var sendData = {'board_id' : board_id, 'heart' : that.prop('name')};
			
			$.ajax({
				url: '/heart.do',
				type: 'POST',
				contentType : 'application/json; charset=utf-8',
				data: JSON.stringify(sendData),
				success: function(data) {
					that.prop('name', data);
					if(data == 1) {
						$("#heart").empty();
						$("#heart").append('<i class="xi-heart"></i>');
					} else {
						$("#heart").empty();
						$("#heart").append('<i class="xi-heart-o"></i>');
					}
				}
			})
		});
		
		$(".tag_val").on("click", function() {
			var searchVal = $(this).text();
			console.log(searchVal);
			$("#search").attr("action", "/gallery/galleryList.do").submit();
		});
	});
	
</script>
</html>