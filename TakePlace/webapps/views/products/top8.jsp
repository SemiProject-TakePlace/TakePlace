<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.jsp.products.model.vo.*, java.util.*"%>
<%
	ArrayList<Product> list = (ArrayList<Product>)request.getAttribute("list");
%>
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
	
	<section id="wrap-contents">
		<div class="container top8">
			<h2 class="font-bold content-title">
				<span class="font-green">최고의 인기</span> 상품
			</h2>
		</div>
		
		
		
		
		<div class="top8-content">
			<div class="product-card">
				<div class="row">
					<!-- 여기서부터 for문 사용하여 여러 개 상품 돌리기 -->
					<% for(Product p : list) { %>
		               <div class="col">
		                  <a href="#">
		                     <div class="card">
		                       <img src="<%=request.getContextPath() %>/resources/images/product/<%= p.getMno()%>/<%= p.getProductFile() %>"
		                          class="card-img-top" alt="대표이미지" width="238" height="158">
		                          <div class="card-body">
		                                <small class="font-green">
		                                   
		                                   <span class="product"><%= p.getPtype() %></span>/
		                                   <span class="location"><%= p.getPcity() %></span>
		                                </small>
		                               <h5 class="card-title font-bold"><%= p.getPname() %></h5>
		                               <p class="card-text"><%= p.getPprice() %>원</p>
		                               <small class="rating">평점 <span class="font-green"><%= p.getPrating() %></span></small>
		                          </div>
		                     </div>
		                  </a>
		               </div>
               		<% } %>
				</div>
			</div>
		</div>
		
		
		
	</section>
	<%@ include file="../common/footer.jsp" %>

</body>
</html>