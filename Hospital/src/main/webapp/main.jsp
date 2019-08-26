<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
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
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Noto+Sans+KR&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Anton|Francois+One&display=swap&subset=latin-ext,vietnamese" rel="stylesheet">
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
footer {
   margin-left: 5%;
   margin-right: 5%;
   color: #000000;
   background-color: #d2cece;
   min-height: 120px;
}

.main-text {
   font-size: 50px;
/*    font-weight: bold; */
   text-shadow: 0 0 15px #000000;
font-family: 'Francois One', sans-serif;
   letter-spacing:10px;
}
</style>
</head>
<!-- NAVBAR
================================================== -->
<body>
<header>
<jsp:include page="/WEB-INF/jsp/include/bytopMenu.jsp"/>
</header>

   <section>
   <div id="myCarousel" class="carousel slide" data-ride="carousel">
      <div class="carousel-inner" role="listbox">
         <div class="item active">
            <img class="first-slide"
               src="${pageContext.request.contextPath}/resources/png/computer-3343887_1920.jpg"
               alt="First slide">
            <div class="container">
               <div class="carousel-caption">
                  
                  <span class="main-text">Hospital Search & Community</span>

                  <p>
                     <a class="btn btn-lg btn-primary" href="${pageContext.request.contextPath}/search" role="button">병원검색 바로가기</a>
                  </p>
               </div>
            </div>
         </div>
      </div>

   </div>
   <!-- /.carousel -->


   <!-- Marketing messaging and featurettes
    ================================================== -->
   <!-- Wrap the rest of the page in another container to center all the content. -->

   <div class="container marketing">

      <!-- START THE FEATURETTES -->

      <div class="row featurette">
         <div class="col-md-7">
            <h2 class="featurette-heading">전국의 병원 찾기가 가능합니다<br>
            <div class="text-muted" style="margin-top:20px;">지금 바로 검색해보세요</div>
            </h2>
            <p class="lead">진료과목, 지역으로 전국의 병원을 검색해 가까운 병원을 찾아보세요. </p>
         </div>
         <div class="col-md-5">
            <img class="featurette-image img-responsive center-block"
               src="${pageContext.request.contextPath}/resources/png/web-3120321_1920.png" alt="Generic placeholder image">
         </div>
      </div>

      <hr class="featurette-divider">

      <div class="row featurette">
         <div class="col-md-7 col-md-push-5">
            <h2 class="featurette-heading">병원 게시판에서 병원정보를</h2>
            <h2 class="featurette-heading" style="margin-top:20px;">
               공유할 수 있습니다
<!--             <span class="text-muted"></span> -->
            </h2>
            <p class="lead">병원의 정보를 다른 사람들과 함께 공유해보세요.</p>
         </div>
         <div class="col-md-5 col-md-pull-7">
            <img class="featurette-image img-responsive center-block"
               src="${pageContext.request.contextPath}/resources/png/doctor-3822863_1920.jpg" alt="Generic placeholder image">
         </div>
      </div>

      <hr class="featurette-divider">

      <div class="row featurette">
         <div class="col-md-7">
            <h2 class="featurette-heading">증상 게시판에서 나의 증상을</h2>
            <h2 class="featurette-heading" style="margin-top:20px;">물어볼 수 있습니다</h2>
            <p class="lead">나에게 일어난 증상을 다른 사람들에게 물어보고 도움을 얻어보세요.</p>
         </div>
         <div class="col-md-5">
            <img class="featurette-image img-responsive center-block"
               src="${pageContext.request.contextPath}/resources/png/business.png" alt="Generic placeholder image"
               style="height: 300px;">
         </div>
      </div>
      
      <hr class="featurette-divider">
      <br><br><br><br>

      </div>


      <!-- /END THE FEATURETTES -->

      </section>
      
      <footer>
      <jsp:include page="/WEB-INF/jsp/include/byfooter.jsp"/>
     </footer>
   </div>
   
   <!-- /.container -->


   <!-- Bootstrap core JavaScript
    ================================================== -->
   <!-- Placed at the end of the document so the pages load faster -->
   <script
      src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
   <script src="${ pageContext.request.contextPath}/resources/css/bootstrap.min.css"></script>
   <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
   <script src="${ pageContext.request.contextPath}/resources/js/holder.js"></script>
   <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
   <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>