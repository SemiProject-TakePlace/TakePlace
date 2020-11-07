<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 승인 거절</title>
<%@ include file="../../resources/css/common/common.jsp" %>

<%@ include file="../../resources/js/common/common.jsp" %>

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
			
			<h2 class="font-regular-content">예약 요청이 거절되었습니다.</h2>
			
			<br /><br />
			
			<form id="frmLogin" method="post">
			
				<div class="form-group" id="rentName">
				    <label for="exampleInputId1" id="rentName" class="font-green font-bold" >예약 규정</label>
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
		    		<p class="font-regular">예약은 호스트에 의해 거절될 수 있습니다.</p>
		    	</div>
				  
			</form>
			
		</div>
		
		<script>
		
			
		
		</script>
		
		
		
	</section>
	
	<%@ include file="../common/footer.jsp" %>

</body>
</html>