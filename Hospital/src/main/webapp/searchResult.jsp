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
                     <td><%=words[1]%></td>
                     <td><%=words[2]%></td>
                     </tr>
                  <%
                  }
               }
            }
         %>
         </table>
         <br>
      <br>



      <!--    <div align="center" class=table> -->

      <%--       <c:set value="${ param.Q0 }" var="Q0" /> --%>
      <%--       <c:set value="${ param.Q1 }" var="Q1" /> --%>
      <%--       <c:set value="${ param.QD }" var="QD" /> --%>


      <!--       <table> -->
      <!--          <tr> -->
      <!--             <th>이름</th> -->
      <!--             <th>주소</th> -->
      <!--             <th>전화번호</th> -->
      <!--          </tr> -->
      <%--          <c:forEach var="i" begin="0" end="10" step="1"> --%>
      <!--             <tr> -->
      <%--                <c:set value='${i:requestHospitalInfo(Q0, Q1, QD, i, 1)}' --%>
      <%--                   var='addr' /> --%>
      <%--                <c:set value="${ param.dong }" var="dong" /> --%>
      <%--                <c:if test="${fn : contains(addr, dong)}"> --%>
      <%--                   <td><c:out value='${i:requestHospitalInfo(Q0, Q1, QD, i, 0)}' /></td> --%>
      <%--                   <td><c:out value='${i:requestHospitalInfo(Q0, Q1, QD, i, 1)}' /></td> --%>
      <%--                   <td><c:out value='${i:requestHospitalInfo(Q0, Q1, QD, i, 2)}' /></td> --%>
      <%--                </c:if> --%>
      <!--             </tr> -->

      <%--          </c:forEach> --%>
      <!--       </table> -->
      <!--    </div> -->
   </section>
   <footer>
      <jsp:include page="/WEB-INF/jsp/include/byfooter.jsp" />
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