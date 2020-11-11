<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.kh.jsp.products.model.vo.*,
				com.kh.jsp.productReview.model.vo.*"%>
<%
	Product p = (Product)request.getAttribute("product");
	ArrayList<ProductImages> fileList
	 	= (ArrayList<ProductImages>)request.getAttribute("fileList");
	 
	ProductImages titleImg = fileList.get(0);
	ProductImages subImg1 = fileList.get(1);
	ProductImages subImg2= fileList.get(2);
	ProductImages subImg3 = fileList.get(3);
	ProductImages subImg4 = fileList.get(4);
	
	ArrayList<ProductReview> rlist = (ArrayList<ProductReview>)request.getAttribute("rlist");
	
	int rating = (int)request.getAttribute("rating");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공간 상세 페이지</title>
<%@ include file="../../resources/css/common/common.jsp" %>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/common/datepicker.min.css" type="text/css" />

<%@ include file="../../resources/js/common/common.jsp" %>
<script src="<%= request.getContextPath() %>/resources/js/common/datepicker.min.js"></script>
<script src="<%= request.getContextPath() %>/resources/js/common/datepicker.en.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2e78244e6d0a409b391542fb720051d2&libraries=services"></script>

<style>
	.content-title a{
	    position: absolute;
    	right: 0;
    	top: 5px;
	}
	
	.product-detail {
		background : rgb(240, 240, 240);
		padding: 30px 0;
	}
	
	.product-detail #datePick {
		margin: 30px;
	}
	
	.product-detail .date-pick {
		background: #fff;
		padding: 40px;
	}
	
	.product-detail .date-pick .form-group {
		display: block;
	}
	
	.product-detail dl dt{
		float: left;
		margin-right: 10px;
	}

	.product-detail .detail-list ul {
		display: table;
	    position: relative;
	    width: 763.5px;
	    color: #656565;
	    table-layout: fixed;
	}
	
	.product-detail .detail-list ul li {
	    position: relative;
	    display: table-cell;
	    height: 40px;
	    background: #fff;
	    font-size: 11.7px;
	    text-align: center;
	    display: table-cell;
	    border-bottom: 1px solid #82cbc4;
	    font-size: 16px;
	    height: 50px;
	    padding: 11px 15px;
	}
	
	.product-detail .detail-list ul li a {
		color: #82cbc4;
	}
	
	.product-detail .detail-list ul li.active {
		background: #82cbc4;
	}
	
	.product-detail .detail-list ul li.active a {
		color: #fff;
	}
	
	.product-detail .details .detail{
    	position: relative;
    	line-height: 25px;
    	margin-bottom: 50px;
    	padding-top: 60px;
	}
	
	.product-detail .details .detail h4,
	.review-content .detail-review h4{
	    position: relative;
	    padding-bottom: 16px;
	    margin: 70px 0 28px;
	    color: #000;
	    font-size: 18px;
	    line-height: 30px;
	}
	
	.product-detail .details .detail h4:after,
	.review-content .detail-review h4:after {
		position: absolute;
	    bottom: 0;
	    left: 0;
	    content: "";
	    height: 4px;
	    width: 20px;
	    background: #82cbc4;
	}
	
	.product-detail .details .detail-refund dd {
		border-bottom: 1px solid #ccc;
		padding-bottom: 10px;
	}
	
	.review-content {
		padding: 80px 0 50px 0;
	}
	
	.review-content .detail-review h4 button{
		position: absolute;
		right: 12px;
	}
	
	.review-content .detail-review .write-review {
		display: none;
   		overflow: hidden;
    	margin-bottom: 50px;
    	padding: 30px;
	}
	
	.review-content .detail-review .guest-review {
		position: relative;
		display: flex;
	}
	
	.review-content .detail-review .guest-review .guest-rating {
		position: absolute;
		right: 160px;
	}
	
	.review-content .detail-review .guest-review .guest-date {
		position: absolute;
		right: 0;
	}
	
	.review-content .detail-review .review-list .rlist {
		border-bottom: 1px solid #ccc;
   	    margin-bottom: 20px;
    	padding-bottom: 20px;
	}
	
	.review-content .detail-review .review-list .rlist:last-child {
		border: none;
	}
	
	.review-content .detail-review .review-list .rlist .review-detail,
	.review-content .host-reply {
		margin: 15px 15px 0 15px;
    	padding: 15px 15px 0 15px;
	}
	
	.review-content .detail-review .review-list .rlist .host-name {
		font-size: 18px;
	}
	
	textarea.info {
		background: transparent;
    	border: none;
	}
	
	textarea.info:focus{
		outline: none;
	}
	
	.sticky {
		position: fixed;
	    top: 90px;
	    width: 763.5px;
	    left: unset;
	    z-index: 10;
	}
