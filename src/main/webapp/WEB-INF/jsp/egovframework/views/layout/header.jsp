<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles"  prefix="tiles"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<style>
	* {
		margin: 0;
	}
	p {
		margin: 0 10px 0 0 !important;
	}
	header {
		width: 100%;
		background: #EFF5F5;
		display: flex;
   		flex-direction: row;
    	justify-content: space-between;
    	align-items: center;
   	    height: 80px;
	}
	.img {
		width: 33%;
		margin: auto;
		text-align: center;
	}
	.searchAll {
		text-align: center;
	}
	.nav_bar{
		width: 33%;
	    display: flex;
	    flex-direction: row;
	    align-items: center;
	    justify-content: center;
	    color: #000;
    }
    .nav_bar p {
    	margin-right: 10px;
    }
    .searchAll input {
        width: 80%;
    	float: left;
    }
    ul li {
    	list-style: none;
    }
    #menu ul {
    	display: flex;
   		flex-direction: row;
    	align-items: center;
    	width: 80%;
    margin: auto;
    }
</style>
</head>
<body>
	<header>
		<div class="img">
			<a href="/tiles/first.do">
				<img src="${path}/resources/images/main/logo.png" />
			</a>
		</div>
		<form action="/etc/searchAll.do" method="GET" style="width: 33%">
		<div class="searchAll">
			<input type="text" id="AllsearchVal" class="form-control" name="AllsearchVal" value="${AllsearchVal}"/>
			<button type="submit" id="search" value="search">검색</button>
		</div>
		</form>
		<div class="nav_bar">
				<c:if test="${login == null}">
					<a class="btn btn-dark" href="/login.do">로그인</a>
					<a class="btn btn-dark" href="/join.do">회원가입</a>
				</c:if>
				<c:if test="${login != null}">
					<p>
						<c:choose>
							<c:when test="${login.u_type eq '0'}">일반사용자</c:when>
							<c:when test="${login.u_type eq '1'}">일반관리자</c:when>
							<c:when test="${login.u_type eq '2'}">슈퍼관리자</c:when>
						</c:choose>
						${login.u_ncnm} 님, 환영합니다
					</p>
					<a class="btn btn-dark" href="/logout.do">로그아웃</a>
					<c:if test="${login.u_type eq '2' || login.u_type eq '1'}">
						<a href="/admin/adminMain.do" class="btn btn-dark">관리자</a>
					</c:if>
				</c:if>
		</div>
	</header>
	<div id="menu">
		<ul>
			<li><a class="btn btn-warning" href="/sns/snsList.do">SNS</a></li>
			<tiles:importAttribute name="menuList"/>
			<c:forEach items="${menuList}" var="menu">
			<c:if test="${login.u_type == menu.auth_type && login != null}">
				<li>
					<c:if test="${menu.ty_id ne '1004'}">
					<a class="btn btn-dark" href="${menu.m_url}?m_seq=${menu.m_seq}">${menu.m_nm}</a>
					</c:if>
					<c:if test="${menu.ty_id eq '1004'}">
					<a class="btn btn-dark link" data-seq="${menu.m_seq}" data-url="${menu.m_url}" target="_blank">${menu.m_nm}</a>
					</c:if>
				</li>
			</c:if>
			<c:if test="${menu.auth_type == null && login == null}">
				<li>
					<c:if test="${menu.ty_id ne '1004'}">
					<a class="btn btn-dark" href="${menu.m_url}?m_seq=${menu.m_seq}">${menu.m_nm}</a>
					</c:if>
					<c:if test="${menu.ty_id eq '1004'}">
					<a class="btn btn-dark link" data-seq="${menu.m_seq}" data-url="${menu.m_url}" target="_blank">${menu.m_nm}</a>
					</c:if>
				</li>
			</c:if>
			</c:forEach>
		</ul>
	</div>
</body>
<script src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('.link').click(function() {
				var href = $(this).data("url");
				var m_seq = $(this).data("seq");
				console.log(href);
			$.ajax({
				url: '/etc/linkLog.do',
				contentType: 'application/json; charset=utf-8',
				type: 'POST',
				data: JSON.stringify({
					m_seq : m_seq
				})
			}).done(function(data) {
				window.open(href);
			})
		})
	});
</script>
</html>