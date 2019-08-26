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
<link rel="stylesheet" href="/resources/css/layout.css">
<!-- Bootstrap core CSS -->
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">

<script src="../../assets/js/ie-emulation-modes-warning.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>

<link href="/resources/css/carousel.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="/resources/css/myPage/justified-nav.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Noto+Sans+KR&display=swap" rel="stylesheet">

<script type="text/javascript">
   $(document)
         .ready(
               function() {

                  $('#updateBtn')
                        .click(
                              function() {

                                 if (confirm("${loginVO.memberid}님의 개인정보 수정을 완료하였습니다.")) {
                                    location.href = "${ pageContext.request.contextPath }/mypage/update/${loginVO.memberid}";
                                 }

                              });
               });
</script>
<style>
#mypage_h3 {
   margin-left: 33%;
   margin-top: 0.5%;
   font-weight: bold;
}

table#mypageup th, td{
	padding: 15px;
}


</style>

</head>
<body>
   <header> <jsp:include
      page="/WEB-INF/jsp/include/bytopMenu.jsp" /> </header>

   <section>

   <div class="container">

      <div class="masthead">
         <ul style="color: #9d9d9d;">
            <c:if test="${ not empty loginVO }">
               <!-- sessionScope.loginVO와같음 -->
               <h3 class="text-muted" id="mypage_h3">${ loginVO.memberid }님의 마이페이지</h3>
            </c:if>
         </ul>
         <nav>
         <ul class="nav nav-justified"
            style="width: 60%; margin-left: 15%; margin-top: 3%;">
            <li><a href="#">개인정보수정</a></li>
         </ul>
         </nav>
      </div>

      <!-- Jumbotron -->
      <div class="jumbotron">
         <img
            src="${pageContext.request.contextPath}/resources/png/profile.png"
            style="width: 150px; height: 150px; margin-left: -10%; margin-top: -2%;">
         <div id="mypageform_byby" style="margin-top: 2%; margin-left: -3%;">
            <div align="center">
               <!-- form 태그는 기본적으로 post방식임, onsubmit은 submit버튼을 눌렀을 때 수행함. return true일 시 넘어가고, false 일 시 안넘어감.  -->
               <form method="post"
                  action="${ pageContext.request.contextPath }/mypage/update"
                  name="inputForm" onsubmit="return checkForm()">
                  <%-- <input type="hidden" name="writer" value="${ loginVo.id }"> --%>
                  <table id="mypageup">
                     <tr>
                        <th width="23%">ID</th>
                        <td><input type="text" name="memberid"
                           value="${ member.memberid }" autofocus="autofocus"></td>
                     </tr>

                     <tr>
                        <th width="23%">이름</th>
                        <td><input type="text" name="name" value="${ member.name }"
                           autofocus="autofocus"></td>
                     </tr>

                     <tr>
                        <th width="23%">Password</th>
                        <td><input type="password" name="password"
                           value="${ member.password }" autofocus="autofocus"></td>
                     </tr>

                     <tr>
                        <th width="23%">Email</th>

                        <td><input type="text" name="emailId"
                           value="${ member.emailId }" autofocus="autofocus">@ <input
                           type="text" name="emailDomain" value="${ member.emailDomain }"
                           autofocus="autofocus"></td>

                     </tr>

                     <tr>
                        <th width="23%">Tel</th>

                        <td><input type="text" name="tel1" value="${ member.tel1 }"
                           autofocus="autofocus"> <input type="text" name="tel2"
                           value="${ member.tel2 }" autofocus="autofocus"> <input
                           type="text" name="tel3" value="${ member.tel3 }"
                           autofocus="autofocus"></td>
                     </tr>
                  </table>
                  <br>
                  <button type="submit" class="btn btn-default" id="updateBtn" style="font-size:15px; background-color:#F0F0F0; padding: 0.5% 2%; margin-left:-6%;">수정</button>
               </form>
            </div>
         </div>
      </div>


      <!-- Example row of columns -->
      <div class="row">
         <div class="col-lg-4"></div>

      </div>
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