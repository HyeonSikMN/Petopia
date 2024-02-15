<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정페이지</title>
<script>
 		function send(f){
 			let id = f.id.value;
 			let nickname = f.nickname.value;
 			let pwd = f.pwd.value;
 			let addr = f.addr.value;
 			
 			//유효성 체크
 			if( id == '' ){
 				alert('아이디를 입력하세요');
 				return;
 			}
 			
 			if( nickname == '' ){
 				alert('닉네임을 입력하세요');
 				return;
 			}
 			
 			if( pwd == '' ){
 				alert('비밀번호를 입력하세요');
 				return;
 			}
 			if( addr == '' ){
 				alert('주소를 입력하세요');
 				return;
 			}
 			
 			f.action = "member_modify.do";//?idx=4&name=홍길&content=내용&pwd=1111
 			f.method = "post";
 			f.submit();//전송
 		}
 	</script>
</head>
<body>
	<form>
		<table border="1" align="center">
			<input type="hidden" name="idx" value="${vo.idx}">
			
			<caption>::: 회원 정보 수정 :::</caption>
			
			<tr>
				<th>ID</th>
				<td><input name="id" type="text" value="${ vo.id }"></td>
			</tr>
			
			<tr>
				<th>NICKNAME</th>
				<td><input name="nickname"  type="text" value= "${ vo.nickname }"></td>
			</tr>
			
			<tr>
				<th>PWD</th>
				<td><input type="text" name="pwd" value="${vo.pwd}"></td>
			</tr>
			<tr>
				<th>ADDR</th>
				<td><input type="text" name="addr" value="${vo.addr}"></td>
			</tr>
			
			<tr>
				<td colspan="2" align="right">
					<input type="button" value="수정하기" onclick="send(this.form);">
					<input type="button" value="관리자모드로" 
					       onclick="location.href='admin.do'">
				</td>
			</tr>
			
		</table>
	</form>
</body>
</html>