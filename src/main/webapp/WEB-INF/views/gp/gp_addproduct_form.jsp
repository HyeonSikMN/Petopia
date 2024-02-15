<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
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
	function send(f){
		let name = f.productname.value;
		let detail = f.productdetail.value;
		let price = f.price.value;
		
		alert(f.photo.value);
		
		if( name == ''){
			alert('상품명을 입력하세요');
			return;
		}
		if( detail == ''){
				alert('상품설명을 입력하세요');
				return;
			}
		if( price == ''){
				alert('가격을 입력하세요');
				return;
			}
		f.action = "addproduct.do";
		f.submit();
	}
	
	
</script>

<head>
    <meta charset="UTF-8">
    <title>Add Product</title>
    <!-- <link rel="stylesheet" type="text/css" href="css/style.css"> -->
    
    <!--  관리자게시판에 상품추가 버튼이 들어가야함
    	<input type="button" value="상품추가" onclick="location.href='addproduct_form.do'">
    	임시로 쇼핑몰 메인에 넣어서 테스트해놨으니 나중에 버튼 지워야함
     -->
    
</head>

<body>

<form  method="post" enctype="multipart/form-data">
    <div class="container">
        <h2>상품 추가</h2>
             <%-- <div class="form-group">
             	<label for="pid">상품번호(pid)</label>
            	<input type="text" name="pid" value="${vo.pid }">
            </div> --%>
         
            <div class="form-group">
                <label for="productname">상품명:</label>
                <input type="text" id="productname" name="productname" >
            </div>
            
            <div class="form-group">
                <label for="species">펫타입:</label>
                <select id="species" name="species">
                	<option value="dog">강아지</option>
                	<option value="cat">고양이</option>
            	</select>
            </div>

            
            <div class="form-group">
                <label for="category">카테고리:</label>
               		 <select id="category" name="category">
                	 	<option value="feed">사료</option>
                		<option value="leash">목줄&amp;가슴줄</option>
                		<option value="pad">배변패드</option>
                		<option value="cloth">의류</option>
            		</select>
            </div>

            <div class="form-group">
                <label for="price">상품 가격:</label>
                <input type="text" id="price" name="price"   required>
            </div>

            <div class="form-group">
                <label for="productdetail">상품설명:</label>
                <pre><textarea id="productdetail" name="productdetail">${vo.productdetail }</textarea></pre>
            </div>

            <div class="form-group">
                <label for="filename">Image:</label>
                <input type="file" id="filename" name="photo">
            </div>
            
            <div class="type_regdate">${vo.regdate }</div>
            
             <div class="form-group">
            	<label type="hidden" for="popularity"></label>
            	<input type="hidden" name="popularity" value="${vo.popularity }">
            </div>
            
			<div>
				
            	<input type="button" value="상품 등록" onclick="send(this.form);">
            	<input type="button" value="목록으로" onclick="location.href='list.do'">  <!-- 관리자페이지 메인 링크를 넣어야함 -->
        	</div>
        
    </div>
    </form>
</body>
</html>
