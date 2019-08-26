<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Noto+Sans+KR&display=swap" rel="stylesheet">

<script src="../../assets/js/ie-emulation-modes-warning.js"></script>


<!-- Custom styles for this template -->
<link href="/resources/css/carousel.css" rel="stylesheet">

<script>
	$(document).ready(function() {	
		showReplyList(); 
		$('#delBtn').click(function() {
			if(confirm("${hospital.no}게시물을 삭제하시겠습니까?")) {
			
			// 비동기 삭제
			$.ajax({
				type : "delete",
				url : "${ pageContext.request.contextPath }/board/${ hospital.no }",
				success : function(data) {
					let jsonData = JSON.parse(data);
					if(jsonData.flag) {
						location.href = "${ pageContext.request.contextPath }/hospitalboard";
					}
				}
			});
			}
		});
		
		$('#updateBtn').click(function() {
	         if(confirm("${hospital.no}게시물을 수정하시겠습니까?")){
	            location.href = "${ pageContext.request.contextPath }/board/update/${hospital.no}"; 
	         }
	         
	      });
	      
	      $('#backmain').click(function() {
	         if(confirm("목록으로 돌아가시겠습니까?")){
	            location.href = "${ pageContext.request.contextPath }/hospitalboard"; 
	         }
	      });
	
	      
	       $(document).on('click', '#btnReplySave', function(){
	          var comm_content = $('#comm_content').val();
	          var replyerid = $('#replyerid').val();
	          var no = '${hospital.no}';
	          var paramData = JSON.stringify({"comm_content": comm_content, "replyerid": replyerid, "no":no
	          });
	          var headers = {"Content-Type" : "application/json", "X-HTTP-Method-Override" : "POST"};
	          $.ajax({
	             url: "${pageContext.request.contextPath}/restBoard/saveReqly"
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
           url: "${pageContext.request.contextPath}/restBoard/deleteReply/"+replynumber 
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
        var url = "${pageContext.request.contextPath}/restBoard/getReqlyList";
        var paramData = {"no" : "${hospital.no}"};
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
                          htmls += '<hr>';
                          htmls += '<div class="media text-muted pt-3"  id="commentno' + this.commentno + '">';
                          //htmls +=this.commentno;
                          //htmls += "번째 댓글입니다."
                          htmls += '<p class="media-body pb-3 mb-0 small lh-125 border-bottom horder-gray">';
                         /*  htmls += '<span class="d-block">'; */
                          htmls += '<span id="replyid" style="font-size: 9pt; color:#000000;">';
                          htmls += '<strong class="text-gray-dark">' + this.replyerid + '</strong>';
                          htmls += '</span>';
                          if ("${loginVO.memberid}" == this.replyerid) {
                          htmls += '<span id="replybtn">'
                          htmls += '<a href="javascript:void(0)"  onclick="fn_editReply(' + this.commentno + ', \'' + this.comm_date + '\', \'' + this.comm_content + '\' )" style="padding-right:5px">수정</a>';
                          htmls += '<a href="javascript:void(0)"  onclick="fn_deleteReply('+ this.commentno + ')" >삭제</a>';    
                          htmls += '</span>';
                          }
                          htmls += '</br>'
                       	  htmls += '<p id="replyContent" style="font-size: 9pt; color:#000000;">';
                          htmls += (this.comm_content).replace(/(?:\r\n|\r|\n)/g, '<br />');
                          htmls += '</p>';
                       	  htmls += '<p id="replydate" style="font-size: 7pt; color:#000000;">';
                          htmls += '<strong class="text-gray-dark">' + this.comm_date + '</strong>';
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
        htmls += '<div class="media text-muted pt-3" id="commentno' + commentno + '">';
        htmls += '<p class="media-body pb-3 mb-0 small lh-125 border-bottom horder-gray">';
        htmls += '<span class="d-block" style="font-size: 9pt; color:#000000;">';
        htmls += '<textarea name="editContent" id="editContent" class="form-control" rows="3" cols="70">';
        htmls += comm_content;
        htmls += '</textarea>';
        
       /*  htmls += '<strong class="text-gray-dark">' + comm_date + '</strong>'; */
        htmls += '<span id="replyeditbtn" style="padding-left: 5px; font-size: 9pt">';
        htmls += '<a href="javascript:void(0)" onclick="fn_updateReply(' + commentno + ', \'' + comm_date + '\')" style="padding-right:4px">저장</a>';
        htmls += '<a href="javascript:void(0)" onClick="showReplyList()">취소<a>';
        htmls += '</span>';
        htmls += '</span>';      
        
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
           url: "${pageContext.request.contextPath}/restBoard/updateReply/" + replynumber2
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
     $('#replystart').click(function(){
    	 document.getElementById('comm_content').focus();
     })
     function confirmId(){
    	 window.location.reload();
    	 <c:if test="${ empty loginVO}">
	      if(confirm('로그인 후 사용할 수 있습니다\n로그인하시겠습니까?')){
	    	  location.href = "${ pageContext.request.contextPath }/login";
	      }
	      else{
	    	return;  
	      }
	   </c:if>
	   
	  
     }
     <%
     	pageContext.setAttribute("br","<br/>");
     	pageContext.setAttribute("cn","\n");
     %>
</script>
<style>
body{
	font-family: 'Noto Sans KR',sans-serif;
}
.img {
	width: 40%;
	height: auto;
}

div#title {
	text-align: center;
}

span#secondH {
	vertical-align: middle;
	float: none;
}

span#vcnt {
	float: right;
}

table#content {
	width: 70%;
	margin-left: auto;
	margin-right: auto;
}
table#content td{
	line-height: 25px;
}
div#replytitle, div#replyList{
	text-align: center;
}
div#replytitle span{
	float: left;
}

