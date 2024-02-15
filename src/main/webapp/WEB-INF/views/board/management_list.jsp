<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="vo.MemberVO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>반려동물 관리 팁</title>
<link rel="stylesheet" href="/member/resources/css/main.css">
<link rel="stylesheet" href="/member/resources/css/management_list.css">
<script src="/member/resources/js/httpRequest.js"></script>

</head>
<body>
	<!-- 상단 네비게이션 바 -->
	<nav>
		<ul class="menu">
			<li><img src="/member/resources/image/Logo.jpg" width="80" height="80"
				onclick="window.location.href='list.do'">
				<c:if test="${ not empty user }"> ${ user.nickname }님 환영합니다.</c:if>
			</li>
			<li><a href="board_main.do">게시판</a></li>
			<li><a href="gp_list.do">쇼핑몰</a></li>
			<li>
				<c:choose>
					<c:when test="${ not empty user }"><a href="logout.do">로그아웃</a></c:when>
					<c:otherwise><a href="login_form.do">로그인</a></c:otherwise>
				</c:choose>
			</li>
		</ul>
	</nav>

	<!-- 관리 -->
	<h1>반려동물 관리 팁</h1>

	<div class="management-tips">
		<div class="text-wrapper">
			<h2>반려동물 건강 관리</h2>
			<p>1. 정기적인 동물 병원 방문을 통해 건강 상태를 확인하세요.</p>
			<p>2. 규칙적인 예방 접종 및 내외부 기생충 예방을 실시하세요.</p>
			<p>3. 적절한 식사 및 청결한 물 공급을 유지하세요.</p>
		</div>
		<div class="image-wrapper">
			<img src="/member/resources/images/dogtooth.jpg" alt="반려동물 건강 관리">
		</div>
	</div>

	<div class="management-tips">
		<div class="text-wrapper">
			<h2>반려동물 행동 교육</h2>
			<p>1. 일관된 교육 방법과 보상 체계를 사용하세요.</p>
			<p>2. 긍정적인 강화를 통해 원하는 행동을 강화하세요.</p>
			<p>3. 불필요한 행동에 대한 경고와 무시를 통해 올바른 행동을 독려하세요.</p>
		</div>
		<div class="image-wrapper">
			<img src="/member/resources/images/study.png" alt="반려동물 건강 관리">
		</div>
	</div>

	<div class="management-tips">
		<div class="text-wrapper">
			<h2>반려동물 환경 조성</h2>
			<p>1. 충분한 운동 공간과 적절한 장난감을 제공하세요.</p>
			<p>2. 안전하고 편안한 숙소를 마련하고 청소를 꾸준히 실시하세요.</p>
			<p>3. 동물에게 적합한 실내 및 외부 환경을 조성하세요.</p>
			<div class="image-wrapper-last">
				<img src="/member/resources/images/run.jpg" alt="반려동물 건강 관리">
			</div>
		</div>
	</div>
</body>
</html>