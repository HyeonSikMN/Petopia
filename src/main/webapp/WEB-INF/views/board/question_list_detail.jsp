<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="vo.MemberVO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A 자세히보기</title>
<link rel="stylesheet" href="/member/resources/css/question_list.css">
<script src="/member/resources/js/httpRequest.js"></script>
<link rel="stylesheet" href="/member/resources/css/main.css">
<script>
		function send(f){
			
			let content = f.content.value;
			
			 if (content.trim() == "") {
			        alert("댓글 내용을 입력하세요.");
			        return;
			      }
		
			 f.action = "content_insert.do";
			f.submit();
		}	
		function delQa(qaidx) {

			if (!confirm('정말 삭제하시나요?')) {
				return;
			}

			let url = "question_delete.do";
			let param = "qaidx= " + qaidx;
			sendRequest(url, param, resultFn, "get");
		}

		function resultFn() {

			if (xhr.readyState == 4 && xhr.status == 200) {

				let data = xhr.responseText;

				let json = JSON.parse(data);

				alert(json[0].result);

				location.href = "question_list.do"; //전체 페이지 갱신
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
		</div>
	</nav>

	<div id="main_box">
		<h1>게시물 상세보기</h1>

		<br> <br>
		<div class="board_box">
			<br>
			<div class="type_title">제목: ${question.qatitle}</div>
			<br>
			<div class="type_content">${question.qacontent}</div>
			<br>
			<div class="type_regdate">${question.qadate}</div>
			<br>
			<div class="type_animaltype">${question.qaanimaltype}</div>
			<br>
			<div class="type_section">${question.qasection}</div>
			<br>
			<input type="button" value="삭제" class="button" id="deleteButton" onclick="delQa(${question.qaidx})">
		</div>
		<hr>
		<br>
		
		<br>
		<div class="comments">
		<h3>회원댓글</h3>
		<c:forEach var="vo" items="${ list }">
		<div>
			${ vo.content }
		</div>
		</c:forEach>
		</div>
		<h2>댓글</h2>
		<form method="post"class="comments">
			<textarea name="content" rows="4" cols="50"></textarea>
			<input type="hidden" name="postId" value="게시물 ID"> 
			<input type="submit" value="댓글 작성" id="commentsButton" onclick="send(this.form)">
		</form>
		<br> <div id="qareturn"><a href="question_list.do">목록으로 돌아가기</a></div>



	</div>
</body>
</html>