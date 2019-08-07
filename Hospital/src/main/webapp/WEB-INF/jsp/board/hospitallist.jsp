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

function doAction(boardNo) {
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
			<br>
			<table id="list">
				<tr>
					<th>게시글번호</th>
					<th>제목</th>
					<th>카테고리</th>
					<th>내용</th>
					<th>조회수</th>
					<th>작성일</th>
					<th>회원ID</th>
				</tr>
				<c:forEach items="${ hospitalboardList }" var="hospital">
					<tr>
						<td>${ hospital.no }</td>
						<td>
						<a href="#" onclick="doAction(${ hospital.no })" id="showdetail">
						${ hospital.title }
						</a>
						</td>
						<td>${ hospital.ctg_no }</td>
						<td>${ hospital.content }</td>
						<td>${ hospital.viewcnt }</td>
						<td>${ hospital.wrt_date }</td>
						<td>${ hospital.memberid }</td>
					</tr>
				</c:forEach>
			</table>
			<br>
			<button id="writeBtn" >새글등록</button>
		</div>
	</section>
	<footer>
		<jsp:include page="/WEB-INF/jsp/include/byfooter.jsp" />
	</footer>
</body>
</html>