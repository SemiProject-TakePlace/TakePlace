<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Take Place</title>
<%@ include file="resources/css/common/common.jsp" %>
<link rel="stylesheet" href="resources/css/main/main.css" type="text/css" />

<%@ include file="resources/js/common/common.jsp" %>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>

</head>
<body>

	<%@ include file="views/common/header.jsp" %>
	
	<section id="main-contents" role="main">
		<div id="main-bg" class="main-content">
			<div class="main-bg-content">
			<h2 class="main-bg-text font-bold">당신의 공간을 등록하세요!</h2>
			<a href="views/products/insertProduct.jsp" class="btn btn-dark">공간 등록하기</a>
			</div>
		</div>
		
		<div class="container product-content">
			<div class="product-menu">
				<ul>
					<li>
					<a href="views/products/room/study.jsp">
						<span>
							<i class="fas fa-pencil-alt"></i>
						</span>
						스터디룸
					</a>
					</li>
					<li>
					<a href="views/products/room/studio.jsp">
						<span>
							<i class="fas fa-camera-retro"></i>
						</span>
						스튜디오
					</a>
					</li>
					<li>
					<a href="views/products/room/seminar.jsp">
						<span>
							<i class="fas fa-briefcase"></i>
						</span>
						세미나룸
					</a>
					</li>
					<li>
					<a href="views/products/room/party.jsp">
						<span>
							<i class="fas fa-birthday-cake"></i>
						</span>
						파티룸
					</a>
					</li>
					<li>
					<a href="views/products/room/office.jsp" style="">
						<span>
							<i class="far fa-building"></i>
						</span>
						오피스
					</a>
					</li>
				</ul>
			</div>
		</div>
		
		<div class="product-card top8-content">
			<div class="top8">
				<h3 class="font-bold">최고의 인기상품
					<a  href="<%= request.getContextPath() %>/productsTop.pr" class="btn-tp-custom-green font-normal">더보기</a>
				</h3>
				<div class="container">
					<div class="row">
					<!-- 여기서부터 for문 사용하여 8개 상품 돌리기 -->
						<div class="col">
							<a href="#">
								<div class="card">
								<!-- DB연동 시 지울 이미지 -->
								  <img src="<%= request.getContextPath() %>/resources/images/main-sample.jpg" class="card-img-top" alt="대표이미지">
									  <div class="card-body">
									  		<small class="font-green">
									  			<span class="product">스터디룸</span>/<span class="location">서울시</span>
									  		</small>
										    <h5 class="card-title font-bold">강남 일등 스터디룸</h5>
										    <p class="card-text">10000원</p>
										    <small class="rating">평점 
										    	<span class="font-green">10.0</span>
										    </small>
									  </div>
								</div>
							</a>
						</div>
						
					</div>
				</div>
			</div>
		</div>
		
		<div class="product-card recommend8-content">
			<div>
				<h3 class="font-bold">금주의 추천상품</h3>
				<div class="container">
					<div class="row">
						<div class="col">
							<!-- 여기서부터 for문 사용하여 8개 상품 돌리기 -->
							<a href="#">
								<div class="card">
								  <img src="resources/images/main-sample.jpg" class="card-img-top" alt="대표이미지">
									  <div class="card-body">
									  		<small class="font-green"><span class="product">스터디룸</span>/<span class="location">서울시</span></small>
										    <h5 class="card-title font-bold">강남 일등 스터디룸</h5>
										    <p class="card-text">10000원</p>
										    <small class="rating">평점 <span class="font-green text-bold">10.0</span></small>
									  </div>
								</div>
							</a>
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<%@ include file="views/common/footer.jsp" %>




</body>
</html>