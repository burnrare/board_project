<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<title>Insert title here</title>
<style>
* {
	text-align: center;
}
    table, th, td { padding: 10px; }
    table { border-collapse: collapse; width: 80%; margin: auto;}
    th { text-align: center; }
    td { text-align: center; }
    thead {background: #439A97;}
    tbody:first-child {
    	border-right: 1px solid #ddd;
    }
    .table_head {
   	   width: 80%; margin: 25px auto; border: 1px solid #ddd; padding: 10px;
    }
</style>
</head>
<body>
	<div class="accordion-wrap">
		<ul>
			<li class="table_head">
				<p>년도별</p>
			</li>
			<li class="table">
				<table class="year">
					<colgroup>
						<col width="25%" />
						<col width="25%" />
						<col width="25%" />
						<col width="25%" />
					</colgroup>
					<thead>
						<tr>
							<th>메뉴명</th>
							<th>2020</th>
							<th>2021</th>
							<th>2022</th>
						</tr>
					</thead>
					<tbody class="year-tbody">
					</tbody>
				</table>
			</li>
			<li class="table_head">
				<p>월별</p>
			</li>
			<li class="table">
				<table class="month">
					<thead>
						<tr>
							<th style="width: 10%">메뉴명</th>
							<th>01월</th>
							<th>02월</th>
							<th>03월</th>
							<th>04월</th>
							<th>05월</th>
							<th>06월</th>
							<th>07월</th>
							<th>08월</th>
							<th>09월</th>
							<th>10월</th>
							<th>11월</th>
							<th>12월</th>
						</tr>
					</thead>
					<tbody class="month-tbody">
					</tbody>
				</table>
			</li>
			<li class="table_head">
				<p>일별</p>
			</li>
			<li class="table">
				<table class="day">
					<thead>
						<tr>
							<th style="width: 10%">메뉴명</th>
							<th>01일</th>
							<th>02일</th>
							<th>03일</th>
							<th>04일</th>
							<th>05일</th>
							<th>06일</th>
							<th>07일</th>
							<th>08일</th>
							<th>09일</th>
							<th>10일</th>
							<th>11일</th>
							<th>12일</th>
							<th>13일</th>
							<th>14일</th>
							<th>15일</th>
							<th>16일</th>
							<th>17일</th>
							<th>18일</th>
							<th>19일</th>
							<th>20일</th>
							<th>21일</th>
							<th>22일</th>
							<th>23일</th>
							<th>24일</th>
							<th>25일</th>
							<th>26일</th>
							<th>27일</th>
							<th>28일</th>
							<th>29일</th>
							<th>30일</th>
							<th>31일</th>
						</tr>
					</thead>
					<tbody class="day-tbody">
					</tbody>
				</table>
			</li>
			<li class="table_head">
				<p>시간별</p>
			</li>
			<li class="table">
				<table class="time">
					<thead>
						<tr>
							<th style="width: 10%">메뉴명</th>
							<th>00시</th>
							<th>01시</th>
							<th>02시</th>
							<th>03시</th>
							<th>04시</th>
							<th>05시</th>
							<th>06시</th>
							<th>07시</th>
							<th>08시</th>
							<th>09시</th>
							<th>10시</th>
							<th>11시</th>
							<th>12시</th>
							<th>13시</th>
							<th>14시</th>
							<th>15시</th>
							<th>16시</th>
							<th>17시</th>
							<th>18시</th>
							<th>19시</th>
							<th>20시</th>
							<th>21시</th>
							<th>22시</th>
							<th>23시</th>
						</tr>
					</thead>
					<tbody class="time-tbody">
					</tbody>
				</table>
			</li>
		</ul>
	</div>
</body>
<script src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$.ajax({
			url: '/admin/menuLog.do',
			type: 'POST',
			success: function(data) {
				
				var object = {};
				
				$.each(data[0], function(idx, value) {
					var str = '<tr>';
					str += '<td class="m_nm">' + value.m_nm + '</td>'
					str += '<td>' + value.year_1 + '</td>';
					str += '<td>' + value.year_2 + '</td>';
					str += '<td>' + value.year_3 + '</td>';
					str += '</tr>';
					$('.year-tbody').append(str);
				})
				$.each(data[1], function(idx, value) {
					var str = '<tr>';
					str += '<td class="m_nm">' + value.m_nm + '</td>';
						for(var i = 1; i <= 12; i++) {
							str += '<td>' + value["lo_" + i] + '</td>';
						}
					str += '</tr>';
					$('.month-tbody').append(str);
				})
				$.each(data[2], function(idx, value) {
					var str = '<tr>';
					str += '<td class="m_nm">' + value.m_nm + '</td>'
						for(var i = 1; i <= 31; i++) {					
							str += '<td>' + value["lo_" + i] + '</td>';
						}
					str += '</tr>';
					$('.day-tbody').append(str);
				})
				$.each(data[3], function(idx, value) {
					var str = '<tr>';
					str += '<td class="m_nm">' + value.m_nm + '</td>'
						for(var i = 0; i <= 23; i++) {					
							str += '<td>' + value["lo_" + i] + '</td>';
						}
					str += '</tr>';
					$('.time-tbody').append(str);
				})
			}
		}); // ajax 끝
		
		$("li.table").hide();
		
		var target = $(".accordion-wrap ul li.table_head");
		
		$(target).click(function() {
			$(this).next().slideToggle().siblings("li.table").slideUp();
		})
		
	});
	
</script>
</html>