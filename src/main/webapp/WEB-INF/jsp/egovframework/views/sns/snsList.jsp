<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link href="${path}/resources/css/sns.css" rel="stylesheet" />
<script src="//cdn.ckeditor.com/4.19.0/standard/ckeditor.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/translations/ko.js"></script>

<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<div class="loading">
		<img src="${path}/resources/images/loading.gif" />
	</div>
	<div class="first_wrap">
		<input type="hidden" value="${m_seq}" name="m_seq" id="m_seq" />
		<input type="hidden" value="${login.u_ncnm}" name="u_ncnm" id="u_ncnm" />
		<input type="hidden" value="${login.user_id}" name="user_id" id="user_id" />
		<input type="hidden" value="${login.u_type}" name="u_type" id="u_type" />
		<div class="position">
		<div class="insert_wrap">
			<div class="insert">
				<c:if test="${not empty login}">
					<textarea name="insertTextarea" id="editor" class="edioer_here"></textarea>
					<button type="button" onclick="snsInsertProc(this)"><i class="xi-check-min"></i></button>
				</c:if>
				<c:if test="${empty login}">
					<button type="button" onclick="location.href='/login.do'">로그인 뒤에 글을 등록해 봐요!</button>
				</c:if>
			</div>
		</div>
		<div class="search_wrap">
			<select id="search_select">
				<option id="search_1" class="seachselect" value="b_writer">작성자</option>
				<option id="search_2" class="seachselect" value="b_content">내용</option>
			</select>
			<input type="text" name="searchVal" id="searchVal" value="" />
			<button type="button" class="search"><i class="xi-search"></i></button>
		</div>
		</div>
		<div class="list_wrap infinite">
		</div> <!-- div.list_wrap 끝 -->
		<div class="last_list">
			<p class="msg"></p>
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
	
	CKEDITOR.replace('insertTextarea');
	
	var m_seq = $("input[name='m_seq']").val();
	var login_chk = $("input[name='user_id']").val();
	var u_type = $("input[name='u_type']").val();
	var search_selected; // searchKey
	var searchVal;
	var first_num = 1;
	var last_num = 5;

	load();
	
	$(document).ready(function() {
		$('.loading').show();
		
		$('.search').click(function() {
			$('.list_wrap').empty();
			first_num = 1;
			last_num = 5;
			load();
		});
		
	});
	
	    var scrollFlag = true;
	    
	$(window).scroll(function(){
	     
	    // 최하단일 경우를 체크하기 위해 최하단 위치값을 지정
	    // 화면 문서전체의 길이에서, 현재 창 높이를 뺀 것이 최하단 값
	    var chkBtm = parseInt($(document).height()) - parseInt($(window).height());
	    var num = Math.round($(window).scrollTop());
	     
	    if((chkBtm -1) <= num && scrollFlag){        
	        // 최하단으로 도달했을 경우        	
				load(); 
	    } 
	});

	function load(type) {
		
		scrollFlag = false;
		search_selected = $('.seachselect:selected').val();
		searchVal = $('#searchVal').val();
		first_num = ($(".list").last().data("num") || 0) + 1;
		last_num = first_num + 4;
		
		$('.loading').show();
		
		if(type != 'insert' && type != 'delete') {
			
			  setTimeout(function() {
					$.ajax({
						url : '/sns/snsList.do',
						type : 'POST',
						data : {'m_seq' : m_seq, 'first_num' : first_num, 'last_num' : last_num, 'searchKey' : search_selected, 'searchVal' : searchVal},
						success : function(data) {
									$('.msg').empty();
								if(data.length == 0) {
									$('.loading').hide();
									console.log("마지막 페이지입니다.");
									$('.msg').append('더 이상 존재하는 글이 없어요. <i class="xi-emoticon-sad"></i>');
								}
								$('.loading').hide();
								mk_seq(data);
								scrollFlag = true;
							
						},
						error : function(data) {
							$('.loading').hide();
							alert("통신 실패!");
						}
					});
			  }, 500);
		} else if(type == 'insert' || type == 'delete'){
			$.ajax({
				url : '/sns/snsList.do',
				type : 'POST',
				data : {'m_seq' : m_seq, 'first_num' : first_num, 'last_num' : last_num, 'searchKey' : search_selected, 'searchVal' : searchVal},
				success : function(data) {
						$('.loading').hide();
						mk_seq(data);
						scrollFlag = true;
				},
				error : function(data) {
					$('.loading').hide();
					alert("통신 실패!");
				}
			});
		}
	
	}

	function mk_seq(data) {
		
			$.each(data, function(idx, value) {
					
								var str = '<div class="list" data-writer="' + value.b_writer_id + '" data-num="' + value.board_num + '" data-no="' + value.board_id + '">';
								//
								str += '<div class="sns_title">';
								str += '<div class="sns_title_p">';
								str += '<p>' + value.nickname + '</p>';
								str += '<p>' + value.b_regist_dt + '</p>';
								str += '</div>';
								str += '<div class="sns_title_btn">';
								if (u_type == '2' || u_type == '1'
										|| u_type == '0') {
									if (u_type == '0') {
										if (login_chk == value.b_writer_id) {
											str += '<button type="button" class="classic_btn" onclick="snsDeleteProc(this)"><i class="xi-trash"></i></button>';
											str += '<button type="button" class="classic_btn" onclick="snsUpdateList(this)"><i class="xi-wrench"></i></button>';
										} else {
											str += '<button type="button" class="classic_btn"><i class="xi-eye"></i></button>';
										}
									} else {
										str += '<button type="button" class="classic_btn" onclick="snsDeleteProc(this)"><i class="xi-trash"></i></button>';
										str += '<button type="button" class="classic_btn" onclick="snsUpdateList(this)"><i class="xi-wrench"></i></button>';
									}
								} else {
									str += '<button type="button" class="classic_btn"><i class="xi-eye"></i></button>';
								}
								str += '</div></div>';
								//
								str += '<div class="sns_content">';
								str += '<div class="content_p">';
								str += '<div class="b_content">'
										+ value.b_content + '</div>';
								str += '</div>';
								str += '</div>';
								//
								str += '<div class="sns_footer">';
									str += '<div class="heart_wrap">';
									str += '<div class="span_wrap">';
								if(login_chk != '') {
									str += '<a class="heart" onclick="heart(this)"><span id="heart"></span>';
								} else {
									str += '<a class="heart"><span id="heart"><i class="xi-emoticon-neutral-o"></i></span>';
								}
									str += '<span class="heart_cnt">'
											+ value.b_like + '</span></a>';
									str += '</div>'
									str += '<span class="reply_cnt on" onclick="replyInsertForm(this)"> 댓글(' + value.r_cnt +')</span>';
									str += '</div>';
								str += '<div class="reply_list">';
								str += '</div>';
								str += '</div>';
								//
								str += '</div>'; // list 끝

								$('div.list_wrap').append(str);

							});
			
				if(login_chk != '') {					
					$('.list').each(function(idx, value) {
						
						const span = $(this).find("span#heart");
						const a = $(this).find("a.heart");
						var board_id = $(this).data('no');
						
						// 처음에 좋아요 눌렀는지 뿌리기
						$.ajax({
							url : '/sns/heartChk.do',
							type : 'POST',
							contentType : 'application/json; charset=utf-8',
							data : JSON.stringify({
								'board_id' : board_id,'b_writer_id' : login_chk}),
							context: this,
							success : function(data) {
								
								if (data >= 1) {
									$(span).empty();
									$(span).append('<i class="xi-emoticon-cool-o"></i>');
									$(this).find(".heart").addClass('on');
									$(a).prop('name', data);
								} else {
									$(span).empty();
									$(span).append('<i class="xi-emoticon-neutral-o"></i>');
									$(a).prop('name', data);
								}
							}, 
							error: function() {
								alert("통신 실패!")
							}
						});
					});
				}
	}
	
	function AllnullChk(btn_click, type) {

		var nullChk = true;
		var str = $.trim(CKEDITOR.instances.editor.getData());
		var editorText = f_SkipTags_html(str);
		editorText = editorText.replace(/\s/gi,"");
	    editorText = editorText.replace(/&nbsp;/gi, "");
		
		if (type == 'insert') {
			// insert
			if (editorText == '' || editorText.length == 0) {
				alert("내용을 입력해 주세요.");
				CKEDITOR.instances.editor.focus();
				nullChk = false;
				return false;
			}
		} else if (type == 'update') {

			var upe_board_id = $(btn_click).closest(".list").data("no");
			// update
			$(".edioer_here").each(function(idx, el) {
				
				var str = $.trim(CKEDITOR.instances[upe_board_id].getData());
				var editorText = f_SkipTags_html(str);
				editorText = editorText.replace(/\s/gi,"");
			    editorText = editorText.replace(/&nbsp;/gi, "");
				
								var id = $(el).attr('id');
								if (upe_board_id == id) {
									if (editorText == '' || editorText.length == 0) {
										alert("내용을 입력해 주세요.");
										CKEDITOR.instances[upe_board_id].focus();
										nullChk = false;
										return false;
									}
								}
							})
		} else if (type == 'replyInsert') {
			var r_content = $.trim($(btn_click).closest('.list').find(
					'input[name=replyInsert]').val());
			if (r_content == null || r_content == '') {
				alert("내용을 입력해 주세요.");
				nullChk = false;
				return false;
			}
			if(r_content.length > 20) {
				alert("내용이 20글자를 초과합니다.");
				nullChk = false;
				return false;
			}
		} else if (type == 'replyUpdate') {
			var r_content = $.trim($(btn_click).closest('.list').find(
					'input[name=replyUpdate]').val());
			if (r_content == null || r_content == '') {
				alert("내용을 입력해 주세요.");
				nullChk = false;
				return false;
			}
			if(r_content.length > 20) {
				alert("내용이 20글자를 초과합니다.");
				nullChk = false;
				return false;
			}
		}

		return nullChk;
	}
	
	//태그제거용
	function f_SkipTags_html(input, allowed) {
	    allowed = (((allowed || "") + "").toLowerCase().match(/<[a-z][a-z0-9]*>/g) || []).join(''); // making sure the allowed arg is a string containing only tags in lowercase (<a><b><c>)
	    var tags = /<\/?([a-z][a-z0-9]*)\b[^>]*>/gi,
	    commentsAndPhpTags = /<!--[\s\S]*?-->|<\?(?:php)?[\s\S]*?\?>/gi;
	    return input.replace(commentsAndPhpTags, '').replace(tags, function ($0, $1) {
	        return allowed.indexOf('<' + $1.toLowerCase() + '>') > -1 ? $0 : '';
	    });
	}

	function snsInsertProc(insert_click) {

		var nullChk = AllnullChk(insert_click, 'insert');

		var b_writer_id = $('input[name=user_id]').val();
		var b_content = CKEDITOR.instances.editor.getData();

		if (nullChk) {
			// $.ajax insert 기능 이후 load 돌리기
			$.ajax({
				url : '/sns/snsInsertProc.do',
				type : 'POST',
				contentType : 'application/json; charset=utf-8',
				data : JSON.stringify({
					'b_writer_id' : b_writer_id,
					'b_content' : b_content,
					'm_seq' : m_seq
				}),
				success : function(data) {
					CKEDITOR.instances.editor.setData("");
					$('.list_wrap').empty();
                    load('insert');
				}
			})
		}
	}

	function snsUpdateProc(update_click) {

		var nullChk = AllnullChk(update_click, 'update');
		var b_content;
		var upe_board_id = $(update_click).closest(".list").data("no");
		/* var b_img =  */

		if (nullChk) {
			$(".edioer_here").each(function(idx, el) {
				var id = $(el).attr('id');
				if (upe_board_id == id) {
					CKEDITOR.replace(id);
					b_content = CKEDITOR.instances[upe_board_id].getData();

					$.ajax({
						url : '/sns/snsUpdateProc.do',
						type : 'POST',
						contentType : 'application/json; charset=utf-8',
						data : JSON.stringify({
							'b_content' : b_content,
							'board_id' : upe_board_id
						}),
						success : function(data) {
							singleLoad('update', update_click, upe_board_id);
						}
					})
				}
			})
		}
	}

	function singleLoad(btn_click_type, btn, board_id) {

		if (btn_click_type == 'insert') {
			//insert, delete했을 시 전체를 다시 load
			$.ajax({
				url : '/sns/snsInsertList.do',
				type : 'POST',
				contentType : 'application/json; charset=utf-8',
				data : JSON.stringify({
					'm_seq' : m_seq
				}),
				success : function(data) {
					insertLoad(btn, data);
				}
			})

		} else if (btn_click_type == 'update') {
			console.log('update');

			// update했을 시 그 부분만 load
			$.ajax({
				url : '/sns/snsUpdateList.do',
				type : 'POST',
				contentType : 'application/json; charset=utf-8',
				data : JSON.stringify({
					'm_seq' : m_seq,
					'board_id' : board_id
				}),
				success : function(data) {
					updateLoad(btn, data);
				}
			})

		} else {
			$.ajax({
				url : '/sns/snsList.do',
				type : 'POST',
				contentType : 'application/json; charset=utf-8',
				data : {
					'm_seq' : m_seq
				},
				success : function(data) {
					alert("통신 성공!");
				}
			})
		}
	}

	function insertLoad(insert_click, value) {

		var str = '<div class="list" data-writer="' + value.b_writer_id + '" data-num="' + value.board_num + '" data-no="' + value.board_id + '">';
		//
		str += '<div class="sns_title">';
		str += '<div class="sns_title_p">';
		str += '<p>' + value.nickname + '</p>';
		str += '<p>' + value.b_regist_dt + '</p>';
		str += '</div>';
		str +='<div class="sns_title_btn">';
		if (u_type == '2' || u_type == '1' || u_type == '0') {
			if (u_type == '0') {
				if (login_chk == value.b_writer_id) {
					str += '<button type="button" class="classic_btn" onclick="snsDeleteProc(this)"><i class="xi-trash"></i></button>';
					str += '<button type="button" class="classic_btn" onclick="snsUpdateList(this)"><i class="xi-wrench"></i></button>';
				} else {
					str += '<button type="button" class="classic_btn"><i class="xi-eye"></i></button>';
				}
			} else {
				str += '<button type="button" class="classic_btn" onclick="snsDeleteProc(this)"><i class="xi-trash"></i></button>';
				str += '<button type="button" class="classic_btn" onclick="snsUpdateList(this)"><i class="xi-wrench"></i></button>';
			}
		} else {
			str += '<button type="button" class="classic_btn"><i class="xi-eye"></i></button>';
		}
		str += '</div></div>';
		//
		str += '<div class="sns_content">';
		str += '<div class="content_p">';
		str += '<div class="b_content">' + value.b_content + '</div>';
		str += '</div>';
		str += '</div>';
		//
		str += '<div class="sns_footer">';
		str += '<div class="heart_wrap">';
		str += '<div class="span_wrap">'
		str += '<a class="heart" onclick="heart(this)"><span id="heart"><i class="xi-emoticon-neutral-o"></i></span>';
		str += '<span class="heart_cnt">0</span></a>';
		str += '</div>'
		str += '<span class="reply_cnt on" onclick="replyInsertForm(this)"> 댓글(' + value.r_cnt + ')</span>';
		str += '</div>';
		str += '<div class="reply_list">';
		str += '</div>';
		str += '</div>';
		//
		str += '</div>'; // list 끝

		$(".list_wrap").prepend(str);
	}

	function updateLoad(update_click, data) {

		const list = $(update_click).closest(".list");

		// 수정 후 내용 바꾸기
		$(list).find(".sns_content").empty();
		$(list).find(".sns_title").empty();

		var title_str = '<div class="sns_title_p">';
		title_str += '<p>' + data.nickname + '</p>';
		title_str += '<p>' + data.b_regist_dt + '</p>';
		title_str += '</div>';
		title_str += '<div class="sns_title_btn">';
		title_str += '<button type="button" class="classic_btn" onclick="snsDeleteProc(this)"><i class="xi-trash"></i></button>';
		title_str += '<button type="button" class="classic_btn" onclick="snsUpdateList(this)"><i class="xi-wrench"></i></button>';
		title_str += '</div>';

		var str = '<div class="content_p">';
		str += '<div class="b_content">' + data.b_content + '</div>';
		str += '</div>';
		str += '</div>';

		$(list).find(".sns_content").append(str);
		$(list).find(".sns_title").append(title_str);

	}

	function snsUpdateList(update_click) {

		const list = $(update_click).closest(".list");
		// 수정폼 만들기

		var b_content = $(list).find('.b_content').html();
		var b_no = $(list).data("no");

		$(update_click).closest(".list").find(".sns_content").empty();
		$(update_click).closest(".list").find(".sns_title").empty();

		var str = '<div class="update">';
		str += '<textarea name="updateTextarea" id="' + b_no + '" class="edioer_here updateCdk"></textarea>';
		str += '</div>';

		var title_str = '<div class="sns_title_UpBtn">';
		title_str += '<button type="button" class="classic_btn" onclick="snsUpdateProc(this)"><i class="xi-check-min"></i></button>';
		title_str += '</div>';

		$(list).find(".sns_content").append(str);
		$(list).find(".sns_title").append(title_str);

		$(".edioer_here").each(function(idx, el) {
			var id = $(el).attr('id');
			if (b_no == id) {
				CKEDITOR.replace(id);
				CKEDITOR.instances[b_no].setData(b_content);
			}
		})

	}

	function snsDeleteProc(delete_click) {
		var del_board_id = $(delete_click).closest('.list').data("no");
		var del_writer_id = $(delete_click).closest('.list').data("writer");
		
		if(u_type == '2' || u_type == '1') {
			if(login_chk != del_writer_id) {
				var result = confirm('다른 사용자가 게시한 글입니다. 삭제하시겠습니까?');
				if(!result) {
					return false;
				}				
			}
		}

		$.ajax({
			url : '/sns/snsDeleteProc.do',
			type : 'POST',
			contentType : 'application/json; charset=utf-8',
			data : JSON.stringify({
				'board_id' : del_board_id
			}),
			success : function(data) {
				// $(delete_click).closest('.list').css("display", "none");
				if(first_num == 1) {		
					$('.list_wrap').empty();
					load('delete');
				} else {
					$(delete_click).closest('.list').css("display", "none");
				}
			}
		})
	}

	function replyInsertForm(reply_click) {

		const list = $(reply_click).closest('div.list').find('div.reply_list');
		
		$(list).toggleClass('open');
		
		if($(list).hasClass('open')) {
			$(list).empty();
	
			var login_user_nm = $('input[name="u_ncnm"]').val();
			var r_board_id = $(reply_click).closest('.list').data('no');
	
			if (u_type != null && u_type != '') {
				var reply_str = '<div class="reply_insert_form">';
				reply_str += '<div class="reply_p"><div><p>' + login_user_nm
						+ '</p></div>';
				reply_str += '<div><button type="button" class="all_btn insert_btn" onclick="replyInsertProc(this)"><i class="xi-plus-min"></i></button></div>';
				reply_str += '</div>';
				reply_str += '<input type="text" id="replyInsert" maxlength="20" name="replyInsert" value="" />';
				reply_str += '</div>';
				reply_str += '</div>';
			} else {
				var reply_str = '<div class="reply_insert_form">';
				reply_str += '<div class="reply_p"><div><p>로그인한 이용자만 댓글 등록이 가능합니다.</p></div>';
				reply_str += '<div></div>';
				reply_str += '</div>';
				reply_str += '</div>';
				reply_str += '</div>';
			}
			
			$(list).append(reply_str);
	
			$.ajax({
				url : '/sns/snsReplyList.do',
				type : 'POST',
				data : {
					'r_board_id' : r_board_id
				},
				success : function(data) {
					replyList(reply_click, data);
				}
			})
		} else {
			$(list).empty();
		}

	}

	function replyInsertProc(reply_click) {

		var nullChk = AllnullChk(reply_click, 'replyInsert');

		var r_board_id = $(reply_click).closest('.list').data("no");
		var user_id = $('#user_id').val();
		var r_content = $(reply_click).closest('.list').find(
				'input[name=replyInsert]').val();

		if (nullChk) {
			$.ajax({
				url : '/sns/snsReplyInsertProc.do',
				type : 'POST',
				contentType : 'application/json; charset=utf-8',
				data : JSON.stringify({
					'r_board_id' : r_board_id,
					'r_user_id' : user_id,
					'r_content' : r_content
				}),
				success : function(data) {
					$(reply_click).closest('.list').find('input[name=replyInsert]').val('');
					replyNewList(reply_click, r_board_id, 'insert');
				}
			})
		}
	}

	function replyNewList(reply_click, r_board_id, type) {
		
		// 수정 후 바꾸기

		const list = $(reply_click).closest('.list').find('div.reply_list');
		const reply_list1 = $(reply_click).closest('.list').find(
				'div.heart_wrap .reply_cnt');
		const reply_data_update = $(reply_click).closest('.reply_insert_list');

		if (type == 'insert') {

			$.ajax({
						url : '/sns/snsReplyInsertList.do',
						type : 'POST',
						contentType : 'application/json; charset=utf-8',
						data : JSON.stringify({
							'r_board_id' : r_board_id
						}),
						success : function(data) {
							var str = '<div class="reply_insert_list" data-writer="' + data.r_user_id + '" data-replyno="' + data.reply_id + '" data-replycontent="' + data.r_content + '" data-replyregist="' + data.r_regist_dt + '">';
							str += '<div class="reply_list_p">';
							str += '<div style="width: 50%;">';
							str += '<p>' + data.r_writer + '</p>';
							str += '<p>' + data.r_regist_dt + '</p>';
							str += '</div>';
							str += '<div>'
							str += '<button type="button" class="all_btn" onclick="replyDeleteProc(this)"><i class="xi-minus-min"></i></button>';
							str += '<button type="button" class="all_btn" onclick="replyUpdateForm(this)"><i class="xi-wrench"></i></button>'
							str += '</div>';
							str += '</div>';
							str += '<p>' + data.r_content + '</p>'
							str += '</div>';

							$(reply_list1).empty();
							$(reply_list1).append('댓글(' + data.r_new_cnt + ')');
							$(list).append(str);
						}
					});

		} else if (type == 'update') {

			const reply_list = $(reply_click).closest('.reply_insert_list');
			var reply_id = $(reply_list).data('replyno');

			$.ajax({
						url : '/sns/snsReplyUpdateList.do',
						type : 'POST',
						contentType : 'application/json; charset=utf-8',
						data : JSON.stringify({
							'r_board_id' : r_board_id,
							'reply_id' : reply_id
						}),
						success : function(data) {

							$(reply_list).find('.reply_update_form').remove();
							
							$(reply_data_update).data('replycontent', data.r_content);
							$(reply_data_update).data('replyregist', data.r_regist_dt);

							var str = '<div class="reply_list_p">';
							str += '<div style="width: 70%;">';
							str += '<p>' + data.r_writer + '</p>';
							str += '<p>' + data.r_regist_dt + '</p>';
							str += '</div>';
							str += '<div><button type="button" class="all_btn" onclick="replyDeleteProc(this)"><i class="xi-minus-min"></i></button>';
							str += '<button type="button" class="all_btn" onclick="replyUpdateForm(this)"><i class="xi-wrench"></i></button></div>';
							str += '</div>';
							str += '<p>' + data.r_content + '</p>'

							$(reply_list).append(str);
						}
					})
		}

	}

	function replyList(reply_click, data) {

		const list = $(reply_click).closest('.list').find('div.reply_list');

		$.each(
						data,
						function(idx, value) {
							
							var str = '<div class="reply_insert_list" data-writer="' + value.r_user_id + '" data-replyNo="' + value.reply_id + '" data-replycontent="' + value.r_content + '" data-replyregist="' + value.r_regist_dt + '">';
							str += '<div class="reply_list_p"><div style="width: 50%;"><p>'
									+ value.r_writer + '</p>';
							str += '<p>' + value.r_regist_dt + '</p>';
							str += '</div>';
							str += '<div>'
							if (u_type == '2' || u_type == '1' || u_type == '0') {
								if (u_type == '0') {
									if (login_chk == value.r_user_id) {
										str += '<button type="button" class="all_btn" onclick="replyDeleteProc(this)"><i class="xi-minus-min"></i></button>';
										str += '<button type="button" class="all_btn" onclick="replyUpdateForm(this)"><i class="xi-wrench"></i></button>';
									}
								} else {
									str += '<button type="button" class="all_btn" onclick="replyDeleteProc(this)"><i class="xi-minus-min"></i></button>';
									str += '<button type="button" class="all_btn" onclick="replyUpdateForm(this)"><i class="xi-wrench"></i></button>';
								}
							}
							str += '</div>';
							str += '</div>';
							str += '<p>' + value.r_content + '</p>'
							str += '</div>';
							$(list).append(str);
						})
	}

	function replyUpdateForm(reply_click) {

		const reply_list = $(reply_click).closest('.reply_insert_list');
		var login_user_nm = $('input[name="u_ncnm"]').val();
		var replyContent = $(reply_list).data('replycontent');
		var reply_id = $(reply_list).data('replyno');
		var replyregist = $(reply_list).data('replyregist');

		$(reply_list).empty();

		var reply_str = '<div class="reply_update_form">';
		reply_str += '<div class="reply_p update_p"><div><p>' + login_user_nm
				+ '</p><p>' + replyregist + '</p></div>';
		reply_str += '<div><button type="button" class="all_btn insert_btn" onclick="replyUpdateProc(this)"><i class="xi-check-min"></i></button></div>';
		reply_str += '</div>';
		reply_str += '<input type="text" id="replyUpdate" maxlength="20" name="replyUpdate" value="' + replyContent + '" />';
		reply_str += '</div>';
		reply_str += '</div>';

		$(reply_list).append(reply_str);

	}

	function replyUpdateProc(reply_click) {

		var nullChk = AllnullChk(reply_click, 'replyUpdate');

		const reply_list = $(reply_click).closest('.reply_insert_list');
		var replyContent = $(reply_list).find('input[name=replyUpdate]').val();
		var reply_id = $(reply_list).data('replyno');
		var r_board_id = $(reply_click).closest('.list').data("no");

		if (nullChk) {
			$.ajax({
				url : '/sns/snsReplyUpdateProc.do',
				type : 'POST',
				contentType : 'application/json; charset=utf-8',
				data : JSON.stringify({
					'reply_id' : reply_id,
					'r_content' : replyContent
				}),
				success : function(data) {
					replyNewList(reply_click, r_board_id, 'update');
				}
			})
		}
	}

	function replyDeleteProc(reply_click) {
		
		var r_writer_id = $(reply_click).closest('.reply_insert_list').data("writer");
		
		console.log(login_chk, r_writer_id);
		
		if(u_type == '2' || u_type == '1') {
			if(login_chk != r_writer_id) {
				var result = confirm('다른 사용자가 등록한 댓글입니다. 삭제하시겠습니까?');
				if(!result) {
					return false;
				}				
			}
		}

		const reply_list = $(reply_click).closest('.reply_insert_list');
		const reply_list1 = $(reply_click).closest('.list').find('div.heart_wrap .reply_cnt');
		var reply_id = $(reply_list).data('replyno');
		var r_board_id = $(reply_click).closest('.list').data("no");

		$.ajax({
			url : '/sns/snsReplyDeleteProc.do',
			type : 'POST',
			contentType : 'application/json; charset=utf-8',
			data : JSON.stringify({
				'reply_id' : reply_id,
				'r_board_id' : r_board_id
			}),
			success : function(data) {
				console.log(data);
				$(reply_list).remove();
				$(reply_list1).empty();
				$(reply_list1).append('댓글(' + data + ')');
				replyList(r_board_id);
			}
		})
	}

	function heart(heart_click) {

		const heart_list = $(heart_click).closest('.list');
		var board_id = $(heart_click).closest('.list').data('no');
		var heartVal = $(heart_click).closest('.list').find('a.heart').attr('name');
		var h_del_yn;
		var str;

		if (heartVal > 0) {
			$(heart_list).find('span#heart').empty();
			$(heart_list).find('span#heart').append('<i class="xi-emoticon-neutral-o"></i>');
			$(heart_list).find('a.heart').prop('name', '0');
			$(heart_list).find('a.heart').removeClass('on');
			h_del_yn = 'Y';
		} else {
			$(heart_list).find('span#heart').empty();
			$(heart_list).find('span#heart').append('<i class="xi-emoticon-cool-o"></i>');
			$(heart_list).find('a.heart').prop('name', '1');
			$(heart_list).find('a.heart').addClass('on');
			h_del_yn = 'N';
		}

		$.ajax({
			url: '/sns/heart.do',
			type: 'POST',
			contentType : 'application/json; charset=utf-8',
			data: JSON.stringify({'heart' : heartVal, 'board_id' : board_id, 'b_writer_id' : login_chk, 'h_del_yn' : h_del_yn}),
			success: function(data) {
				
				if(data == null || data == '') {
					data = 0;
				}
				
				$(heart_list).find('span.heart_cnt').empty();
				$(heart_list).find('span.heart_cnt').append(data);
			}
		})

	}

</script>
</html>