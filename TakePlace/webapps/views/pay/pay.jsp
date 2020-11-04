<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 페이지</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/common/bootstrap.min.css" type="text/css" />
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/common/common.css" type="text/css" />
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/main/main.css" type="text/css" />

<script src="<%= request.getContextPath() %>/resources/js/common/jquery-3.5.1.min.js"></script>
<script src="<%= request.getContextPath() %>/resources/js/common/bootstrap.min.js"></script>

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
				  
			</form>
			
		</div>
		
		<script>
		
			
		
		</script>
		
		
		
	</section>
	
	<%@ include file="../common/footer.jsp" %>

</body>
</html>