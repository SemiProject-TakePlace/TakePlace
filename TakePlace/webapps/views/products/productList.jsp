<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공간 유형 리스트</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/common/bootstrap.min.css" type="text/css" />
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/common/common.css" type="text/css" />
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/main/main.css" type="text/css" />

<script src="<%= request.getContextPath() %>/resources/js/common/jquery-3.5.1.min.js"></script>
<script src="<%= request.getContextPath() %>/resources/js/common/bootstrap.min.js"></script>

<style>
	.form-group {
		margin-bottom: 50px;
	}
	
	.form-group #searchType1 {
		width: 150px;
	}
	
	.form-group #searchType2 {
		width: 200px;
	}
	
	.product-list-content {
		background : rgb(240, 240, 240);
	}
</style>
</head>
<body>

	<%@ include file="../common/header.jsp" %>
	
	<section id="wrap-contents">
		<div class="container">
			<h2 class="font-bold content-title">공간 유형 
				<!-- 유형에 따라 다른 유형 이름 보여주기 -->
				<span class="font-green product-name">스터디룸</span>
			</h2>
			<div class="form-group justify-content-md-center">
				<select id="searchType1" class="form-control inline-block mr-2">
					<option value="pName" selected>공간유형</option>
					<option value="pCity">지역</option>
				</select>
				<input type="search" id="keyword" class="form-control inline-block mr-2" placeholder="검색어를 입력하세요."> 
				<button type="button" class="btn btn-tp-custom-green mr-5" onclick="search();">검색</button>
				<select id="searchType2" class="form-control inline-block ml-3">
					<option value="pName">가격 낮은 순</option>
					<option value="pCity">가격 높은 순</option>
					<option value="pCity">이용후기 많은 순</option>
				</select>
				<%-- <% if(m != null && m.getMtype().equals("host")){ %>--%> 
				<button type="button" class="btn btn-tp-custom-green ml-5" onclick="insertProduct();">공간 등록 하기</button>
				<%--
				<% } %>
				 --%>
			</div>
		</div>
		
		<div class="product-list-content">
			<div class="product-card">
				<div class="row">
					<!-- 여기서부터 for문 사용하여 여러 개 상품 돌리기 -->
					<div class="col">
						<a href="#">
							<div class="card">
							  <img src="../../resources/images/main-sample.jpg" class="card-img-top" alt="대표이미지">
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
	
	<script>
		function search() {
			
		}
		
		function insertProduct() {
			location.href = "insertProduct.jsp";
		}
	</script>

</body>
</html>