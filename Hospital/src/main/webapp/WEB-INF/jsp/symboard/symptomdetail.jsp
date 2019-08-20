<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${ pageContext.request.contextPath }/resources/css/layout.css">
<link rel="stylesheet"
	href="${ pageContext.request.contextPath }/resources/css/board.css">
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>

<!-- Bootstrap core CSS -->
<link
	href="${ pageContext.request.contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">

<script src="../../assets/js/ie-emulation-modes-warning.js"></script>
<script
	src="${ pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>

<!-- Custom styles for this template -->
<link href="/resources/css/carousel.css" rel="stylesheet">

<script>
	$(document).ready(function() {	
		
		$('#delBtn').click(function() {
			if(confirm("${symptom.no}게시물을 삭제하시겠습니까?")) {
			
			// 비동기 삭제
			$.ajax({
				type : "delete",
				url : "${ pageContext.request.contextPath }/symboard/${ symptom.no }",
				success : function(data) {
					let jsonData = JSON.parse(data);
					if(jsonData.flag) {
						location.href = "${ pageContext.request.contextPath }/symptomboard";
					}
				}
			});
			}
		});
		
		$('#updateBtn').click(function() {
	         if(confirm("${symptom.no}게시물을 수정하시겠습니까?")){
	            location.href = "${ pageContext.request.contextPath }/symboard/update/${symptom.no}"; 
	         }
	         
	      });
	      
	      $('#backmain').click(function() {
	         if(confirm("목록으로 돌아가시겠습니까?")){
	            location.href = "${ pageContext.request.contextPath }/symptomboard"; 
	         }
	      });
	
	      
	       $(document).on('click', '#btnReplySave', function(){
	          var comm_content = $('#comm_content').val();
	          var replyerid = $('#replyerid').val();
	          var no = '${symptom.no}';
	          var paramData = JSON.stringify({"comm_content": comm_content, "replyerid": replyerid, "no":no
	          });
	          var headers = {"Content-Type" : "application/json", "X-HTTP-Method-Override" : "POST"};
	          $.ajax({
	             url: "${pageContext.request.contextPath}/symboard/restBoard/saveReqly"
	             , headers : headers
	             , data : paramData
	             , type : 'POST'
	             , dataType : 'text'
	             , success: function(result){
	                showReplyList();
	                $('#comm_content').val('');
	                $('#replyerid').val('');
	             }
	             , error: function(error){
	                console.log("에러 : " + error);
	             }
	          });
	       });
	});
	
	function fn_deleteReply(commentno){
        var paramData = {"commentno": commentno};
        var replynumber = paramData.commentno;
        
           if(confirm("댓글을 삭제하시겠습니까?") == true){
            }
            else{
                return ;
            }
        $.ajax({
           url: "${pageContext.request.contextPath}/symboard/restBoard/deleteReply/"+replynumber 
           , data : paramData
           , type : 'POST'
           , dataType : 'text'
           , success: function(result){
              showReplyList();
              alert("삭제되었습니다");
           }
           , error: function(error){
              console.log("에러 : " + error);
           }
        });
     }
     
     
     function showReplyList(){
        var url = "${pageContext.request.contextPath}/symboard/restBoard/getReqlyList";
        var paramData = {"no" : "${symptom.no}"};
        $.ajax({
              type: 'POST',
              url: url,
              data: paramData,
              dataType: 'json',
              success: function(result) {
                    var htmls = [""];
           if(result.length < 1){
              htmls.push("등록된 댓글이 없습니다.");
           } else {
                         $(result).each(function(){
                          htmls += '<div style="background-color:#ffedee; width:400px; font-size: 10pt; color:#000000;" class="media text-muted pt-3"  id="commentno' + this.commentno + '">';
                          //htmls +=this.commentno;
                          //htmls += "번째 댓글입니다."
                          htmls += '<p class="media-body pb-3 mb-0 small lh-125 border-bottom horder-gray">';
                          htmls += '<span class="d-block">';
                          htmls += '<span style="font-size: 9pt; color:#000000;">';
                          htmls +="댓글내용: "
                          htmls += this.comm_content;
                          htmls += '</br>'
                          htmls +="아이디: "
                          htmls += this.replyerid;
                          htmls += '</br>'
                          htmls += '<strong class="text-gray-dark">' + this.comm_date + '</strong>';
                          htmls += '</br>'
                          htmls += '<a href="javascript:void(0)"  onclick="fn_editReply(' + this.commentno + ', \'' + this.comm_date + '\', \'' + this.comm_content + '\' )" style="padding-right:5px">수정</a>';
                          htmls += '<a href="javascript:void(0)"  onclick="fn_deleteReply('+ this.commentno + ')" >삭제</a>';    
                          htmls += '</span>';
                          htmls += '</span>';
                          htmls += '</p>';
                          htmls += '</div>';
                     });   //each end
           }
           $("#replyList").html(htmls);

              }      // Ajax success end
        });   // Ajax end
     } 
     
     function fn_editReply(commentno, comm_date, comm_content){
        var htmls = "";
        htmls += '<div style="background-color:#ffedee; width:400px; font-size: 10pt; color:#000000;" class="media text-muted pt-3" id="commentno' + commentno + '">';
        htmls += '<p class="media-body pb-3 mb-0 small lh-125 border-bottom horder-gray">';
        htmls += '<span class="d-block" style="font-size: 9pt; color:#000000;">';
        htmls += '<strong class="text-gray-dark">' + comm_date + '</strong>';
        htmls += '<span style="padding-left: 5px; font-size: 9pt">';
        htmls += '<a href="javascript:void(0)" onclick="fn_updateReply(' + commentno + ', \'' + comm_date + '\')" style="padding-right:4px">저장</a>';
        htmls += '<a href="javascript:void(0)" onClick="showReplyList()">취소<a>';
        htmls += '</span>';
        htmls += '</span>';      
        htmls += '<textarea name="editContent" id="editContent" class="form-control" rows="3">';
        htmls += comm_content;
        htmls += '</textarea>';
        htmls += '</p>';
        htmls += '</div>';
        $('#commentno' + commentno).replaceWith(htmls);
        $('#commentno' + commentno + ' #editContent').focus();
     };
     
     function fn_updateReply(commentno, comm_date){
        var replyEditContent = $('#editContent').val();
        var paramData = JSON.stringify({"comm_content": replyEditContent
              , "commentno": commentno
        });
        var replynumber2 = commentno;
        var headers = {"Content-Type" : "application/json"
              , "X-HTTP-Method-Override" : "POST"};
        if(confirm("댓글을 수정하시겠습니까?") == true){
             
         }
         else{
             return ;
         }
        $.ajax({
           url: "${pageContext.request.contextPath}/symboard/restBoard/updateReply/" + replynumber2
           , headers : headers
           , data : paramData
           , type : 'POST'
           , dataType : 'text'
           , success: function(result){
                  console.log(result);
              showReplyList();
              alert("수정되었습니다");
           }
           , error: function(error){
              console.log("에러 : " + error);
           }
        });
     }; 
