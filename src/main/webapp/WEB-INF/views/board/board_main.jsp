<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="vo.MemberVO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>

<link rel="stylesheet" href="/member/resources/css/main.css">
<link rel="stylesheet" href="/member/resources/css/board.css">
<link rel="stylesheet" href="/member/resources/css/board_new.css">
<script src="/member/resources/js/httpRequest.js"></script>

<!-- 동물 유형 선택 -->
<script>
	var selectedAnimals = [];

	function toggleAnimalSelection(checkbox) {
		var animal = checkbox.value;

		if (checkbox.checked) {
			selectedAnimals.push(animal);
		} else {
			var index = selectedAnimals.indexOf(animal);
			if (index !== -1) {
				selectedAnimals.splice(index, 1);
			}
		}
	}

	function applySelection() {
		if (selectedAnimals.length > 0) {
			var selectedAnimalText = "선택된 동물 유형: " + selectedAnimals.join(", ");
			showSelectedAnimals(selectedAnimalText);
		} else {
			alert("동물 유형을 선택해주세요.");
		}
	}

	function showSelectedAnimals(selectedAnimalText) {
		alert(selectedAnimalText);
	}
	
	// 초기 게시글 목록 표시
	//displayPostList(posts);

	// 라디오 버튼 변경 시 이벤트 처리
	var sortOptions = document.getElementsByName("sort-option");

	sortOptions.forEach(function(option) {
		option.addEventListener("change", function() {
			var selectedOption = document
					.querySelector('input[name="sort-option"]:checked').value;
			var sortedPosts = sortPosts(posts, selectedOption);
			displayPostList(sortedPosts);
		});
	});

	// 게시글 목록을 정렬하여 보여주는 함수
	function sortPosts(posts, option) {
		var sortedPosts = [];

		if (option === "latest") {
			sortedPosts = posts.slice().sort(function(a, b) {
				return new Date(b.date) - new Date(a.date);
			});
		} else if (option === "popular") {
			sortedPosts = posts.slice().sort(function(a, b) {
				return b.views - a.views;
			});
		}

		return sortedPosts;
	}

	// 게시글 목록을 화면에 표시하는 함수
	function displayPostList(posts) {
		var postListContainer = document.getElementById("post-list-container");
		postListContainer.innerHTML = "";

		posts.forEach(function(post) {
			var postElement = document.createElement("div");
			postElement.classList.add("post-list");
			postElement.textContent = post.title;
			postListContainer.appendChild(postElement);
		});
	}
	
	// 게시글을 작성을 선택하는 함수
	function showSection() {
		
		let section = document.getElementById("pageSelect").value;

		if (section !== "") {
			location.href = "move_selected.do?section="+section;
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


	<div>
		<ul class="board">
			<li><a href="post_list.do">Post</a></li>
			<li><a href="question_list.do">Question</a></li>
			<li><a href="management_list.do">Management</a></li>
			<li><a href="diary_list.do">Diary</a></li>
		</ul>
	</div>
	
	<div class="write_post">
		<h3 class="write_post_2">글쓰기</h3>
		<select id="pageSelect">
			<option value="">글쓰기 종류를 선택하세요</option>
			<option value="post">Post</option>
			<option value="question">Question</option>
			<option value="diary">Diary</option>
		</select>
		<button onclick="showSection()" class="goToPage">이동</button>
	</div>

	 <section id="shop">
            <form>
            <div class="shop-container">
                <div class="sectionHead"></div>
                <hr>
                <br>
                <div class="row">
                    <div class="column1">
                        <div class="item-box">
                            <div class="item-box-img">
                                <img src="/member/resources/image/dogmain.png">
                            </div>
                           
                            <div class="item-box-head">강아지</div>
                            <div class="item-box-sub-text"></div>
                            <button class="btn item-box-btn" onclick="dogbutton(this.form)">관련 글 보기</button>
                        </div>
                    </div>
                    <div class="column1">
                        <div class="item-box">
                            <div class="item-box-img">
                                <img src="/member/resources/image/catmain.png">
                            </div>
                            <div class="item-box-head">고양이</div>
                            <div class="item-box-sub-text"></div>
                            <button class="btn item-box-btn" onclick="catbutton(this.form)">관련 글 보기</button>
                        </div>
                    </div>
                    <div class="column1">
                        <div class="item-box">
                            <div class="item-box-img">
                                <img src="/member/resources/image/smallmain.png">
                            </div>
                            <div class="item-box-head">소동물</div>
                            <div class="item-box-sub-text"></div>
                            <button class="btn item-box-btn" onclick="smallbutton(this.form)">관련 글 보기</button>
                        </div>
                    </div>
                    <div class="column1">
                        <div class="item-box">
                            <div class="item-box-img">
                                <img src="/member/resources/image/birdmain.png">
                            </div>
                            <div class="item-box-head">기타 동물</div>
                            <div class="item-box-sub-text"></div>
                            <button class="btn item-box-btn" onclick="etcbutton(this.form)">관련 글 보기</button>
                        </div>
                    </div>
                </div>
         </div>
            </form>
            </section>

	<br>
	<br>

	<!-- 게시글 목록 -->
	<div id="post-list-container"></div>

	<hr>

	<!-- 게시글 목록 -->
	<div id="post-list-container"></div>

</body>
</html>