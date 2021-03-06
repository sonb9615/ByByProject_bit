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
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Noto+Sans+KR&display=swap" rel="stylesheet">

<script src="../../assets/js/ie-emulation-modes-warning.js"></script>
<script
	src="${ pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>

<!-- Custom styles for this template -->
<link href="/resources/css/carousel.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/resources/js/common/jquery.form.js"></script>
<script>


$(document).ready(function() {
	 $('#backmain').click(function() {
	      if(confirm("목록으로 돌아가시겠습니까?")){
	         location.href = "${ pageContext.request.contextPath }/hospitalboard"; 
	      }
	   });
	var form = document.inputForm;
	$.ajax({
		type: 'GET',
		url: "/categoryData",
		success: function(result) {
			console.log(result);
			var myObj = JSON.parse(result);
			for (var i = 0; i < myObj.length; i++) {
				var item = myObj[i];
				$("#category").append("<option value=" + item.ctg_no + ">" + item.ctg_name + "</option>");
				
			}
			if(form.ctg_no.length > 0) {
				$("#category").val(form.ctg_no);
			}
		},
		error:function(request, status, error) {
			alert("ERROR: " + request + " " + status + " " + error);
		}
	});
	
});

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
		if (!form.ctg_no.value) {
			alert('카테고리는 필수항목입니다.');
			return false;
		}		 
		if (!form.content.value) {
			alert('내용은 필수항목입니다.');
			form.content.focus();
			return false;
		}
		if ($("input[name='files[0]']").val() == "") {

			$("input[name='files[0]']").remove();
		}
		return true;
	}
	
	 
</script>
<style>
body{
	font-family: 'Noto Sans KR',sans-serif;
}

div#Wtitle span#title{
	float: left;
}

div#selectctg span#ctg, div#Wcontent span#content{
	float: left;
}
table#writeForm th, td{
	padding: 15px;
}
table th {
	background-color: rgba(229,203,149,0.5);
	text-align: center;
	
	
}
</style>
</head>
<body>

	<header>
		<!-- action include 사용-->
		<jsp:include page="/WEB-INF/jsp/include/bytopMenu.jsp" />
	</header>
	<section>
		<div align="center">
			<br>
			
			<h2>게시글 작성</h2>
			<hr>
			<br>

			<!-- form 태그는 기본적으로 post방식임, onsubmit은 submit버튼을 눌렀을 때 수행함. return true일 시 넘어가고, false 일 시 안넘어감.  -->
			<form method="post"
			enctype="multipart/form-data"
            action="${ pageContext.request.contextPath }/board/hospitalwrite2"
            name="inputForm" onsubmit="return checkForm()">
            <input type="hidden" name="memberid" value="${ loginVO.memberid }">    
            <table id="writeform">
					<tr>
						<th width="23%">제목</th>
						<td><input type="text" name="title" style="width:100%;"
							autofocus="autofocus"></td>
					</tr>
					<tr>
						<th width="23%">카테고리</th>
						
						<td><select id="category" name="ctg_no"></select>
						</td>
					</tr>
					<tr>
						<th width="23%">내용</th>
						<td><textarea rows="15" name="content" style="width:100%;"></textarea></td>
					</tr>
					<tr>
						<th scope="row">첨부파일</th>
						<td><input type="file" accept="image/*" id="files[0]" name="files[0]" value="">
						</td>
					</tr>
					
					    <tr>
                  <th width="25%">회원아이디</th>
                  <td>${ loginVO.memberid }</td>
               </tr>
				</table>
				<button type="submit" class="btn btn-default">등록</button>
			</form>
			<br>
				     
            &nbsp;&nbsp;&nbsp;
            <button id="backmain" class="btn btn-default">목록으로</button>
		</div>
	</section>
	<footer>
		<jsp:include page="/WEB-INF/jsp/include/byfooter.jsp" />
		
	</footer>
</body>
</html>