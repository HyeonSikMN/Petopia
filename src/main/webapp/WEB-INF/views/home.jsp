<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
<%@ page import="vo.MemberVO" %>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/member/resources/css/home.css">
<script src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>
<meta charset="utf-8">
<title>Petopia</title>
<script>
  // 최신소식 더보기 기능
  function showHiddenElement() {
    var hiddenElement = document.querySelector('.bottom-news');
    hiddenElement.style.display = 'inline-flex';
  }
  // 최신소식 더보기 닫기
  function returnNone() {
    var hiddenElement = document.querySelector('.bottom-news');
    hiddenElement.style.display = 'none';
  }
  function goMenu(){
	  alert("로그인 후 이용해주세요.");
	  location.href="login_form.do";
  }
</script>
</head>
<body>
	<!-- 상단 네비게이션 바 -->
	<nav>
		<ul class="menu">
			<li><img src="/member/resources/image/Logo.jpg" width="80" height="80"
				onclick="window.location.href='list.do'">
				<c:if test="${ not empty user }"> ${ user.nickname }님 환영합니다.</c:if>
			</li>
			<c:if test="${ empty user }">
			<li><a href="#" onclick="goMenu();">게시판</a></li>
			<li><a href="#" onclick="goMenu();">쇼핑몰</a></li>
			</c:if>
			<c:if test="${ not empty user }">
			<li><a href="board_main.do">게시판</a></li>
			<li><a href="gp_list.do">쇼핑몰</a></li>
			</c:if>
			<c:if test="${ empty user }">
			<li><a href="member_insert_form.do">회원 가입</a></li>
			</c:if>
			<li>
				<c:choose>
					<c:when test="${ not empty user }"><a href="logout.do">로그아웃</a></c:when>
					<c:otherwise><a href="login_form.do">로그인</a></c:otherwise>
				</c:choose>
			</li>
		</ul>
	</nav>

	<div>
		<video src="/member/resources/image/Video.mp4" autoplay loop muted width="1920" height="1080"></video>
	</div>

	<!-- 배너 -->
	<div class="banner">
		<!-- 배너 이미지와 내용 추가 -->
	</div>

	<!-- 소개 섹션 -->
	<section class="introduction">
		<h2>Welcome to Petopia!</h2>
		<p>우리는 반려동물에 대한 정보와 경험을 공유하는 공간입니다.</p>
		<!-- 추가 내용 작성 -->
	</section>

	<!-- 최신 소식 -->
	<section class="latest-news">
		<h3>알아두면 쓸모있는 신비한 반려사전</h3>
		<ul class="news-wrapper">
			<div class="top-news">
				<li class="news">
				<h4>"제가 핥는 데는 이유가 있어요"</h4>
					<img src="/member/resources/image/tip1.png" width="150" height="150">
					<p>작성일: 2022-05-26</p>
					<p><a href="https://blog.naver.com/wlgus2123526/222747160357">강아지들이 핥는 여러가지 이유</a></p>
				</li>
				<li class="news">
					<h4>"왈왈!" 짖는 이유</h4>
					<img src="/member/resources/image/tip2.png" width="150" height="150">
					<p>작성일: 2023-04-24</p>
					<p><a href="https://blog.naver.com/yourns/223083683941">강아지가 짖는 이유, 짖음 방지 교육 방법은?</a></p>
				</li>
				<li class="news">
					<h4>반려묘 트레이닝 Tip!</h4> 
					<img src="/member/resources/image/tip3.jpg" width="150" height="150">
					<p>작성일: 2018-09-12</p>
					<p><a href="https://korean.mercola.com/sites/articles/archive/2018/09/12/%EA%B3%A0%EC%96%91%EC%9D%B4%EC%99%80-%EC%82%B0%EC%B1%85.aspx">반려묘와 안전하게 산책하기</a></p>
				</li>
				<li class="news">
					<h4>"우리 댕댕이 펫보험 어떻게 가입하나요?"</h4> 
					<img src="/member/resources/image/tip4.jpg" width="150" height="150">
					<p>작성일: 2022-08-20</p>
					<p><a href="https://blog.naver.com/blogseason/222862076086">반려동물 천만 시대, 펫보험은 들으셨나요?</a></p>
				</li>
				<button onclick="showHiddenElement()" class="more-button">더보기</button>
			</div>
			<div class="bottom-news">
				<!-- 추가 소식 작성 -->
				<li class="news">
					<h4>"갈 수 있어! 강아지도"</h4> 
					<img src="/member/resources/image/tip5.jpg" width="150" height="150">
					<p>작성일: 2023-05-13</p>
					<p><a href="https://campaign.naver.com/puppymap/?pcode=naver_pcserp_map_puppy_i">전국 애견동반 장소 3만개 다모았댕</a></p>
				</li>
				<li class="news">
					<h4>나도 이제는 어엿한 집사!</h4> 
					<img src="/member/resources/image/tip6.jpg" width="150" height="150">
					<p>작성일: 2016-06-07</p>
					<p><a href="https://www.hillspet.co.kr/cat-care/training/tips-for-kitten-proofing-your-home">쉽고 간단한 반려묘 맞을 준비 10가지</a></p>
				</li>
				<li class="news">
					<h4>이건 먹으면 안돼!!!</h4> 
					<img src="/member/resources/image/tip7.jpg" width="150" height="150">
					<p>작성일: 2022-06-28</p>
					<p><a href="https://adeukes.tistory.com/1346">반려동물이 먹으면 안되는 간식 10가지</a></p>
				</li>
				<li class="news">
					<h4>[펫라이프]반려동물 기본 상식</h4> 
					<img src="/member/resources/image/tip8.jpg" width="150" height="150">
					<p>작성일: 2022-06-20</p>
					<p><a href="https://www.fnnews.com/news/202206221550122844">필독! 반려동물 예방접종의 모든것</a></p>
				</li>
				<button onclick="returnNone()" class="close-button">닫기</button>
			</div>
		</ul>
	</section>

	<!-- 반려동물 사진 갤러리 -->
	<section class="pet-gallery">
		<div class="gallery-content">
		<h3>반려동물 사진 갤러리</h3>
		<!-- 사진들을 그리드나 슬라이더 형식으로 추가 -->
		<article>
			<aside>
				<div class="slideshow-container">
					<div class="slide">
						<img src="/member/resources/image/gallery1.jpg" alt="이미지 1" width="550" height="550">
					</div>
					<div class="slide">
						<img src="/member/resources/image/gallery2.jpg" alt="이미지 2" width="550" height="550">
					</div>
					<div class="slide">
						<img src="/member/resources/image/gallery3.jpg" alt="이미지 3" width="550" height="550">
					</div>
					<div class="slide">
						<img src="/member/resources/image/gallery4.jpg" alt="이미지 4" width="550" height="550">
					</div>
					<div class="slide">
						<img src="/member/resources/image/gallery5.jpg" alt="이미지 5" width="550" height="550">
					</div>
					<div class="slide">
						<img src="/member/resources/image/gallery6.jpg" alt="이미지 6" width="550" height="550">
					</div>
					<div class="slide">
						<img src="/member/resources/image/gallery7.jpg" alt="이미지 7" width="550" height="550">
					</div>
				</div>
			</aside>
		</article>
		</div>
		<div class="banner-content">
     	 	<aside class="banner">
         	<div class="hori-banner"> 
         		<img src="/member/resources/image/banner1.png" alt="가로 배너 이미지">
				<div class="banner-text">
				  <h2>최신 기사</h2>
				  <p><a href="https://www.ichannela.com/news/main/news_detailPage.do?publishId=000000353361">보호? 학대? …말 뿐인 유기견 보호소</a></p>
				  <p><a href="https://newsis.com/view/?id=NISX20230707_0002367725&cID=10201&pID=10200">수의사 처방 없는 동물약품 판매 금지…헌재 "합헌"</a></p>
				  <p><a href="https://www.news1.kr/articles/5099775">"반려동물을 위한 여름 선물"…쿠팡, 11일까지 '펫스티벌' 진행</a></p>
				</div>         	
         	</div>
        	<div class="veri-banner">
         		<img src="/member/resources/image/veri-banner.png" alt="세로 배너 이미지">
        	</div>
      		</aside>
    	</div>
	</section>

	<!-- 이용 안내 및 연락처 -->
	<footer class="footer">
		<section class="contact">
			<h3>Petopia</h3>
			<p>
				(주) Petopia | 사업자등록번호 432-86-00569 | 대표이사 : 박지영 | 개인정보관리책임자 : 이영웅<br>
				서울특별시 마포구 노고산동 106-5 <br> Tel : 010.8617.7436 월-금 (10:00 -
				19:00) Email : web&app@korea.com <br> © 2023 Petopia Inc. All
				Rights Reserved.
			</p>
			<c:if test="${user.id eq 'admin'}">
				<a href="admin.do">관리자모드로 이동</a>
			</c:if>
		</section>
	</footer>
	<!-- JavaScript 코드를 여기에 추가 -->
	<script>
    // JavaScript 코드 작성
  </script>
	<script>
    const slides = document.querySelectorAll('.slide');
let currentSlide = 0;

function showSlide() {
slides[currentSlide].classList.add('active');
}

function hideSlides() {
slides.forEach(slide => {
slide.classList.remove('active');
});
}

function nextSlide() {
hideSlides();
currentSlide = (currentSlide + 1) % slides.length;
showSlide();
}

setInterval(nextSlide, 3000); // 슬라이드 변경 간격 (3초)

showSlide(); // 초기 슬라이드 표시

</script>
</body>
</html>