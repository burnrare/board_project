<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<title>Insert title here</title>
<link href="${path}/resources/css/codeInfoCss.css" rel="stylesheet" />
</head>
<body>
	<div class="code_title">
		<h1>공통코드관리</h1>
		<p>공통코드를 생성하거나 수정(삭제)</p>
		<div>
			<ul class="type_wrap">
				<li class="type_table on">table</li>
				<li class="type_tree">tree</li>
			</ul>
		</div>
	</div>
		<form action="/admin/codeInfo.do" method="GET">
			<input type="hidden" name="viewType" value="">
			<div class="code_search">
				<select name="searchKey">
					<option value="code_nm" id="code_nm" <c:if test="${searchKey eq 'code_nm'}">selected</c:if>>코드명</option>
					<option value="code_id" id="code_id" <c:if test="${searchKey eq 'code_id'}">selected</c:if>>코드번호</option>
					<option value="all" id="all" <c:if test="${searchKey eq 'all'}">selected</c:if>>전체</option>
				</select> <input type="text" name="searchVal" id="searchVal"
					value="${not empty cvo.searchVal ? cvo.searchVal:param.searchVal}" />
				<button type="submit" name="code_search_btn" id="code_search_btn">검색</button>
			</div>
		</form>
	<div class="code_wrap">
		<div class="code_main code_layout">
			<div class="code_head">
				<p>코드 대분류</p>
				<div class="btn_wrap">
					<button type="button" onclick="delCode(this, 1)">
						<i class="xi-minus xi-x"></i>
					</button>
					<button type="button" onclick="modal(1, this)">
						<i class="xi-plus xi-x"></i>
					</button>
					<button type="button" onclick="modCode(this, 1)">
						<i class="xi-wrench xi-x"></i>
					</button>
				</div>
			</div>
			<table class="code_main_list code_list">
				<thead>
					<tr>
						<th style="width: 5%;">check</th>
						<th style="width: 10%;">코드번호</th>
						<th>코드명</th>
						<th>상세내용</th>
						<th style="width: 12%;">사용여부</th>
					</tr>
				</thead>
				<tbody>
					<!-- 여기에서 c:forEacn를 돌린다 tr마다 그리고 tr에 data-main 속성을 주고 main id 값을 넘긴다 -->
					<c:forEach var="code" items="${codeList}">
							<tr class="main tr_table" data-yn="${code.code_del_yn}" data-id="${code.code_main_id}" data-content="${code.code_content}" data-nm="${code.code_nm}">
								<td class="code_nm">
								<input type="checkbox" name="del_chk" id="del_chk" class="del_chk main_chk par_chk tr_table" /></td>
								<td>${code.code_main_id}</td>
								<td class="code_nm">${code.code_nm}</td>
								<td>${code.code_content}</td>
								<td class="code_nm">
									<c:if test="${code.code_del_yn eq 'N'}">사용 중</c:if>
									<c:if test="${code.code_del_yn eq 'Y'}">미사용</c:if>
								</td>
							</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="code_middle code_layout">
			<div class="code_head">
				<p>코드 중분류</p>
				<div class="btn_wrap">
					<button type="button" onclick="delCode(this, 1)">
						<i class="xi-minus xi-x"></i>
					</button>
					<button type="button" onclick="modal(2, this)">
						<i class="xi-plus xi-x"></i>
					</button>
					<button type="button" onclick="modCode(this, 2)">
						<i class="xi-wrench xi-x"></i>
					</button>
				</div>
			</div>
			<table class="code_middle_list code_list">
				<thead>
					<tr>
						<th style="width: 5%;">check</th>
						<th style="width: 10%;">코드번호</th>
						<th>코드명</th>
						<th>상세내용</th>
						<th style="width: 8%;">사용여부</th>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
		</div>
		<div class="code_sub code_layout">
			<div class="code_head">
				<p>코드 소분류</p>
				<div class="btn_wrap">
					<button type="button" onclick="delCode(this, 1)">
						<i class="xi-minus xi-x"></i>
					</button>
					<button type="button" onclick="modal(3, this)">
						<i class="xi-plus xi-x"></i>
					</button>
					<button type="button" onclick="modCode(this, 3)">
						<i class="xi-wrench xi-x"></i>
					</button>
				</div>
			</div>
			<table class="code_sub_list code_list">
				<thead>
					<tr>
						<th style="width: 5%;">check</th>
						<th style="width: 10%;">코드번호</th>
						<th>코드명</th>
						<th>상세내용</th>
						<th style="width: 8%;">사용여부</th>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
		</div>
	</div>
	<div class="code_tree">
		<div class="code_head code_p">
			<p>코드 트리구조</p>
			<p>사용 중인 대분류 코드만 나타납니다.</p>
		</div>
	  <div class="tree_flex">
		  <ul class="tree code_main_list code_main_tree">
				<c:forEach items="${codeList}" var="code">
					<c:if test="${code.code_del_yn eq 'N'}">
						<li class="main li_tree ${code.code_main_id}" data-id="${code.code_main_id}" data-content="${code.code_content}" data-nm="${code.code_nm}">
							<div class="deco_label">
								<div class="deco_depth1">
									<input type="checkbox" id="${code.code_main_id}" class="tree_chk del_chk par_chk main_chk li_tree" name="del_chk" />
									<label for="${code.code_main_id}" class="deco depth1" onclick="setting(this)">(${code.code_main_id}) ${code.code_nm}
									</label>
									<span class="span_deco"><i class="xi-caret-up-circle-o"></i></span>
								</div>
								<button onclick="codeAdd(this, 1)"><i class="xi-plus xi-x"></i></button>
							</div>
							<ul class="code_middle_list code_mid_tree">
							</ul>
						</li>
					</c:if>
				</c:forEach>
		  </ul>
		  <div class="tree_stat">
		  	<div class="code_head">
				<p>코드 내용</p>
				<div class="btn_wrap">
					<button type="button" onclick="treeDel(this, 6)"><i class="xi-minus xi-x"></i></button>
					<button type="button" onclick="treeModi(this)"><i class="xi-wrench xi-x"></i></button>
					<button type="button" onclick="codeAdd(this, 3)">대분류 추가</button>
				</div>
			</div>
		  	<div class="tree_header">
		  	</div>
		  	<div class="tree_body"> 
		  		<p>코드를 선택해 주세요!</p>
			</div>
			<div class="tree_footer">
			</div>
		  </div>
	  </div>
	</div>
	<!-- Modal -->
	<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
				</div>
				<div class="modal-body"> 
				</div>
				<div class="modal-footer">
				</div>
			</div>
		</div>
	</div>

