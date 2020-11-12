<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.kh.jsp.products.model.vo.*, com.kh.jsp.common.model.vo.*" %>
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
	
	.disabled {
	  color: currentColor;
	  cursor: not-allowed;
	  opacity: 0.5;
	  text-decoration: none;
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
					
				</div>
				<% if( mem != null && mem.getMtype().equals("HOST")) { %> 
					<div class="col-2">
						<button type="button" class="btn btn-tp-custom-green" onclick="insertProduct()">공간 등록 하기</button>
					 </div>
				<% } %> 
			</div>
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
						<% for(Product p : list) { %>
						<div class="pcard">
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
									  </div>
								</div>
							</div>
						<% } %>
					</div>
				</div>
			</div>
		</div>
		
	</section>

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
			
			$(".pcard").click(function() {
				var pno = $(this).children("#pno").val();
				location.href="<%= request.getContextPath()%>/selectOneProduct.pr?pno=" + pno;
			})
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
			location.href="<%=request.getContextPath()%>/views/products/insertProduct.jsp";
		}
		
	</script>

</body>
</html>