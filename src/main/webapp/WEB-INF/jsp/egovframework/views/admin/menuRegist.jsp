<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles"  prefix="tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	.modal-body {
		display: flex;
	    flex-direction: column;
	    justify-content: center;
	    align-items: stretch;
    }
    .modal-body input[type="text"], select {
    	height: 30px;
    	margin: 5px;
    }
    label {
    	font-weight: 700;
    }
</style>
<body>
	<main class="mt-5 pt-5">
	<div class="container-fluid px-4">
		<h1 class="mt-4">메뉴관리</h1>

		<div class="card mb-4">
			<div class="card-header">
				<a class="btn btn-primary float-end" onclick="modal()">메뉴 추가</a>
			</div>

		  <!-- Modal -->
		  <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		    <div class="modal-dialog">
		      <div class="modal-content">
		        <div class="modal-header">
		          <h5 class="modal-title" id="staticBackdropLabel">메뉴 추가</h5>
		          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		        </div>
		        <div class="modal-body">
		          <input type="hidden" id="user_id" value="${login.user_id}" />
		          <label for="m_nm">메뉴명</label>
		          <input type="text" id="m_nm" name="m_nm" value="" />
		          <label for="ty_id">메뉴타입</label>
					<select id="ty_id" name="ty_id">
							<option class="sample" value="1">선택</option>
						<c:forEach var="ty" items="${typeList}">
							<option class="ty_id" value="${ty.ty_id}">${ty.tynm}</option>
						</c:forEach> 
					</select>
					<label for="m_url">메뉴url</label>
					<input type="text" id="m_url" class="m_url" name="m_url" value="" />
					<!-- <input type="radio" name="newPage" value="새창으로 띄우기~" /> -->
					<div class="auth_chk">
						<p>권한</p>
						<label for="m_authNull">비회원</label>
						<input type="checkbox" id="m_authNull" name="m_auth" value="">
						<label for="m_auth0">일반회원</label>
						<input type="checkbox" id="m_auth0" name="m_auth" value="0">
						<label for="m_auth1">일반관리자</label>
						<input type="checkbox" id="m_auth1" name="m_auth" value="1">
						<label for="m_auth2">슈퍼관리자</label>
						<input type="checkbox" id="m_auth2" name="m_auth" value="2">
					</div>
		        </div>
		        <div class="modal-footer">
		          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
		          <button type="button" class="btn btn-primary submit">등록</button>
		        </div>
		      </div>
		    </div>
		  </div>
			
			<div class="card-body">
				<table class="table table-hover table-striped">
					<thead>
						<tr>
							<th>메뉴번호</th>
							<th>메뉴명</th>
							<th>메뉴유형</th>
							<th>URL</th>
							<th>메뉴등록일</th>
							<th>메뉴사용권한유저</th>
							<th>메뉴활성화여부</th>
							<th>수정</th>
							<c:if test="${login.u_type eq '2'}">
								<th>삭제</th>
							</c:if>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${allList}" var="menu">
								<tr class="other_tr" data-seq="${menu.m_seq}" data-tyid="${menu.ty_id}" data-url="${menu.m_url}" data-regist="${menu.m_regist_dt}">
									<td>${menu.m_num}</td>
									<td>
										<input type="text" name="m_nm" value="${menu.m_nm}" />
									</td>
									<td>
										${menu.ty_nm}
									</td>
									<td>${menu.m_url}</td>
									<td>${menu.m_regist_dt}</td>
									<td>
										<label for="checkbox${menu.m_seq}null">
											비회원
										</label>
										<input type="checkbox" name="m_auth" value="" id="checkbox${menu.m_seq}null" <c:forEach items="${authList}" var="auth"><c:if test="${auth.auth_type == null && auth.m_seq == menu.m_seq}">checked</c:if></c:forEach> />
										<label for="checkbox${menu.m_seq}0">
											일반사용자
										</label>
										<input type="checkbox" name="m_auth" value="0" id="checkbox${menu.m_seq}0" <c:forEach items="${authList}" var="auth"><c:if test="${auth.auth_type == 0 && auth.m_seq == menu.m_seq}">checked</c:if></c:forEach> />
										<label for="checkbox${menu.m_seq}1">
											일반관리자
										</label>
										<input type="checkbox" name="m_auth" value="1" id="checkbox${menu.m_seq}1" <c:forEach items="${authList}" var="auth"><c:if test="${auth.auth_type == 1 && auth.m_seq == menu.m_seq}">checked</c:if></c:forEach> />
										<label for="checkbox${menu.m_seq}2">
											슈퍼관리자
										</label>
										<input type="checkbox" name="m_auth" value="2" id="checkbox${menu.m_seq}2" <c:forEach items="${authList}" var="auth"><c:if test="${auth.auth_type == 2 && auth.m_seq == menu.m_seq}">checked</c:if></c:forEach> />
									</td>
									<td>
										<c:if test="${menu.m_del_yn eq 'Y'}">
											<button type="button" class="btn btn-danger yn_btn" data-del="N" data-seq="${menu.m_seq}">
													비활성화 상태
											</button>
										</c:if>
										<c:if test="${menu.m_del_yn eq 'N'}">
											<button type="button" class="btn btn-primary yn_btn" data-del="Y" data-seq="${menu.m_seq}">
													활성화 상태
											</button>
										</c:if>
									</td>
									<td>
										<button type="button" class="update_btn">수정</button>
									</td>
									<c:if test="${login.u_type eq '2'}">
										<td>
											<button type="button" class="del_btn">삭제</button>
										</td>
									</c:if>
								</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	</main>
