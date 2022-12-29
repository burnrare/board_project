<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1, user-scalable=no">
<title>황하경 작업 내역</title>
<script src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/1c8b7ea464.js" crossorigin="anonymous"></script>
<link href="${path}/resources/css/main.css" rel="stylesheet" />
<link href="${path}/resources/css/media.css" rel="stylesheet" />
</head>
<body>
<div id="main-container">
		<div id="container-img"></div>
	<div id="container">
		<div id="header">
			<div id="nav">
				<div id="nav-left-box">
				<img src="${path}/resources/images/main/logo.png" />
					<div class="nav-bar" >
						<div class="bar1"></div>
						<div class="bar2"></div>
						<div class="bar3"></div>
					</div>
				</div>
				<div class="m-menu">
						<ul>
							<li>
								<a href="#">CK소개</a>
								<i class="fa-solid fa-caret-down"></i>
							</li>
							<li>
								<a href="#">채용공고</a>
								<i class="fa-solid fa-caret-down"></i>
							</li>
							<li>
								<a href="#">인재서비스</a>
								<i class="fa-solid fa-caret-down"></i>
							</li>
							<li>
								<a href="#">인터뷰</a>
								<i class="fa-solid fa-caret-down"></i>
							</li>
							<li>
								<a href="/board/boardList.do">공지사항</a>
								<i class="fa-solid fa-caret-down"></i>
							</li>
						</ul>
				</div>
					<div class="m-menu-bg"></div>
				<div id="nav-first-box">
					<ul> 
						<li>KR</li>
						<li>EN</li>
					</ul>
					<ul>
						<li>
							<a href="#">CK소개</a>
						</li>
						<li>
							<a href="#">채용공고</a>
						</li>
						<li>
							<a href="#">인재서비스</a>
						</li>
						<li>
							<a href="#">인터뷰</a>
						</li>
						<li>
							<a href="/board/boardList.do">공지사항</a>
						</li>
					</ul>
				</div>
				<div id="nav-second-box">
					<h2>FUSIONSOFT</h2>
					<p>2022 하반기 공채</p>
				</div>
			</div>
		</div>
		<div id="title">
					<p>FUSIONSOFT</p>
					<p>RECRUIT</p>
					<p>퓨전소프트의 미래를 이끌어 나갈<br>
					<span>인재</span>를 기다리고 있습니다.</p>
		</div>
			<div class="content-wrap">
				<div class="arrow-after">
					<label for="job">직종별</label>
					<select id="job"></select>
					
					<label for="team">부서별</label>
					<select id="team"></select>
					
					<label for="year">경력</label>
					<select id="year"></select>

					<div class="btn-wrap">
						<button>검색</button>
						<button>전체보기</button>
					</div>
				</div>
				<div>
					<h1>신입경력</h1>
					<h1>채용공고 검색</h1>
					<img src="${path}/resources/images/main/img_01.png" />
				</div>
			</div>
				<!-- ------ -->
	</div>
	<div id="sub-container">
			<div id="sub-main">
						<div class="content1">
							<img src="${path}/resources/images/main/banner_01.png" />
						</div>
						<div class="content2">
							<p>마케팅 지식</p>
							<p>It is a long established 
							fact that a reader will be distracted 
							by the readable content of a page when 
							looking at its layout. The point of using 
							Lorem Ipsum is that it has a more-or-less
						    normal distribution of letters, as opposed
						    to using 'Content here, content here'
							(injected humour and the like).</p>
							<p><a href="#">자세히보기</a></p>
						</div>	
				<!-- ------ -->
						<div class="content3">
							<p>
							<span>이달의</span>
							부서</p>
							<p>
							<img src="${path}/resources/images/main/img_03.png" />
							</p>
							<p>물류서비스팀</p>
						</div>
						<div class="content4">
							<img src="${path}/resources/images/main/ico_play.png" />
							<a href="#">홍보영상 보기</a>
						</div>
					<aside>
						<p>주요 새소식</p>
						<div>
							<img src="${path}/resources/images/main/img_02.png" />
							<p>공지사항</p>
							<p>인턴 교육 프로그램 지원 안내</p>
							<ul>
								<li>
									<a href="#">2022 4차 산업혁명 박람회 관람</a>
								</li>
								<li>
									<a href="#">사내 교육 일정 안내</a>
								</li>
							</ul>
						</div>
						<div>
							<img src="${path}/resources/images/main/img_04.png" />
							<p>자료실</p>
							<p>주요 서식 다운로드</p>
						</div>
					</aside>		
			</div>
	</div>
	
	<div id="modal">
		<div id="modal-body">
			<div id="modal-close">
				<p>이달의 <span>유머</span>입니다.</p>
				<img src="${path}/resources/images/main/btn_modal_close.png" />
			</div>
				<div id="modal-content">
					<p>
						뽀로로가 납치당한 이유는? 포로로 납치당해서<br>
						오리가 얼면? 언덕<br>
						동그라미 2개, 별이 2개면? 영영이별<br>
						딸기가 직장을 잃으면? 딸기시럽<br>
						소금의 유통기한은? 천일염<br>
						세상에서 가장 억울한 도형은? 원통<br>
						우유가 넘어지면? 아야<br>
						아몬드가 죽으면? 다이아몬드<br>
						소가 죽으면? 다이소<br>
						깨가 죽으면? 주근깨<br>
						토끼가 쓰는 빗은? 래빗<br>
						세상에서 가장 쉬운 숫자는? 190,000<br>
						비가 1시간 동안 내리면? 추적 60분<br>
						바늘만 가지고 다니는 사람은? 실 없는 사람<br>
						콩 한알은 영어로? 원빈<br>
						햄버거는의 색깔은? 버건디<br>
						토끼가 강한 이유는? 깡과 총이 있어서<br>
						가장 정의로운 달은? 악토벌<br>
						항상 미안한 동물은? 오소리<br>
						가장 인기있는 벌레는? 스타벅스<br>
						둘리가 다니는 고등학교 이름은? 빙하타고<br>
						삶은? 계란<br>
						이별은? 지구<br>
						11월에 뱀이랑 벌이 없는 이유는? 노뱀벌<br>
						미소의 반대말은? 당기소<br>
						모래가 울면? 흙흙<br>
						얼음이 죽으면? 다이빙<br>
						사과가 웃으면? 풋사과<br>
						칼이 정색하면? 검정색<br>
						바나나가 웃으면? 바나나킥<br>
						아마존의 창업자는? 아마존
					</p>
				</div>
		</div>
	</div>
	<div id="top-btn">▲</div>
