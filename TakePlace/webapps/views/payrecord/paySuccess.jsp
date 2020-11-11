<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="com.kh.jsp.reservation.model.vo.*, com.kh.jsp.member.model.vo.*, com.kh.jsp.products.model.vo.*"%>
<%
	Reservation r = (Reservation)request.getAttribute("reservation");
	
	Product p = (Product)request.getAttribute("product");
	
	int price = Integer.parseInt(request.getParameter("num"))
			* Integer.parseInt(request.getParameter("price"));
	
	//Host는 header에 이미 들어가져있음
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
			
			<form id="payPage" method="post" name="payPage"
				action="<%=request.getContextPath()%>/payLink.pa">
				  
				  <h1>결제 완료 : <%= request.getParameter("item") %></h1>
					<p class="font-medium">
						구매 갯수 : <%= request.getParameter("num") %> <br>
						총 구매금액 : <%= price %> <br>
					</p>
			</form>
			
		</div>
		
	</section>
	
	<%@ include file="../common/footer.jsp" %>

</body>
</html>