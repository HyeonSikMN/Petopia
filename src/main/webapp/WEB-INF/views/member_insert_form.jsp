<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="vo.MemberVO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/member/resources/css/main.css">
<link rel="stylesheet" href="/member/resources/css/member_insert.css">
<title>회원가입 페이지</title>
</head>
<script src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>    
    <script>
    
     		let b_idCheck = false; 
        	let b_nicknameCheck = false;
 
 		function send(f){
     		let id = f.id.value.trim();
 			let nickname = f.nickname.value.trim();
 			let pwd = f.pwd.value.trim();
 			let c_pwd = f.c_password.value.trim();
 			let addr = f.addr.value.trim();
 			let agree = f.agree.value;
 		   
 			
 			//유효성 체크
 			if( id == '' ){
 			  
				alert("id는 필수 입력사항 입니다");
				return;
			}

      //중복체크 여부 확인
			if(b_idCheck == false){
				alert("아이디 중복체크를 해주세요");
				return;
			}
 			
 			if( nickname == '' ){
 				
 				alert('별명을 입력하세요');
 				return;
 			}
 			
 			if( pwd == '' ){
 				
 				alert('비밀번호를 입력하세요');
 				return;
 			}

       if( pwd !==  c_pwd ){
    	  	
 				alert('비밀번호가 다릅니다.');
 				return;
 			}
       if(addr ==''){
	   		
	   		alert('주소는 필수 입력사항 입니다.');
	   		return;
  		}

       if( agree == '' ){
    	   	
 				alert('이용 약관에 모두동의하세요');
 				return;
 			}
      
 			
 			f.action = "insert.do";
 			f.submit();//전송
 		}

    //아이디 중복체크 메서드
		function check_id(){
			let id = document.getElementById("id").value.trim();
			if( id == '' ){
				alert("아이디를 먼저 입력하세요");
				return;
			}
			
			let url = "check_id.do";
			//@, !, _등의 특수문자가 포함된 파라미터를 보내고자 한다면...
			let param = "id=" + encodeURIComponent(id);
			
			//check_id.do?id=aaa
			sendRequest(url, param, resultFunc, "GET");
		}

    //닉네임 중복체크 메서드
    function check_nickname(f){
			let nickname = f.nickname.value;
			if( nickname == '' ){
				alert("닉네임을 먼저 입력하세요");
				return;
			}
			
			let url = "check_nickname.do";
			//@, !, _등의 특수문자가 포함된 파라미터를 보내고자 한다면...
			let param = "nickname=" + encodeURIComponent(nickname);
			
			//check_id.do?id=aaa
			sendRequest(url, param, result2Func, "GET");
		}

    function resultFunc(){
			
			if(xhr.readyState == 4 && xhr.status == 200){
				
				//도착한 데이터를 받는다
				let data = xhr.responseText;
				
				if( data == 'yes' ){
					alert("이미 사용중인 아이디 입니다");
					return;
				}
				
				alert("사용 가능한 아이디 입니다");
				b_idCheck = true;
				
			}
			
		}

    function result2Func(){
		
		if(xhr.readyState == 4 && xhr.status == 200){
			
			//도착한 데이터를 받는다
			let data = xhr.responseText;
			
			if( data == 'yes' ){
				alert("이미 사용중인 닉네임 입니다");
				return;
			}
			
			alert("사용 가능한 닉네임 입니다");
			b_nicknameCheck = true;
			
		}
		
	}
		
		//아이디를 입력받는 input의 값이 변경되면 onchange를 통해 호출되는 함수
		function che(){
			b_idCheck = false;
		}
    	function che2(){
			b_nicknameCheck = false;
		}
		
 	</script>
    <script>
      // 모두 동의 체크 함수
      function toggleCheckAll() {
      var checkboxes = document.querySelectorAll('.agree-checkbox');
      var checkAllCheckbox = document.getElementById('check-all');

      for (var i = 0; i < checkboxes.length; i++) {
        checkboxes[i].checked = checkAllCheckbox.checked;
      }
    }
    </script>
</head>
<body>
    <!-- 상단 네비게이션 바 -->
    <!-- 상단 네비게이션 바 -->
    <nav>
		<ul class="menu">
			<li><img src="/member/resources/image/Logo.jpg" width="80" height="80"
				onclick="window.location.href='list.do'">
			<li><a href="login_form.do">로그인</a>
		</ul>
	</nav>

    <h2>회원가입</h2>
    <form>
      <div>
        <label for="id">아이디:</label>
        <input type="text" id="id" name="id" onchange="che();" placeholder="아이디를 입력하세요"required>
        <button type="button" onclick="check_id();" id="checkBT">중복체크</button>
        <span id="duplicate-msg"></span>
      </div>
      <div>
        <label for="name">닉네임:</label>
        <input type="text" id="nickname" name="nickname" onchange="che2();" placeholder="닉네임을 입력하세요"required>
        <button type="button" onclick="check_nickname(this.form);" id="checkBT">중복체크</button>
      </div>
      <div>
        <label for="password">비밀번호:</label>
        <input type="password" id="pwd" name="pwd" placeholder="비밀번호를 입력하세요"required>
      </div>
      <div>
        <label for="password">비밀번호 확인:</label>
        <input type="password" id="password2" name="c_password" placeholder="비밀번호 확인" required>
      </div>
      <div>
        <label for="addr">주소:</label>
        <input type="text" id="addr" name="addr" placeholder="서울특별시 마포구.." required>
      </div>
      <!-- 정보수집동의 체크박스 -->
      <div class="checkbox-container">
        <label class="checkbox-label">
          <input type="checkbox" id="check-all" name="agree" onchange="toggleCheckAll()">
          <h2>모두 동의합니다.</h2>
        </label>
      </div>
      <div class="checkbox-container">
        <label class="checkbox-label">
          <input type="checkbox" class="agree-checkbox" id="agree1" name="agree1" required>
          <span>개인정보 수집 및 이용에 동의합니다.</span>
        </label>
      </div>
      <div class="checkbox-container">
        <label class="checkbox-label">
          <input type="checkbox" class="agree-checkbox" id="agree2" name="agree2" required>
          <span>서비스 이용 약관에 동의합니다.</span>
        </label>
      </div>
      <div class="checkbox-container">
        <label class="checkbox-label">
          <input type="checkbox" class="agree-checkbox" id="agree3" name="agree3" required>
          <span>마케팅 정보 수신에 동의합니다.</span>
        </label>
      </div>
      <div>       
      	<input type="button" id="ins" onclick="send(this.form)" value="가입하기">
        <input type="button" id="cancel" value="취소" onclick="location.href='list.do'">
      </div>
     </form>
</body>
</html>