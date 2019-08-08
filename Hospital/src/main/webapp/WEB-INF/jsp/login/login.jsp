<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../favicon.ico">
<title>회원가입</title>
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

<%-- <script src="${ pageContext.request.contextPath }/resources/js/checkForm.js"></script> --%>
<script>

	if("${ param.msg }") 
		alert("${ param.msg }");
	
	
	// isNull은 resources/js/checkForm.js 에서 가져옴
	function checkForm() {
		var form = document.inputForm;
		
		if(isNull(form.memberid, "아이디를 입력하세요"))
			return false;
		
		if(isNull(form.password, "패스워드를 입력하세요"))
			return false;
		
		/* if(!form.id.value) {	//비어있으면
			alert('아이디는 필수항목입니다');
			form.id.focus();		//비어있으면 자동으로 제목칸으로 커서의 포커스가 이동
			return false;
		} 
		
		if(!form.password.value) {	//비어있으면
			alert('패스워드는 필수항목입니다');
			form.password.focus();	//비어있으면 자동으로 작성자 칸으로 커서의 포커스가 이동
			return false;
		} */
		
		return true;
	}
</script>
</head>
<body>
	<header>
		<jsp:include page="/WEB-INF/jsp/include/bytopMenu.jsp" />
	</header>
	<section>
		
		<div align="center">
		<!-- action 안하면 get방식으로 받아온 url에서 post 방식으로만 자동으로 적용 -->
		<form method="post" action="${ pageContext.request.contextPath }/login" name="inputForm" onsubmit="return checkForm()">
			<table id="login" style="width: 40%;">
				<tr>
					<th>아이디</th>
					<td>
						<input type="text" name="memberid" />
					</td>
				</tr>
				<tr>
					<th>패스워드</th>
					<td>
						<input type="text" name="password" />
					</td>

			</table>
			<br>
			<button type="submit">로그인</button>
		</form>
		</div>
		
	</section>
	<footer>
		<!-- 지시자 include 방식 -->
		<jsp:include page="/WEB-INF/jsp/include/byfooter.jsp" />
	</footer>
</body>
</html>