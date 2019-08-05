<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
</script>

<div class="navbar-wrapper">
	<div class="container">

		<nav class="navbar navbar-inverse navbar-static-top">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#navbar" aria-expanded="false"
						aria-controls="navbar">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="${pageContext.request.contextPath}/">삐용삐용</a>
				</div>
				<div id="navbar" class="navbar-collapse collapse">
					<ul class="nav navbar-nav">
						<li><a href="hello.jsp">병원검색</a></li>
						<li><a href="${pageContext.request.contextPath}/hospitalboard">병원게시판</a></li>
						<li><a href="#contact">증상게시판</a></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-expanded="false">마이페이지
								<span class="caret"></span>
						</a>
							<ul class="dropdown-menu" role="menu">
								<li><a href="#">Action</a></li>
								<li><a href="#">Another action</a></li>
								<li><a href="#">Something else here</a></li>
								<li class="divider"></li>
								<li class="dropdown-header">Nav header</li>
								<li><a href="#">Separated link</a></li>
								<li><a href="#">One more separated link</a></li>
							</ul></li>
					</ul>
				</div>
			</div>
		</nav>

	</div>
</div>