</style>

</head>
<body>

	<%@ include file="../common/header.jsp" %>
	<% if(mem != null) { %>
	<section id="wrap-contents">
		<div class="container">
			<h2 class="font-bold content-title">공간 유형 

				<% if(p.getPtype().equals("STUDY")) {%>
	  				<span class="font-green">스터티룸</span> 
	  			<% } else if (p.getPtype().equals("STUDIO")) {%>
	  				<span class="font-green">스튜디오</span>
	  			<% } else if (p.getPtype().equals("SEMINAR")) {%>
	  				<span class="font-green">세미나룸</span>
	  			<% } else if (p.getPtype().equals("PARTY")) {%>
	  				<span class="font-green">파티룸</span>
	  			<% } else if (p.getPtype().equals("OFFICE")) {%>
	  				<span class="font-green">오피스</span>
	  			<% } %>
				<%if(mem.getBsnum() != null && mem.getBsnum().equals(p.getBsNum())) { %>
				<button type="button" class="btn btn-tp-custom-green active" style="float:right;"
					onclick="location.href='<%= request.getContextPath() %>/updateProductView.pr?pno='+<%=p.getPno()%>">상품 수정
				</button>
				<% } %>
			</h2>
		</div>
		<div class="product-detail">
			<div class="container">
				<div class="row mb-5">
					<div class="col-md-7 col-sm-12">
					
						<div id="carouselExampleInterval" class="carousel slide" data-ride="carousel">
							<ol class="carousel-indicators">
							<% for(ProductImages pi : fileList) { %>
							    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
						  	<% } %>
						  	</ol>
						  	
							 <div class="carousel-inner">
							 <% if(titleImg.getChangeName() != null) { %>
							   <div class="carousel-item active" data-interval="3000">
							     <img src="<%=request.getContextPath() %>/resources/images/product/<%= p.getMno()%>/<%= titleImg.getChangeName() %>"
							     class="d-block w-100" alt="공간 사진" width="635" height="360">
							    </div>
							 <% } %>
							  <% if(subImg1.getChangeName() != null) { %>
							    <div class="carousel-item" data-interval="2000">
							      <img src="<%=request.getContextPath() %>/resources/images/product/<%= p.getMno()%>/<%= subImg1.getChangeName() %>"
							      class="d-block w-100" alt="공간 사진" width="635" height="360">
							    </div>
							  <% } %>
							  <% if(subImg2.getChangeName() != null) { %>
							    <div class="carousel-item">
							      <img src="<%=request.getContextPath() %>/resources/images/product/<%= p.getMno()%>/<%= subImg2.getChangeName() %>"
							      class="d-block w-100" alt="공간 사진" width="635" height="360">
							    </div>
							  <% } %>
							  <% if(subImg3.getChangeName() != null) { %>
							    <div class="carousel-item">
							      <img src="<%=request.getContextPath() %>/resources/images/product/<%= p.getMno()%>/<%= subImg3.getChangeName() %>"
							      class="d-block w-100" alt="공간 사진" width="635" height="360">
							    </div>
							  <% } %>
							  <% if(subImg4.getChangeName() != null) { %>
							    <div class="carousel-item">
							      <img src="<%=request.getContextPath() %>/resources/images/product/<%= p.getMno()%>/<%= subImg4.getChangeName() %>"
							      class="d-block w-100" alt="공간 사진" width="635" height="360">
							    </div>
							  <% } %>
							  <a class="carousel-control-prev" href="#carouselExampleInterval" role="button" data-slide="prev">
							    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
							    <span class="sr-only">Previous</span>
							  </a>
							  <a class="carousel-control-next" href="#carouselExampleInterval" role="button" data-slide="next">
							    <span class="carousel-control-next-icon" aria-hidden="true"></span>
							    <span class="sr-only">Next</span>
							  </a>
							  </div>
						</div>
					
					</div>
					
					<div class="col-md-5 col-sm-12 date-pick text-center">
	                  <p>예약을 하시려면 호스트의 승인이 필요합니다. <br>승인 후에 결제가 가능합니다!</p>
	                  <form id="datePick" method="post" action="<%= request.getContextPath()%>/ReservationHostRequest.re">
	                     <div class="form-group">
	                         <label for="pAbleDate" class="font-green font-bold">예약 날짜 선택</label>
	                         <div class="inline-block">
	                            <input type="hidden" id="pAbleDate" value="<%= p.getPableDate() %>"/>
	                            <input type="hidden" name="pno" value="<%= p.getPno() %>"/>
	                            <input type="text" name="selectDate" id="selectDate" data-range="true" data-multiple-dates-separator=" - "
	                                  data-language="en"class="form-control inlne-block" value="<%= p.getPableDate() %>" autocomplete="off"/>
	                            <small class="form-text text-error requiredId" style="display:none;">필수 입력 사항 입니다.</small>
	                        </div>          
	                    </div>
	                    <button type="submit" class="btn btn-dark mt-4">
	                             HOST에게 예약 요청하기
	                    </button>
	                    </form>
	               </div>
			
				</div>
				
				<div class="mb-5">
					<p class="font-bold font-green">
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
					<p>
					<h3 class="font-bold"><%= p.getPname() %></h3>
					
					<dl>
						<dt class="font-bold font-green">HOST</dt>
						<dd><%= p.getMname() %></dd>
						<dt class="font-bold font-green">가격</dt>
						<dd><%= p.getPprice() %></dd>
						<dt class="font-bold font-green">HOST 평점</dt>
						<dd><%= rating %></dd>
					</dl>
				</div>
				
				<div class="detail-list">
					<ul>
						<li class="active"><a href="#info">시설 안내</a></li>
						<li><a href="#caution">유의사항</a></li>
						<li><a href="#location">위치</a></li>
						<li><a href="#refund">환불 규정</a></li>
						<li><a href="#review">이용 후기</a></li>
					</ul>
				</div>
				
				<div class="details col-md-7 col-sm-12">
					<div id="info" class="detail detail-info">
						<h4 class="font-bold font-green">시설 안내</h4>
						<textarea class="info" cols="75" rows="8" readonly><%= p.getPguide() %></textarea>
					</div>
					
					<div id="caution" class="detail detail-caution">
						<h4 class="font-bold font-green">유의사항</h4>
						<textarea class="info" cols="75" rows="8" readonly><%= p.getPwarn() %></textarea>
					</div>
					
					<div id="location" class="detail detail-location">
						<h4 class="font-bold font-green">위치</h4>
						<input type="hidden" name="mName" id="mName" value="<%= p.getMname() %>">
						<input type="hidden" name="pAddress" id="pAddress" value="<%= p.getPaddress() %>">
						<p class="full-address mb-3"></p>
						<div id="map" style="width:100%;height:400px;"></div>
					</div>
					
					<div id="refund" class="detail detail-refund">
						<h4 class="font-bold font-green">환불 규정</h4>
						<p class="text-error pb-2">자세한 환불 관련 사항은 호스트에서 직접 문의하셔야 합니다.</p>
						<dl class="refund-info">
							<dt>이용 8일전</dt>
							<dd>총 금액의 100% 환불</dd>
							<dt>이용 7일전</dt>
							<dd>총 금액의 100% 환불</dd>
							<dt>이용 6일전</dt>
							<dd>총 금액의 100% 환불</dd>
							<dt>이용 5일전</dt>
							<dd>총 금액의 100% 환불</dd>
							<dt>이용 4일전</dt>
							<dd>총 금액의 100% 환불</dd>
							<dt>이용 3일전</dt>
							<dd>총 금액의 100% 환불</dd>
							<dt>이용 2일전</dt>
							<dd>총 금액의 100% 환불</dd>
							<dt>이용 전날</dt>
							<dd>총 금액의 50% 환불</dd>
							<dt>이용 당일전</dt>
							<dd>총 금액의 20% 환불</dd>
						</dl>
					</div>
					
					</div>
					<div class="container-fluid review-content">
						<div id="review" class="detail-review">
							<h4 class="font-bold font-green">이용 후기
								<!-- 이용 내역이 있고 후기를 아직 남기지 않은 회원만 -->
								<button class="btn btn-tp-custom-green my-2 my-sm-0" type="button" onclick="writeReview(this)">이용 후기 남기기</button>
							</h4>
							
							
							<div class="replyArea">
								<div class="replyWriteArea write-review" style="display: none;">
									
										<form action="<%= request.getContextPath()%>/insertProductReview.re" method="post">
											<input type="hidden" name="mname" value="<%= mem.getMname() %>"/>
											<input type="hidden" name="mno" value="<%= mem.getMno() %>"/>
											<input type="hidden" name="pno" value="<%= p.getPno() %>" />
											<input type="hidden" name="refrno" value="0" />
											<input type="hidden" name="rlevel" value="1" />
											<label for="pRating" class="font-green font-bold" style="float: left; margin: 5px 10px 20px 5px" >평점</label>
											<input type="number" min="0" max="10" id="pRating" name="pRating" class="form-control" />
											<textarea id="reviewContent" name="reviewContent" rows="5" style='width: 100%;'></textarea>
											<button type="submit" class="btn btn-tp-custom-green mr-3 btn-confirm-review"
												style="display:block;">이용후기 등록</button>
										</form>
									
								</div>						
								<div class="reveiw-area">
									<!-- 댓글 목록 구현 영역 -->
									<% if(rlist.size() == 0) { %>
										<span>아직 이용후기가 없습니다!</span>
									<% } else {
										for(ProductReview pr : rlist)  { %>
										<ul id="review-list"
					      	 				style="margin-left : <%= (pr.getRlevel()-1) * 15 %>px;
					      	 						width : <%= 800 - ((pr.getRlevel()-1) * 15)%>px;
					      	 						margin-bottom: 30px;"
					      	 				class="review-list-<%=pr.getRlevel()%>">
					      	 
					      	 				
					      	 				<% if( pr.getRlevel() == 1 ) { %>
												<li class="rlist review<%=pr.getRlevel()%>">
												<div class="guest-review">
													<p class="guset-name font-bold"><%= pr.getMname() %></p>
													<p class="guest-rating">평점 <span class="font-bold font-green"><%= pr.getRrating() %></span></p>
													<p class="guest-date text-muted"><%= pr.getRdate() %></p>
													
												</div>
												<p class="review-detail"><%= pr.getRcontent() %></p>
												</li>
					      	 				<% } else if( pr.getRlevel() == 2 ) { %>
					      	 					<li class="rlist">
					      	 					<div class="host-reply reply<%=pr.getRlevel()%>">
														<p class="host-name font-green">호스트님의 답글</p>
														<p class="reply-detail mb-2">
															<%= pr.getRcontent() %>
														</p>
														<p class="host-date text-muted"><%= pr.getRdate() %></p>
													</div>
												</li>
					      	 				<% } %> 
					      	 				<%if(mem.getBsnum() != null && mem.getBsnum().equals(p.getBsNum())) { %>
												<button class="btn btn-tp-custom-white ml-2 my-2 my-sm-0" type="button"
														style="float:right; padding: 5px; font-size:10px;"
														onclick="writeReply(this)">답글 남기기</button>
												<div class="write-reply" style="display: none; height: 200px;">
													<input type="hidden" name="mname" value="<%= mem.getMname()%>"/>
													<input type="hidden" name="refrno" value="<%= pr.getRno() %>" />
													<input type="hidden" name="rlevel" value="<%= pr.getRlevel() %>" />
													<textarea id="replyContent" rows="5" style='width: 100%;'></textarea>
													<button type="button" class="btn btn-tp-custom-green mr-3 btn-reply-review"
														onclick="replyReview(this)" style="display:block;">답글 등록</button>
												</div>
											<% } %>
										</ul>
									<%
										}
									}
									%>
								</div>
							</div>
						</div>
					</div>
				</div>
		
		<!-- 관리자로 로그인했을때 / 승인 리스트에 들어와있을때 보여주기 -->
		<% if(mem.getMtype().equals("MANAGER") && p.getPisOk().equals("N")) { %>
			<div class="btn-area text-center mt-5">
				<!-- 승인 일때는 DB에 들어간 공간정보 유지 -->
				<form action="approvalProduct.mp" method="post">
					<input type="hidden" name="pno" value="<%= p.getPno() %>" />
					<input type="hidden" name="approval" value="<%= p.getPisOk() %>" />
					<button class="btn btn-tp-custom-green mr-3 approval">승인</button>
				</form>
				<!-- 비승인 일때는 DB에 들어간 공간 정보 삭제 -->
				<form action="nonApprovalProduct.mp" method="post">
					<input type="hidden" name="pno" value="<%= p.getPno() %>" />
					<input type="hidden" name="approval" value="<%= p.getPisOk() %>" />
					<button class="btn btn-tp-custom-white ml-3 nonApproval">비승인</button>
				</form>
			</div>
		<% } %>
	</section>
	<% } else {
		request.setAttribute("error-msg", "회원 가입 후 이용 가능합니다.");
		request.getRequestDispatcher("../common/errorPage.jsp").forward(request, response);
	} %>
	
	<%@ include file="../common/footer.jsp" %>
	
	<script>
		$(function() {
			
		    var ableDate = $("#pAbleDate").val().split(" - ");
		    
		    var startYear = ableDate[0].substr(0, 4);
		    var startMonth = ableDate[0].substr(5, 2);
		    var startDay = ableDate[0].substr(8, 2);
		    var startTime = ableDate[0].substr(11, 2);
		    
		    var fromAbleDate = new Date(startYear, startMonth - 1 , startDay);
			var start = new Date(startYear, startMonth - 1 , startDay),
								prevDay;		

		    $("#selectDate").datepicker({
		    	multipleDates: true,
		        language: "en",
		        minDate: start,
		        maxDate : end,
		        dateFormat: "yyyy/mm/dd",
		        onSelect: function (fd, d, picker) {
		            // Do nothing if selection was cleared
		            
		            if (!d) return;
		           
		            var day = d[0].getDay();
		       
		            // Trigger only if date is changed
		            if (prevDay != undefined && prevDay == day) return;
		            prevDay = day;
		        }
		    })
			
			// $('#selectDate').data('datepicker').selectDate(new Date(startYear, startMonth - 1, startDay, 09));
		});
		
	</script>
	
	<script>
		$(function () {
			var div_top = $('.detail-list').offset().top;
			
		    $(window).on('scroll', function () {
		    	
	    	 var window_top = $(window).scrollTop() - 10;
	    	    if (window_top >= div_top) {
	    	        if (!$('.detail-list').is('.sticky')) {
	    	            $('.detail-list').addClass('sticky');
	    	        }
	    	    } else {
	    	        $('.detail-list').removeClass('sticky');
	    	    }
		    });
		    
		    $('.detail-list li').click(function() {
		        $('.detail-list li').removeClass();
		        $(this).addClass('active');
		    })
		});
	</script>
	
	<script>
		
		var pAddress = $("#pAddress").val().split(", ");
		var fullAddress = pAddress[0] + " " + pAddress[1] + " " + pAddress[2];
		$(".full-address").text(fullAddress);
		
		
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  
		
	
		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		
		var hostName = $("#mName").val();
		var address = $("#pAddress").val().split(", ")[1];
		
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch(address, function(result, status) {
		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {
		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        });
		        // 인포윈도우로 장소에 대한 설명을 표시합니다
		        var infowindow = new kakao.maps.InfoWindow({
		            content: '<div style="width:150px;text-align:center;padding:6px 0;">' + hostName + '</div>'
		        });
		        infowindow.open(map, marker);
		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		    } 
		});
		
	</script>
		
	<script>

		function writeReview(btn) {
			$(".write-review").css("display", "block");
			$(".btn-confirm-review").css({
				"display": "block",
				"float" : "right"
			});
			$(btn).css("display", "none");
			
				
			// 게스트 정보 및 후기 내용 서블릿으로 보내주기
			
		}
		
		function writeReply(btn) {
			$(btn).siblings(".write-reply").css("display", "block");
			$(".btn-reply-review").css({
				"display": "block",
				"float" : "right"
			})
			$(btn).css("display", "none");
		}
		
		/*
			이용후기 등록 스크립트
		*/
		function replyReview(obj) {
			// 참조할 댓글 번호 가져오기
			var refrno = $(obj).siblings("input[name=refrno]").val();
			var level = $(obj).siblings("input[name=rlevel]").val();
			
			// console.log(refcno + " : " + level);
			
			level = Number(level) + 1;
			
			// 게시글 번호 가져오기
			var pno = "<%= p.getPno() %>";
			
			var content = $("#replyContent").val();
		
			
		
			location.href = "<%= request.getContextPath() %>/insertProductReview.re"
										+ "?mname=<%= mem.getMname()%>"
										+ "&mno=<%= mem.getMno()%>"
										+ "&reviewContent=" + content
										+ "&pRating=" + 0 
										+ "&pno=" + pno
										+ "&refrno=" + refrno
										+ "&rlevel=" + level;
									
		}
	</script>

</body>
</html>