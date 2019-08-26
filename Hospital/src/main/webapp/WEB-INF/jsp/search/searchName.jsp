<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
<link
   href="${ pageContext.request.contextPath}/resources/css/carousel.css"
   rel="stylesheet">

<link
   href="${ pageContext.request.contextPath}/resources/css/searchpage.css"
   rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Noto+Sans+KR&display=swap" rel="stylesheet">
 <link href="https://fonts.googleapis.com/css?family=Anton|Francois+One&display=swap&subset=latin-ext,vietnamese" rel="stylesheet">
 <script
   src="${ pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script>

      
    function doAction(){   
      var hnVal = document.search.hName.value;
     
      if(!hnVal){
         confirm("병원이름을 입력해주세요.");
         location.href="#";
      }             
      else{
         $('#search').attr("type","submit");
      }
      
   } 
   

   
</script>
<style>
body{
    font-family: 'Noto Sans KR',sans-serif; 
   /*  font-family: 'Righteous', cursive;  */
/* font-family: 'Jua', sans-serif; */
/* font-family: 'Francois One', sans-serif; */
}
.img-circle:hover{
opacity:0.3;
}
#hName{
   width : 120%;
   padding:10px 0px 10px 0px;
   margin-top: 10%;
   margin-left: 35%;
   border-radius: 10px 10px 10px 10px;
}
#search{
   width : 100%;
   margin-top: 10%;
   margin-left: 35%;
}
#hnamestyleh {
   margin-left: 30%;
   margin-top: 10%;
   background-color: #F0F0F0;
   border-radius: 10px 10px 10px 10px;
   width: 400px;
   /* width:38%; */
   /* height:200%; */
   height: 550px;
   align: center;
}
#form{
margin-left: 50%;
   margin-top: 10%;
    margin: auto; 
        width:250px;
}
#recep{
   width: 100%;
   font-weight: bold;
   margin-left: 35%;
   color: #da620c;
   
}
</style>
</head>
<body>
   <header> <jsp:include
      page="/WEB-INF/jsp/include/bytopMenu.jsp" /> </header>

   <section  align="center"> <!-- Carousel
    ================================================== -->
   <div align="center" id="hnamestyleh" style="margin-top: 5%;">
   <form name="search" method="post" id="form" class="form-inline" 
      action="${ pageContext.request.contextPath }/searchNameResult" >
      <img
                     src="${pageContext.request.contextPath}/resources/png/hospital.png"
                     style="position: relative;width: 150px; height: 150px; margin-top: 20%; margin-left:55%;">
      <img
                     src="${pageContext.request.contextPath}/resources/png/magnifying-glass.png"
                     style="position: relative;width: 230px; height: 230px; margin-top: -70%;margin-left:45%; opacity: 0.7;">
      <div class="form-group" align="center">
         <label class="sr-only" for="hName">병원이름</label> <input type="text"
            name="hName" id="hName" class="in" placeholder="병원이름을 입력해주세요">
      </div>
      
      <button type="button" id="search" name="searchBtn" class="btn btn-default"
         aria-label="Left Align" onclick="doAction()">
          
         검색
      </button>
      <br>
      <br>
      <br>
      <p id="recep">병원이름과 지역을 함께 입력하시면 <br>더 정확한 결과를 얻으실 수 있습니다.</p>
      <br>
      
   </form>

 
</div>


   <!-- /.carousel --> </section>

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