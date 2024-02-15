<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
	
	<%@ page import="vo.MemberVO" %>

<!DOCTYPE html>
<html>

<script src="/member/resources/js/httpRequest.js"></script>
<link rel="stylesheet" href="/member/resources/css/main.css">
<link rel="stylesheet" href="/member/resources/css/gp.css">

<script>
	
	function web(url) {
		window.location.href = url;
	}
	function feedbutton(f) {
		f.action = "feedlist.do";
		f.method = "post";
		f.submit();
	}
	function leashbutton(f) {
		f.action = "leashlist.do";
		f.method = "post";
		f.submit();
	}
	function padbutton(f) {
		f.action = "padlist.do";
		f.method = "post";
		f.submit();
	}
	function clothbutton(f) {
		f.action = "clothlist.do";
		f.method = "post";
		f.submit();
	}
	
	
	
</script>

<head>
<meta charset="UTF-8">
<title>(주) Petopia</title>
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
		
      <form align="center";>
  		<input type="text" value="search your item">
  		<input type="submit" value="search">
  	</form>
    </nav>
 
 
 
      <section id="shop">
            <form>
            <div class="container">
                <div class="sectionHead">Shop</div>
                <hr>
                <br>
                <div class="row">
                    <div class="column1">
                        <div class="item-box">
                            <div class="item-box-img">
                                <img src="/member/resources/image/feed1.jpg">
                            </div>
                           
                            <div class="item-box-head">건사료</div>
                            <div class="item-box-sub-text">내 반려동물의 최고의 식사</div>
                            <button class="btn item-box-btn" onclick="feedbutton(this.form)">Shop Now</button>
                        </div>
                    </div>
                    <div class="column1">
                        <div class="item-box">
                            <div class="item-box-img">
                                <img src="/member/resources/image/leash1.jpg">
                            </div>
                            <div class="item-box-head">가슴줄&목줄</div>
                            <div class="item-box-sub-text">반려동물과 산책시 필수 아이템</div>
                            <button class="btn item-box-btn" onclick="leashbutton(this.form)">Shop Now</button>
                        </div>
                    </div>
                    <div class="column1">
                        <div class="item-box">
                            <div class="item-box-img">
                                <img src="/member/resources/image/pad1.png">
                            </div>
                            <div class="item-box-head">배변패드</div>
                            <div class="item-box-sub-text">실내배변을 도와줄 배변패드</div>
                            <button class="btn item-box-btn" onclick="padbutton(this.form)">Shop Now</button>
                        </div>
                    </div>
                    <div class="column1">
                        <div class="item-box">
                            <div class="item-box-img">
                                <img src="/member/resources/image/cloth1.jpg">
                            </div>
                            <div class="item-box-head">반려동물 옷</div>
                            <div class="item-box-sub-text">나의 반려동물에게 옷을 선물하세요</div>
                            <button class="btn item-box-btn" onclick="clothbutton(this.form)">Shop Now</button>
                        </div>
                    </div>
                </div>
			</div>
				</form>
				<br>
				<br>
				<br>
				<br>
				<hr>
				

                <div class="sectionSubHead">인기 품목</div>
			<!-- <form>
				<input type="radio" name="sort" value="popularity"
					onclick="sortByPopularity()">인기순<br> 
					<input type="radio" name="sort" value="ascPrice"
					onclick="sortByAscPrice()">최저 가격순<br> <input
					type="radio" name="sort" value="descPrice"
					onclick="sortByDescPrice()">최고 가격순<br> <input
					type="radio" name="sort" value="latestIn"
					onclick="sortByLatestIn()">최신순<br>
			</form> -->

			<%-- <c:forEach var="vo" items="${ list }"> --%>
			
			<div class="container">
			
				<div class="row">
				<c:forEach var="vo" items="${ list }">
					<div class="column2" onclick="web('https://www.coupang.com')">
						<div class="card">
							<c:if test="${ vo.filename ne 'no_file' }">
								<img class="card-img-top" src="resources/upload/${vo.filename}">
							</c:if>
							<div class="card-footer">
								<p class="card-text">
								상품이름: ${ vo.productname}
									 <hr>
								</p>
								<div class="card-productinfo">
									상품번호: ${ vo.pid}<br>
									상품가격: ${ vo.price}원 <span style="color: rgb(173, 11, 11)">(39%
										off)</span><br> 
									상품설명: ${ vo.productdetail}

									<form>
										<input type="hidden" name="species" value="${ vo.species }"> 
										<input type="hidden" name="pid" value="${ vo.pid }"> 
										<input type="hidden" name="productname" value="${ vo.productname }"> 
										<input type="hidden" name="productdetail" value="${ vo.productdetail }">
										<input type="hidden" name="photo" value="${ vo.filename }">	
										<input type="hidden" name="category" value="${ vo.category }"> 	
										<input type="hidden" name="price" value="${ vo.price }">
										<input type="hidden" name="regdate" value="${ sysdate }">
										<input type="hidden" name="popularity" value="${ vo.popularity }">   

										
									</form>

								</div>
							</div>
						</div>
					</div>
					</c:forEach>
				</div>
			
			</div>	
		<%-- 	</c:forEach> --%>
		
			</section>
        
        <br>
        <br>
        
     
         <!-- 이용 안내 및 연락처 -->
  <footer class="footer">
  <section class="contact">
    <h3>Petopia</h3>
    <p>(주) Petopia | 사업자등록번호  432-86-00569 | 대표이사 : 박지영 | 개인정보관리책임자 : 이영웅<br>
				 서울특별시 마포구 노고산동 106-5 <br>
Tel : 010.8617.7436 월-금 (10:00 - 19:00) Email : web&app@korea.com <br>

© 2023 Petopia Inc. All Rights Reserved.</p>
  </section>
  </footer>



</body>
</html>