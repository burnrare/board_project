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
				<form method="post" id="boardInsert" action="/board/boardInsertProc.do">
				<input type="hidden" id="user_id" name="b_writer_id" value="${login.user_id}" />
				<input type="hidden" id="m_seq" name="m_seq" value="${m_seq}" />
					<c:if test="${login.u_type eq '1' || login.u_type eq '2'}">
<!-- 						<div class="mb-3">
							<select id="b_notice" name="b_notice" class="form-control">
								<option value="0">일반게시글</option>
								<option value="1">공지사항</option>
							</select>
						</div> -->
					</c:if>
						<div class="mb-3 addSelect">
							<label for="code_id">대분류</label>
							<select id="code_id" name="code_id" class="form-control code">
										<option class="code_select" value="">대분류 선택 안 함</option>
								<c:forEach items="${codeAllList}" var="code">
									<c:if test="${code.level == 1 && code.code_del_yn eq 'N'}">
										<option class="code_select" value="${code.code_id}">${code.code_nm}</option>
									</c:if>
								</c:forEach>
							</select>
						</div>
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
					<button type="button" class="btn btn-outline-warning submit">등록하기</button>
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
		
		$('#code_id').change(function() {
			
			$(this).siblings('#code_mid_id').remove();
			console.log($(this));
			var code_main_id = $(this).val();

			$.ajax({
				url: '/admin/boardInsert.do',
				type: 'POST',
				contentType : 'application/json; charset=utf-8',
				data: JSON.stringify({'code_main_id' : code_main_id}),
				success: function(data) {
					
					if(data.length != 0) {
						
					 	var str = '<label id="code_mid_id" for="code_mid_id">중분류</label>';
						str += '<select id="code_mid_id" name="code_mid_id" class="form-control code_mid">'
							str += '<option class="code_mid_select" value="">중분류 선택</option>'
						$.each(data, function(idx, value) {
							str += '<option class="code_mid_select" value="' + value.code_mid_id + '">' + value.code_nm + '</option>';
						})
						str += '</select>';
						$('.addSelect').append(str);
						
					}
					
				}
			})
		});
		
 		$(document).on("change", '#code_mid_id', function() {
			var code_main_id = $('.code_select:selected').val();
			var code_mid_id = $(this).val();
			
			$(this).siblings('#code_sub_id').remove();
			
			 $.ajax({
				url: '/admin/boardInsert.do',
				type: 'POST',
				contentType : 'application/json; charset=utf-8',
				data: JSON.stringify({'code_main_id' : code_main_id, 'code_mid_id' : code_mid_id}),
				success: function(data) {
					
					console.log(data.length);
					
					if(data.length != 0) {
						var str = '<label id="code_sub_id" for="code_sub_id">소분류</label>'
						str += '<select id="code_sub_id" name="code_sub_id" class="form-control code_sub">'
							str += '<option class="code_sub_select" value="">소분류 선택</option>'
						$.each(data, function(idx, value) {
							str += '<option class="code_sub_select" value="' + value.code_sub_id + '">' + value.code_nm + '</option>';
						})
						str += '</select>';
						$('.addSelect').append(str);
					}
					
				}
			}) 
		});
 		
 		$('.submit').click(function() {
 			var nullCheckSuccess = nullCheck($(this));
 			
 			event.preventDefault();
 			
 			if(nullCheckSuccess) {
 				$("#boardInsert").submit();
 			}
 		});
 		
	});
	
	function nullCheck(btn) {
		var main_code_val = $(btn).closest('div.card-body').find('select.code option:selected').val();
		var mid_code_val = $(btn).closest('div.card-body').find('select.code_mid option:selected').val();
		var sub_code_val = $(btn).closest('div.card-body').find('select.code_sub option:selected').val();
		
		var nullCheck = true;
		
		if(main_code_val == null) {
			var result = confirm("선택되지 않은 코드가 있습니다. 진행할까요?");
			if(!result) {
				nullCheck = false;
				return false;
			}
		} else if(mid_code_val == null) {
			var result = confirm("선택되지 않은 코드가 있습니다. 진행할까요?");
			if(!result) {
				nullCheck = false;
				return false;
			}
		} else if(sub_code_val == null) {
			var result = confirm("선택되지 않은 코드가 있습니다. 진행할까요?");
			if(!result) {
				nullCheck = false;
				return false;
			}
		}
		return nullCheck;
	}
</script>
</html>