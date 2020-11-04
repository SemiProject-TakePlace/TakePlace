<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공간 상세 페이지</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/common/bootstrap.min.css" type="text/css" />
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/common/common.css" type="text/css" />
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/main/main.css" type="text/css" />
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/common/datepicker.css" type="text/css" />

<script src="<%= request.getContextPath() %>/resources/js/common/jquery-3.5.1.min.js"></script>
<script src="<%= request.getContextPath() %>/resources/js/common/bootstrap.min.js"></script>
<script src="<%= request.getContextPath() %>/resources/js/common/bootstrap-datepicker.js"></script>
<script src="<%= request.getContextPath() %>/resources/js/common/bootstrap-datepicker.kr.js"></script>

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
	
	/*
	
	.product-detail .details {
		padding-top: 50px;
	}
	
	*/
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
    	padding-bottom: 20px;
	}
	
	.review-content .detail-review .review-list .rlist:last-child {
		border: none;
	}
	
	.review-content .detail-review .review-list .rlist .review-detail,
	.review-content .detail-review .review-list .rlist .host-reply {
		margin: 15px 15px 0 15px;
    	padding: 15px 15px 0 15px;
	}
	
	.review-content .detail-review .review-list .rlist .host-name {
		font-size: 18px;
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
	
	<section id="wrap-contents">
		<div class="container">
			<h2 class="font-bold content-title">공간 유형 
				<!-- 유형에 따라 다른 유형 이름 보여주기 -->
				<span class="font-green">스터디룸</span>
				<!-- 유저가 호스트일때만 버튼 보이기 -->
				<a href="views/products/updateProduct.jsp" class="btn btn-tp-custom-green active"
					role="button" aria-pressed="true">상품 수정
				</a>
			</h2>
		</div>
		<div class="product-detail">
			<div class="container">
				<div class="row mb-5">
					<div class="col-md-7 col-sm-12">
					
						<div id="carouselExampleInterval" class="carousel slide" data-ride="carousel">
							<!-- 호스트가 올린 사진 수 만큼 for문 -->
							<ol class="carousel-indicators">
							    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
							    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
							    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
						  	</ol>
						  	
							 <div class="carousel-inner">
							   <div class="carousel-item active" data-interval="3000">
							     <img src="<%= request.getContextPath() %>/resources/images/main-sample.jpg" class="d-block w-100" alt="공간 사진">
							    </div>
							    <div class="carousel-item" data-interval="2000">
							      <img src="<%= request.getContextPath() %>/resources/images/main-sample.jpg" class="d-block w-100" alt="공간 사진">
							    </div>
							    <div class="carousel-item">
							      <img src="<%= request.getContextPath() %>/resources/images/main-sample.jpg" class="d-block w-100" alt="공간 사진">
							    </div>
							  </div>
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
					
					<div class="col-md-5 col-sm-12 date-pick text-center">
						<p>예약을 하시려면 호스트의 승인이 필요합니다. <br>승인 후에 결제가 가능합니다!</p>
						<form id="datePick" method="post" action="/">
							<div class="form-group">
							    <label for="pAbleDate" class="font-green font-bold">예약 날짜 선택</label>
							    <div class="inline-block">
							    	<input type="text" id="pAbleDate" class="form-control inlne-block"/>
								    <small class="form-text text-error requiredId" style="display:none;">필수 입력 사항 입니다.</small>
								</div>			 
						  </div>
						  <button type="button" class="btn btn-dark">HOST에게 예약 요청하기</button>
					  	</form>
					  	 <a href="#" class="btn btn-secondary active" role="button" aria-pressed="true">1:1 문의하기</a>
					</div>
			
				</div>
				
				<div class="mb-5">
					<p class="font-bold font-green">
						<span class="product">스터디룸</span>/<span class="location">서울시</span>
					<p>
					<h3 class="font-bold">강남 일등 스터디룸 공간 대여</h3>
					
					<dl>
						<dt class="font-bold font-green">HOST</dt>
						<dd>HOST의 회사명</dd>
						<dt class="font-bold font-green">가격</dt>
						<dd>10,000원</dd>
						<dt class="font-bold font-green">HOST 평점</dt>
						<dd>10.0</dd>
						<dt class="font-bold font-green">시설 평점</dt>
						<dd>10.0</dd>
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
						<p>사는가 싶이 살았으며 그들의 그림자는 천고에 사라지지 않는 것이다 이것은 현저하게 일월과 같은 예가 되려니와 그와 같지 못하다 할지라도
							사는가 싶이 살았으며 그들의 그림자는 천고에 사라지지 않는 것이다 이것은 현저하게 일월과 같은 예가 되려니와 그와 같지 못하다 할지라도
							사는가 싶이 살았으며 그들의 그림자는 천고에 사라지지 않는 것이다 이것은 현저하게 일월과 같은 예가 되려니와 그와 같지 못하다 할지라도
							사는가 싶이 살았으며 그들의 그림자는 천고에 사라지지 않는 것이다 이것은 현저하게 일월과 같은 예가 되려니와 그와 같지 못하다 할지라도
						</p>
					</div>
					
					<div id="caution" class="detail detail-caution">
						<h4 class="font-bold font-green">유의사항</h4>
						<p>사는가 싶이 살았으며 그들의 그림자는 천고에 사라지지 않는 것이다 이것은 현저하게 일월과 같은 예가 되려니와 그와 같지 못하다 할지라도
							사는가 싶이 살았으며 그들의 그림자는 천고에 사라지지 않는 것이다 이것은 현저하게 일월과 같은 예가 되려니와 그와 같지 못하다 할지라도
							사는가 싶이 살았으며 그들의 그림자는 천고에 사라지지 않는 것이다 이것은 현저하게 일월과 같은 예가 되려니와 그와 같지 못하다 할지라도
							사는가 싶이 살았으며 그들의 그림자는 천고에 사라지지 않는 것이다 이것은 현저하게 일월과 같은 예가 되려니와 그와 같지 못하다 할지라도
						</p>
					</div>
					
					<div id="location" class="detail detail-location">
						<h4 class="font-bold font-green">위치</h4>
						<div id="map" style="width:100%;height:400px;"></div>
					</div>
					
					<div id="refund" class="detail detail-refund">
						<h4 class="font-bold font-green">환불 규정</h4>
						<p>사는가 싶이 살았으며 그들의 그림자는 천고에 사라지지 않는 것이다 이것은 현저하게 일월과 같은 예가 되려니와 그와 같지 못하다 할지라도
							사는가 싶이 살았으며 그들의 그림자는 천고에 사라지지 않는 것이다 이것은 현저하게 일월과 같은 예가 되려니와 그와 같지 못하다 할지라도
							사는가 싶이 살았으며 그들의 그림자는 천고에 사라지지 않는 것이다 이것은 현저하게 일월과 같은 예가 되려니와 그와 같지 못하다 할지라도
							사는가 싶이 살았으며 그들의 그림자는 천고에 사라지지 않는 것이다 이것은 현저하게 일월과 같은 예가 되려니와 그와 같지 못하다 할지라도
						</p>
					</div>
					
					</div>
					<div class="container-fluid review-content">
						<div id="review" class="detail-review">
							<h4 class="font-bold font-green">이용 후기
								<!-- 이용 내역이 있는 사용자만 버튼 보이기 -->
								<button class="btn btn-tp-custom-green my-2 my-sm-0" type="button" onclick="writeReview(this)">이용 후기 남기기</button>
							</h4>
							<div class="write-review">
								<button type="button" class="btn btn-tp-custom-green mr-3 confirm-review"
										onclick="confirmReview(this);" style="display:none;">이용후기 등록</button>
							</div>
							<ul class="review-list">
								<!--  여기서부터 리뷰 for문 -->
								<li class="rlist">
									<div class="guest-review">
										<p class="guset-name font-bold">게스트명</p>
										<p class="guest-rating">평점 <span class="font-bold font-green">10.0</span></p>
										<p class="guest-date text-muted">2020-11-04 12:38</p>
									</div>
									<p class="review-detail">
										사는가 싶이 살았으며 그들의 그림자는 천고에 사라지지 않는 것이다 이것은 현저하게 일월과 같은 예가 되려니와 그와 같지 못하다 할지라도
										사는가 싶이 살았으며 그들의 그림자는 천고에 사라지지 않는 것이다 이것은 현저하게 일월과 같은 예가 되려니와 그와 같지 못하다 할지라도
										사는가 싶이 살았으며 그들의 그림자는 천고에 사라지지 않는 것이다 이것은 현저하게 일월과 같은 예가 되려니와 그와 같지 못하다 할지라도
										사는가 싶이 살았으며 그들의 그림자는 천고에 사라지지 않는 것이다 이것은 현저하게 일월과 같은 예가 되려니와 그와 같지 못하다 할지라도
									</p>
									<button type="button" class="btn btn-tp-custom-green mr-3 confirm-review"
										onclick="confirmReview(this);" style="display:none;">이용후기 등록</button>
									<div class="host-reply">
										<p class="host-name font-green">호스트님의 답글</p>
										<p class="reply-detail mb-2">
											감사합니다~
										</p>
										<p class="host-date text-muted">2020-11-04 12:38</p>
									</div>
								</li>
							</ul>
						</div>
					</div>
				
			</div>
		</div>
		
		<!-- 관리자로 로그인했을때 / 승인 리스트에 들어와있을때 보여주기 -->
		<div class="btn-area text-center mt-5">
			<!-- 승인 일때는 DB에 들어간 공간정보 유지 -->
			<button class="btn btn-tp-custom-green mr-3" onclick="">승인</button>
			<!-- 비승인 일때는 DB에 들어간 공간 정보 삭제 -->
			<button class="btn btn-tp-custom-white ml-3" onclick="">비승인</button>
		</div>
	</section>
	
	<%@ include file="../common/footer.jsp" %>
	
	<script>
	
		/*
			date-picker 스크립트
		*/
		$(function() {	
			$('#pAbleDate').datepicker({
			    format: "yyyy-mm-dd",	//데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
			    startDate: '-10d',	//달력에서 선택 할 수 있는 가장 빠른 날짜. 이전으로는 선택 불가능 ( d : 일 m : 달 y : 년 w : 주)
			    endDate: '+10d',	//달력에서 선택 할 수 있는 가장 느린 날짜. 이후로 선택 불가 ( d : 일 m : 달 y : 년 w : 주)
			    autoclose : true,	//사용자가 날짜를 클릭하면 자동 캘린더가 닫히는 옵션
			    calendarWeeks : false, //캘린더 옆에 몇 주차인지 보여주는 옵션 기본값 false 보여주려면 true
			    clearBtn : false, //날짜 선택한 값 초기화 해주는 버튼 보여주는 옵션 기본값 false 보여주려면 true
			    datesDisabled : ['2019-06-24','2019-06-26'],//선택 불가능한 일 설정 하는 배열 위에 있는 format 과 형식이 같아야함.
			    daysOfWeekDisabled : [0,6],	//선택 불가능한 요일 설정 0 : 일요일 ~ 6 : 토요일
			    daysOfWeekHighlighted : [3], //강조 되어야 하는 요일 설정
			    disableTouchKeyboard : false,	//모바일에서 플러그인 작동 여부 기본값 false 가 작동 true가 작동 안함.
			    immediateUpdates: false,	//사용자가 보는 화면으로 바로바로 날짜를 변경할지 여부 기본값 :false 
			    multidate : false, //여러 날짜 선택할 수 있게 하는 옵션 기본값 :false 
			    multidateSeparator :",", //여러 날짜를 선택했을 때 사이에 나타나는 글짜 2019-05-01,2019-06-01
			    templates : {
			        leftArrow: '&laquo;',
			        rightArrow: '&raquo;'
			    }, //다음달 이전달로 넘어가는 화살표 모양 커스텀 마이징 
			    showWeekDays : true ,// 위에 요일 보여주는 옵션 기본값 : true
			    title: "테스트",	//캘린더 상단에 보여주는 타이틀
			    todayHighlight : true ,	//오늘 날짜에 하이라이팅 기능 기본값 :false 
			    toggleActive : true,	//이미 선택된 날짜 선택하면 기본값 : false인경우 그대로 유지 true인 경우 날짜 삭제
			    weekStart : 0 ,//달력 시작 요일 선택하는 것 기본값은 0인 일요일 
			    language : "ko"	//달력의 언어 선택, 그에 맞는 js로 교체해줘야한다.
			    
			})//datepicker end
			.on("changeDate", function(e) {
	            console.log(e);// 찍어보면 event 객체가 나온다.
	            //간혹 e 객체에서 date 를 추출해야 하는 경우가 있는데 
	            // e.date를 찍어보면 Thu Jun 27 2019 00:00:00 GMT+0900 (한국 표준시)
	            // 위와 같은 형태로 보인다. 
	            // 추후에 yyyy-mm-dd 형태로 변경하는 코드를 업로드 하겠습니다. 
	       });
		});//ready end
		
		
		/*
			상세 정보 리스트 Sticky 스크립트
		*/
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
		
		/*
			카카오 지도 api 스크립트
		*/
		
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  
	
		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch('제주특별자치도 제주시 첨단로 242', function(result, status) {
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
		            content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
		        });
		        infowindow.open(map, marker);
		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		    } 
		});
		
		/*
			이용후기 남기기 스크립트
		*/
		function writeReview(obj) {
			$(obj).parent().siblings(".write-review").css("display", "block");
			$(obj).parent().siblings().children(".confirm-review").css({
				"display": "block",
				"float" : "right"
			});
			$(obj).css("display", "none");
			
			var htmlForm = 
				"<textarea rows='5' placeholder='다른 게스트를 위한 이용 후기를 남겨주세요.' style='width: 100%;'>" + 
				"</textarea>"
				
			$(obj).parent().siblings().children(".confirm-review").before(htmlForm);
				
			// 게스트 정보 및 후기 내용 서블릿으로 보내주기
			
		}
		
		/*
			이용후기 등록 스크립트
		*/
		function confirmReview() {
			// 참조할 후기 번호 가져오기
			// 게시글 번호 가져오기
			// location.href로 서블릿 연결해서 정보 보내주기
		}
	</script>

</body>
</html>