<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="vo.MemberVO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글</title>

<link rel="stylesheet" href="/member/resources/css/main.css">
<link rel="stylesheet" href="/member/resources/css/post_list.css">

<script src="/member/resources/js/httpRequest.js"></script>

<script>
	function getPostDetails(idx) {
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
		xhr.open('GET', 'post_detail.do?idx=' + idx, true);
		xhr.send();
	}

	//Ajax를 통해 요청된 url이 마무리되면
	//현재 페이지로 돌아와 자동으로 호출되는 메서드(콜백 메서드)
	function resultFn() {
		if (xhr.readyState == 4 && xhr.status == 200) {

			//컨트롤러부터 return받은 데이터를 읽어오자
			//data = "[{'result':'삭제 성공'}]";
			let data = xhr.responseText;

			//data는 JSON처럼 생긴 단순 문자열 일 뿐이므로
			//이를 실제 JSON구조로 변경해줘야 한다
			let json = eval(data);

			alert(json[0].result);

			location.href = "list.do"; //전체 페이지 갱신
		}
	}
</script>

</head>
<body>
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


	<div id="main_box">
		<h1>게시물 전체보기</h1>
		<br> <br>
		<hr>
		<div id="post-container">
			<h3>게시글 목록:</h3>
			<div id="post-list"></div>
		</div>

		<form action="post_detail.do" method="get">
			<c:forEach var="vo" items="${list}">
				<div class="board_box">
					<br>
					<div class="type_title">제목: ${vo.title}</div>
					<div class="type_content">${vo.content}</div>
					<c:if test="${vo.filename ne 'no_file'}">
						<img src="resources/upload/${vo.filename}" width="200" />
					</c:if>
					<div class="type_regdate">${vo.regdate}</div>
					<div class="type_animaltype">${vo.animaltype}</div>
					<div class="type_section">${vo.section}</div>

					<input type="hidden" name="idx" value="${vo.idx}"> <input
						type="hidden" name="title" value="${vo.title}"> <input
						type="hidden" name="content" value="${vo.content}"> <input
						type="hidden" name="photo" value="${vo.filename}"> <input
						type="hidden" name="date" value="${vo.date}"> <input
						type="hidden" name="animaltype" value="${vo.animaltype}">
					<input type="hidden" name="section" value="${vo.section}">
				 <form action="post_detail.do" method="get">
                  <input type="hidden" name="idx" value="${vo.idx}">
                  <button type="submit">자세히 보기</button>
               </form>
				</div>
			</c:forEach>
		</form>
	</div>
</body>
</html>