<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>설문 참여</title>
<style>
	.survey-wrap {
	    width: 80%;
    	margin: 30px auto;
    	border: 1px solid #ddd;
    	padding: 30px;
    }
    .survey-wrap > div {
    	margin: 50px 0 0 0;
    }
/*     .input-flex {
    	display: grid;
    	align-items: center;
    	grid-template-columns: 1fr 1fr 1fr 1fr;
    } */
    .input-flex {
    	padding-bottom: 20px;
    	border-bottom: 1px solid #ddd;
    }
    p {
   		padding-top: 10px;
    }
    .input-flex > div {
   	    padding: 10px;
    }
    .survey-wrap > div > p {
   	    margin-bottom: 40px;
    }
    textarea {
        width: 700px;
    	height: 150px;
    	border: 1px solid #b3b3b3;
    	border-radius: 15px;
    	resize: none;
    }
	ul {
		list-style: none;
	}
	.survey-li {
		padding: 10px;
	}
	.progress {
		margin: 30px auto;
		height: 10px;
		width: 80%;
		background: grey;
	}
	.progress-bar {
		heignt: 100%;
		background: #68B984;
	}
</style>
</head>
<body>
	<input type="hidden" id="sur_id" value="${page.sur_id}" />
	<input type="hidden" id="user_id" value="${login.user_id}" />
	<input type="hidden" id="lastNum" value="${lastNum}" />
	<input type="hidden" id="getTotal" value="${getTotal}" />
	<div class="progress">
		<div class="progress-bar"></div>
	</div>
	<div class="survey-wrap" style="display: none;">
			<ul>
				<c:forEach items="${questionList}" var="que" varStatus="stat">
						<li data-page="${que.que_page_num}" 
						data-queid="${que.que_id}" 
						data-qrnk=
						<c:choose>
							<c:when test="${que.que_par_id eq null}">
								"${que.q_rnk}"
							</c:when>
							<c:when test="${que.que_par_id ne null}">
								"${que.que_par_id}-${que.que_id - que.que_par_id}"
							</c:when>
						</c:choose>
						data-ess="${que.que_ess_type}" 
						data-max="${que.que_max_type}"
						data-min="${que.que_min_type}"
						data-type="${que.que_type}"
						id="question_${que.que_num}" class="survey-li">
							<strong>문항
						<c:choose>
							<c:when test="${que.que_par_id eq null}">
								${que.q_rnk}.
							</c:when>
							<c:otherwise>
								${que.que_par_id} - ${que.que_id - que.que_par_id}.
							</c:otherwise>
						</c:choose>
							</strong>
						<c:forEach items="${cateList}" var="cate">
							<c:choose>
								<c:when test="${cate.cate_nm eq null}">
									${cate.cate_nm}
								</c:when>
								<c:when test="${cate.cate_id == que.cate_id}">
									<strong>
									[${cate.cate_nm}]
									</strong>
								</c:when>
							</c:choose>
						</c:forEach>
						${que.que_content}
						<c:choose>
							<c:when test="${que.que_max_type ne null && que.que_max_type > 1}">
								<c:if test="${que.que_max_type ne que.que_min_type}">
									(<c:if test="${que.que_min_type >= 1}">${que.que_min_type}개 ~	</c:if>${que.que_max_type}개 선택)
								</c:if>
								<c:if test="${que.que_max_type eq que.que_min_type}">								
									(${que.que_max_type}개 선택)
								</c:if>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${que.que_ess_type eq 'Y' && que.que_ess_visible eq 'Y'}">
								(필수)
							</c:when>
							<c:when test="${que.que_ess_type eq 'N' && que.que_ess_visible eq 'Y'}">
								(자율)
							</c:when>
						</c:choose>
						<br/>
						<c:if test="${que.que_type eq 'W'}">
							<textarea class="area_con" id="area_${que.que_id}" maxlength="50" placeholder="10자 이상으로 작성해 주세요."></textarea>
						</c:if>
						<c:forEach items="${optionList}" var="option" varStatus="opt">
							<c:if test="${option.que_id == que.que_id}">
								<input type="checkbox" name="que_${que.que_id}" value="${option.option_id}" class="checkbox <c:choose><c:when test="${option.option_type == 2}">two</c:when><c:when test="${option.option_type == 3}">none</c:when><c:when test="${option.option_type == 4}">etc</c:when><c:otherwise>alone</c:otherwise></c:choose>" id="op_${option.option_id}" data-que="que_${que.que_id}" />
								<label for="op_${option.option_id}">${option.option_nm}</label>
							</c:if>
						</c:forEach>
						</li> <!-- 문항 -->
				</c:forEach>
			</ul>
			<a href="#" class="btn btn-dark prev">이전</a>
			<a href="#" class="btn btn-dark next">다음</a>
			<a href="#" class="btn btn-dark submit" style="display: none;">제출</a> 
	</div>
			<a href="/survey/surveyList.do" class="btn btn-dark main" style="display: none;">메인으로</a>
