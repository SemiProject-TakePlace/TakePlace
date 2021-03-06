<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="com.kh.jsp.reservation.model.vo.*, com.kh.jsp.member.model.vo.*, com.kh.jsp.products.model.vo.*"%>
<%
	Reservation r = (Reservation)request.getAttribute("reservation");
	
	Product p = (Product)request.getAttribute("product");
	
	//int preqno = request.getParameter("preqno");
	
	int pno = (Integer)request.getAttribute("pno");
	int preqno = (Integer)request.getAttribute("preqno");
	
	//int mno = (Integer)request.getAttribute("mno");
	
	//System.out.println(p.getPno() + mno);
	
	// Member는 header에 이미 들어가있음
%>
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

*{
	text-align:center;
}

#smallText { font-size: small; }

#payBtn{
	margin:0 auto;
}
</style>
</head>
<body>

	<%@ include file="../common/header.jsp" %>
	
	<section id="wrap-contents" class="footer-bottom">
		
		<div class="container">
			<h2 class="font-bold content-title">결제 페이지</h2>
			
			<form method="post"
				action="<%=request.getContextPath()%>/insertPay.pa">
				  
				  
				  <input type="hidden" name="mno" id="mno" value="<%= mem.getMno() %>" />
				  <input type="hidden" name="preqno" id="preqno" value="<%= preqno %>" />
				  <input type="hidden" name="pno" id="pno" value="<%= pno %>" />
				  <input type="hidden" name="pname" id="pname" value="공간" />
				  <input type="hidden" name="price" id="price" value="100" />
				  <input type="hidden" name="num" id="num" value="1" />
				  
				  <input type="hidden" name="email" value="<%= mem.getEmail() %>" />
				  <input type="hidden" name="mname" value="<%= mem.getMname() %>" />
				  
				  
				  <div class="inline-block">
				  		<p class="font-bold">정말 결제 하시겠습니까?</p>
				  		<br />
			    		<p id="smallText" class="font-regular">결제는 마이페이지에서 취소할 수 있습니다.</p>
			      </div>
		    	<br />
		    	<br />
		    	<br />
				<button type="button" class="btn btn-tp-custom-green" id="payBtn">결제하기</button> &nbsp;&nbsp;&nbsp;&nbsp;
				<button type="reset" class="btn btn-tp-custom-white">취소</button>
			</form>
			
		</div>
		
		<script>
		
		// 결제 api 회원가입한 db 값들 가지고 수정해야함
		
		var IMP = window.IMP; // 생략가능

		$(function() {
			IMP.init('imp55995809');
		}); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
		 	// 내 REST API 키를 찾아서 수정하기 // 1178841415834492
		
		$('#payBtn').on('click', function(){
			// 문서 로딩될 때 바로 호출
			
				IMP.request_pay({
					pg : 'html5_inicis',
				    pay_method : 'card',
				    merchant_uid : 'merchant_' + new Date().getTime(),
					name : '주문명:' + $('#pname').text(),
					amount : parseInt($('#price').val()) * $('#num').val(), // amount : parseInt($('[name=price]').text()) * $('#num').val(),
					buyer_email : $('#email').text(),
					buyer_name : '주문자:' + $('#mname').text(),
					buyer_tel : '010-1234-5678',
					buyer_addr : '서울시 강남구 역삼동',
					buyer_postcode : '01234'
				}, function(rsp) {
					if (rsp.success) {
						//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
						$.ajax({
							url : "takeplace/insertPay.pa", //cross-domain error가 발생하지 않도록 동일한 도메인으로 전송
							type : 'POST',
							dataType : 'json',
							data : {
								item : 'place',
								code : 'P0001',
								num : $('#num').val(),
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
						<%--
						location.href="/takeplace/insertPay.pa?item=place&pay_method="+rsp.pay_method
								+"&num=" + $('#num').val() + "&nick="+rsp.buyer_name + "&price="+ $('#price').text()
								+"&date="+rsp.paid_at+"&price="+rsp.paid_amount;
						--%>		
						<%--
						location.href="/takeplace/insertPay.pa?mno= + $('#mno').val() + "&preqno=" + $('#preqno').val();
						--%>
						location.href="<%=request.getContextPath()%>/insertPay.pa?mno="+$('#mno').val()+"&preqno="+$('#preqno').val();
						
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