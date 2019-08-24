<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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

<link rel="stylesheet"
   href="${ pageContext.request.contextPath}/resources/css/testjeffohcss.css">

<!-- Bootstrap core CSS -->
<link
   href="${ pageContext.request.contextPath}/resources/css/bootstrap.min.css"
   rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Noto+Sans+KR&display=swap" rel="stylesheet">

<script src="../../assets/js/ie-emulation-modes-warning.js"></script>
<script
   src="${ pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>

<!-- Custom styles for this template -->
<link
   href="${ pageContext.request.contextPath}/resources/css/carousel.css"
   rel="stylesheet">
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
   $(document).ready(function() {
      $('#checkbtn').on('click', function() {
         $.ajax({
            type : 'POST',
            url : '/checkSignUp',
            data : {
               "memberid" : $('#memberid').val()
            },
            success : function(data) {
               if ($.trim(data) == 0) {
                  $('#checkMsg').html('<p style="color:blue">사용가능</p>');
               } else {
                  $('#checkMsg').html('<p style="color:red">사용불가능</p>');
               }
            }
         });
      });
   });
</script>
<style>
body{
	font-family: 'Noto Sans KR',sans-serif;
}
.error {
   color: red;
}

#joinstyleh {
   margin-left: 30%;
   margin-top: 10%;
   background-color: #F0F0F0;
   border-radius: 10px 10px 10px 10px;
   width: 400px;
   height: 850px;
}

</style>

</head>
<body>
   <header> <jsp:include
      page="/WEB-INF/jsp/include/bytopMenu.jsp" /> </header>



   <section class="login-blockj">
   <div align="center" id="joinstyleh">
      <div class="container">
         <div class="row" >
            <div align="center">
               <div class="col-md-4 login-secj" style="margin-top: 4%;">
                  <img
                     src="${pageContext.request.contextPath}/resources/png/signup.png"
                     style="width: 150px; height: 150px; margin-top: -4%; margin-left:2%;">
                  <h2 class="text-center" style="margin-top:4%; font-weight:bold;">Join</h2>
                  <form:form method="post" commandName="memberVO" class="login-form">
                     <div class="form-group">
                        <label for="id" class="text-uppercase">ID</label><br />

                        <form:input path="memberid" id="memberid" class="form-control"
                           size="35px" />
                        <br>
                        <form:errors path="memberid" class="error" />
                        <div id="checkMsg"></div>
						
                        <button type="button" id="checkbtn" class="btn btn-default" style="margin-top:2%;">중복확인</button>
                     </div>
                     <div class="form-group">
                        <label for="name" class="text-uppercase">Username</label><br />


                        <form:input path="name" class="form-control" size="35px" />
                        <br>
                        <form:errors path="name" class="error" />
                     </div>


                     <div class="form-group">
                        <label for="password" class="text-uppercase">Password</label><br />

                        <form:input path="password" type="password" class="form-control"
                           size="35px" />
                        <br>
                        <form:errors path="password" class="error" />
                     </div>


                     <div class="form-group">
                        <label for="email" class="text-uppercase">Email</label><br />

                        <form:input path="emailId" class="form-control" size="12px" />
                        @
                        <form:input path="emailDomain" class="form-control" size="12px" />
                        <%--                   <form:errors path="emailId" class="error"/> --%>
                     </div>

                     <div class="form-group">
                        <label for="tel" class="text-uppercase">Phone Number</label><br />

                        <form:input path="tel1" class="form-control" size="4px" />
                        -
                        <form:input path="tel2" class="form-control" size="4px" />
                        -
                        <form:input path="tel3" class="form-control" size="4px" />
                        <%--                   <form:errors path="tel1" class="error"/> --%>

                     </div>
                     <button type="submit" class="btn btn-login float-right">Join</button>

                  </form:form>
               </div>

            </div>
         </div>
      </div>
   </section>
   <footer> <jsp:include page="/WEB-INF/jsp/include/byfooter.jsp" />
   </footer>

</body>
</html>