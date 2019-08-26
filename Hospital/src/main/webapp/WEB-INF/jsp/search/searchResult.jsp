<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="kr.co.byby.controller.Search"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="i" uri="tld/searchHospitalInfo.tld"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
<link rel="stylesheet"
	href="${ pageContext.request.contextPath}/resources/css/layout.css">
<!-- Bootstrap core CSS -->
<link
	href="${ pageContext.request.contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">

<script src="../../assets/js/ie-emulation-modes-warning.js"></script>
<script
	src="${ pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>

<link href="/resources/css/carousel.css" rel="stylesheet">
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
	$(document).ready(function() {
		$(".selected_td").click(function() {
			var td_val = $(this).text();
			console.log(td_val);
			document.getElementById("addr").value = td_val;
			document.searchResultForm.submit();
			console.log(document.getElementById("addr").value);
		});
	});
</script>
<style>
body {
	font-family: 'Noto Sans KR', sans-serif;
}

table {
	width: 60%;
}

table, th, td {
	/* border: 1px solid #f8e2e4; */
	border-collapse: collapse;
	/* font-family:  'Noto Sans KR',sans-serif;
 */ /* color: #555; */
	align-content: center;
}

table {
	width: 100%;
	align-content: center;
}

th, td {
	padding: 5px;
	align-content: center;
}

table th {
	background-color: rgba(229, 203, 149, 0.5);
	text-align: center;
	color: #000000;
}

div#hplist {
	width: 90.2%;
	margin: 0 auto;
	margin-left: 6.3%;
}

td.locactn {
	text-align: center;
}

div#pageNum {
	margin-top: 3%;
	padding-left: 6%;
}

li#ctg {
	width: 14%;
}

li#total {
	/* padding-left: 4%; */
	width: 14%;
}
/* table, th, td {
	background-color: #ffffff;
	margin: auto;
	text-align: center;
	border: 2px solid green;
} */
</style>
</head>
<body>
	<header> <jsp:include
		page="/WEB-INF/jsp/include/bytopMenu.jsp" /> </header>

	<section>
	<form method="post" name="searchResultForm" id="form"
		class="form-inline"
		action="${ pageContext.request.contextPath }/mapResult">
		<div align="center" id="hplist">

			<br>

			<h2>병원 검색 결과</h2>
			<hr>
			<%
            //request.setCharacterEncoding("euc-kr");
            String Q0 = request.getParameter("Q0");
            String Q1 = request.getParameter("Q1");
            String QD = request.getParameter("QD");
            String dong = request.getParameter("dong");
            String doro = request.getParameter("doro");

            Search s = new Search(Q0, Q1, QD);
            s.requestHospitalInfo();
            
            
            int n = s.cnt();
            
            %>
			<table id="list" class="table">
				<%
            if (n==0) {
               %>
				<!--                <h2>해당 지역의 병원 검색결과가 없습니다.</h2> -->
				<%
            }else {
               %>
				<tr>
					<th>no</th>
					<th>이름</th>
					<th>주소</th>
					<th>전화번호</th>
				</tr>
				<% 
		    int cnt=0;
         	for (int i = 0; i < n; i++) {
            	if (s.getItem(i).contains(dong)) {
          	  		cnt++;
               %>
				<tr>
					<% 
               String str = s.getItem(i);
               String words[] = str.split("/");
            %>
					<%--                   <h5><%=s.getItem(i)%></h5> --%>
					<td><%= cnt %></td>
					<td><%=words[0]%></td>
					<td class="selected_td"><%=words[1]%>&emsp;<input
						type="button" value="지도" id="map" name="map"></td>
					<td><%=words[2]%></td>
				</tr>
				<%
            }
         }
            }
         %>
			</table>
			<br> <br>
		</div>
		<input type="hidden" name="addr" id="addr" value="">
	</form>

	</section>
	<footer> <jsp:include page="/WEB-INF/jsp/include/byfooter.jsp" />
	</footer>

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