</body>
<script src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<script type="text/javascript">

	var auth_arr = [];
	var m_nm_arr = [];

	$(document).ready(function() {
		
		$('#ty_id').change(function() {
			var ty_id = $('#ty_id option:selected').val();
			console.log(ty_id);
			if(ty_id == 1001) {
				$('#m_url').val('/board/boardList.do');
				$('#m_url').attr('disabled', true);
			} else if(ty_id == 1002) {
				$('#m_url').val('/gallery/galleryList.do');
				$('#m_url').attr('disabled', true);
			} else if(ty_id == 1003) {
				$('#m_url').val('/survey/surveyList.do');
				$('#m_url').attr('disabled', true);
			} else {
				$('#m_url').val('https://');
				$('#m_url').attr('disabled', false);
			}
		});
	
		
		$('.other_tr').find('input[name=m_nm]').each(function(idx, el) {
			m_nm_arr.push({'m_nm' : $(el).val()});
		})
		
		$('.submit').click(function() {
			
			var subCheck = true;
			
			var m_nm = $('#m_nm').val();
			var ty_id = $('select[name="ty_id"] > option:selected').val();
			var m_url = $('#m_url').val();
			var user_id = $('#user_id').val();
			
			var data = {'m_nm' : m_nm, 'ty_id' : ty_id, 'm_url' : m_url, 'user_id' : user_id}
			
			$(".auth_chk").find("input[name=m_auth]:checked").each(function(idx, el) {
				var m_auth = $(el).val();
				auth_arr.push({auth_type : m_auth});
			});
			
			if(m_nm == '') {
				alert("메뉴명이 입력되지 않았습니다. 확인해 주세요.");
				$('#m_nm').val('').focus();
				subCheck = false;
				return false;
			} 
			if(ty_id == '' || ty_id == null || ty_id == 1) {
				alert("메뉴 타입이 입력되지 않았습니다. 확인해 주세요.");
				subCheck = false;
				return false;
			}
			if(m_url == '' || m_url == 'https://') {
				alert("메뉴 주소가 입력되지 않았습니다. 확인해 주세요.");
				$('#m_url').val('').focus();
				subCheck = false;
				return false;
			}
			if($(".auth_chk").find("input[name=m_auth]").is(":checked") == false) {
				alert("권한이 선택되지 않았습니다. 확인해 주세요.");
				subCheck = false;
				return false;
			}

			if(subCheck){
			
				$.ajax({
					url: '/admin/menuRegistProc.do',
					type: 'POST',
					contentType: 'application/json; charset=utf-8',
					data: JSON.stringify(data),
					error: function() {
						alert("실패하였습니다. 다시 시도해 주세요.");
						return false;
					},
					success: function() {
						$.ajax({
							url: '/admin/menuAuthRegistProc.do',
							type: 'POST',
							contentType: 'application/json; charset=utf-8',
							data: JSON.stringify(auth_arr),
							success: function(data) {
								alert("메뉴 추가 완료");
								$('#staticBackdrop').modal("hide");
								location.reload();
							}, error: function() {
								alert("실패하였습니다. 다시 시도해 주세요.");
								return false;
							}
						}) // ajax 끝
					}
				}) //  ajax 끝
			}
			
		});
		
		$('.yn_btn').click(function() {
			var m_seq = $(this).data('seq');
			var m_del_yn = $(this).data('del');
			console.log(m_seq, m_del_yn);
			
			var data = {'m_seq' : m_seq, 'm_del_yn' : m_del_yn};
			
			$.ajax({
				url: '/admin/menuDelUpdate.do',
				type: 'POST',
				contentType: 'application/json; charset=utf-8',
				data: JSON.stringify(data),
				success: function(data) {
					alert("비활성화/활성화 완료");
					location.reload();					
				}
			}) // ajax 끝
		});
		
		$('.del_btn').click(function() {
			var result = confirm("선택한 메뉴가 DB에서도 완전히 삭제됩니다. 삭제하시겠습니까?");
			var m_seq = $(this).closest('.other_tr').data('seq');
			var data = {'m_seq' : m_seq};
			
			if(result) {
				$.ajax({
					url: '/admin/menuAuthDeleteProc.do',
					type: 'POST',
					contentType: 'application/json; charset=utf-8',
					data: JSON.stringify(data),
					success: function(data) {	
						alert("삭제 완료");
						location.reload();
					}
				}) // ajax 끝
				
			}
		});
		
		$('.update_btn').click(function() {
			
			up_auth_arr = [];
			
			var updCheck = true;
			
			var m_seq = $(this).closest('.other_tr').data('seq');
			var m_nm = $(this).closest('.other_tr').find('input[name=m_nm]').val();
			var updateData = {'m_nm' : m_nm, 'm_seq' : m_seq};
			
			$(this).closest(".other_tr").find("input[name=m_auth]:checked").each(function(idx, el) {
				var m_auth = $(el).val();
				up_auth_arr.push({auth_type : m_auth, m_seq : m_seq});
			});			
			
			if(m_nm == '') {
				alert("메뉴명이 입력되지 않았습니다. 확인해 주세요.");
				$(this).closest('.other_tr').find('input[name=m_nm]').val('').focus();
				updCheck = false;
				return false;
			}
			if($(this).closest(".other_tr").find("input[name=m_auth]").is(":checked") == false) {
				alert("권한이 선택되지 않았습니다. 확인해 주세요.");
				updCheck = false;
				return false;
			}
			
			
			if(updCheck) {
			
			$.ajax({
				url: '/admin/menuUpdate.do',
				type: 'POST',
				contentType: 'application/json; charset=utf-8',
				data: JSON.stringify(updateData),
				success: function() {
					$.ajax({
						url: '/admin/menuAuthUpdateProc.do',
						type: 'POST',
						contentType: 'application/json; charset=utf-8',
						data: JSON.stringify(up_auth_arr), // 다시 같은 m_seq auth 추가
						success: function(data) {
							alert("수정 완료");
							location.reload();
						}
					}) //  ajax 끝 
				}
			}) // ajax 끝
			
		}
		});
		
 	});
	
	function modal() {
		$("#staticBackdrop").modal("show");
	}

	
</script>
</html>