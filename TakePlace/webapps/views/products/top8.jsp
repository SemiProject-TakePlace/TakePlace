<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>최고의 인기 상품</title>
<%@ include file="../../resources/css/common/common.jsp" %>
<%@ include file="../../resources/js/common/common.jsp" %>

<style>
	.top8 h2 {
		margin-bottom: 30px;
	}
	.top8-content {
		background : rgb(240, 240, 240);
	}
</style>

</head>
<body>

	<%@ include file="../common/header.jsp" %>
	
	<section id="wrap-contents" class="footer-bottom">
		<div class="container top8">
			<h2 class="font-bold content-title">
				<span class="font-green">최고의 인기</span> 상품
			</h2>
		</div>
		
		<div class="top8-content">
			<div class="product-card">
				<div class="row">
					<!-- 여기서부터 for문 사용하여 여러 개 상품 돌리기 -->
					<div class="col">
						<a href="#">
							<div class="card">
							  <img src="../resources/images/main-sample.jpg" class="card-img-top" alt="대표이미지">
								  <div class="card-body">
								  		<small class="font-green"><span class="product">스터디룸</span>/<span class="location">서울시</span></small>
									    <h5 class="card-title font-bold">강남 일등 스터디룸</h5>
									    <p class="card-text">10000원</p>
									    <small class="rating">평점 <span class="font-green">10.0</span></small>
								  </div>
							</div>
						</a>
					</div>
				</div>
			</div>
		</div>
		
	</section>
	<%@ include file="../common/footer.jsp" %>

</body>
</html>