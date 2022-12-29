
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<title>퓨전 게시판(목록)</title>
<style>
	* {
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
}
*:before, *:after {
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
}

body {
  font-weight: 300;
  line-height: 1.5;
  color: #333;
}
#row{
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(25%, auto));
}
ul#gallery{
  margin-top: 30px;
    list-style: none;
    padding: 0;
    text-align: center;
}
.img2 {
	width: 80%;
    height: 250px;
    object-fit: cover;
}
ul#gallery>li{
    position: relative;
    display: inline-block;
    margin: 5px;
    
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    border: 1px solid #ddd;
    padding: 15px;
}
ul#gallery>li>a {
	color: #000;
	font-weight: 700;
	padding: 10px;
}
ul#gallery>li>img{
    transition: 0.6s ease-in-out;
}
ul#gallery>li:hover img{
    transform: scale(1.0);
    opacity: 0.65;
}
ul#gallery>li:hover::after{
    opacity: 1;
}
</style>
</head>
<body>
	<main class="mt-5 pt-5">
	<div class="container-fluid px-4">
		<h1 class="mt-4">
		<a style="text-decoration: none; color: #000;" href="/gallery/galleryList.do">게시판
		</a>
		</h1>
			<c:if test="${login != null}">
				<a class="btn btn-primary float-end"
				href="javascript:openPop('/gallery/galleryInsert.do?m_seq=${m_seq}', 'popup');">
				글 작성
				</a>
			</c:if>
		<form action="/gallery/galleryList.do" method="GET" class="row g-3">
			<input type="hidden" id="m_seq" name="m_seq" value="${m_seq}" />
			<div class="col-auto">
				<select name="searchKey" id="searchKey" class="form-control">
					<option value="title" 
						<c:if test="${searchKey eq 'title'}">
						selected
						</c:if>
					>제목</option>
					<option value="content"
						<c:if test="${searchKey eq 'content'}">
						selected
						</c:if>
					>내용</option>
					<option value="writer_id"
						<c:if test="${searchKey eq 'writer_id'}">
						selected
						</c:if>
					>작성자</option>
					<option value="tag"
						<c:if test="${searchKey eq 'tag'}">
						selected
						</c:if>
					>태그</option>
				</select>
			</div>
			<div class="col-auto">
				<input type="text" id="gallerySearchVal" class="form-control" onkeypress="showName(event)" name="searchVal" 
				value="${not empty bvo.searchVal ? bvo.searchVal:param.searchVal}"/>
			</div>
			<div class="col-auto">
				<button class="search-btn btn btn-secondary" type="submit">검색</button>
			</div>
		</form>
			<div id="row" class="card-container">
  				<c:forEach items="${galleryList}" var="gallery">
					<ul id="gallery">
						<li>
							<c:choose>
								<c:when test="${empty gallery.f_uuid}">
									<img class="img2" src="/fileUpload/idk/idk.png" />
								</c:when>
								<c:otherwise>
									<img class="img2" src="/fileUpload/${gallery.f_uuid}" />
								</c:otherwise>
							</c:choose>
							<a href="javascript:openPop('/gallery/galleryPost.do?board_id=${gallery.board_id}&m_seq=${gallery.m_seq}', 'popup');">${gallery.b_title}</a>
							<span><i class="xi-heart"></i>${gallery.b_like}
								  <i class="xi-eye"></i>${gallery.b_board_cnt}
							</span>
							<c:forEach items="${tagList}" var="tag">
								<c:if test="${tag.board_id == gallery.board_id}">
									<a href="/gallery/galleryList.do?m_seq=${m_seq}&pageIndex=1&searchKey=tag&searchVal=${tag.tag_name}" style="text-decoration: none; color: #000; font-size: 12px;">
									&#35; 
									<span class="tag_val">${tag.tag_name}</span>
									</a>
								</c:if>
							</c:forEach>
							<span>${gallery.b_regist_dt}</span>
							<span>${gallery.tag_name}</span>
						</li>
					</ul>
				</c:forEach>
			</div>
		<ui:pagination paginationInfo = "${paging}"
			type="image"
			jsFunction="linkPage"/>
	</div>
	
	
</main>
</body>
<script src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<script type="text/javascript">

		var searchKey = $("select[name=searchKey] > option:selected").val();
		var searchVal = $("#gallerySearchVal").val();
		var m_seq = $("#m_seq").val();
		
	$(document).ready(function() {
		
		$(".search-btn").on('click', function() {
			linkPage(1);
		});
		
		$(".tag_val").on("click", function() {
			var searchVal = $(this).text();
			$("#search").attr("action", "/gallery/galleryList.do").submit();
		});
		
	});
	function showName(e) {
		var inputTxt = $("#gallerySearchVal").val();
		var code = e.code;
		console.log("?")
		if(code == 'Enter') {
			linkPage(1);
		}
	}
	function linkPage(pageIndex) {
		console.log(pageIndex);
		location.href = "/gallery/galleryList.do?m_seq=" + m_seq + "&pageIndex=" + pageIndex + "&searchKey=" + searchKey + "&searchVal=" + searchVal;
	}
	function openPop(url, name) {
		var options = 'top=10, left=10, width: 200, height: 300, status=no, menubar=no, toolbar=no, resizable=no';
		window.open(url, name, options);
	}
</script>
</html>