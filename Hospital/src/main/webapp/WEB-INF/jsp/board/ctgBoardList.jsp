<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../favicon.ico">
<title>병원게시판</title>
<link rel="stylesheet"
	href="${ pageContext.request.contextPath}/resources/css/layout.css">
<link rel="stylesheet"
	href="${ pageContext.request.contextPath}/resources/css/board.css">

<!-- Bootstrap core CSS -->
<link
	href="${ pageContext.request.contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">

<script src="../../assets/js/ie-emulation-modes-warning.js"></script>
<script
	src="${ pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>

<!-- Custom styles for this template -->
<link href="/resources/css/carousel.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
$(document).ready(function name() {
	$('#writeBtn').click(function name() {
		location.href = "${ pageContext.request.contextPath }/board/hospitalwrite2"
	});
});

// 카테고리
$(document).ready(function() {
	$.ajax({
		type: 'GET',
		url: "/categoryData",
		success: function(result) {
			console.log(result);
			var myObj = JSON.parse(result);
			for (var i = 0; i < myObj.length; i++) {
				var item = myObj[i];
				$("#divCtg").append("<li><a href=/category/" + item.ctg_name + " onclick='doAction2(${ hospital.ctg_name })'>" + item.ctg_name + "</a></li>");
			}
		},
		error:function(request, status, error) {
			alert("ERROR: " + request + " " + status + " " + error);
		}
	});
});

function doAction2(boardNo) {
/* 	<c:if test="${ empty loginVo}">
		if(confirm('로그인 후 사용할 수 있습니다\n로그인하시겠습니까?')) 
			location.href = "${ pageContext.request.contextPath }/login";
			
	</c:if> */
	
/* 	<c:if test="${ not empty loginVo}">
		
	</c:if> */
	
	location.href = "${ pageContext.request.contextPath}/board/" + boardNo;
}

</script>
<style type="text/css">
#showdetail{
	color: #e9afbc;
}

.board-tab li {
    float: none;
    display: inline-block;
    position: relative;
    padding: 16px 0;
    text-align: center;
    box-sizing: border-box;
    width: 8.3759388%;
    margin: 0 0 0 -4px;
    color: #000000;
}

.board-tab li {
    float: left;
    position: relative;
    padding: 20px 1.7%;
    text-align: center;
    box-sizing: border-box;
    color: #000000;
}


ul {
    display: block;
    list-style-type: disc;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    padding-inline-start: 40px;
}

.board-tab li:before {
    content: "";
    display: block;
    clear: both;
    position: absolute;
    width: 1px;
    height: 10px;
    background-color: #cdcdcd;
    top: 26px;
    left: 0;
}

</style>
</head>
<body>
	<header>
		<jsp:include page="/WEB-INF/jsp/include/bytopMenu.jsp" />
	</header>
	<section>
		<div align="center">
			<br> 
			<hr>
			<h2>병원게시판</h2>
			<hr>

		<div class='board-tab-outer'><ul class='board-tab  w6-2 tabCategory'>
		<div id="divCtg"></div>
		<li><a href="${pageContext.request.contextPath}/hospitalboard" id="end">전체</a></li>
		</ul></div>
			<br>
			<table id="list">
				<tr>
					<th>카테고리</th>
					<th>제목</th>
					<th>조회수</th>
					<th>작성일</th>
					<th>회원ID</th>
				</tr>
				<c:forEach items="${ ctgBoard }" var="hospital">
					<tr>
<%-- 						<td>${ hospital.no }</td>  --%>
						<td>${ hospital.ctg_name }</td>
						<td>
						<a href="#" onclick="doAction2(${ hospital.no })" id="showdetail">
						${ hospital.title }
						</a>
						</td>
						<td>${ hospital.viewcnt }</td>
						<td>${ hospital.wrt_date }</td>
						<td>${ hospital.memberid }</td>
					</tr>
				</c:forEach>
			</table>
			<br>
			<button id="writeBtn" >새글등록</button>
		</div>
		<div>
			<ul class="btn-group pagination">
				<c:if test="${pageMaker.prev }">
					<li>
						<a href="hospitalboard?${pageMaker.makeQuery(pageMaker.startPage - 1) }"><i class="fa fa-chevron-left"></i>이전</a>
					</li>
				</c:if>
				<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
					<li>
						<a href="hospitalboard${pageMaker.makeQuery(idx) }"><i class="fa">${idx }</i></a>
					</li>
				</c:forEach>
				<c:if test="${pageMaker.next && pageMaker.endPage>0 }">
					<li>
						<a href="hospitalboard${pageMaker.makeQuery(pageMaker.endPage+1) }"><i class="fa fa-chevron-right"></i>다음</a>
					</li>
				</c:if>
			</ul>
		</div>
	</section>
	<footer>
		<jsp:include page="/WEB-INF/jsp/include/byfooter.jsp" />
	</footer>
</body>
</html>