</script>
<style>
.img {
	width: 500px;
	height: auto;
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
			<hr>
			<h2>증상게시판 상세</h2>
			<hr>
			<br>
			<table>
				<tr>
					<th width="25%">게시글번호</th>
					<td>${ symptom.no }</td>
				</tr>
				<tr>
					<th width="25%">제목</th>
					<td>${ symptom.title }</td>
				</tr>
				<tr>
					<th width="25%">카테고리</th>
					<td>${ symptom.ctg_name }</td>
				</tr>
				<tr>
					<th width="25%">내용</th>
					<td>${ symptom.content }<br><img src="${pageContext.request.contextPath}/resources/imageUpload/${symptom.file_name_key }"  name="img" id="img" class="img" alt="${ symptom.file_name_key }"/></td>
				</tr>
				<tr>
					<th width="25%">회원아이디</th>
					<td>${ symptom.memberid }</td>
				</tr>
				<tr>
					<th width="25%">조회수</th>
					<td>${ symptom.viewcnt }</td>
				</tr>
				<tr>
					<th width="25%">등록일</th>
					<td>${ symptom.wrt_date }</td>
				</tr>
			</table>
			<br>
			<div>
				<c:if test="${ loginVO.memberid eq symptom.memberid }">
					<button id="updateBtn">수정</button>
               &nbsp;&nbsp;&nbsp;
               <button id="delBtn">삭제</button>
               &nbsp;&nbsp;&nbsp;
            </c:if>
				<button id="backmain">목록으로</button>
				
				
			         <!-- Reply Form {s} -->
          <div class="my-3 p-3 bg-white rounded shadow-sm"
            style="padding-top: 10px">
            <form:form name="form" id="form" role="form" modelAttribute="replyVO" method="post">
               <form:hidden path="no" id="no" />
               <div class="row">
                  <div class="col-sm-10">
                     <form:textarea path="comm_content" id="comm_content" class="form-control" rows="3" placeholder="댓글을 입력해 주세요"></form:textarea>
                  </div>
                  <div class="col-sm-2">
                     <form:input path="replyerid" class="form-control" id="replyerid" placeholder="댓글 작성자"></form:input>
                     <button type="button" class="btn btn-sm btn-secondary" id="btnReplySave" style="width: 100%; margin-top: 10px">
                     저 장</button>
                  </div>
               </div>
            </form:form>
         </div>
         <!-- Reply Form {e} -->
         <!-- Reply List {s}-->
         <div class="my-3 p-3 bg-white rounded shadow-sm"
            style="padding-top: 10px">
            <h6 class="border-bottom pb-2 mb-0">Reply list</h6>
            <div id="replyList"></div>
         </div>
         <br>
         <!-- Reply List {e}-->
   
		</div> 
	</section>
	<footer>
		<jsp:include page="/WEB-INF/jsp/include/byfooter.jsp" />
	</footer>
</body>
</html>