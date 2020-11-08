<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 페이지</title>
<%@ include file="../../resources/css/common/common.jsp" %>

<%@ include file="../../resources/js/common/common.jsp" %>

<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<style>
.font-regular-content{
	text-align:center;
}
</style>
</head>
<body>

	<%@ include file="../common/header.jsp" %>
	
	<section id="wrap-contents" class="footer-bottom">
		
		<div class="container">
			<h2 class="font-bold content-title">결제 페이지</h2>
			
			<h2 class="font-regular-content">예약 요청이 승인되었습니다.</h2>
			
			<br /><br />
			
			<form id="frmLogin" method="post">
		    	
		    	<div class="form-group">
				    <label for="exampleInputId1" id="placeName" class="font-green font-bold" >공간 이름</label>
			    	<div class="inline-block">
						<p class="font-regular" id="placeName">font-regular</p>
			  		</div>
				  </div>
				  
				  <div class="form-group">
				    <label for="exampleInputId1" id="placeAddress" class="font-green font-bold" >공간 주소</label>
			    	<div class="inline-block">
						<p class="font-regular" id="placeAddress">font-regular</p>
			  		</div>
				  </div>
				  
				  <div class="form-group">
				    <label for="exampleInputId1" id="rentDate" class="font-green font-bold" >예약 날짜</label>
			    	<div class="inline-block">
						<p class="font-regular" id="rentDate">font-regular</p>
			  		</div>
				  </div>
				  
				  <div class="form-group">
				    <label for="exampleInputId1" id="price-title" class="font-green font-bold" >결제 가격</label>
			    	<div class="inline-block">
						<p class="font-regular" id="price-title">font-regular</p>
			  		</div>
				  </div>
				  
				  <div class="form-group" id="rentName">
				    <label for="exampleInputId1" id="rentName" class="font-green font-bold" >결제</label>
				    	<br />
				 </div>
				  
				  <div class="inline-block">
		    		<p class="font-medium">
		    		국가안전보장에 관련되는 대외정책·군사정책과 국내정책의 수립에 관하여 국무회의의 심의에 앞서 대통령의 자문에 응하기 위하여 국가안전보장회의를 둔다.
					<br />
					대통령의 임기연장 또는 중임변경을 위한 헌법개정은 그 헌법개정 제안 당시의 대통령에 대하여는 효력이 없다.
					<br />
					국가안전보장에 관련되는 대외정책·군사정책과 국내정책의 수립에 관하여 국무회의의 심의에 앞서 대통령의 자문에 응하기 위하여 국가안전보장회의를 둔다.
					<br />
					대통령의 임기연장 또는 중임변경을 위한 헌법개정은 그 헌법개정 제안 당시의 대통령에 대하여는 효력이 없다.
					</p>
		    		
		    		<br />
		    		<br />
		    		<p class="font-regular">결제는 마이페이지에서 취소할 수 있습니다.</p>
		    	</div>
		    	
				<button type="button" class="btn btn-tp-custom-green" id="payBtn" onclick="submitPay(this)">결제하기</button>
			</form>
			
		</div>
		
		<script>
		
		// 결제 api 회원가입한 db 값들 가지고 수정해야함
		
		var IMP = window.IMP; // 생략가능

		$(function() {
			IMP.init('1178841415834492');
		}); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
		 	// 내 REST API 키를 찾아서 수정하기
		
		$('#payBtn').on('click', function(){
			// 문서 로딩될 때 바로 호출
			
				IMP.request_pay({
					pg : 'inicis',
				    pay_method : 'card',
				    merchant_uid : 'merchant_' + new Date().getTime(),
					name : '주문명:', //+ $('#pname').text(),
					amount : parseInt($('#price').text()) * $('#quan').val(),
					buyer_email : 'test@example.com',
					buyer_name : '홍길동',
					buyer_tel : '010-1111-2222',
					buyer_addr : '서울시 강남구 역삼동',
					buyer_postcode : '01234'
				}, function(rsp) {
					if (rsp.success) {
						//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
						$.ajax({
							url : "/test/orderconfirm.do", //cross-domain error가 발생하지 않도록 동일한 도메인으로 전송
							type : 'POST',
							dataType : 'json',
							data : {
								item : 'toy',
								code : 'P0001',
								quan : $('#quan').val(),
								imp_uid : rsp.imp_uid,
								pay_method : rsp.pay_method,
								price : rsp.paid_amount,
								status : rsp.status,
								title : rsp.name,
								pg_tid : rsp.pg_tid,
								buyer_name : rsp.buyer_name,
								paid_at : rsp.paid_at,
								receipt_url : rsp.receipt_url
							//기타 필요한 데이터가 있으면 추가 전달
							}
						});
						location.href="/test/views/iamport/orderConfirm.jsp?item=toy&pay_method="+rsp.pay_method
								+"&quan=" + $('#quan').val() + "&nick="+rsp.buyer_name + "&price="+ $('#price').text()
								+"&date="+rsp.paid_at+"&price="+rsp.paid_amount;
					} else {
						var msg = '결제에 실패하였습니다.';
						msg += '\n에러내용 : ' + rsp.error_msg;
						alert(msg);
					}
				});
		});
		
		</script>
		
		
		
	</section>
	
	<%@ include file="../common/footer.jsp" %>

</body>
</html>