<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
<title>퓨전 게시판(목록)</title>
<style>

	a {
		text-decoration: none;
	}

	.notice {
        background: #f1f1f1;
	    width: 30%;
	    position: fixed;
		left: 25%;
		top: 25%;
	    padding: 30px;
	    margin-left: -15%;
	    margin-top: -250px;
	    box-shadow: 0 10px 10px rgb(30 30 30 / 8%);
	    border: 3px solid #333333;
	    opacity: 1;
	    -webkit-transition: all 180ms ease-in;
	    transition: all 180ms ease-in;
	}

	.notice .notice_close {
	  font-size: 2rem;
	  line-height: 2rem;
	  position: absolute;
	  right: 15px;
	  top: 15px;
	  cursor: pointer;
	  padding: 15px;
	  -webkit-transition: color 150ms ease;
	  transition: color 150ms ease;
	}
	.notice .notice_close:hover {
	  color: #E74C3C;
	}
	.notice .notice_title {
	  font-size: 2rem;
	  font-family: 'Slabo 27px', serif;
	  font-weight: 100;
	  margin: 0;
	  padding: 0 0 15px 0;
	  border-bottom: 2px solid #333333;
	}
	.notice .notice_content {
	  font-size: 1.1rem;
	  line-height: 2rem;
	}
	.notice .notice_action {
	  margin: 0;
	  font-size: 1rem;
	}
	
	.row {
	    padding-top: 20px;
    	padding-left: 15px;
    }

</style>
</head>
<body>
	<main class="mt-5 pt-5">
		<div class="container-fluid px-4">
		<div class="navbar">
			<p class="mt-4">게시판</p>
			<c:if test="${login == null}">
				<a class="btn btn-dark" href="/login.do">로그인</a>
			</c:if>
			<c:if test="${login != null}">
				<a class="btn btn-dark" href="/logout.do">로그아웃</a>
			</c:if>
		</div>

			<div class="card mb-4">
			<c:if test="${login.user_id != null}">
				<div class="card-header">
					<a class="btn btn-primary float-end"
						href="javascript:openPop('/board/boardInsert.do', 'popup');">
						<i class="fas fa-edit"></i> 글 작성
					</a>
					<a class="btn btn-info float-end"
						href="/gallery/galleryList.do">
						<i class="fas fa-edit"></i> 갤러리게시판
					</a>
				</div>
			</c:if>
					<form action="/board/boardList.do" method="GET" class="row g-3">
						<div class="col-auto">
							<select id="cntPerPage" name="cntPerPage" class="form-control">
								<option value="5"
									<c:if test="${cntPerPage eq '5'}">
									selected
									</c:if>
								>5개 보기</option>
								<option value="10"
									<c:if test="${cntPerPage eq '10'}">
									selected
									</c:if>
								>10개 보기</option>
								<option value="50"
									<c:if test="${cntPerPage eq '50'}">
									selected
									</c:if>
								>50개 보기</option>
							</select>
						</div>
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
								<option value="all"
									<c:if test="${searchKey eq 'all'}">
									selected
									</c:if>
								>전체</option>
							</select> 
						</div>
						<div class="col-auto">
							<input type="text" id="searchVal" class="form-control" name="searchVal" value="${not empty bvo.searchVal ? bvo.searchVal:param.searchVal}"/>
						</div>
						<div class="col-auto">
							<button class="search-btn btn btn-secondary" type="button">검색</button>
						</div>
					</form>
				<div class="card-body">
					<table class="table table-hover">
							<thead>
								<tr>
									<th>글번호</th>
									<th>제목</th>
									<th>조회수</th>
									<th>작성자</th>
									<th>작성일</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${noticeList}" var="notice">
									<tr style="background: #DFF6FF;">
										<td>
											<i class="xi-crown" style="color: #FD841F;"></i>
										</td>
										<td>
											<a style="font-weight: 900; color: #182747;" href="javascript:openPop('/board/boardPost.do?board_id=${notice.board_id}', 'popup');">${notice.b_title}</a>
											<span>[${notice.b_rcount}]</span>
										</td>
										<td>${notice.b_board_cnt}</td>
										<td>${notice.nickname}</td>
										<td>
											<fmt:parseDate value="${notice.b_regist_dt}"  var="date" pattern="yyyy-MM-dd"/>
											<fmt:formatDate value="${date}" pattern="yyyy-MM-dd" />
										</td>
									</tr>
								</c:forEach>
								<c:forEach items="${boardList}" var="board">
									<tr>
										<td>${board.board_num}</td>
										<td>
										<c:if test="${board.level > 1}">
											<span style="padding-left: ${board.level * 15}px;">
												&#32;
												<i class="xi-subdirectory-arrow"></i>
											</span>
										</c:if>
										<c:choose>
											<c:when test="${board.b_del_yn eq 'Y'}">
												삭제된 게시글입니다.
											</c:when>
											<c:otherwise>
												<a href="javascript:openPop('/board/boardPost.do?board_id=${board.board_id}', 'popup');">${board.b_title}</a>
												<span>[${board.b_rcount}]</span>
											</c:otherwise>
										</c:choose>
										</td>
										<td>${board.b_board_cnt}</td>
										<td>${board.nickname}</td>
										<td>
											<fmt:parseDate value="${board.b_regist_dt}"  var="date" pattern="yyyy-MM-dd"/>
											<fmt:formatDate value="${date}" pattern="yyyy-MM-dd" />
										</td>
									</tr>
								</c:forEach>
							</tbody>
					</table>
				</div>
			</div>
			
	<ui:pagination paginationInfo = "${paging}"
			type="image"
			jsFunction="linkPage"/>
			
		</div>
		
	<c:forEach items="${noticeList}" var="notice" varStatus="stat">
		<div class="notice" style="left: ${stat.count + 19}%; top:${stat.count + 22}%; z-index: ${stat.count}; ">
		  <span class="notice_close">&#x2715;</span>
		  <p class="notice_content">${notice.b_regist_dt}</p>
		  <h2 class="notice_title">
	  		<a style="color: #000;" href="javascript:openPop('/board/boardPost.do?board_id=${notice.board_id}', 'popup');">
	  		${notice.b_title}
	  		</a>
		  </h2>
		  <p class="notice_content">${notice.b_content}</p>
		  <p style="float: left;">오늘 하루 보지 않기</p>
		  <input type="checkbox" name="check" value="오늘 하루 보지 않기"/>
		</div>
	</c:forEach>
	
	</main> 
