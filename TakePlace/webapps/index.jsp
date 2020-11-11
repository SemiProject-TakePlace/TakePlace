<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.kh.jsp.products.model.vo.*" %>
<%
	ArrayList<Product> list = (ArrayList<Product>)request.getAttribute("list");

	ArrayList<Product> listTop = (ArrayList<Product>)request.getAttribute("listTop");
 %>
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
					<a href="<%=request.getContextPath()%>/selectProductList.pr?type=study">
						<span>
							<i class="fas fa-pencil-alt"></i>
						</span>
						스터디룸
					</a>
					</li>
					<li>
					<a href="<%=request.getContextPath()%>/selectProductList.pr?type=studio">
						<span>
							<i class="fas fa-camera-retro"></i>
						</span>
						스튜디오
					</a>
					</li>
					<li>
					<a href="<%=request.getContextPath()%>/selectProductList.pr?type=seminar">
						<span>
							<i class="fas fa-briefcase"></i>
						</span>
						세미나룸
					</a>
					</li>
					<li>
					<a href="<%=request.getContextPath()%>/selectProductList.pr?type=party">
						<span>
							<i class="fas fa-birthday-cake"></i>
						</span>
						파티룸
					</a>
					</li>
					<li>
					<a href="<%=request.getContextPath()%>/selectProductList.pr?type=office">
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
						<% for(Product p : listTop) { %>
						<div class="col">
							<input type="hidden" name="pno" id="pno" value="<%= p.getPno() %>" />
							
								<div class="card">
								  <img src="<%=request.getContextPath() %>/resources/images/product/<%= p.getMno()%>/<%= p.getProductFile() %>"
								  	class="card-img-top" alt="대표이미지" width="238" height="158">
									  <div class="card-body">
									  		<small class="font-green">
									  			<% if(p.getPtype().equals("STUDY")) {%>
									  				<span class="product">스터티룸</span> /
									  			<% } else if (p.getPtype().equals("STUDIO")) {%>
									  				<span class="product">스튜디오</span> /
									  			<% } else if (p.getPtype().equals("SEMINAR")) {%>
									  				<span class="product">세미나룸</span> /
									  			<% } else if (p.getPtype().equals("PARTY")) {%>
									  				<span class="product">파티룸</span> /
									  			<% } else if (p.getPtype().equals("OFFICE")) {%>
									  				<span class="product">오피스</span> /
									  			<% } %>
									  			
									  			<span class="location"><%= p.getPcity() %></span>
									  		</small>
										    <h5 class="card-title font-bold"><%= p.getPname() %></h5>
										    <p class="card-text"><%= p.getPprice() %>원</p>
										    <small class="rating">평점 <span class="font-green"><%= p.getPrating() %></span></small>
									  </div>
								</div>
						</div>
						<% } %>
						
					</div>
				</div>
			</div>
		</div>
		
		<div class="product-card recommend8-content">
			<div>
				<h3 class="font-bold">최신 등록 상품</h3>
				<div class="container">
					<div class="row">
						<% for(Product p : list) { %>
						<div class="col">
							<input type="hidden" name="pno" id="pno" value="<%= p.getPno() %>" />
							
								<div class="card">
								  <img src="<%=request.getContextPath() %>/resources/images/product/<%= p.getMno()%>/<%= p.getProductFile() %>"
								  	class="card-img-top" alt="대표이미지" width="238" height="158">
									  <div class="card-body">
									  		<small class="font-green">
									  			<% if(p.getPtype().equals("STUDY")) {%>
									  				<span class="product">스터티룸</span> /
									  			<% } else if (p.getPtype().equals("STUDIO")) {%>
									  				<span class="product">스튜디오</span> /
									  			<% } else if (p.getPtype().equals("SEMINAR")) {%>
									  				<span class="product">세미나룸</span> /
									  			<% } else if (p.getPtype().equals("PARTY")) {%>
									  				<span class="product">파티룸</span> /
									  			<% } else if (p.getPtype().equals("OFFICE")) {%>
									  				<span class="product">오피스</span> /
									  			<% } %>
									  			
									  			<span class="location"><%= p.getPcity() %></span>
									  		</small>
										    <h5 class="card-title font-bold"><%= p.getPname() %></h5>
										    <p class="card-text"><%= p.getPprice() %>원</p>
										    <small class="rating">평점 <span class="font-green"><%= p.getPrating() %></span></small>
									  </div>
								</div>
						</div>
						<% } %>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<%@ include file="views/common/footer.jsp" %>




</body>
</html>