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
<link rel="stylesheet" href="${ pageContext.request.contextPath}/resources/css/layout.css">
<!-- Bootstrap core CSS -->
<link href="${ pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">

<script src="../../assets/js/ie-emulation-modes-warning.js"></script>
<script src="${ pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>

<link href="/resources/css/carousel.css" rel="stylesheet">
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
   $(document).ready(function() {
      $(".selected_td").click(function() {
         var td_val = $(this).text();
         console.log(td_val);
         document.getElementById("addr").value = td_val;
         console.log(document.getElementById("addr").value);
      });
   });
</script>
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
   <header> 
      <jsp:include page="/WEB-INF/jsp/include/bytopMenu.jsp" /> 
   </header>

   <section>
     <form method="post" name="searchResultForm" id="form" class="form-inline"
      action="${ pageContext.request.contextPath }/mapResult">
   <div align="center">

      <br>
      <hr>
      <h2>병원 검색 결과</h2>
      <hr>
      <%
            //request.setCharacterEncoding("euc-kr");
            String Q0 = request.getParameter("Q0");
            String Q1 = request.getParameter("Q1");
            String QD = request.getParameter("QD");
            String dong = request.getParameter("dong");

            Search s = new Search(Q0, Q1, QD);
            s.requestHospitalInfo();
            
            
            int n = s.cnt();
            
            %>
      <table>
         <%
            if (n==0) {
               %>
         <!--                <h2>해당 지역의 병원 검색결과가 없습니다.</h2> -->
         <%
            }else {
               %>
         <tr>
            <th>이름</th>
            <th>주소</th>
            <th>전화번호</th>
         </tr>
         <% 
               for (int i = 0; i < n; i++) {
                  if (s.getItem(i).contains(dong)) {
                     %>
         <tr>
            <% 
                     String str = s.getItem(i);
                     String words[] = str.split("/");
                  %>
            <%--                   <h5><%=s.getItem(i)%></h5> --%>
            <td><%=words[0]%></td>
            <td class="selected_td"><%=words[1]%><button type="submit" id="map" name="map">지도</button></td>
            
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