</body>
<script src="https://code.jquery.com/jquery-3.6.1.js"
	integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
	crossorigin="anonymous"></script>
<script type="text/javascript">

	$('.code_tree').hide();

	var viewType = '${viewType}';
	
	if(viewType === 'TR') {
		$('.code_tree').show();
		$('.code_wrap').hide();
		$('.type_table').removeClass('on');
		$('.type_tree').addClass('on');
	} else {
		$('.code_tree').hide();
		$('.code_wrap').show();
		$('.type_tree').removeClass('on');
		$('.type_table').addClass('on');
	}

	$(document).ready(function() {
		
			$('.code_main_list input.main_chk').click(function() {
				
				$('.code_middle_list > tbody').empty();
				$('.code_sub_list > tbody').empty();
				
				console.log($(this).closest("li.main").find("code_middle_tree li").length);
				
				if($(this).closest("li.main").find("code_middle_tree li").length == 0) {
					$(this).closest("div.deco_depth1").find('span.span_deco i').removeClass();
				}
				
				var code_main_id = null;
				var findClass = $(this).closest('li');
				
				if($(this).is(":checked")) {
					
					$(this).closest("div.deco_depth1").find('span.span_deco i').removeClass("xi-caret-up-circle-o");
					$(this).closest("div.deco_depth1").find('span.span_deco i').addClass("xi-caret-down-circle-o");
					$(this).closest("li.li_tree").find('ul.code_mid_tree').empty();
					$(this).closest("li.main").addClass("checked");
					
					if($(this).hasClass("tr_table")) {
						code_main_id = $(this).closest('tr').data("id");
					} else if($(this).hasClass("li_tree")) {
						code_main_id = $(this).closest('li').data("id");
					}

					$.ajax({
						url: '/admin/codeInfo.do',
						type: 'POST',
						data: {'code_main_id' : code_main_id},
						context: this,
						success: function(data) {
							
							if($(this).hasClass("tr_table")) {
								
								$.each(data, function(idx, value) {
									
									if(value.code_content == null) {
										value.code_content = '상세 내용이 없습니다.';
									}
									
									if(value.code_del_yn == 'N') {
										value.code_del_yn = '사용 중'
									} else {
										value.code_del_yn = '미사용'
									}
									
									var str = '<tr class="mid par_code" data-yn="' + value.code_del_yn + '" data-nm="' + value.code_nm + '" data-content="' + value.code_content + '" data-par="' + value.par_code_id + '" data-id="' + value.code_mid_id + '">';
									str += '<td class="code_nm"><input type="checkbox" class="mid_chk del_chk par_chk tr_table" name="del_chk" id="del_chk" /></td>';
									str += '<td>' + value.code_mid_id + '</td>';
									str += '<td class="code_nm">' + value.code_nm + '</td>';
									str += '<td>' + value.code_content + '</td>';
									str += '<td class="code_nm">' + value.code_del_yn + '</td>';
									str += '</tr>';
									$('.code_middle_list > tbody').append(str);
								})
								
							} else if($(this).hasClass("li_tree")) {
								
								$.each(data, function(idx, value) {
									
										var str = '<li class="mid par_code mid_deco ' + value.code_mid_id + '" data-yn="' + value.code_del_yn + '" data-nm=' + value.code_nm + '" data-content="' + value.code_content + '" data-par="' + value.par_code_id + '" data-id="' + value.code_mid_id + '"><div class="deco_label deco_label2"><div class="deco_depth1 deco_depth2"><input type="checkbox" class="tree_chk del_chk par_chk li_tree mid_chk" name="del_chk" id="' + value.code_mid_id + '" /><label onclick="setting(this)" class="deco depth2" for="' + value.code_mid_id + '">' + '<i class="xi-code"></i>(' + value.code_mid_id + ') ' +value.code_nm + '</label><span class="span_deco"><i class="xi-caret-up-min"></i></span></div><button class="color_change" onclick="codeAdd(this, 2)">';									
										str += '<i class="xi-plus xi-x"></i>';
										str += '</button></div>';
										str += '<ul class="code_sub_list code_sub_tree"></ul></li>';
										if($(findClass).hasClass(value.par_code_id)) {	
											$(findClass).each(function() {
												$(this).find('ul.code_mid_tree').append(str);
											})
										}
								})
								
							}
						},
						error: function() {
							alert("통신 실패!");
						}
					}); // ajax 끝 
					
				}
				
				if(!$(this).is(":checked")) {
					
					$(this).closest("div.deco_depth1").find('span.span_deco i').removeClass("xi-caret-down-circle-o");
					$(this).closest("div.deco_depth1").find('span.span_deco i').addClass("xi-caret-up-circle-o");
					$(this).closest("li.li_tree").find('ul.code_mid_tree').empty();
					$(this).closest("li.li_tree").find('ul.code_sub_tree').empty();
					$(".tree_body").empty();
				}
 			}); 
			$(document).on("click", '.code_middle_list input.mid_chk', function() {
				
				$('.code_sub_list > tbody').empty();
				$(this).closest("li.main").removeClass("checked");

				var code_mid_id = null;
				var par_code_id = null;
				var findClass = $(this).closest('li');

				if($(this).is(":checked")) {
					
					$(this).closest('li.mid').addClass("checked");
					$(this).closest('li.mid').find('ul.code_sub_tree').empty();
					
					$(this).closest("div.deco_depth2").find('span.span_deco i').removeClass("xi-caret-up-min");
					$(this).closest("div.deco_depth2").find('span.span_deco i').addClass("xi-caret-down-min");
					
					if($(this).hasClass('li_tree')) {
						code_mid_id = $(this).closest('li').data("id");
						par_code_id = $(this).closest('li').data("par");
					} else if($(this).hasClass('tr_table')) {
						code_mid_id = $(this).closest('tr').data("id");
						par_code_id = $(this).closest('tr').data("par");
					}
					
					$.ajax({
						url: '/admin/codeInfo.do',
						type: 'POST',
						context: this,
						data: {'code_mid_id' : code_mid_id, 'code_main_id' : par_code_id},
						success: function(data) {
							
							if($(this).hasClass('li_tree')) {
								
								$.each(data, function(idx, value) {										
									var str = '<li class="sub par_code" data-yn="' + value.code_del_yn + '" data-nm=' + value.code_nm + '" data-content="' + value.code_content + '" data-par="' + value.par_code_id + '" data-id="' + value.code_sub_id + '"><input type="checkbox" class="tree_chk del_chk par_chk li_tree" name="del_chk" id="' + value.code_sub_id + '" />';
									str += '<label class="deco depth3" onclick="setting(this)" for="' + value.code_sub_id + '"><i class="xi-trending-flat"></i>(' + value.code_sub_id + ') ' +value.code_nm + '</label></li>';
									$(this).find('ul.code_sub_list').empty();
									if($(findClass).hasClass(value.par_code_id)) {	
										$(findClass).each(function() {
											$(this).find("ul.code_sub_tree").append(str);
										})
									}
								})
								
							} else if($(this).hasClass('tr_table')) {
								
								$.each(data, function(idx, value) {
									
									if(value.code_content == null) {
										value.code_content = '상세 내용이 없습니다.';
									}
									if(value.code_del_yn == 'N') {
										value.code_del_yn = '사용 중'
									} else {
										value.code_del_yn = '미사용'
									}
									
									var str = '<tr class="sub par_code" data-yn="' + value.code_del_yn + '" data-nm="' + value.code_nm + '" data-content="' + value.code_content + '"data-par="' + value.par_code_id + '" data-id="' + value.code_sub_id + '">';
									str += '<td class="code_nm" ><input type="checkbox" class="del_chk" name="del_chk" id="del_chk" /></td>'
									str += '<td>' + value.code_sub_id + '</td>';
									str += '<td class="code_nm">' + value.code_nm + "</td>";
									str += '<td>' + value.code_content + '</td>';
									str += '<td class="code_nm">' + value.code_del_yn + "</td>";
									str += '</tr>';
									$('.code_sub_list > tbody').append(str);
								})
								
							}
							
						},
						error: function() {
							alert("통신 실패!");
						}
					}) // ajax 끝
				}
				
				if(!$(this).is(":checked")) {
					$(this).closest("div.deco_depth2").find('span.span_deco i').removeClass("xi-caret-down-min");
					$(this).closest("div.deco_depth2").find('span.span_deco i').addClass("xi-caret-up-min");
					$(this).closest('li.mid').find('ul.code_sub_list').empty();
					$(".tree_body").empty();
					$(this).closest('li.mid').removeClass("checked");
				}
				
			});
			$(document).on("click", '.code_middle_list input.del_chk, .code_main_list input.del_chk, li.sub input.del_chk', function() {
				var thisTable = $(this).closest('.code_layout');
				if($(this).is(":checked")) {
					$(thisTable).find("input.del_chk").not($(this)).prop("checked", false);
					$(this).closest("li.mid").removeClass("checked");
				}
			});
			
			$('.type_table').click(function() {
				$('.code_tree').hide();
				$('.code_wrap').show();
				$('.type_tree').removeClass('on');
				$('.type_table').addClass('on');
				$('input[name=viewType]').val('TB');
			})
			$('.type_tree').click(function() {
				$('.code_tree').show();
				$('.code_wrap').hide();
				$('.type_table').removeClass('on');
				$('.type_tree').addClass('on');
				$('input[name=viewType]').val('TR');
			})
			$('input[name="code_del_yn"]').click(function() {
				if($(this).is(":checked")) {
					not($(this)).prop("checked", false);
				}
			})
	});
	
	function modal(btn_num, modal_this) {
		
		var title = null;
		var mid_par_id = $(modal_this).closest('.code_wrap').find('tr.main').has('input.par_chk:checked').data("id");
		var sub_par_id = $(modal_this).closest('.code_wrap').find('tr.mid').has('input.par_chk:checked').data("id");
		var par_chk = $(modal_this).closest('.code_wrap').find('input.par_chk:checked').length;
		var par_str = '<label for="code_id">코드번호</label> <input type="text" id="code_id" class="code_id" name="code_id" value="" /><label for="code_nm">코드명</label><input type="text" id="code_nm" class="code_nm" value="" />';
		var code_main_yn = $(modal_this).closest('.code_wrap').find('tr.main').has('input.del_chk:checked').data("yn");
		var code_mid_yn = $(modal_this).closest('.code_wrap').find('tr.mid').has('input.del_chk:checked').data("yn");
		
		console.log("사용 여부", code_mid_yn, code_main_yn);
		
		if(code_main_yn == '미사용' || code_main_yn == 'Y' || code_mid_yn == '미사용' || code_mid_yn == 'Y') {
			alert("미사용 코드는 추가 등록이 불가합니다.");
			return false;
		}
 		
		
		if(par_chk < 1 && btn_num != 1) {
			alert("선택한 상위 코드가 없습니다.");
			return false;
		}
		
		 if(btn_num == 1) {
			$("#staticBackdrop .modal-header, #staticBackdrop .modal-body, #staticBackdrop .modal-footer").empty();
			title = '대분류 코드';
		} else if(btn_num == 2) {
			if(par_chk < 1 && btn_num != 1) {
				alert("선택한 상위 코드가 없습니다.");
				return false;
			}
			$("#staticBackdrop .modal-header, #staticBackdrop .modal-body, #staticBackdrop .modal-footer").empty();
			title = '중분류 코드';
			$(".modal-header").removeClass("sub-title");
			$(".modal-header").addClass("mid-title");
			par_str += '<label for="par_id">상위 코드번호</label><input type="text" name="code_main_id" id="par_id" class="par_id" value="' + mid_par_id + '" disabled />';
		} else {

			if(par_chk < 2 && btn_num != 1) {
				alert("선택한 상위 코드가 없습니다.");
				return false;
			}
			$("#staticBackdrop .modal-header, #staticBackdrop .modal-body, #staticBackdrop .modal-footer").empty();
			$(".modal-header").removeClass("mid-title");
			$(".modal-header").addClass("sub-title");
			title = '소분류 코드';
			par_str += '<label for="par_id">상위 코드번호</label><input type="text" name="code_mid_id" id="par_id" class="par_id" value="' + sub_par_id + '" disabled />';
		}

		var str = '<h5 class="modal-title" id="staticBackdropLabel">' + title + '</h5><button type="button" class="btn-close" data-bs-dismiss="modal"aria-label="Close"></button>';
		par_str += '<label for="code_content">코드 상세내용</label><textarea class="code_content" id="code_content" maxlength="50"></textarea>';
		
		var footer_str = '<button type="button" class="btn btn-secondary"data-bs-dismiss="modal">닫기</button><button type="button" class="btn btn-primary submit" onclick="insertCode(this, 6)">등록</button>';
		
		$("#staticBackdrop").modal("show");
		$("#staticBackdrop .modal-footer").append(footer_str);
		$("#staticBackdrop .modal-body").append(par_str);
		$("#staticBackdrop .modal-header").append(str); 
	}
	
	function nullCodeCheck(num) {
		
		var code_nm = null;
		var code_id = null;
		var code_content = null;
		
		console.log(num);
		
		if(num == 1) {
			code_nm = $.trim($('.modal-content').find('input.code_nm').val());
			code_id = $.trim($('.modal-content').find('input.code_id').val());
			code_content = $.trim($('.modal-content').find('textarea.code_content').val());
		} else if(num == 0) {
			code_nm = $.trim($('.tree_body').find('.code_nm').val());
			code_id = $.trim($('.tree_body').find('.code_id').val());
			code_content = $.trim($('.tree_body').find('.code_content').val());
		}

		var nullCodeCheck = true;
		console.log(code_id);
		console.log(code_id);
		if(code_nm == null || code_nm == '' || code_id == null || code_id == '') {
			alert("빈 칸은 입력할 수 없습니다.");
			nullCodeCheck = false;
			return false;
		}
		
		
		if(code_content == null || code_content == '') {
			var result = confirm("코드 상세내용이 작성되어 있지 않습니다. 저장하시겠습니까?");
			if(!result) {
				nullCodeCheck = false;
				return false;
			}
		}
		
		return nullCodeCheck;
	}
	
	function insertCode(insert_this, num) {
		var code_nm = $.trim($(insert_this).closest('.modal-content').find('input.code_nm').val());
		var code_id = $.trim($(insert_this).closest('.modal-content').find('input.code_id').val());
		var par_id = $(insert_this).closest('.modal-content').find('input.par_id').val();
		var code_content = $(insert_this).closest('.modal-content').find('textarea.code_content').val();
		var par_type = $(insert_this).closest('.modal-content').find('.modal-header');
		var insertCheck = nullCodeCheck(1);
		var viewType = null;
		var mid_id = $(insert_this).closest('.modal-content').find('input[name=code_mid_id]').val();
		
		console.log(code_nm, code_id, par_id, code_content);
		
		console.log(par_type);
		
		if(!par_id) {
			par_id = null;
		}
		
		if(num == 5) {
			viewType = 'TR';
		} else {
			viewType = 'TB';
		}

 		if(insertCheck) {
			// ajax 등록
 			$.ajax({
				url: '/admin/codeInfoProc.do',
				type: 'POST',
				contentType: 'application/json; charset=utf-8',
				data: JSON.stringify({'code_id' : code_id, 'code_nm' : code_nm, 'par_code_id': par_id, 'code_content' : code_content}),
				success: function(re) {
					if(re == 'true') {
						alert("등록 성공!");
						$("#staticBackdrop").modal("hide");
						if(par_id != null) {
							if($(par_type).hasClass('mid-title')) {								
								noReload(par_id, 1, mid_id);
							} else if($(par_type).hasClass('sub-title')) {
								noReload(par_id, 2, mid_id);
							}
						} else {
							/* location.reload(); */
							location.href="/admin/codeInfo.do?viewType=" + viewType;
						}
					} else if(re == 'code_id_error') {
						alert("코드 번호에 중복된 값이 있습니다.");
					}
				},
				error: function() {
					alert("통신 실패!!");
				}
			}); // ajax 끝 
		} 
	}
	
	function modCode(btn_this, num) {
		
		var modChecklength = $(btn_this).closest('.code_layout').find('table > tbody input.del_chk:checked').length;
		var code_nm = null;
		var code_content = null;
		var code_id = null;
		var code_par_id = null;
		var code_del_yn = null;
		var title = null;
		
		if(modChecklength > 1) {
			alert("수정은 한 개씩 가능합니다.");
			return false;
		}
		
		if(modChecklength < 1) {
			alert("선택된 코드가 없습니다.");
			return false;
		}
 			
		code_nm = $(btn_this).closest('.code_layout').find('table > tbody > tr').has('input.del_chk:checked').data("nm");
		code_content = $(btn_this).closest('.code_layout').find('table > tbody > tr').has('input.del_chk:checked').data("content");
		code_id = $(btn_this).closest('.code_layout').find('table > tbody > tr').has('input.del_chk:checked').data("id");
		code_par_id = $(btn_this).closest('.code_layout').find('table > tbody > tr').has('input.del_chk:checked').data("par");
		code_del_yn = $(btn_this).closest('.code_layout').find('table > tbody > tr').has('input.del_chk:checked').data("yn");
		
		
		if(code_content == null || code_content == '상세 내용이 없습니다.') {
			code_content = '';
		}

		
		if(num == 1) {
			title = '대분류 코드 수정'
		} else if(num == 2) {
			title = '중분류 코드 수정'
			$(".modal-header").removeClass("sub-title");
			$(".modal-header").addClass("mid-title");
		} else {
			title = '소분류 코드 수정'
			$(".modal-header").removeClass("mid-title");
			$(".modal-header").addClass("sub-title");
		}
		 
		var str = '<label for="code_id">코드번호</label><input type="text" id="code_id" class="code_id" name="code_id" value="' + code_id + '" /><label for="code_nm">코드명</label><input type="text" id="code_nm" class="code_nm" value="' + code_nm + '" />';
		if(code_par_id) {
			str += '<label for="par_id">상위 코드번호</label><input type="text" name="code_mid_id" id="par_id" class="par_id" value="' + code_par_id + '" disabled />';			
		}
		str += '<label for="code_content">코드 상세내용</label><textarea class="code_content" id="code_content" maxlength="50">' + code_content + '</textarea>';
		
		var header_str = '<h5 class="modal-title" id="staticBackdropLabel">' + title + '</h5><button type="button" class="btn-close" data-bs-dismiss="modal"aria-label="Close"></button>';
		
		if(code_del_yn == 'Y' || code_del_yn == '미사용') {			
			str += '<p>사용 여부</p><label for="del_n"><input type="radio" id="del_n" name="code_del_yn" value="N"/>사용하기</label>';
		}

		var footer_str = '<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button><button type="button" data-old="' + code_id + '" class="btn btn-primary submit" onclick="ModifyCode(this, 5)">수정</button>';
		
		$("#staticBackdrop .modal-body, #staticBackdrop .modal-footer, #staticBackdrop .modal-header").empty();
		$("#staticBackdrop .modal-body").append(str);
		$("#staticBackdrop .modal-header").append(header_str);
		$("#staticBackdrop .modal-footer").append(footer_str);
		$("#staticBackdrop").modal("show");
	}
	
	function ModifyCode(modify_this, code_id) {

		var code_nm = $(modify_this).closest('.modal-content').find('input.code_nm').val();
		var code_new_id = $(modify_this).closest('.modal-content').find('input.code_id').val();
		var code_id = $(modify_this).data('old');
		var par_id = $(modify_this).closest('.modal-content').find('input.par_id').val();
		var code_content = $(modify_this).closest('.modal-content').find('textarea.code_content').val();
		var code_del_yn = $(modify_this).closest('.modal-content').find('input[name="code_del_yn"]').val();
		var par_type = $(modify_this).closest('.modal-content').find('.modal-header');
		var mid_id = $(modify_this).closest('.modal-content').find('input[name=code_mid_id]').val();
		
		console.log(code_del_yn);
		
		var modifyCheck = nullCodeCheck(1);
		
		if(!par_id) {
			par_id = null;
		}
		
		var result = true;
		
		if(code_new_id == code_id) {
			result = confirm("코드 번호가 변경되지 않았습니다. 진행하시겠습니까?");
		}
		
		if(!code_del_yn) {
			code_del_yn = 'N';
		}
		
		if(modifyCheck && result) {
   			$.ajax({
				url: '/admin/codeInfoModifyProc.do',
				type: 'POST',
				contentType: 'application/json; charset=utf-8',
				data: JSON.stringify({'code_new_id' : code_new_id, 'code_id' : code_id, 'code_nm' : code_nm, 'par_code_id': par_id, 'code_content' : code_content, 'code_del_yn' : code_del_yn}),
				success: function(re) {
					alert("수정 성공!");
					$("#staticBackdrop").modal("hide");
					if(par_id != null) {	
						
						if($(par_type).hasClass('mid-title')) {
							noReload(par_id, 1, mid_id)
						} else {
							noReload(par_id, 2, mid_id)
						}
					
					} else {
						location.href="/admin/codeInfo.do?viewType=TB";
					}
				},
				error: function() {
					alert("통신 실패!!");
				}
			}); // ajax 끝    
		}
	}
	
