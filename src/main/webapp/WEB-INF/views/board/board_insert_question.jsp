<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A 작성 페이지</title>
<link rel="stylesheet" href="/member/resources/css/board_write_question.css">
<script src="/member/resources/js/httpRequest.js"></script>

<script>
	function send(f) {

		let qatitle = f.qatitle.value;
		let qacontent = f.qacontent.value;

		// 유효성 체크
		if (qatitle === '') {
			alert('제목을 입력하세요');
			return;
		}

		if (qacontent === '') {
			alert('내용을 입력하세요');
			return;
		}

		// 동물 유형 선택 체크박스 값을 가져오기
		let qaanimalTypes = [];
		let checkboxes = document.getElementsByName('qaanimaltype');
		for (let i = 0; i < checkboxes.length; i++) {
			if (checkboxes[i].checked) {
				qaanimalTypes.push(checkboxes[i].value);
			}
		}
		// 동물 유형 선택이 최소 1개 이상 선택되었는지 확인
		if (qaanimalTypes.length == 0) {
			alert('동물 유형을 선택하세요');
			return;
		}

		f.action = "qainsert.do"; //url 맵핑(컨트롤러에서만 가능)
		f.submit();

	}
</script>
</head>
<body>
	<h1>Q&A 작성</h1>
	<div class="board_box">
		<form method="post" enctype="multipart/form-data">

			<label for="title">제목:</label> <input type="text" id="title"
				name="qatitle" required> <label for="content">내용:</label>
			<textarea id="content" name="qacontent" rows="4" cols="50" required></textarea>

			<label for="date">날짜:</label> <input type="date" id="date"
				name="qadate" required> <input type="hidden"
				name="qasection" value="${param.section}">

			<p>동물 유형 선택</p>
			<label><input type="checkbox" name="qaanimaltype" value="dog">강아지</label>
			<label><input type="checkbox" name="qaanimaltype" value="cat">고양이</label>
			<label><input type="checkbox" name="qaanimaltype" value="mini">소동물</label>
			<label><input type="checkbox" name="qaanimaltype" value="act">기타</label>
			<input type="submit" value="작성" onclick="send(this.form);">
		</form>
	</div>
</body>
</html>