<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="vo.MemberVO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<link rel="stylesheet" href="/member/resources/css/main.css">
<link rel="stylesheet" href="/member/resources/css/login.css">
<script src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

<script>
	function send(f){
			//유효성 체크 했다 쳐
			
			let url = "login.do";
			let param = "id="+f.id.value+"&pwd="+encodeURIComponent(f.pwd.value);
			//login.do?id=aaa&pwd=1111
			sendRequest(url, param, resFn, "post");
	}
	
	function resFn(){
		if(xhr.readyState==4 && xhr.status==200){
			
			var data = xhr.responseText;
			
			// data를 JSON구조로 파싱
			let json = eval(data);
			
			//json = [['res':'no_id']]
			if(json[0].res=='no_id'){
				alert("아이디가 존재하지 않습니다");
			}else if(json[0].res=='no_pwd'){
				alert("비밀번호가 일치하지 않습니다");
			}else{
				location.href="clear.do";
			}
		}
	}
</script>

</head>
  <body>
    <!-- 상단 네비게이션 바 -->
   <nav>
		<ul class="menu">
			<li><img src="/member/resources/image/Logo.jpg" width="80" height="80"
				onclick="window.location.href='list.do'">
			</li>
		</ul>
      </nav>

    <form class="login-form">
        <div class="logoimg">
          <!-- 로고 이미지 삽입2 -->
          <img src="/member/resources/image/Logo.jpg" alt="Logoimg">
        </div>
        
        <div>
          <label for="username">아이디</label>
          <input type="text" id="id" name="id" required><br><br>
          <label for="password">비밀번호 </label>
          <input type="password" id="pwd" name="pwd" required><br><br>

         <input type="submit" value="로그인" class="loginBT" onclick="send(this.form);">
         <input type="button" class="join-link" value="회원가입" onclick="location.href='member_insert_form.do';" >
      
         <br><br>
        
		<!-- 네이버 로그인 버튼 노출 영역 -->
        <div class="naver_id_login" id="naver_id_login"></div>
        <!-- //네이버 로그인 버튼 노출 영역 -->
        <script type="text/javascript">
            var naver_id_login = new naver_id_login("qGBCgbmGoSiWDMttVZEo", "https://localhost:5500/petopia/callback.html");
            var state = naver_id_login.getUniqState();
            naver_id_login.setButton("white", 5,41);
            naver_id_login.setDomain("YOUR_SERVICE_URL");
            naver_id_login.setState(state);
            naver_id_login.setPopup();
            naver_id_login.init_naver_id_login();
        </script>
        
        <!-- 카카오 로그인  -->
        <script src="https://t1.kakaocdn.net/kakao_js_sdk/2.2.0/kakao.min.js"
        integrity="sha384-x+WG2i7pOR+oWb6O5GV5f1KN2Ko6N7PTGPS7UlasYWNxZMKQA63Cj/B2lbUmUfuC" crossorigin="anonymous"></script>
        <script>
        Kakao.init('63812e0f6f352ce94c39f3c7a65bc2b1'); // 사용하려는 앱의 JavaScript 키 입력
        </script>

        <a id="kakao-login-btn" href="javascript:loginWithKakao()">
        <img src="https://k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg" width="190" height="41"
            alt="카카오 로그인 버튼" />
        </a>
        <p id="token-result"></p>

        <script>
        function loginWithKakao() {
            Kakao.Auth.authorize({
            redirectUri: 'http://127.0.0.1:5500/petopia/kakao_login.html',
            });
        } 

    // 아래는 데모를 위한 UI 코드입니다.
    displayToken()
    function displayToken() {
        var token = getCookie('authorize-access-token');

        if(token) {
        Kakao.Auth.setAccessToken(token);
        Kakao.Auth.getStatusInfo()
            .then(function(res) {
            if (res.status === 'connected') {
                document.getElementById('token-result').innerText
                = 'login success, token: ' + Kakao.Auth.getAccessToken();
            }
            })
            .catch(function(err) {
            Kakao.Auth.setAccessToken(null);
            });
        }
    }

    function getCookie(name) {
        var parts = document.cookie.split(name + '=');
        if (parts.length === 2) { return parts[1].split(';')[0]; }
    }
    </script>
    </div>
</form>
        <footer>
            &copy; PETOPIA Corp. All rigths reserved.
        </footer>
</body>
</html>