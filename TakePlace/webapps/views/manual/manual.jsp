<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이용 방법(게스트)</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/common/bootstrap.min.css" type="text/css" />
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/common/common.css" type="text/css" />
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/main/main.css" type="text/css" />

<script src="<%= request.getContextPath() %>/resources/js/common/jquery-3.5.1.min.js"></script>
<script src="<%= request.getContextPath() %>/resources/js/common/bootstrap.min.js"></script>

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
</style>
</head>
<body>

	<%@ include file="../common/header.jsp" %>
	
	<section id="wrap-contents" class="footer-bottom">
		<div class="container top8">
			<h2 class="font-bold">이용 방법 </h2>
		</div>
		
		<nav>
		  <div class="nav nav-tabs" id="nav-tab" role="tablist">
		  	<!-- 3개 탭일때는 33.3% -->
		    	<a style="width: 50%" class="nav-link active" id="nav-home-tab"  onclick="goGuestManual()" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">게스트 이용방법</a>
		    	<a style="width: 50%" class="nav-link" id="nav-profile-tab" onclick="goHostManual()" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">호스트 이용방법</a>
		  </div>
		</nav>
		
		<script>
		
			function goGuestManual(){
				location.href="/takeplace/views/manual/guestManual.jsp";
			}
			
			function goHostManual(){
				location.href="/takeplace/views/manual/hostManual.jsp";
			}
		
		</script>
		
		<div class="tab-content" id="nav-tabContent">
		  	<div class="container">
				
				<br />
				<br />
				<br />
					
				<h3>font-weight</h3>
				<!-- common.css에 있음 -->
				<p class="font-regular">font-regular</p>
				<p class="font-medium">font-medium</p>
				<p class="font-bold">font-bold</p>
				
			</div>
		</div>
		
	</section>
	
	<%@ include file="../common/footer.jsp" %>

</body>
</html>