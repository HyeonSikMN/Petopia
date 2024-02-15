<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="vo.MemberVO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>성장일기 자세히보기</title>
<link rel="stylesheet" href="/member/resources/css/main.css">
<link rel="stylesheet" href="/member/resources/css/diary_list.css">
<script src="/member/resources/js/httpRequest.js"></script>
<script>
	function modify(diidx) {	
	
		location.href="diary_modify_form.do?diidx="+diidx;

	}

	function delDi(diidx) {

		//비밀번호가 일치할 경우 정말 삭제할 것인지 확인
		if (confirm('정말 삭제하시나요?')) {
			alert("삭제가 완료되었습니다.");
			location.href="diary_list.do";
		}

		//삭제하고싶은 게시글의 idx번호를 컨트롤러로 전송
		//Ajax기능을 사용
		let url = "diary_delete.do";
		let param = "diidx= " + diidx;
		sendRequest(url, param, resultFn, "get");
		location.reload="diary_list.do";
	}
	//Ajax를 통해 요청된 url이 마무리되면
	//현재 페이지로 돌아와 자동으로 호출되는 메서드(콜백 메서드)
	function resultFn(){
	
		if( xhr.readyState == 4 && xhr.status == 200){
		
			let data = xhr.responseText;

			let json = JSON.parse ( data );
		
			alert( json[0].result );
		
			location.href="diary_list.do"; //전체 페이지 갱신
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
		<h1>반려동물 성장일기 글 상세보기</h1>

		<br> <br>
		<div class="board_box">
			<form id="modifyForm" action="diary_modify_form.do" method="post">
				<br>
				<div class="type_dititle">제목: ${didiary.dititle}</div>
				<div class="type_dicontent">${didiary.dicontent}</div>
				<c:if test="${didiary.difilename ne 'no_file'}">
					<img src="resources/upload/${didiary.difilename}" width="200" />
				</c:if>
				<div class="type_didate">${didiary.didate}</div>
				<div class="type_dianimaltype">${didiary.dianimaltype}</div>
				<div class="type_disection">${didiary.disection}</div>
				<input type="button" value="수정" class="button" id="modifyButton" onclick="modify(${didiary.diidx})">
				<input type="button" value="삭제" class="button" id="deleteButton" onclick="delDi(${didiary.diidx})">
			</form>
		</div>
		<br> <div id="direturn"><a href="diary_list.do">목록으로 돌아가기</a></div>
	</div>
</body>
</html>