<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정 페이지</title>
<link rel="stylesheet" href="/member/resources/css/post_modify_form.css">
<script src="/member/resources/js/httpRequest.js"></script>
<script>
		function send( f ){
			let title = f.title.value;
			let content = f.content.value;
			let animaltype = f.animaltype.value;
			
			//유효성 체크
			if( title == '' ){
				alert('제목을 입력하세요');
				return;
			}
			
			if( content == '' ){
				alert('내용을 입력하세요');
				return;
			}
			
			if (animaltype.length == 0) {
			     alert('동물 유형을 선택하세요');
			     return;
			 }
			
			 
			f.action = "post_modify.do"; //idx=4&name=홍길동&content=내용&pwd=1111
			f.method = "post";
			f.submit(); //전송
		}
	</script>

</head>
<body>
	<h2>게시글 수정</h2>
	<form id="modifyForm" action="post_modify.do" method="post">
		<input type="hidden" name="idx" value="${vo.idx}">
		<div class="form-group">
			<label for="title">제목</label> <input type="text" id="title"
				name="title" value="${vo.title}">
		</div>
		<div class="form-group">
			<label for="content">내용</label>
			<textarea id="content" name="content" rows="5" cols="50">${vo.content}</textarea>
		</div>
		
			<label for="animaltype">동물 유형 선택</label> 
			<label><input type="radio" name="animaltype" value="dog" ${vo.animaltype == 'dog' ? 'checked' : ''}>강아지</label> 
			<label><input type="radio" name="animaltype" value="cat" ${vo.animaltype == 'cat' ? 'checked' : ''}>고양이</label> 
			<label><input type="radio" name="animaltype" value="mini" ${vo.animaltype == 'mini' ? 'checked' : ''}>소동물</label> 
			<label><input type="radio" name="animaltype" value="act" ${vo.animaltype == 'act' ? 'checked' : ''}>기타</label>
	
		
			<input type="button" value="수정하기" id="modifyButton" onclick="send(this.form);"> 
			<input type="button" value="목록으로" id="listButton" onclick="location.href='post_list.do'">
		
	</form>
</body>
</html>