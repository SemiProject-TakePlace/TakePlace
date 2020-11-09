<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>guest Manual</title>
<%@ include file="../../resources/css/common/common.jsp" %>

<%@ include file="../../resources/js/common/common.jsp" %>

<style>
	.top8 h2 {
		margin-bottom: 30px;
	}
	#wrap-contents{
		width:70%;
		margin:0 auto;
		padding:top-150px;
	}
	#nav-tab{
		text-align : center;
	}
	.tab-content{
		margin:0 auto;
	}
</style>
</head>
<body>

	<%@ include file="../common/header.jsp" %>

		<section id="wrap-contents">
		<div class="container top8">
			<h2 class="font-bold content-title">이용 방법 </h2>
		</div>
		
		<div style="border: 1px solid #82cbc4">
		<nav>
		  <div class="nav nav-tabs" id="nav-tab" role="tablist">
		  	<!-- 3개 탭일때는 33.3% -->
		    	<a style="width: 50%" class="nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">게스트 이용방법</a>
		    	<a style="width: 50%" class="nav-link" id="nav-profile-tab" onclick="goHostManual()" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">호스트 이용방법</a>
		  </div>
		</nav>
		
		
		<div class="tab-content" id="nav-tabContent">
		  	<div class="container">
				
				<br />
				<br />
				<br />
					
				<h3 class="font-green">예약하기</h3>
				
				<br />

				<p class="font-bold">예약은 어떻게 해야하나요?</p>
				<p class="font-regular">인기 상품이나 금주의 추천 공간 등을 참고하거나 공간 유형에서 원하시는 공간을 고르신 후 공간 상세페이지의 
				'HOST에게 예약 요청하기' 버튼을 눌러 공간 대여 요청을 합니다. 그 후 HOST의 승인을 받으면 결제 후 예약 완료하실 수 있습니다.</p>
				
				<br />
				
				<p class="font-bold">호스트 승인 여부는 언제 알 수 있나요?</p>
				<p class="font-regular">호스트 승인 여부는 1~2일 안에 마이페이지 '예약 현황 조회'에서 확인 하실 수 있습니다.</p>
				
				<br />
				
				<p class="font-bold">몇 시간 예약할 수 있나요?</p>
				<p class="font-regular">최소 1시간부터 최대 24시간까지 예약 가능합니다.</p>
				
				<br />
				
				<p class="font-bold">예약이 승인된 후 결제는 어떻게 해야하나요?</p>
				<p class="font-regular">마이페이지>예약 현황 조회>승인 완료 페이지의 '결제' 버튼을 누르고 결제를 진행하시면 됩니다.</p>
				
				<br />
				<br />
				
				
				<h3 class="font-green">질문하기</h3>
				
				<br />
				
				<p class="font-bold">'Take Place'에게 질문을 하고 싶으면 어떻게 해야하나요?</p>
				<p class="font-regular">테이크 플레이스 이용 및 예약 등 관련 문의는 테이크 플레이스 홈페이지 하단에 있는 '1:1 문의'를 이용하여 주시기 바랍니다.</p>
				<br />
				<br />
				<br />
				<br />
			</div>
		</div>
		</div>
		
	</section>
	
	<script>
			
			function goHostManual(){
				location.href="/takeplace/views/manual/hostManual.jsp";
			}
		
		</script>
		
	<%@ include file="../common/footer.jsp" %>	

</body>
</html>