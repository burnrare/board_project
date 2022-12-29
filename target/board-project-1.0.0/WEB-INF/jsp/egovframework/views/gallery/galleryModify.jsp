<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
<title>퓨전 게시판(수정)</title>
<style>
.pt-5 {
	paddint-top: 0 !important;
}

.mt-5 {
	margin-top: 0 !important;
}

.span>a>span {
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
</head>
<body>
	<main class="mt-5 pt-5">
		<div class="container-fluid px-4">
			<p class="mt-4">게시글 수정</p>
			<div class="card mb-4">
				<div class="card-body">
					<form method="post" action="/gallery/galleryPostUp.do" id="modifyForm" name="form" enctype="multipart/form-data">
						<input type="hidden" name="board_id" value="${gPost.board_id}" />
						<div class="mb-3">
							<label for="b_title" class="form-label">제목</label> <input
								type="text" class="form-control" id="b_title" name="b_title"
								value="${gPost.b_title}">
						</div>
						<div class="mb-3">
							<c:forEach items="${imgList}" var="img">
								<c:if test="${img.f_del_yn = 'N'}">
								<img src="/fileUpload/${img.f_uuid}" />
								</c:if>
							</c:forEach>
						</div>
						<div class="mb-3">
							<label for="b_content" class="form-label">내용</label>
							<textarea class="form-control" id="b_content"
								style="resize: none;" name="b_content">${gPost.b_content}</textarea>
						</div>
						<div class="mb-3">
							<button id="btn-upload" type="button" style="border: 1px solid #ddd; outline: none;">파일 추가</button>
							
							<input id="input_file" type="file" name="input_file" style="display: none;" multiple> 
							
							<span style="font-size: 10px; color: gray;">※첨부파일은 최대 5개까지 등록이 가능합니다.</span>
							<div class="data_file_txt" id="data_file_txt" style="margin-top: 40px;">
								<span>첨부 파일</span>
								<div id="articlefileChange">
									<c:forEach items="${imgList}" var="img" varStatus="stat">
										<c:if test="${img.f_del_yn eq 'N'}">
											<div id="file${img.f_num}" onclick="fileDelete('file${img.f_num}')">
												<font style="font-size: 12px">${img.f_name}</font>
												<img src="/img/icon_minus.png" style="width:20px; heifht: auto; vertical-align: middle; cursor: pointer;" />
											</div>
										</c:if>
									</c:forEach>
								</div>
							</div>
							<div class="form-group">
								<input type="hidden" value="" name="tag_name" class="tag_name" id="tag_name" />
							</div>

							<ul id="tag-list">
								<c:forEach items="${tagList}" var="tag" varStatus="stat">
									<input type="hidden" name="tag_id2" value="${tag.tag_id}" />
									<li class="tag-item">${tag.tag_name}<span class="del-btn"
										idx="${tag.tag_id}">x</span>
									</li>
								</c:forEach>
							</ul>

							<div class="form-group">
								<input type="text" id="tag" size="7"
									placeholder="엔터로 해시태그를 등록해주세요." style="width: 300px;" />
							</div> 
						</div>
						<a href="/gallery/galleryPost.do?board_id=${gPost.board_id}"
							class="btn btn-outline-secondary">뒤로 가기</a>
						<button class="btn btn-outline-warning">수정하기</button>
					</form>
				</div>
			</div>
		</div>
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
$(document).ready(function(e) {
	$("#input_file").on("change", fileCheck);
});

$(function () {
    $('#btn-upload').click(function (e) {
        e.preventDefault();
        $('#input_file').click();
    });
    
    var tag = {};
    var counter = 0;
    
    function addTag(value) {
    	if(counter > 4) {
    		alert("태그는 다섯 개까지만 등록 가능합니다.");
    		return false;
    	} else {
   		tag[counter] = value;
    	counter++;
    	}
    }
    
    function marginTag () {
        return Object.values(tag).filter(function (word) {
            return word !== "";
        });
    }
    
    $("#modifyForm").on("submit", function (e) {
    	console.log($(".tag_name").val(value));
        var value = marginTag(); // return array
        console.log(value);
        $(".tag_name").val(value); 
    });
    
    $("#tag").on("keypress", function (e) {
        var self = $(this);

        //엔터나 스페이스바 눌렀을때 실행
        if (e.key === "Enter" || e.keyCode == 32) {

            var tagValue = self.val(); // 값 가져오기

            // 해시태그 값 없으면 실행X
            if (tagValue !== "") {

                // 같은 태그가 있는지 검사한다. 있다면 해당값이 array 로 return 된다.
                var result = Object.values(tag).filter(function (word) {
                    return word === tagValue;
                })
            
                // 해시태그가 중복되었는지 확인
                if (result.length == 0) { 
                    $("#tag-list").append("<li class='tag-item'>"+tagValue+"<span class='del-btn' idx='"+counter+"'>x</span></li>");
                    addTag(tagValue);
                    self.val("");
                } else {
                    alert("태그값이 중복됩니다.");
                }
            }
            e.preventDefault(); // SpaceBar 시 빈공간이 생기지 않도록 방지
        }
    });

	    // 삭제 버튼 
	    // 인덱스 검사 후 삭제
	    $(document).on("click", ".del-btn", function (e) {
	        var index = $(this).attr("idx");
	        tag[index] = "";
	        $(this).parent().remove();
	        
	        var tag_id = index;
	        console.log(tag_id)
	        var sendData = {'tag_id' : tag_id};
	        
	        $.ajax({
	        	url: '/tagDelete.do',
	        	type: 'POST',
	        	contentType : 'application/json; charset=utf-8',
	        	data: JSON.stringify(sendData),
	        	success: function(data) {
	        		console.log("태그 삭제 성공");
	        	}
	        }) 
	    });

});

// 파일 현재 필드 숫자 totalCount랑 비교값
var fileCount = 0;
// 해당 숫자를 수정하여 전체 업로드 갯수를 정한다.
var totalCount = 5;
// 파일 고유넘버
var fileNum = 0;
// 첨부파일 배열
var content_files = new Array();


var regex = new RegExp("(.*?)\.(exe|sh|zip|alz|hwp|pdf)$");
var maxSize = 1024 * 1024 * 5; // 5MB

function checkExtension(fileName, fileSize) {
	if(regex.test(fileName)){
		alert("해당 종류의 파일은 업로드할 수 없습니다.");
		return false;
	}
	if(fileSize >= maxSize){
		alert("파일 사이즈 초과");
		return false;
	} 
	return true;
}

function fileCheck(e) {
    var files = e.target.files;
    // 파일 배열 담기
    var filesArr = Array.prototype.slice.call(files);
    
    // 파일 개수 확인 및 제한
    if (fileCount + filesArr.length > totalCount) {
      	alert('파일은 최대 '+totalCount+'개까지 업로드 할 수 있습니다.');
      return;
    } else {
    	 fileCount = fileCount + filesArr.length;
    }
    
    // 각각의 파일 배열담기 및 기타
    filesArr.forEach(function (f) {
      var reader = new FileReader();
	  var inputFile = $("input[name='input_file']");
	  var files = inputFile[0].files;
	  
		for(var i = 0; i < files.length; i++) {
			if(!checkExtension(files[i].name, files[i].size)) {
				return false;
			} else {
	      reader.onload = function (e) {
	        content_files.push(f);
	        $('#articlefileChange').append(
	       		'<div id="file' + fileNum + '" onclick="fileDelete(\'file' + fileNum + '\')">'
	       		+ '<font style="font-size:12px">' + f.name + '</font>'  
	       		+ '<img src="/img/icon_minus.png" style="width:20px; height:auto; vertical-align: middle; cursor: pointer;"/>' 
	       		+ '</div>'
			);
	        fileNum ++;
	      };
			};
		};
      reader.readAsDataURL(f);
    });
    console.log(content_files);
  }

// 파일 부분 삭제 함수
function fileDelete(fileNum){
    var no = fileNum.replace(/[^0-9]/g, "");
	$('#' + fileNum).remove();
	fileCount --;
    console.log(content_files);

    var f_num = no;
    console.log(f_num);
    var sendData = {'f_num' : f_num};
	    $.ajax({
    	url: '/fileDelete.do',
    	type: 'POST',
    	contentType : 'application/json; charset=utf-8',
    	data: JSON.stringify(sendData),
    	success: function(data) {
    		console.log("파일 삭제 성공");
    	}
    }) 
}
</script>
</html>