function noReload(par_id, num, mid_id) {
		
		console.log(par_id, num, mid_id)
		
		if(num == 1) {		// middle	
			$.ajax({
				url: '/admin/codeInfo.do',
				type: 'POST',
				data: {'code_main_id' : par_id},
				context: this,
				success: function(data) {
					
					$('.code_middle_list > tbody').empty();

					
						$.each(data, function(idx, value) {
							
							if(value.code_content == null) {
								value.code_content = '상세 내용이 없습니다.';
							}
							
							if(value.code_del_yn == 'N') {
								value.code_del_yn = '사용 중'
							} else {
								value.code_del_yn = '미사용'
							}
							
							var str = '<tr class="mid par_code" data-yn="' + value.code_del_yn + '" data-nm="' + value.code_nm + '" data-content="' + value.code_content + '" data-par="' + value.par_code_id + '" data-id="' + value.code_mid_id + '">';
							str += '<td class="code_nm"><input type="checkbox" class="mid_chk del_chk par_chk tr_table" name="del_chk" id="del_chk" /></td>';
							str += '<td>' + value.code_mid_id + '</td>';
							str += '<td class="code_nm">' + value.code_nm + '</td>';
							str += '<td>' + value.code_content + '</td>';
							str += '<td class="code_nm">' + value.code_del_yn + '</td>';
							str += '</tr>';
							$('.code_middle_list > tbody').append(str);
						})		
							
				}
			})
		} else { // sub
			
			
			$.ajax({
				url: '/admin/codeInfo.do',
				type: 'POST',
				context: this,
				data: {'code_mid_id' : mid_id, 'code_main_id' : par_id},
				success: function(data) {
					
					$('.code_sub_list > tbody').empty();
					
					$.each(data, function(idx, value) {
						
						if(value.code_content == null) {
							value.code_content = '상세 내용이 없습니다.';
						}
						if(value.code_del_yn == 'N') {
							value.code_del_yn = '사용 중'
						} else {
							value.code_del_yn = '미사용'
						}
						
						var str = '<tr class="sub par_code" data-yn="' + value.code_del_yn + '" data-nm="' + value.code_nm + '" data-content="' + value.code_content + '"data-par="' + value.par_code_id + '" data-id="' + value.code_sub_id + '">';
						str += '<td class="code_nm" ><input type="checkbox" class="del_chk" name="del_chk" id="del_chk" /></td>'
						str += '<td>' + value.code_sub_id + '</td>';
						str += '<td class="code_nm">' + value.code_nm + "</td>";
						str += '<td>' + value.code_content + '</td>';
						str += '<td class="code_nm">' + value.code_del_yn + "</td>";
						str += '</tr>';
						$('.code_sub_list > tbody').append(str);
					})
					
				},
				error: function() {
					alert("통신 실패!");
				}
			}) // ajax 끝 
		}
	}

	function delCode(btn_this, num) {
		
		var delCheckTrue = true;
		
		console.log(btn_this);
		
		var del_chk_length = $(btn_this).closest(".code_layout, .code_tree").find("input.del_chk:checked").length;
		var del_chk_closest = $(btn_this).closest(".code_layout, .code_tree");
		var tr_del_chk_yn = $(btn_this).closest(".code_layout").find("tbody > tr").has("input.del_chk:checked").data("yn");
		var del_chk_arr = [];
		
		console.log(tr_del_chk_yn);
		
		if(tr_del_chk_yn == 'Y') {
			alert("이미 사용하지 않는 코드입니다.");
			return false;
		}
		
		if(del_chk_length == 0) {
			
			alert("선택된 코드가 없습니다.");
			return false;
			
		} else if(del_chk_length > 0) {
			
			delCheckTrue = delCheck(btn_this);
			
			if(delCheckTrue) {				
				// 삭제 기능 구현할 곳
				
				if(num == 1) {
					
		 			$(del_chk_closest).find("input.del_chk:checked").each(function(idx, el) {
						var code_id = $(el).closest('table > tbody > tr').data('id');
						del_chk_arr.push({'code_id' : code_id});
					});
		 			
				} else if(num == 0) {
					
					$(del_chk_closest).find("input.del_chk:checked").each(function(idx, el) {
						var code_id = $(el).closest('li').data('id');
						console.log(code_id);
						del_chk_arr.push({'code_id' : code_id});
					});
					
				}

			$.ajax({
					url: '/admin/codeInfoDe.do',
					type: 'POST',
					contentType: 'application/json; charset=utf-8',
					data: JSON.stringify(del_chk_arr),
					success: function(data) {
						alert("미사용 처리되었습니다.");
						location.href="/admin/codeInfo.do?viewType=TB";
					}
				});   
				
			}
			
		}
	}
	
	function delCheck(btn_this) {
		
		var del_chk_type = null;
		var del_chk_type_id = null;
		

			del_chk_type = $(btn_this).closest(".code_layout").find('table > tbody > tr');
			del_chk_type_id = $(btn_this).closest(".code_layout").find('table > tbody > tr').has('input.del_chk:checked').data('id');
		
		
		var delCheckTrue = true;
		
		 console.log(del_chk_type); // main이면 대분류니까 중분류(mid)가 있는지 파악, mid면 중분류니까 소분류(sub)가 있는지 파악
		 
		
		if($(del_chk_type).hasClass("main")) {
				
				$('.code_wrap').find('table > tbody > tr').each(function(idx, el) {	
					console.log($(el).data('yn'));
					if(del_chk_type_id == $(el).data('par') && $(el).data('yn') == '사용 중') {
						alert("존재하는 중분류가 있습니다. 삭제가 불가합니다.");
						delCheckTrue = false;
						return false;
					}
					
				})
		} 
		if($(del_chk_type).hasClass("mid")) {

				$('.code_wrap').find('table > tbody > tr').each(function(idx, el) {	
					if(del_chk_type_id == $(el).data('par') && $(el).data('yn') == '사용 중') {
						alert("존재하는 소분류가 있습니다. 삭제가 불가합니다.");
						delCheckTrue = false;
						return false;
					}
					
				})
		}
		return delCheckTrue;

	}
	
	function setting(label) {
		
		$('.tree_footer').empty();
		$('.tree_body').empty();
		$('.tree_stat .code_head .btn_wrap').empty();
		
		var code_nm = $(label).closest('li').data("nm");
		var code_id = $(label).closest('li').data("id");
		var code_content = $(label).closest('li').data("content");
		var par_id = $(label).closest('li').data("par");
		var class_nm = 'mid';
		
		if(!par_id) {
			par_id = null;
			class_nm = 'main';
		}
		
		console.log("empty label " + code_nm)

		var headStr = '<button type="button" onclick="treeDel(this, 6)"><i class="xi-minus xi-x"></i></button><button type="button" onclick="treeModi(this)"><i class="xi-wrench xi-x"></i></button><button type="button" onclick="codeAdd(this, 3)">대분류 추가</button>';
		var str = '<label for="code_id">코드 번호</label><input type="text" id="code_id" class="code_id" name="code_id" value="' + code_id + '" />';
		str += '<label for="code_nm">코드명</label><input type="text" id="code_nm" class="code_nm" name="code_nm" value="' + code_nm + '" />';
		if(par_id) {			
			str += '<label for="par_code_id">상위 코드번호</label><input type="text" id="par_code_id" class="par_code_id" name="par_code_id" value="' + par_id + '" disabled />';
		}
		str += '<label for="code_content">코드 상세내용</label><textarea style="width: 100%; height: 100px" class="code_content" id="code_content">' + code_content + '</textarea>';
		str += '<input type="hidden" class="old" value="' + code_id + '" />';
		
		$('.tree_body').append(str);
		$('.tree_stat .code_head .btn_wrap').append(headStr);
	}
	
	function codeAdd(tree_btn, num) {

		var title = null;
		var par_id = $(tree_btn).closest('.li_tree').data("id");
		var mid_par_id = $(tree_btn).closest('.par_code').data("id");
		var sub_par_id = $(tree_btn).closest('.par_code').has('input.par_chk:checked').data("par");
		var par_chk = $(tree_btn).closest('.code_wrap').find('input.par_chk:checked').length;
		var par_str = '<label for="code_id">코드번호</label> <input type="text" id="code_id" class="code_id" name="code_id" value="" /><label for="code_nm">코드명</label><input type="text" id="code_nm" class="code_nm" value="" />';
		
		 if(num == 1) {
			$("#staticBackdrop .modal-header, #staticBackdrop .modal-body, #staticBackdrop .modal-footer").empty();
			title = '중분류 코드 추가';
			$(".modal-title").removeClass("sub-title");
			$(".modal-title").addClass("mid-title");
			par_str += '<label for="par_id">상위 코드번호</label><input type="text" name="code_main_id" id="par_id" class="par_id" value="' + par_id + '" disabled />';
		} else if(num == 2) {
			$("#staticBackdrop .modal-header, #staticBackdrop .modal-body, #staticBackdrop .modal-footer").empty();
			title = '소분류 코드 추가';
			$(".modal-title").removeClass("mid-title");
			$(".modal-title").addClass("sub-title");
			par_str += '<label for="par_id">상위 코드번호</label><input type="text" name="code_main_id" id="par_id" class="par_id" value="' + mid_par_id + '" disabled />';
		} else {
			$("#staticBackdrop .modal-header, #staticBackdrop .modal-body, #staticBackdrop .modal-footer").empty();
			title = '대분류 코드 추가';
		}

		var str = '<h5 class="modal-title" id="staticBackdropLabel">' + title + '</h5><button type="button" class="btn-close" data-bs-dismiss="modal"aria-label="Close"></button>';
		par_str += '<label for="code_content">코드 상세내용</label><textarea class="code_content" id="code_content" maxlength="50"></textarea>';
		
		var footer_str = '<button type="button" class="btn btn-secondary"data-bs-dismiss="modal">닫기</button><button type="button" class="btn btn-primary submit" onclick="insertCode(this, 5)">등록</button>';
		
		$("#staticBackdrop").modal("show");
		$("#staticBackdrop .modal-footer").append(footer_str);
		$("#staticBackdrop .modal-body").append(par_str);
		$("#staticBackdrop .modal-header").append(str); 
	}

	function treeModi(tree_btn) {

		var modChecklength = $(tree_btn).closest('.code_tree').find('input.del_chk:checked').length;
		
		if(modChecklength < 1) {
			alert("선택된 코드가 없습니다.");
			return false;
		}
		
		var code_nm = $(tree_btn).closest('.tree_stat').find('input.code_nm').val();
		var code_new_id = $(tree_btn).closest('.tree_stat').find('input.code_id').val();
		var code_id = $(tree_btn).closest('.tree_stat').find('input.old').val();
		var par_id = $(tree_btn).closest('.tree_stat').find('input.par_code_id').val();
		var code_content = $(tree_btn).closest('.tree_stat').find('textarea.code_content').val();
		var code_del_yn = $(tree_btn).closest('.tree_stat').find('input.code_del_yn').val();
		
		var modifyCheck = nullCodeCheck(0);

		var result = true;
		
		if(code_new_id == code_id) {
			result = confirm("코드 번호가 변경되지 않았습니다. 진행하시겠습니까?");
		}
		
		if(!par_id) {
			par_id = null;
		}
		
		if(modifyCheck && result) {
 			$.ajax({
				url: '/admin/codeInfoModifyProc.do',
				type: 'POST',
				contentType: 'application/json; charset=utf-8',
				data: JSON.stringify({'code_new_id' : code_new_id, 'code_id' : code_id, 'code_nm' : code_nm, 'par_code_id': par_id, 'code_content' : code_content, 'code_del_yn' : code_del_yn}),
				success: function(re) {
					if(re == 'true') {
						alert("수정 성공!");
						location.href="/admin/codeInfo.do?viewType=TR";
					}
				},
				error: function() {
					alert("통신 실패!! 트리 수정");
				}
			}); // ajax 끝  
		}

	}
	
	function treeDelCheck(tree_btn) {
		
		var delCheckTrue = true;
	
		var del_chk_type = $(tree_btn).closest(".code_tree").find('.tree li.checked');
		var del_chk_type_id = $(tree_btn).closest(".code_tree").find('.tree li.checked').data('id');
		
		console.log("!!!!!!!!!! ", del_chk_type);
		console.log(del_chk_type_id)
		
 		if($(del_chk_type).hasClass("main")) {
			$('.code_tree').find('.tree li').each(function(idx, el) {	
				if(del_chk_type_id == $(el).data('par')) {
					alert("존재하는 중분류가 있습니다. 삭제가 불가합니다.");
					delCheckTrue = false;
					return false;
				}
				
			})
		} 
		
 		if($(del_chk_type).hasClass("mid")) {
			
			$('.code_tree').find('.tree li').each(function(idx, el) {	
				if(del_chk_type_id == $(el).data('par')) {
					console.log($(el).data('par'));
					
					alert("존재하는 소분류가 있습니다. 삭제가 불가합니다.");
					delCheckTrue = false;
					return false;
				}
			})
		}
		return delCheckTrue;
	}
	
	function treeDel(tree_btn, viewType) {

		var delCheckTrue = true;
		
		var del_chk_length = $(tree_btn).closest(".code_tree").find("li.checked").length;
		var code_id = $(tree_btn).closest('.tree_stat').find('input.code_id').val();
		
		var del_chk_arr = [{'code_id' : code_id}];
		
		if(del_chk_length == 0) {
			
			alert("선택된 코드가 없습니다.");
			return false;
			
		} else if(del_chk_length > 0) {
			
			delCheckTrue = treeDelCheck(tree_btn);
			console.log(delCheckTrue);
			
 			if(delCheckTrue) {				
				// 삭제 기능 구현할 곳
				$.ajax({
					url: '/admin/codeInfoDe.do',
					type: 'POST',
					contentType: 'application/json; charset=utf-8',
					data: JSON.stringify(del_chk_arr),
					success: function(data) {
						alert("미사용 처리되었습니다.");
						location.href="/admin/codeInfo.do?viewType=TR";
					}
				}); 
				
			}
			
		}
		
	}
	function treeModi(tree_btn) {

		var modChecklength = $(tree_btn).closest('.code_tree').find('.tree li.checked').length;
		
		if(modChecklength < 1) {
			alert("선택된 코드가 없습니다.");
			return false;
		}
		
		var code_nm = $(tree_btn).closest('.tree_stat').find('input.code_nm').val();
		var code_new_id = $(tree_btn).closest('.tree_stat').find('input.code_id').val();
		var code_id = $(tree_btn).closest('.tree_stat').find('input.old').val();
		var par_id = $(tree_btn).closest('.tree_stat').find('input.par_code_id').val();
		var code_content = $(tree_btn).closest('.tree_stat').find('textarea.code_content').val();
		var code_del_yn = 'N';
		
		var modifyCheck = nullCodeCheck(0);

		var result = true;
		
		if(code_new_id == code_id) {
			result = confirm("코드 번호가 변경되지 않았습니다. 진행하시겠습니까?");
		}
		
		if(!par_id) {
			par_id = null;
		}

		
		if(modifyCheck && result) {
 			$.ajax({
				url: '/admin/codeInfoModifyProc.do',
				type: 'POST',
				contentType: 'application/json; charset=utf-8',
				data: JSON.stringify({'code_new_id' : code_new_id, 'code_id' : code_id, 'code_nm' : code_nm, 'par_code_id': par_id, 'code_content' : code_content, 'code_del_yn' : code_del_yn}),
				success: function(re) {
					if(re == 'true') {
						alert("수정 성공!");
						location.href="/admin/codeInfo.do?viewType=TR";
					}
				},
				error: function() {
					alert("통신 실패!! 트리 수정");
				}
			}); // ajax 끝  
		}

	}
	
	function treeDelCheck(tree_btn) {
		
		var delCheckTrue = true;
	
		var del_chk_type = $(tree_btn).closest(".code_tree").find('.tree li.checked');
		var del_chk_length = $(tree_btn).closest(".code_tree").find('.tree li.checked').length;
		var del_chk_type_id = $(tree_btn).closest(".code_tree").find('.tree li.checked').data('id');
		
		if(del_chk_length == 0) {
			alert("선택된 코드가 없습니다.")
			delCheckTrue = false;
			return false;
		}
		
		console.log(del_chk_type);
		console.log(del_chk_type_id)
		
 		if($(del_chk_type).hasClass("main")) {
			$('.code_tree').find('.tree li').each(function(idx, el) {	
				if(del_chk_type_id == $(el).data('par')) {
					alert("존재하는 중분류가 있습니다. 삭제가 불가합니다.");
					delCheckTrue = false;
					return false;
				}
				
			})
		} 
		
 		if($(del_chk_type).hasClass("mid")) {
			
			$('.code_tree').find('.tree li').each(function(idx, el) {	
				if(del_chk_type_id == $(el).data('par')) {
					console.log("!!!!!!!!!!! ", $(el).data('par'));
					
					alert("존재하는 소분류가 있습니다. 삭제가 불가합니다.");
					delCheckTrue = false;
					return false;
				}
			})
		}
		return delCheckTrue;
	}
	
	function treeDel(tree_btn, viewType) {

		var delCheckTrue = true;
		
		var del_chk_length = $(tree_btn).closest(".code_layout, .code_tree").find("input.del_chk:checked").length;
		var code_id = $(tree_btn).closest('.tree_stat').find('input.code_id').val();
		
		var del_chk_arr = [{'code_id' : code_id}];
		
		if(del_chk_length == 0) {
			
			alert("선택된 코드가 없습니다.");
			return false;
			
		} else if(del_chk_length > 0) {
			
			delCheckTrue = treeDelCheck(tree_btn);
			console.log(delCheckTrue);
			
 			if(delCheckTrue) {				
				// 삭제 기능 구현할 곳
				$.ajax({
					url: '/admin/codeInfoDe.do',
					type: 'POST',
					contentType: 'application/json; charset=utf-8',
					data: JSON.stringify(del_chk_arr),
					success: function(data) {
						alert("삭제 완료!");
						location.href="/admin/codeInfo.do?viewType=TR";
					}
				}); 
				
			}
			
		}
		
	}
</script>
</html>