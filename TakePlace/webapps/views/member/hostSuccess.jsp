<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Take Place : 호스트 회원가입 성공</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/common/bootstrap.min.css" type="text/css" />
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/common/common.css" type="text/css" />
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/main/main.css" type="text/css" />

<script src="<%= request.getContextPath() %>/resources/js/common/jquery-3.5.1.min.js"></script>
<script src="<%= request.getContextPath() %>/resources/js/common/bootstrap.min.js"></script>
<script src="<%= request.getContextPath() %>/resources/js/common/jquery-ui.min.js"></script>

<style>
	#hostJoin {
	margin: 0 auto;
	width: 100%;
	}
	
	#mainbtn {
		text-align: center;
		margin-top: 50px;
	}
	
	
</style>
</head>
<body>
	<%@ include file="../common/header.jsp" %>
	
	<section id="wrap-contents">
    	<div class="container">
			
			<img src="<%= request.getContextPath() %>/resources/images/hostJoin.png" alt="호스트 가입  승인요청(3일이내 처리)" id="hostJoin"/>
		   	<div id="mainbtn">
		   		<button class="btn btn-tp-custom-green" onclick="location.href='<%= request.getContextPath() %>/index'">메인으로 돌아가기</button>
		   	</div>
		</div>
	</section>
	
	<%@ include file="../common/footer.jsp" %>
</body>
</html>