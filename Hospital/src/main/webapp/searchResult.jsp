<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.co.byby.controller.Search" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="i" uri="tld/searchHospitalInfo.tld" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../favicon.ico">

<title>삐용삐용</title>

<!-- Bootstrap core CSS -->
<link href="${ pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">

<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
<script src="../../assets/js/ie-emulation-modes-warning.js"></script>
<script src="${ pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

<!-- Custom styles for this template -->
<link href="/resources/css/carousel.css" rel="stylesheet">
<style>
table {
	width: 60%;
}

table, th, td {
	background-color: #ffffff;
	margin: auto;
	text-align: center;
	border: 2px solid green;
}

</style>
</head>
<body>
	<div>
		<jsp:include page="/WEB-INF/jsp/include/bytopMenu.jsp" />
	</div>
	<!-- Carousel
    ================================================== -->
	<!-- 	<div id="myCarousel" class="carousel slide" data-ride="carousel"> -->
	<!-- 		<div class="carousel-inner" role="listbox"> -->
	<!-- 			<div class="item active"> -->
	<div align="center" class=table>

		<c:set value="${ param.Q0 }" var="Q0" />
		<c:set value="${ param.Q1 }" var="Q1" />
		<c:set value="${ param.QD }" var="QD" />


		<%-- 		<c:forEach var="i" begin="0" end="100" step="1"> --%>
		<%-- 			${i:requestHospitalInfo(Q0, Q1, QD, i, 0)} --%>
		<%-- 		</c:forEach> --%>


		<%-- 		<c:set var = "name" value = "${value}" /> --%>

		<%-- 		<c:if test = "${fn : contains(value, '포함된문자열')}">내용</c:if> --%>




		<br> <br> <br> <br> <br> <br>
		<table>
			<tr>
				<th>이름</th>
				<th>주소</th>
				<th>전화번호</th>
			</tr>
			<c:forEach var="i" begin="0" end="50" step="1">
				<tr>
					<c:set value='${i:requestHospitalInfo(Q0, Q1, QD, i, 1)}'
						var='addr' />
					<c:set value="${ param.dong }" var="dong" />
					<c:if test="${fn : contains(addr, dong)}">
						<td><c:out value='${i:requestHospitalInfo(Q0, Q1, QD, i, 0)}' /></td>
						<td><c:out value='${i:requestHospitalInfo(Q0, Q1, QD, i, 1)}' /></td>
						<td><c:out value='${i:requestHospitalInfo(Q0, Q1, QD, i, 2)}' /></td>
					</c:if>
				</tr>

			</c:forEach>
		</table>
	</div>
	<!-- 			</div> -->
	<!-- 		</div> -->
	<!-- 	</div> -->
	<!-- /.carousel -->


	<!-- FOOTER -->
	<jsp:include page="/WEB-INF/jsp/include/byfooter.jsp" />


	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script
		src="${ pageContext.request.contextPath}/resources/css/bootstrap.min.css"></script>
	<!-- Just to make our placeholder images work. Don't actually copy the next line! -->
	<script
		src="${ pageContext.request.contextPath}/resources/js/holder.js"></script>
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
</body>

</html>