div#replyList span#replyid{
	float: left;
}
div#replyList p#replyContent{
	text-align: left;
}
div#replyList span#replybtn, span#replyeditbtn{
	float: right;
}
div#replyList p#replydate{
	text-align: left;
}
</style>
</head>
<body>
	<header>
		<!-- action include 사용-->
		<jsp:include page="/WEB-INF/jsp/include/bytopMenu.jsp" />
	</header>
	<section>
		<div id="title">
			<br>

			<h2>${ fn:replace(hospital.title, cn, br) }</h2>
			<br>
			<p id="secondH">${ hospital.ctg_name }&emsp;작성자: ${ hospital.memberid }&emsp;${ hospital.wrt_date }</p>
			<span id="vcnt">조회수 : ${ hospital.viewcnt }</span> <br>
			<hr>
			<br> <br>
			<table id="content">
				<tr>
					<td>${fn:replace(hospital.content,cn,br)}<br> <br> <img
						src="${pageContext.request.contextPath}/resources/imageUpload/${ hospital.file_name_key }"
						name="img" id="img" class="img" alt="${ hospital.file_name_key }" /></td>
				</tr>

			</table>
			<br>
			<br>
			<div id="replytitle">
				<span><a href="#comm_content">댓글쓰기</a></span>
			</div>
			
			<div>
				<!-- Reply List {s}-->
				<div class="my-3 p-3 bg-white rounded shadow-sm"
					style="padding-top: 10px">
					<div id="replyList"></div>
				</div>
				<br>
				<!-- Reply List {e}-->
				<!-- Reply Form {s} -->
				<div class="my-3 p-3 bg-white rounded shadow-sm"
					style="padding-top: 10px">
					<form:form name="form" id="form" role="form"
						modelAttribute="replyVO" method="post">
						<form:hidden path="no" id="no" />
						<div class="row">
							<div class="col-sm-10" >
								<form:textarea path="comm_content" id="comm_content"
									class="form-control" rows="3" cols="70" placeholder="댓글을 입력해 주세요"></form:textarea>
							</div>
							<div class="col-sm-2">
								<%-- <form:input path="replyerid" class="form-control" id="replyerid" placeholder="댓글 작성자"></form:input> --%>
								<input type="hidden" name="replyerid" class="form-control"
									id="replyerid" value="${loginVO.memberid}">
								
								<button type="button" class="btn btn-sm btn-secondary" onclick="confirmId()"
									id="btnReplySave" style="width: 100%; margin-top: 20px">
									저 장</button>
							</div>
						</div>
					</form:form>
				</div>
				<!-- Reply Form {e} -->
				<br>
				<c:if test="${ loginVO.memberid eq hospital.memberid }">
					<button id="updateBtn" class="btn btn-default">수정</button>
               &nbsp;&nbsp;&nbsp;
               <button id="delBtn" class="btn btn-default">삭제</button>
               &nbsp;&nbsp;&nbsp;
            </c:if>
            
				<button id="backmain" class="btn btn-default">목록으로</button>
				
			</div>
		</div>
	</section>
	<footer>
		<jsp:include page="/WEB-INF/jsp/include/byfooter.jsp" />
	</footer>
</body>
</html>