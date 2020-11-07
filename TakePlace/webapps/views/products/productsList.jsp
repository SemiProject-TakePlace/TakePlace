<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.kh.jsp.products.model.vo.*" %>
<%
	ArrayList<Product> list = (ArrayList<Product>)request.getAttribute("list");
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공간 유형 리스트</title>
<%@ include file="../../resources/css/common/common.jsp" %>
<%@ include file="../../resources/js/common/common.jsp" %>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>

<style>
	.search-area {
		margin-bottom: 50px;
   	 	padding-bottom: 10px;
    	overflow: hidden;
	}
	.search-area .form-group {
	    margin: auto;
    	width: 50%;
	}
	.search-area #searchType {
		width: 150px;
	}
	
	.search-area #searchType2 {
		width: 200px;
	}
	
	.product-list-content {
		background : rgb(240, 240, 240);
	}
	
	.product-list {
	    color: #656565;
        margin: 0 auto 30px auto;
    	width: 50%;
    	overflow: hidden;
	}
	
	.product-list li {
	    background: #fff;
	    font-size: 11.7px;
	    text-align: center;
	    border: 1px solid #82cbc4;
	    font-size: 16px;
	    height: 50px;
	    padding: 11px 15px;
	    margin: 0 1%;
    	float: left;
    	cursor: pointer;
	}
	
	.product-list li.active {
		background: #82cbc4;
		color: #fff;
	}
</style>
</head>
<body>

	<%@ include file="../common/header.jsp" %>
	
	<section id="wrap-contents">
		<div class="container">
			<h2 class="font-bold content-title">공간 유형 
				<span class="font-green product-name"></span>
			</h2>
			<div class="row search-area">
				<div class="form-group justify-content-md-center col-10">
					<select id="searchType" class="form-control inline-block mr-2">
						<option value="pname" selected>제목</option>
						<option value="mname">호스트</option>
						<option value="pcity">지역</option>
					</select>
					<input type="search" id="keyword" class="form-control inline-block mr-2" placeholder="검색어를 입력하세요." onkeyup="enterkey()"> 
					<button type="button" class="btn btn-tp-custom-green mr-5" onclick="search()">검색</button>
					
					
					<!--
					이 부분 보류  
					<select id="searchType2" class="form-control inline-block ml-3">
						<option value="asc">가격 낮은 순</option>
						<option value="desc">가격 높은 순</option>
						<option value="many">이용후기 많은 순</option> 
					</select>
					--> 
				</div>
				<% if( mem != null && mem.getMtype().equals("HOST")) { %> 
					<div class="col-2">
						<button type="button" class="btn btn-tp-custom-green" onclick="insertProduct()">공간 등록 하기</button>
					 </div>
				<% } %> 
			</div>
			<!-- 각 상품 클릭 시 쿼리 작성하여 DB에서 유형별로 다시 받아오기 -->
			<ul class="product-list">
				<li id="all"><a>전체</a></li>
				<li id="study"><a>스터디룸</a></li>
				<li id="studio"><a>스튜디오</a></li>
				<li id="seminar"><a>세미나룸</a></li>
				<li id="party"><a>파티룸</a></li>
				<li id="office"><a>오피스</a></li>
			</ul>
			
			<div class="product-list-content">
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
								  			
								  			<% if(p.getPcity().equals("seo")) {%>
								  				<span class="location">서울</span>
								  			<% } else if (p.getPcity().equals("gyg")) {%>
								  				<span class="location">경기</span>
								  			<% } else if (p.getPcity().equals("gan")) {%>
								  				<span class="location">강원</span>
								  			<% } else if (p.getPcity().equals("chu")) {%>
								  				<span class="location">충청</span>
								  			<% } else if (p.getPcity().equals("jnl")) {%>
								  				<span class="location">전라</span>
							  				<% } else if (p.getPcity().equals("gys")) {%>
							  					<span class="location">경상</span>
						  					<% } else if (p.getPcity().equals("jej")) {%>
							  					<span class="location">제주</span>
								  			<% } %>
								  			
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
			
			
		</div>
		
	</section>
	
	<nav class="form-group justify-content-md-center">
	  <ul class="pagination">	
  	    <li class="page-item">
	      <a class="page-link" href="#" aria-label="Previous">
	        <span aria-hidden="true" style="font-size:12px;"><i class="fas fa-angle-double-left"></i></span>
	      </a>
	    </li>
	    <li class="page-item">
	      <a class="page-link" href="#" aria-label="Previous">
	        <span aria-hidden="true" style="font-size:10px;"><i class="fas fa-chevron-left"></i></span>
	      </a>
	    </li>
	    <li class="page-item"><a class="page-link active" href="#">1</a></li>
	    <li class="page-item"><a class="page-link" href="#">2</a></li>
	    <li class="page-item"><a class="page-link" href="#">3</a></li>
	    <li class="page-item">
	      <a class="page-link" href="#" aria-label="Next">
	        <span aria-hidden="true" style="font-size:10px;"><i class="fas fa-chevron-right"></i></span>
	      </a>
	    </li>
	    <li class="page-item">
	      <a class="page-link" href="#" aria-label="Previous">
	        <span aria-hidden="true" style="font-size:12px;"><i class="fas fa-angle-double-right"></i></span>
	      </a>
	    </li>
	  </ul>
	</nav>
	
	
	<%@ include file="../common/footer.jsp" %>
	
	<script>
	
		$(function () {
			
			$("#all").click(function() {
				location.href="<%=request.getContextPath()%>/selectProductList.pr?type="+'all';
			})
			$("#study").click(function() {
				location.href="<%=request.getContextPath()%>/selectProductList.pr?type="+'study';
			})
			$("#studio").click(function() {
				location.href="<%=request.getContextPath()%>/selectProductList.pr?type="+'studio';
			})
			$("#seminar").click(function() {
				location.href="<%=request.getContextPath()%>/selectProductList.pr?type="+'seminar';
			})
			$("#party").click(function() {
				location.href="<%=request.getContextPath()%>/selectProductList.pr?type="+'party';
			})
			$("#office").click(function() {
				location.href="<%=request.getContextPath()%>/selectProductList.pr?type="+'office';
			})
			
			
			var url = location.href;
			
			if (url.indexOf("?type=study") > -1 ) {
			     $("#study").addClass("active");
			     $(".product-name").text("스터디룸");
			     // $("select#searchType2").change(function(){
			    //	 var orderBy = $(this).children(":selected").val();
				//	});
			} else if (url.indexOf("?type=studio") > -1 ) {
			     $("#studio").addClass("active");
			     $(".product-name").text("스튜디오");
			} else if (url.indexOf("?type=seminar") > -1 ) {
			     $("#seminar").addClass("active");
			     $(".product-name").text("세미나룸");
			} else if (url.indexOf("?type=party") > -1 ) {
			     $("#party").addClass("active");
			     $(".product-name").text("파티룸");
			} else if (url.indexOf("?type=office") > -1 ) {
			     $("#office").addClass("active");
			     $(".product-name").text("오피스");
			} else {
				$("#all").addClass("active");
			     $(".product-name").text("전체");
			}
		});		
		
		function search() {
			location.href="<%=request.getContextPath()%>/searchProduct.pr?con="+$('#searchType').val()+"&keyword="+$('#keyword').val();
		}
		
		function enterkey() {
	        if (window.event.keyCode == 13) {
	        	search();
	        }
		}
		
		function insertProduct() {
			location.href="<%=request.getContextPath()%>/insertProduct.pr";
		}
		
		function cheap() {
			alert("ddd");
		}
		
		
	</script>

</body>
</html>