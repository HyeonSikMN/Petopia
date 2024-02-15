<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>성장일기 작성 페이지</title>
<link rel="stylesheet" href="/member/resources/css/board_write_diary.css">
<script src="/member/resources/js/httpRequest.js"></script>

<script>
		function send( f ){
			
			//let dititle = f.dititle.value;
			//let dicontent = f.dicontent.value;
		
			//유효성 체크
			/* if( dititle == '' ){
				alert('제목을 입력하세요');
				return;
			}
			
			if( dicontent == '' ){
				alert('내용을 입력하세요');
				return;
			}*/
			
			// 동물 유형 선택 체크박스 값을 가져오기
			let dianimalTypes = [];
			let checkboxes = document.getElementsByName('dianimaltype');
			for (let i = 0; i < checkboxes.length; i++) {
				if (checkboxes[i].checked) {
					dianimalTypes.push(checkboxes[i].value);
				}
			}
			// 동물 유형 선택이 최소 1개 이상 선택되었는지 확인
			if (dianimalTypes.length == 0) {
				alert('동물 유형을 선택하세요');
				return;
			}
			
			f.action = "write.do"; //url 맵핑(컨트롤러에서만 가능)
			f.submit(); //전송
		}
	</script>
</head>
<body>
	<h1>반려동물 성장일기</h1>
	<div class="board_box">
		<form method="post" enctype="multipart/form-data">
			<input type="hidden" name="disection" value="${param.section}">
			<input type="hidden" name="animalType" value="">

		<label for="title">제목:</label> <input type="text" id="title"
			name="dititle" required> <label for="content">내용:</label>
		<textarea id="content" name="dicontent" rows="4" cols="50" required></textarea>

		<div class="file-upload">
			<label class="file-label" for="image">파일 첨부:</label> <input
				type="file" id="image" name="image" class="file-input">
		</div>

		<label for="date">날짜:</label> <input type="date" id="date" name="didate"
			required>

		<p>동물 유형 선택</p>
		<label><input id="atype" type="checkbox" name="dianimaltype" value="dog">강아지</label>
		<label><input id="atype" type="checkbox" name="dianimaltype" value="cat">고양이</label>
		<label><input id="atype" type="checkbox" name="dianimaltype" value="mini">소동물</label>
		<label><input id="atype" type="checkbox" name="dianimaltype" value="act">기타</label>

		<input type="submit" value="Diary 작성" onclick="send(this.form);">
	</form>
	</div>
</body>
</html>