<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>성장일기 수정 페이지</title>
<link rel="stylesheet" href="/member/resources/css/post_modify_form.css">
<script src="/member/resources/js/httpRequest.js"></script>
<script>
		function send( f ){
			let dititle = f.dititle.value;
			let dicontent = f.dicontent.value;
			let dianimaltype = f.dianimaltype.value;
			
			//유효성 체크
			if( dititle == '' ){
				alert('제목을 입력하세요');
				return;
			}
			
			if( dicontent == '' ){
				alert('내용을 입력하세요');
				return;
			}
			
			if (dianimaltype.length == 0) {
			     alert('동물 유형을 선택하세요');
			     return;
			 }
			
			 
			f.action = "diary_modify.do"; //idx=4&name=홍길동&content=내용&pwd=1111
			f.method = "post";
			f.submit(); //전송
		}
	</script>

</head>
<body>
	<h2>게시글 수정</h2>
	<form id="modifyForm" action="diary_modify.do" method="post">
		<input type="hidden" name="diidx" value="${vo.diidx}">
		<div class="form-group">
			<label for="title">제목</label> <input type="text" id="dititle"
				name="dititle" value="${vo.dititle}">
		</div>
		<div class="form-group">
			<label for="content">내용</label>
			<textarea id="dicontent" name="dicontent" rows="5" cols="50">${vo.dicontent}</textarea>
		</div>
		
			<label for="animaltype">동물 유형 선택</label> 
			<label><input type="radio" name="dianimaltype" value="dog" ${vo.dianimaltype == 'dog' ? 'checked' : ''}>강아지</label> 
			<label><input type="radio" name="dianimaltype" value="cat" ${vo.dianimaltype == 'cat' ? 'checked' : ''}>고양이</label> 
			<label><input type="radio" name="dianimaltype" value="mini" ${vo.dianimaltype == 'mini' ? 'checked' : ''}>소동물</label> 
			<label><input type="radio" name="dianimaltype" value="act" ${vo.dianimaltype == 'act' ? 'checked' : ''}>기타</label>
	
		
			<input type="button" value="수정하기" id="modifyButton" onclick="send(this.form);"> 
			<input type="button" value="목록으로" id="listButton" onclick="location.href='diary_list.do'">
		
	</form>
</body>
</html>