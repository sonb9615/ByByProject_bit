<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
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
<script>
	$(document).ready(function() {
		$('#checkbtn').on('click', function() {
			$.ajax({
				type: 'POST',
				url: '/checkSignUp',
				data: {
					"memberid": $('#memberid').val()
				},
				success: function(data) {
					if($.trim(data) == 0) {
						$('#checkMsg').html('<p style="color:blue">사용가능</p>');
					}
					else{
						$('#checkMsg').html('<p style="color:red">사용불가능</p>');
					}
				}
			});
		});
	});
</script>
<style>
 .error { 
 	color: red; 
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
		<h2>회원가입 폼</h2>
		<hr>
		<br>
		
		<form:form method="post" commandName="memberVO">
			<table>
				<tr>
					<th width="23%">ID *</th>
					<td>
						<form:input path="memberid" id="memberid"/>
						<form:errors path="memberid" class="error"/>
						<div id="checkMsg"></div>
						
						<button type="button" id="checkbtn" class="btn btn-default">중복확인</button>
					</td>
				</tr>
				<tr>
					<th width="23%">이름 *</th>
					<td>
						<form:input path="name" />
						<form:errors path="name" class="error"/>
					</td>
				</tr>
				<tr>
					<th width="23%">Password *</th>
					<td>
						<form:input path="password" />
						<form:errors path="password" class="error"/>
					</td>
				</tr>
				
				<tr>
					<th width="23%">Email</th>
					<td>
						<form:input path="emailId" />
						@
						<form:input path="emailDomain" />
<%-- 						<form:errors path="emailId" class="error"/> --%>
					</td>
				</tr>
				<tr>
					<th width="23%">Tel</th>
					<td>
						<form:input path="tel1" /> -
						<form:input path="tel2" /> -
						<form:input path="tel3" />
<%-- 						<form:errors path="tel1" class="error"/> --%>
					</td>
				</tr>
				
			</table>
			<br>
			<button type="submit">가입</button>
		</form:form>
		
		
		</form>
	</div>
	</section>
	<footer>
		<jsp:include page="/WEB-INF/jsp/include/byfooter.jsp" />
	</footer>
	
</body>
</html>