<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${ pageContext.request.contextPath }/resources/css/layout.css">
<link rel="stylesheet"
	href="${ pageContext.request.contextPath }/resources/css/board.css">
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>

<!-- Bootstrap core CSS -->
<link
	href="${ pageContext.request.contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">

<script src="../../assets/js/ie-emulation-modes-warning.js"></script>
<script
	src="${ pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>

<!-- Custom styles for this template -->
<link href="/resources/css/carousel.css" rel="stylesheet">

<script>
	$(document).ready(function() {
		$('#delBtn').click(function() {
			if(confirm("${hospital.no}게시물을 삭제하시겠습니까?")) {
			// 동기식 삭제
			// location.href = "${ pageContext.request.contextPath }/board/remove/${board.no}"; 
			
			// 비동기 삭제
			$.ajax({
				type : "delete",
				url : "${ pageContext.request.contextPath }/board/${ hospital.no }",
				success : function(data) {
					let jsonData = JSON.parse(data);
					if(jsonData.flag) {
						location.href = "${ pageContext.request.contextPath }/hospitalboard";
					}
				}
			});
			}
		});
		
		$('#updateBtn').click(function() {
			if(confirm("${hospital.no}게시물을 수정하시겠습니까?")){
				location.href = "${ pageContext.request.contextPath }/board/update/${hospital.no}"; 
			}
			
		});
	});
</script>
</head>
<body>
	<header>
		<!-- action include 사용-->
		<jsp:include page="/WEB-INF/jsp/include/bytopMenu.jsp" />
	</header>
	<section>
		<div align="center">
			<br>
			<hr>
			<h2>병원게시판 상세</h2>
			<hr>
			<br>
			<table>
				<tr>
					<th width="25%">게시글번호</th>
					<td>${ hospital.no }</td>
				</tr>
				<tr>
					<th width="25%">제목</th>
					<td>${ hospital.title }</td>
				</tr>
				<tr>
					<th width="25%">카테고리</th>
					<td>${ hospital.ctg_no }</td>
				</tr>
				<tr>
					<th width="25%">내용</th>
					<td>${ hospital.content }</td>
				</tr>
				<tr>
					<th width="25%">회원아이디</th>
					<td>${ hospital.memberid }</td>
				</tr>
				<tr>
					<th width="25%">조회수</th>
					<td>${ hospital.viewcnt }</td>
				</tr>
				<tr>
					<th width="25%">등록일</th>
					<td>${ hospital.wrt_date }</td>
				</tr>
			</table>
			<br>
			<button id="updateBtn">수정</button>
			&nbsp;&nbsp;&nbsp;
			<button id="delBtn">삭제</button>
			&nbsp;&nbsp;&nbsp;
		</div>
	</section>
	<footer>
		<jsp:include page="/WEB-INF/jsp/include/byfooter.jsp" />
	</footer>
</body>
</html>