</body>
<script src="https://code.jquery.com/jquery-3.6.1.js"
	integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
	crossorigin="anonymous"></script>
<script type="text/javascript">

	var searchKey;
	var searchVal;
	var cntPerPage;

	$(document).ready(function() {
		
		var noticeClose = $('.notice_close');
		
/*   		cookiedata = document.cookie;
		console.log(cookiedata);
		
 		if(cookiedata.indexOf("close=Y") < 0) {
			$(".notice").css({"display" : "block"});
		} else {
			$(".notice").hide();
		}  */

		
		noticeClose.on('click', function() {
			$(this).parent().hide(); 
			/* couponClose();  */
		});
		
		searchKey = $("#searchKey").val();
		searchVal = $("#searchVal").val();
		cntPerPage = $("#cntPerPage").val();
		
		$(".search-btn").on('click', function() {
			searchKey = $("#searchKey").val();
			searchVal = $("#searchVal").val();
			cntPerPage = $("#cntPerPage").val();
			
			linkPage(1);
		});
	
			
	});
	
/* 	
 	 var getCookie = function(cname) {
		var name = cname + "=";
		var ca = document.cookie.split(';');
		for (var i = 0; ca.length; i++) {
			var c = ca[i];
			while (c.charAt(0) == ' ') c = c.substring(1);
			if (c.indexOf(name) != -1) {
				return c.substring(name.length, c.length);
			}
		}
		return "";
	}
	 
     var setCookie = function (cname, cvalue, exdays) {
        var todayDate = new Date();
        todayDate.setTime(todayDate.getTime() + (exdays*24*60*60*1000));    
        var expires = "expires=" + todayDate.toUTCString();
        document.cookie = cname + "=" + cvalue + "; " + expires;
        // 계정도 같이 붙여서 넘기기 , layer 번호, id
    }
 
     var couponClose = function(){
        if($("input[name='check']").is(":checked") == true){
            setCookie("close", "Y", 1);
        }
        $(noticeClose).parent().hide(); 
    }   
     */
	function linkPage(pageIndex) {
		location.href = "/board/boardList.do?pageIndex=" + pageIndex + "&cntPerPage=" + cntPerPage + "&searchKey=" + searchKey + "&searchVal=" + searchVal;
	}
	function openPop(url, name) {
		var options = 'top=10, left=10, width: 200, height: 300, status=no, menubar=no, toolbar=no, resizable=no';
		window.open(url, name, options);
	}
	
</script>
</html>