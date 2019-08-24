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
<link href="./resources/css/carousel.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>

<%-- <script src="${ pageContext.request.contextPath }/resources/js/checkForm.js"></script> --%>
<script>
   if ("${ param.msg }")
      alert("${ param.msg }");

   // isNull은 resources/js/checkForm.js 에서 가져옴
   function checkForm() {
      var form = document.inputForm;

      if (!form.memberid.value) { //비어있으면
         alert('아이디는 필수항목입니다');
         form.memberid.focus(); //비어있으면 자동으로 제목칸으로 커서의 포커스가 이동
         return false;
      }

      if (!form.password.value) { //비어있으면
         alert('패스워드는 필수항목입니다');
         form.password.focus(); //비어있으면 자동으로 작성자 칸으로 커서의 포커스가 이동
         return false;
      }

      return true;
   }
</script>
<style>
body{
	font-family: 'Noto Sans KR',sans-serif;
}
#loginstyleh {
   margin-left: 30%;
   margin-top: 10%;
   background-color: #F0F0F0;
   border-radius: 10px 10px 10px 10px;
   width: 400px;
   /* width:38%; */
   /* height:200%; */
   height: 500px;
}
</style>
</head>
<body>
   <header> <jsp:include
      page="/WEB-INF/jsp/include/bytopMenu.jsp" /> </header>

   <section class="login-blockj">

   <div align="center" id="loginstyleh" style="margin-top: 5%;">
      <div class="container">
         <div class="row">
            <div align="center">
               <div class="col-md-4 login-secj" style="margin-top:4%;">
                  <img
                     src="${pageContext.request.contextPath}/resources/png/login.png"
                     style="width: 150px; height: 150px; margin-top: -4%;">
                  <h2 class="text-center" style="margin-top:4%; font-weight:bold;">Login</h2>
                  <!-- action 안하면 get방식으로 받아온 url에서 post 방식으로만 자동으로 적용 -->
                  <form method="post" style="margin-top: 5%;"
                     action="${ pageContext.request.contextPath }/login"
                     name="inputForm" onsubmit="return checkForm()" class="login-form">

                     <div class="form-group">
                        <label for="exampleInputEmail1" class="text-uppercase">ID</label><br />
                        <input type="text" name="memberid" autofocus="autofocus"
                           class="form-control" size="32px" />

                     </div>


                     <div class="form-group">
                        <label for="exampleInputPassword1" class="text-uppercase">Password</label><br />
                        <input type="password" name="password" autofocus="autofocus"
                           class="form-control" size="32px" />
                     </div>
                     <br />



                     <button type="submit" class="btn btn-login float-right">Login</button>
                     <a href="${ pageContext.request.contextPath }/member/join"><button
                           type="button" class="btn btn-login float-right">Signup</button></a>

                  </form>
               </div>
            </div>
         </div>
      </div>
   </div>
   </section>



   <footer> <!-- 지시자 include 방식 --> <jsp:include
      page="/WEB-INF/jsp/include/byfooter.jsp" /> </footer>
</body>
</html>