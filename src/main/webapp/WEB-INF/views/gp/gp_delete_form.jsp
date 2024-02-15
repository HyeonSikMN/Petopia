<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<script src="/member/resources/js/httpRequest.js"></script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
    font-family: 'Arial', sans-serif;
    background-color: #b4e1fa;
}

.container {
    max-width: 500px;
    margin: 0 auto;
    padding: 20px;
    background-color: #ffffff;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h2 {
    text-align: center;
    color: #333333;
}

.form-group {
    margin-bottom: 20px;
}

label {
    display: block;
    font-size: 16px;
    color: #333333;
}

input[type="text"],
textarea,
input[type="number"],
input[type="file"] {
    width: 100%;
    padding: 10px;
    border: 1px solid #dddddd;
    border-radius: 5px;
    font-size: 16px;
    background-color: #f9f9f9;
}

input[type="checkbox"] {
    margin-right: 5px;
}

.submit-button {
    display: block;
    width: 100%;
    padding: 10px;
    border: none;
    border-radius: 5px;
    background-color: #ff9e85;
    color: #ffffff;
    font-size: 16px;
    font-weight: bold;
    text-align: center;
    cursor: pointer;
}



</style>

<script>
function del(f){

	let pid = f.pid.value;
	
	if( pid == ''){
		alert('상품번호를 입력하세요');
		return
	}
	
	
	f.action = "delete.do";
	f.method = "get";
	f.submit();
	/* location.href="list.do"; */
	
	
}

</script>


</head>
<body>
<div class="container">
        <h2>상품 수정</h2>
        
        <form  method="post" enctype="multipart/form-data">
            
            <div class="form-group">
             	<label for="pid">상품 삭제</label>
            	<input type="text" name="pid" placeHolder="삭제하고싶은 상품의 pid를 입력하세요">
            </div>
            <div colspan="1" align="right">
				<input type="button" value="삭제 하기" onclick="del(this.form);"> 
</div>
        </form>
</div>


</body>
</html>