</div>
		<footer>
			<div>
				<a href="https://outlook.office.com/mail/"><img src="${path}/resources/images/main/footer_ico_m.png" /></a>
				<a href="https://twitter.com"><img src="${path}/resources/images/main/footer_ico_t.png" /></a>
				<a href="https://facebook.com"><img src="${path}/resources/images/main/footer_ico_f.png" /></a>
			</div>
			<p>Copyright @ Fusionsoft All rights reserved.</p>
		</footer>

<script>

$(document).ready(function() {
	
	$(".content3").click(function() {
		$("#modal").fadeIn();
		$("body").addClass("modal-open");
	});
	
	$("#modal-close img").click(function() {
		$("#modal").fadeOut();
		$("body").removeClass("modal-open");
	});
	
	$(window).scroll(function() {
		if ($(this).scrollTop() > 200) {
			$('#top-btn').fadeIn();
		} else {
			$('#top-btn').fadeOut();
		}
	});
	
	$('#top-btn').click(function() {
		$('html, body').animate({scrollTop: 0}, '400');
	});
	
	$(".nav-bar").click(function() {
		$(".nav-bar").toggleClass("change");
		
		if($(this).hasClass("open")) {
			$(this).removeClass("open");
			$("body").removeClass("m-menu-open");
			$(".m-menu").css({"display" : "none"}).animate({right: "-50%"}, 400);
			$(".m-menu-bg").css({"display" : "none"});
		} else {
			$(this).addClass("open");
			$("body").addClass("m-menu-open");
			$(".m-menu").css({"display" : "block"}).animate({right: "0"}, 400);
			$(".m-menu-bg").css({"display" : "block"});
		}
	});
	
	$(window).resize(function() {
		let bodyWidth = $($(window)).width();
	
		if(bodyWidth <= 420) {
			$("#job, #team, #year").empty();
			$('#job').append('<option value="" selected>직종별</option>');
			$('#team').append('<option value="" selected>부서별</option>');
			$('#year').append('<option value="" selected>경력별</option>');
			
		} else if (bodyWidth >= 1000 || bodyWidth > 420) {
			$("#job, #team, #year").empty();
			$(".m-menu-bg, .m-menu").css({"display" : "none"});
			$(".nav-bar").removeClass("open change");
			$(".m-menu").css({"display" : "none"}, {"right" : "-50%"});
		}
	});

})
</script>

</body>
</html>