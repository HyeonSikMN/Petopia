<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A</title>
<link rel="stylesheet" href="/member/resources/css/main.css">
<link rel="stylesheet" href="/member/resources/css/question_list.css">
<script src="/member/resources/js/httpRequest.js"></script>

<script>
	function getPostDetails(qaidx) {
		// AJAX 요청 생성
		var xhr = new XMLHttpRequest();

		// 응답 받았을 때의 동작 정의
		xhr.onreadystatechange = function() {
			if (xhr.readyState === XMLHttpRequest.DONE) {
				if (xhr.status === 200) {
					// 응답 처리
					var postDetails = JSON.parse(xhr.responseText);
					// 상세 정보를 처리하는 코드 작성 (예: 팝업, 동적으로 내용을 추가하는 등)
					console.log(postDetails);
				} else {
					console.error('AJAX 요청 실패: ' + xhr.status);
				}
			}
		};

		// AJAX 요청 설정
		xhr.open('GET', 'question_detail.do?qaidx=' + qaidx, true);
		xhr.send();
	}

	function resultFn() {
		if (xhr.readyState == 4 && xhr.status == 200) {

			//컨트롤러부터 return받은 데이터를 읽어오자
			//data = "[{'result':'삭제 성공'}]";
			let data = xhr.responseText;

			//data는 JSON처럼 생긴 단순 문자열 일 뿐이므로
			//이를 실제 JSON구조로 변경해줘야 한다
			let json = eval(data);

			alert(json[0].result);

			location.href = "question_list.do"; //전체 페이지 갱신
		}
	}
</script>

</head>
<body>
	<!-- 상단 네비게이션 바 -->
	<nav>
		<ul class="menu">
			<li><img src="/member/resources/image/Logo.jpg" width="80" height="80"
				onclick="window.location.href='list.do'">
				<c:if test="${ not empty user }"> ${ user.nickname }님 환영합니다.</c:if>
			</li>
			<li><a href="board_main.do">게시판</a></li>
			<li><a href="gp_list.do">쇼핑몰</a></li>
			<li>
				<c:choose>
					<c:when test="${ not empty user }"><a href="logout.do">로그아웃</a></c:when>
					<c:otherwise><a href="login_form.do">로그인</a></c:otherwise>
				</c:choose>
			</li>
		</ul>
	</nav>

	<h1>Question & Answer</h1>
	<br>
	<br>
	<hr>
	<br>
	<div id="qa-container">
		<h3>질문과 답변 목록:</h3>
		<div id="posts"></div>
	</div>
	<form action="question_detail.do" method="get">
	<c:forEach var="vo" items="${ qadata }">
	<div id="main_box">
			<div class="board_box">
				<br>
				<div class="type_qatitle">제목: ${ vo.qatitle }</div>
				<div class="type_qacontent">${ vo.qacontent }</div>
				<div class="type_qadate">${ vo.qadate }</div>
				<div class="type_qaanimaltype">${ vo.qaanimaltype }</div>
				<div class="type_qasection">${ vo.qasection }</div>
				<br>
					<input type="hidden" name="qaidx" value="${ vo.qaidx }"> <input
						type="hidden" name="qatitle" value="${ vo.qatitle }"> <input
						type="hidden" name="qacontent" value="${ vo.qacontent }">
					<input type="hidden" name="qadate" value="${ vo.qadate }">
					<input type="hidden" name="qaanimaltype"
						value="${ vo.qaanimaltype }"> <input type="hidden"
						name="qasection" value="${ vo.qasection }">
						<input type="hidden" name="qaidx" value="${vo.qaidx}">
						<button type="submit">자세히 보기</button>			
			</div>
	</div>

	</c:forEach>

	</form>

</body>
</html>