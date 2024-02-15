<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 자세히보기</title>
<link rel="stylesheet" href="/member/resources/css/main.css">
<link rel="stylesheet" href="/member/resources/css/post_list.css">
<script src="/member/resources/js/httpRequest.js"></script>
<script>
	function modify(idx) {
		
		location.href="post_modify_form.do?idx="+idx;

	}

	function delPo(idx) {

		//비밀번호가 일치할 경우 정말 삭제할 것인지 확인
		if (confirm('정말 삭제하시나요?')) {
			alert("삭제가 완료되었습니다.");
			location.href="post_list.do";
		}

		//삭제하고싶은 게시글의 idx번호를 컨트롤러로 전송
		//Ajax기능을 사용
		let url = "post_delete.do";
		let param = "idx= " + idx;
		sendRequest(url, param, resultFn, "get");
		location.reload="post_list.do";
	}
	//Ajax를 통해 요청된 url이 마무리되면
	//현재 페이지로 돌아와 자동으로 호출되는 메서드(콜백 메서드)
	function resultFn(){
		
		if( xhr.readyState == 4 && xhr.status == 200){
	
			let data = xhr.responseText;

			let json = JSON.parse ( data );
			
			alert( json[0].result );
			
			location.href="post_list.do"; //전체 페이지 갱신
		}
	}
</script>
</head>
<body>
	<nav>
		<ul class="menu">
			<li><img src="/member/resources/image/Logo.jpg" width="80"
				height="80" onclick="window.location.href='list.do'"> <c:if
					test="${ not empty user }"> ${ user.nickname }님 환영합니다.</c:if></li>
			<li><a href="board_main.do">게시판</a></li>
			<li><a href="gp_list.do">쇼핑몰</a></li>
			<li><c:choose>
					<c:when test="${ not empty user }">
						<a href="logout.do">로그아웃</a>
					</c:when>
					<c:otherwise>
						<a href="login_form.do">로그인</a>
					</c:otherwise>
				</c:choose></li>
		</ul>
	</nav>


	<div id="main_box">
		<h1>게시물 상세보기</h1>

		<br> <br>
		<div class="board_box">
			<form id="modifyForm" action="post_modify_form.do" method="post">
				<br>
				<div class="type_title">제목: ${post.title}</div>
				<div class="type_content">${post.content}</div>
				<c:if test="${post.filename ne 'no_file'}">
					<img src="resources/upload/${post.filename}" width="200" />
				</c:if>
				<div class="type_date">${post.date}</div>
				<div class="type_animaltype">${post.animaltype}</div>
				<div class="type_section">${post.section}</div>
				<input type="button" value="수정" class="button" id="modifyButton" onclick="modify(${post.idx})">
				<input type="button" value="삭제" class="button" id="deleteButton" onclick="delPo(${post.idx})">
			</form>
		</div>
		<br> <div id="poreturn"><a href="post_list.do">목록으로 돌아가기</a></div>
	</div>
</body>
</html>