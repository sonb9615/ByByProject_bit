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
      <!-- Indicators -->
<!--       <ol class="carousel-indicators">
         <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
         <li data-target="#myCarousel" data-slide-to="1"></li>
         <li data-target="#myCarousel" data-slide-to="2"></li>
      </ol> -->
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
         <div class="item">
            <img class="second-slide"
               src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw=="
               alt="Second slide">
<!--             <div class="container"> -->
<!--                <div class="carousel-caption"> -->
<!--                   <h1>Another example headline.</h1> -->
<!--                   <p>Cras justo odio, dapibus ac facilisis in, egestas eget -->
<!--                      quam. Donec id elit non mi porta gravida at eget metus. Nullam id -->
<!--                      dolor id nibh ultricies vehicula ut id elit.</p> -->
<!--                   <p> -->
<!--                      <a class="btn btn-lg btn-primary" href="#" role="button">Learn -->
<!--                         more</a> -->
<!--                   </p> -->
<!--                </div> -->
<!--             </div> -->
         </div>
         <div class="item">
            <img class="third-slide"
               src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw=="
               alt="Third slide">
            <div class="container">
               <div class="carousel-caption">
                  <h1>One more for good measure.</h1>
                  <p>Cras justo odio, dapibus ac facilisis in, egestas eget
                     quam. Donec id elit non mi porta gravida at eget metus. Nullam id
                     dolor id nibh ultricies vehicula ut id elit.</p>
                  <p>
                     <a class="btn btn-lg btn-primary" href="#" role="button">Browse
                        gallery</a>
                  </p>
               </div>
            </div>
         </div>
      </div>
<!--       <a class="left carousel-control" href="#myCarousel" role="button"
         data-slide="prev"> <span class="glyphicon glyphicon-chevron-left"
         aria-hidden="true"></span> <span class="sr-only">Previous</span>
      </a> <a class="right carousel-control" href="#myCarousel" role="button"
         data-slide="next"> <span
         class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
         <span class="sr-only">Next</span>
      </a> -->
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

<!--       Three columns of text below the carousel -->
<!--       <div class="row"> -->
<!--          <div class="col-lg-4"> -->
<!--             <img class="img-circle" -->
<!--                src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" -->
<!--                alt="Generic placeholder image" width="140" height="140"> -->
<!--             <h2>Heading</h2> -->
<!--             <p>Donec sed odio dui. Etiam porta sem malesuada magna mollis -->
<!--                euismod. Nullam id dolor id nibh ultricies vehicula ut id elit. -->
<!--                Morbi leo risus, porta ac consectetur ac, vestibulum at eros. -->
<!--                Praesent commodo cursus magna.</p> -->
<!--             <p> -->
<!--                <a class="btn btn-default" href="#" role="button">View details -->
<!--                   &raquo;</a> -->
<!--             </p> -->
<!--          </div> -->
<!--          /.col-lg-4 -->
<!--          <div class="col-lg-4"> -->
<!--             <img class="img-circle" -->
<!--                src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" -->
<!--                alt="Generic placeholder image" width="140" height="140"> -->
<!--             <h2>Heading</h2> -->
<!--             <p>Duis mollis, est non commodo luctus, nisi erat porttitor -->
<!--                ligula, eget lacinia odio sem nec elit. Cras mattis consectetur -->
<!--                purus sit amet fermentum. Fusce dapibus, tellus ac cursus commodo, -->
<!--                tortor mauris condimentum nibh.</p> -->
<!--             <p> -->
<!--                <a class="btn btn-default" href="#" role="button">View details -->
<!--                   &raquo;</a> -->
<!--             </p> -->
<!--          </div> -->
<!--          /.col-lg-4 -->
<!--          <div class="col-lg-4"> -->
<!--             <img class="img-circle" -->
<!--                src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" -->
<!--                alt="Generic placeholder image" width="140" height="140"> -->
<!--             <h2>Heading</h2> -->
<!--             <p>Donec sed odio dui. Cras justo odio, dapibus ac facilisis in, -->
<!--                egestas eget quam. Vestibulum id ligula porta felis euismod semper. -->
<!--                Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum -->
<!--                nibh, ut fermentum massa justo sit amet risus.</p> -->
<!--             <p> -->
<!--                <a class="btn btn-default" href="#" role="button">View details -->
<!--                   &raquo;</a> -->
<!--             </p> -->
<!--          </div> -->
         
<!--          <div class="col-lg-4"> -->
<!--             <img class="img-circle" -->
<!--                src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" -->
<!--                alt="Generic placeholder image" width="140" height="140"> -->
<!--             <h2>Heading</h2> -->
<!--             <p>Donec sed odio dui. Cras justo odio, dapibus ac facilisis in, -->
<!--                egestas eget quam. Vestibulum id ligula porta felis euismod semper. -->
<!--                Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum -->
<!--                nibh, ut fermentum massa justo sit amet risus.</p> -->
<!--             <p> -->
<!--                <a class="btn btn-default" href="#" role="button">View details -->
<!--                   &raquo;</a> -->
<!--             </p> -->
<!--          </div> -->
<!--          /.col-lg-4 -->
<!--       </div> -->
      <!-- /.row -->
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