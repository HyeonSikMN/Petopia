<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<%@ page import="vo.MemberVO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>관리자 페이지</title>
<link rel="stylesheet" href="/member/resources/css/main.css">
<script src="/member/resources/js/httpRequest.js"></script>
<style>
/* �ㅽ���쇰��� ���� CSS 肄��� */
body {
	font-family: Arial, sans-serif;
}

.container {
	max-width: 800px;
	margin: 0 auto;
	padding: 20px;
}

h1 {
	text-align: center;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-bottom: 20px;
}

table th, table td {
	padding: 10px;
	text-align: left;
	border-bottom: 1px solid #ddd;
}

.btn {
	display: inline-block;
	padding: 8px 12px;
	background-color: #4CAF50;
	color: #fff;
	text-decoration: none;
	border-radius: 4px;
}

.btn-danger {
	background-color: #f44336;
}

.btn-primary {
	background-color: #2196F3;
}
</style>
<script>
function modify( idx ){
	
	//let f = document.getElementById("my_form");
	
	alert(idx);
	
	
	//f.action = 'modify_form.do;
	//f.submit();//
	location.href="modify_form.do?idx="+idx;
}
		
        function del(idx){
          //idx -> ������怨��띠�� ������ 踰���
          if( !confirm("정말로 삭제 하시겠습니까?") ){
            return;
          }
          
          let url = "member_del.do";
          let param = "idx=" + idx;
          sendRequest(url, param, resultFn, "GET");
        }
        
        //肄�諛깅�����
        function resultFn(){
          
          if( xhr.readyState==4 && xhr.status == 200 ){
            
            let data = xhr.responseText;
    
            if( data == "1" ){
              alert("삭제성공");
            }else{
              alert("삭제실패");
            }
            
            location.href="list.do";
            
          }
          
        }
      </script>
</head>
<body>
	<nav>
		<ul class="menu">
			<li><img src="/member/resources/image/Logo.jpg" width="80" height="80"
				onclick="window.location.href='list.do'">
			</li>
		</ul>
	</nav>
	<h1 text-align="center">관리자페이지</h1>
	<hr>
	<h2>고객DB조회</h2>
	
	
	<div>
	<form id="my_form">
	
		<table border="1" align="center">
			<caption>회원목록</caption>
			
			<tbody>
				<!-- 怨�媛� DB �곗�댄�곕�� �����쇰� 異��� -->
				<tr>
					<td colspan="7" align="center"></td>
				</tr>

				<tr>
					<th>회원번호</th>
					<th>닉네임</th>
					<th>아이디</th>
					<th>비밀번호</th>
					<th colspan="3">주소</th>
				</tr>

				

				<c:forEach var="vo" items="${ list }">
				
					<tr>
						<td>${vo.idx }</td>
						<td>${vo.nickname }</td>
						<td>${vo.id }</td>
						<td>${vo.pwd }</td>
						<td>${vo.addr }</td>
					
						<td>
							<input type="button" value="삭제" onclick="del('${vo.idx}')"/>
							<input type="button" value="수정" onclick="modify('${vo.idx}');"/>
						</td>	
					</tr>		
				</c:forEach>
				
				
		
		</tbody>
		</table>
		</form>
	</div>
	
	<hr>
	
	<h2>쇼핑몰</h2>
	<input type="button" value="상품추가" onclick="location.href='addproduct_form.do'">
	<input type="button" value="상품수정" onclick="location.href='delete_modify_form.do'">
    <input type="button" value="상품삭제" onclick="location.href='delete_form.do'">




</body>
</html>