</body>
<script src="https://code.jquery.com/jquery-3.6.1.js"
	integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
	crossorigin="anonymous"></script>
<script type="text/javascript">

		var sur_id = $('#sur_id').val();
		var user_id = $('#user_id').val();
		var last_num = $('#lastNum').val();
		var idx = 0;
		var endPoint = $('#getTotal').val();
		var optLength = $('input.checkbox').length;
		var cntPercent = 100 / endPoint;
		var lastPercent = $('.chkPer').length;
		var allPercent = lastPercent / cntPercent * 100;
		var chk_arr1 = [];
		// var countPer = 100 / ${reqCnt};

	$(document).ready(function() {
		var page_cnt = $(".survey-wrap").find('li').data('page'); // 1
		var inputCheck = true;
		
		$(".main").show();
		$(".survey-wrap").show();
		changeLi(page_cnt);
		
 		$('.next').click(function() {
 			inputCheck = checkFrm(page_cnt); 			
 			if(!inputCheck) {
 				return;
 			}
 			page_cnt = page_cnt + 1;
 			if(inputCheck) {
 	 			changeLi(page_cnt);				
 			} 
 			changeLi(page_cnt);	
		});
 		
 		$('.prev').click(function() {		
 			page_cnt = page_cnt - 1;
			changeLi(page_cnt);
 		});
 		
 		$('.submit').click(function() {
 		// 값 입력했는지 확인하는 로직
			inputCheck = checkFrm(page_cnt); 		
 		
				if(inputCheck) {
					$(".survey-wrap").find("input.checkbox:checked").each(function(idx, el) {
		 				var que_id = $(el).parents("li").data("queid");
						var inputText;
						var chk = $(el).val();
						
						// 기타 체크여부 확인
						if($(el).hasClass("etc")) {
							inputText = $(el).next().next().val();
						}
						
						chk_arr1.push({que_id : que_id, option_id : chk, ans_etc_con: inputText, user_id : user_id, sur_id : sur_id});
					});
					
					$(".survey-wrap").find(".area_con").each(function(idx, el) {
						if($(el).val() != '') {
			 				var que_id = $(el).parents("li").data("queid");
							var ans_con = $(el).val();
						
							chk_arr1.push({que_id : que_id, ans_con : ans_con, user_id : user_id, sur_id : sur_id});
						}
					});
					
		 			   $.ajax({
		 				url:'/surveyInsertProc.do',
		 				type: 'POST',
						contentType: 'application/json; charset=utf-8',
						data: JSON.stringify(chk_arr1),
						success: function(data) {
							alert("제출 완료");
							location.href="/survey/surveyMain.do?sur_id=" + sur_id;
						}
		 			});   // ajax 끝 
		 			console.log(chk_arr1);
				}
 		})
		
		function changeLi(page_cnt) { // page 이동
		 		$(".survey-wrap").find('.survey-li').each(function(idx, el) {
					if($(el).data('page') == page_cnt) {
						$(el).show();
						if(page_cnt == 1) {
							$('.prev').hide();
							$('.submit').hide();
							$('.next').show();
						} else if(page_cnt != 1 && page_cnt < last_num) {
							$('.prev').show();
							$('.submit').hide();
							$('.next').show();
						} else if(page_cnt == last_num) {
							$('.submit').show();
							$('.next').hide();
						}
					} else {
						$(el).hide();
					}
				}); 
		}
		
		$('input.checkbox').click(function(){
			
			/* progressBarChk(); */
			
			var que = $(this).parents(".survey-li");
			var max = $(this).parents(".survey-li").data("max");
			var min = $(this).parents(".survey-li").data("min");

			if($(this).is(":checked")) {
				if($(que).find("input.two:checked, input.etc:checked").length > max) { // max값에 맞게끔 선택 가능
					alert(max + "개만 선택 가능");
					$(this).prop("checked", false);						
				}
				if($(que).find("input.none:checked").length == 1) {
					$(que).find("input.checkbox").not($(this)).prop("checked", false);
				}
				$(que).find("input.alone").not($(this)).prop("checked", false);
				$(que).find("input.etc").not($(this)).prop("checked", false);
				$(que).find("input.etc").next("label").next("input[name='etc_con']").remove();
 			}
			
			progressBarChk();
		})
		
		$('input.etc').click(function() {
			
			if($(this).is(':checked')) { // etc 선택할 시 attr로 input태그 추가
				$(this).next("label").after($("<input/>").attr({
					"type" : "text",
					"maxlength" : "10",
					"name" : "etc_con"
				}));
			}
			if(!$(this).is(':checked')){
				$(this).next("label").next("input[name='etc_con']").remove(); // 취소할 시 input태그 삭제
			}
		}); 
		
		$('textarea[class="area_con"]').on("keyup", function(e) {
			if($(this).closest(".survey-li").data('ess') == 'Y') {
				progressBarChk();
			}
		});
		
		/* 1. 되는거 : 전체페이지 -> input[name="etc_con"] -> keyup
		2. 안되는거: input[name="etc_con"] -> keyup */
		
 		$(document).on("keyup", 'input[name="etc_con"]', function(e) {
			if($(this).closest(".survey-li").data('ess') == 'Y') {
				console.log(e.target.value.length);
				progressBarChk(e.target.value.length);
			}
		}); 
	});
	
	function progressBarChk() {
		
			var cnt = 0;
			var progress = $('.progress-bar');
			
			$('.survey-li[data-ess="Y"]').each(function(idx, el) {
				
				// 텍스트 area여부
				var isTextarea = $(el).find('textarea[class="area_con"]').length;
				// 체크된 값 존재
				var optfalse = $(el).find('input[type=checkbox]').is(":checked");
				// 없음 존재
				var optnone = $(el).find('input.none').is(":checked");
				// 기타에 클릭 포함되어있을 경우
				var etcfalse = $(el).find('input[type=checkbox].etc').is(":checked");
				// 체크 개수
				var optLth = $(el).find('input[type=checkbox]:checked').length;
				// 최대 체크할 수 있는 개수
				var max = $(el).data("max");
				// 최소 체크할 수 있는 개수
				var min = $(el).data("min");
				
				// 텍스트 area일 경우 증가
				if(isTextarea) {
					if($(el).find('textarea[class="area_con"]').val().length >= 10) {
						cnt++;
						return true;
					}
				}
				
				// 체크된 값 존재하면
				if(optfalse == true) {
					if(optnone == true) {
						cnt++;
						return true;
					}
					
					if(min <= optLth) {
						if(etcfalse == true) {
							cnt++;
							return true;
						} 
						cnt ++;
						return true;
					}
				}
			});
			
			$(progress).css('width', cnt/endPoint*100 + '%');
	}
	
	
	function checkFrm(page_cnt) {
		
			/*formCheck*/
			/*1 ==> 유효성 체크되고 통과*/
			/*2 ==> 유효성 체크되고 통과X*/
			/*3 ==> 기타란이 비어있다*/
		
			 var formCheck = 1;
			 var inputCheck = true;
				$(".survey-wrap").find("li[data-page='" + page_cnt + "']").each(function(idx, el) {
							
								 if(formCheck != 1) {
									return formCheck;
								} 
								
								var type = $(el).data("type");
								var ess = $(el).data("ess");
								var max = $(el).data("max");
								var min = $(el).data("min");
								var que_id = $(el).data("queid");
								var qrnk = $(el).data("qrnk");
								var inputText = $(el).find("input[name='etc_con']").val();
								var ans_con = $(el).find("textarea[class='area_con']");
								
								if(type == 'M') {
									// 객관식 유효성 통과못함
									if(ess == 'Y' && $(el).find("input.checkbox:checked").length == 0) { // 객관식 값
										formCheck = 2;
										inputCheck = false;
										noticeNum(qrnk, max);
										return;
									}

								 	// 객관식의 기타값 유효성 통과못함
									if(ess == 'Y' && $(el).find("input.etc:checked") && inputText == '') { // 필요 YES
										formCheck = 2;
										inputCheck = false;
										noticeEtcNum(qrnk);
										$(el).find("input[name='etc_con']").val('').focus();
										return;
									}
									if(ess == 'N' && $(el).find("input.etc:checked") && inputText == '') { // 필요 NO
										formCheck = 2;
										inputCheck = false;
										noticeEtcNum(qrnk);
										$(el).find("input[name='etc_con']").val('').focus();
										return;
									}
								
									// 다중선택 유효성 통과못함
									if(ess == 'Y' && $(el).find("input.two:checked, input.etc:checked").length != 0) { // 필요 YES
										if($(el).find("input.two:checked, input.etc:checked").length < min) {
											formCheck = 2;
											inputCheck = false;
											noticeMaxNum(qrnk, min);
											return;
										}
									}
									if(ess == 'N' && $(el).find("input.two:checked, input.etc:checked").length != 0) { // 필요 NO
										if($(el).find("input.two:checked, input.etc:checked").length < min) {
											formCheck = 2;
											inputCheck = false;
											noticeMaxNum(qrnk, min);
											return;
										}
									}
								}
								
								
								if(type == 'W') { // 주관식 textarea
									
									if(ess == 'Y' && ans_con.val().length < 10) {
										if(ans_con.val() == '') {											
											formCheck = 2;
											inputCheck = false;
											noticeEtcNum(qrnk)
											ans_con.val('').focus();
											return;
										}
										formCheck = 2;
										inputCheck = false;
										noticeCalNum(qrnk)
										ans_con.focus();
										return;
									}
								
									if(ess == 'N' && ans_con.val().length < 10 && ans_con.val() != '') {
										formCheck = 2;
										inputCheck = false;
										noticeCalNum(qrnk)
										ans_con.focus();
										return;
									}
								}
				});
				return inputCheck;
	}

	function noticeMaxNum(num, min) {
		let msg = num + " 번 문항은 최소 " + min + "개 이상 선택해야 합니다. 확인해 주세요.";
		alert(msg);
	}
	
	function noticeNum(num, max) {
		let msg = num + " 번 문항은 반드시 " + max + "개 선택해야 합니다. 확인해 주세요.";
		alert(msg);
	}
	
	function noticeEtcNum(num) {
		let msg = num + " 번 문항의 입력란이 비어 있습니다. 확인해 주세요.";
		alert(msg);
	}
	
	function noticeCalNum(num) {
		let msg = num + " 번 문항의 요구 글자 개수가 적습니다. 확인해 주세요. (최소 10 글자)";
		alert(msg);
	}
	

</script>
</html>