<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
   // 더 이쁘게 사용할려면 bootstrap의 modal 사용
   function addFavorite() {
      //explore에서만 즐겨찾기가능한 코드이므로 chrome에서도 쓰기 위해 try-catch이용
      try{
      window.external.AddFavorite('http://localhost:9999${pageContext.request.contextPath}',
            'byby')
      } catch (e) {
         alert("현재 사용중인 브라우저에서는 사용할 수 없습니다\n크롬에서는 ctrl+d를 사용해주세요.")
      }
   }
   
   
   function doActiontp(){
      <c:if test= "${empty loginVO}">
         if(confirm("로그인후 사용가능\n 로그인 하시겠습니까?"))
            location.href="${pageContext.request.contextPath}/login";
      </c:if>
      <c:if test="${!empty loginVO}"> 
            location.href="${pageContext.request.contextPath}/mypage/${loginVO.memberid}";
      </c:if>
      /* href="${pageContext.request.contextPath}/mypage/{loginVO.memberid}" */
   }

   jQuery(document).ready(function($) {
      // hide the menu when the page load
      $("#navigation-list").hide();
      // when .menuBtn is clicked, do this
      
      $(".navbar-toggle").click(function() {
      
      // open the menu with slide effect
      
      $("#navigation-list").slideToggle(300);
      
      });
      
      });


</script>
<style>
#loginstyle {
   color: #9d9d9d;
   margin-top: 14px;
}

.logo {
   width: 100px;
   height: 60px;
   margin-top: 0px;
   margin-right: 20px;
   margin-left: 30px;
}

header nav ul {
   list-style: none;
}

header nav li {
   display: block;
}

header nav li a {
   text-decoration: inherit;
   padding: 5px 0px;
   color: white;
   display: block;
   text-transform: uppercase;
   transition: all 0.4s;
   -webkit-transition: all 0.4s;
}

header nav li a:hover {
   background-color: #2c3e50;
}

.navbar-toggle {
   line-height: 85px;
   text-align: right;
   padding-right: 20px;
   cursor: pointer;
}

.navbar-toggle:hover {
   opacity: 0.8;
}
</style>
<header>
   <div class="navbar-wrapper">
      <div class="container">

         <nav class="navbar navbar-inverse navbar-static-top">
            <div class="container">
               <div class="navbar-header">


                  <button type="button" class="navbar-toggle collapsed"
                     data-toggle="collapse" data-target="#navbar"
                     aria-expanded="false" aria-controls="navbar">
                     <!--                   <span class="sr-only">Toggle navigation</span> -->
                     <span class="icon-bar"></span> <span class="icon-bar"></span> <span
                        class="icon-bar"></span> <span class="icon-bar"></span>
                     <nav id="navigation-list">
                        <ul>
                           <li><a href="${pageContext.request.contextPath}/search"
                              class="tog" style="color: #ffffff">Search</a></li>
                           <li><a
                              href="${pageContext.request.contextPath}/hospitalboard"
                              class="tog" style="color: #ffffff">Hospital Board</a></li>
                           <li><a
                              href="${pageContext.request.contextPath}/symptomboard"
                              class="tog" style="color: #ffffff">Symptom Board</a></li>
                           <li><a onclick="doActiontp()" class="tog"
                              style="color: #ffffff">MyPage</a></li>
                        </ul>
                     </nav>
                  </button>



                  <%--                <a class="navbar-brand" href="${pageContext.request.contextPath}/" style="font-size: 30px;">BYBY</a> --%>
                  <a href="${pageContext.request.contextPath}/"><img
                     class="logo"
                     src="${pageContext.request.contextPath}/resources/png/LOGO_byby.png"></a>
               </div>
               <div id="navbar" class="navbar-collapse collapse">
                  <ul class="nav navbar-nav">
                     <li><a href="${pageContext.request.contextPath}/search">Search</a></li>
                     <li><a
                        href="${pageContext.request.contextPath}/hospitalboard">Hospital
                           Board</a></li>
                     <li><a
                        href="${pageContext.request.contextPath}/symptomboard">Symptom
                           Board</a></li>



                     <li><a onclick="doActiontp()" id="mypage">MyPage </a></li>


                     <li><c:choose>
                           <c:when test="${ empty loginVO }">
                              <li style="color: #9d9d9d;"><a
                                 href="${ pageContext.request.contextPath }/member/join">Join</a></li>
                              <li style="color: #9d9d9d;"><a
                                 href="${ pageContext.request.contextPath }/login">Login</a></li>
                           </c:when>
                           <c:otherwise>
                              <a href="${ pageContext.request.contextPath }/logout">Logout</a>
                           </c:otherwise>
                        </c:choose></li>

                     <li id="loginstyle" style="color: black; margin-left: 50px">
                        <c:if test="${ not empty loginVO }">
                           <!-- sessionScope.loginVO와같음 -->
                     ${ loginVO.memberid } 님으로 로그인
                     </c:if>
                     </li>
                  </ul>
               </div>
            </div>
         </nav>

      </div>
   </div>
</header>