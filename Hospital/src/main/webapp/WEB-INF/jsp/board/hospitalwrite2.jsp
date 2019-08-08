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
	function checkForm() {
		var form = document.inputForm;

		//inputForm의 title tag가 비어있으면, 등록버튼을 누르는 순간 안 넘어감.
		if (!form.title.value) {
			alert('제목은 필수항목입니다.');
			//autofocus를 사용하여 커서가 그곳을 향하게 만들 수 있음.
			form.title.focus();
			return false;
		}
		/* 		if (!form.writer.value) {
		 alert('작성자는 필수항목입니다.');
		 form.writer.focus();
		 return false;
		 } */
		if (!form.content.value) {
			alert('내용은 필수항목입니다.');
			form.content.focus();
			return false;
		}
		return true;
	}
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
			<h2>게시판 등록폼</h2>
			<hr>
			<br>

			<!-- form 태그는 기본적으로 post방식임, onsubmit은 submit버튼을 눌렀을 때 수행함. return true일 시 넘어가고, false 일 시 안넘어감.  -->
			<form method="post"
				action="${ pageContext.request.contextPath }/board/hospitalwrite2"
				name="inputForm" onsubmit="return checkForm()">
				<%-- <input type="hidden" name="writer" value="${ loginVo.id }"> --%>
				<table>
					<tr>
						<th width="23%">제목</th>
						<td><input type="text" name="title" size="80"
							autofocus="autofocus"></td>
					</tr>
					<tr>
						<th width="23%">카테고리</th>
						<td><input type="text" name="ctg_no" size="80"> <%-- ${ loginVo.id } --%>
						</td>
					</tr>
					<tr>
						<th width="23%">내용</th>
						<td><textarea rows="5" cols="80" name="content"></textarea></td>
					</tr>
					<tr>
						<th width="23%">회원아이디</th>
						<td><textarea rows="5" cols="80" name="memberid"></textarea></td>
					</tr>
				</table>
				<br>
				<button type="submit">등록</button>
			</form>
		</div>
	</section>
	<footer>
		<jsp:include page="/WEB-INF/jsp/include/byfooter.jsp" />
	</footer>
</body>
</html>