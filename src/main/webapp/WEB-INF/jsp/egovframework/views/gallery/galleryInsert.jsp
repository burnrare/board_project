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

<title>퓨전 게시판(작성)</title>
</head>
<style>
.pt-5 {
	paddint-top: 0 !important;
}

.mt-5 {
	margin-top: 0 !important;
}
.tag-item {
    border: 1px solid #ddd;
    border-radius: 5px;
    padding: 8px;
    font-size: 12px;
    background: #59C1BD;
    color: #fff;
    width: fit-content;
    }
.del-btn {
	margin-left: 8px;
}
</style>
<body>
	<main class="mt-5 pt-5">
		<div class="container-fluid px-4">
			<p class="mt-4">게시글 작성</p>
			<div class="card mb-4">
				<div class="card-body">
					<form method="post" action="/gallery/galleryInsertProc.do"
						name="form" id="insertForm" enctype="multipart/form-data">
						<input type="hidden" id="b_writer_id" name="b_writer_id"
							value="${login.user_id}" />
						<input type="hidden" id="m_seq" name="m_seq" value="${m_seq}" />
						<c:if test="${login.u_type eq '1'}">
							<div class="mb-3">
								<select id="ty_id" name="ty_id" class="form-control">
									<c:forEach items="${typeList}" var="type">
										<option value="${type.ty_id}">${type.tynm}</option>
									</c:forEach>
								</select>
							</div>
						</c:if>
						<div class="mb-3">
							<label for="b_title" class="form-label">제목</label> <input
								type="text" class="form-control" id="b_title" name="b_title"
								value="" required>
						</div>
						<div class="mb-3">
							<label for="b_content" class="form-label">내용</label>
							<textarea class="form-control" id="b_content"
								style="resize: none;" rows="20" cols="50" name="b_content" required></textarea>
						</div>
						
			            <div class="mb-3">
					  	<button id="btn-upload" type="button" style="border: 1px solid #ddd; outline: none;">파일 추가</button>
					  		
					  		<input id="input_file" multiple type="file" name="input_file" style="display: none;">
					  		<span style="font-size:10px; color: gray;">※첨부파일은 최대 5개까지 등록이 가능합니다.</span>
					  		
						  	<div class="data_file_txt" id="data_file_txt" style="margin-top:40px;">
								<span>첨부 파일</span>
								<div id="articlefileChange">
								</div>
							</div>
						</div>
			            <div class="mb-3">
			                <input type="hidden" value="" name="tag_name" id="tag_name" />
			             </div>           
			             <div class="form-group">
			            	<input type="text" id="tag" size="7" placeholder="엔터로 해시태그를 등록해주세요." style="width: 300px;"/>
			             </div>
			        
			              <ul id="tag-list"></ul>
						<button class="btn btn-outline-warning" type="submit">등록하기</button>
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
    		return;
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
    
    $("#insertForm").on("submit", function (e) {
        var value = marginTag(); // return array
        $("#tag_name").val(value); 

        $(this).submit();
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


var regex = new RegExp("(.*?)\.(exe|sh|alz|hwp|pdf)$");
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
    content_files[no].is_delete = true;
	$('#' + fileNum).remove();
	fileCount --;
    console.log(content_files);
}
</script>
</html>