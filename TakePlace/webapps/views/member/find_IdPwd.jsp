<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Take Place : ID/비밀번호 찾기</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/common/bootstrap.min.css" type="text/css" />
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/common/common.css" type="text/css" />
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/main/main.css" type="text/css" />

<script src="<%= request.getContextPath() %>/resources/js/common/jquery-3.5.1.min.js"></script>
<script src="<%= request.getContextPath() %>/resources/js/common/bootstrap.min.js"></script>
<script src="<%= request.getContextPath() %>/resources/js/common/jquery-ui.min.js"></script>

<style>

	
	.container>div {
		display: flex;
		text-align: center;
		margin: 50px;
	}
	
	.find {
		border: 1px solid black;
		width: 40%;
		display: inline-block;
		text-align: center;
		margin: 10px;
		flex: 1;
	}
	
	form {
		padding: 30px;
	}
	
	h2 {
		padding-bottom: 20px;
		margin-bottom: 30px;
		border-bottom: 2px solid #ccc;
	}
	
	.btn {
		margin-top: 20px;
	}
	
</style>

</head>
<body>
	<%@ include file="../common/header.jsp" %>
	
	<section id="wrap-contents">
    	<div class="container">
		
		<div>
			<div class="find">
				<form action="#">
					<h2>아이디 찾기</h2>
					<label for="findId" class="font-green inline-block" >이메일 주소</label>
					<input type="text" class="form-control inline-block name="findId" id="findId" />
					<button class="btn btn-tp-custom-green">아이디 찾기</button>
				</form>
			</div>
		
			<div class="find">
				<form action="#">
					<h2>비밀찾기 찾기</h2>
					<label for="findPwd" class="font-green inline-block" >아이디</label>
			    	<input type="text" class="form-control inline-block" name="findId" id="findPwd" />
				
					<label for="findPwd2" class="font-green inline-block" >이메일 주소</label>
					<input type="text" class="form-control inline-block" name="findId" id="findPwd2" />
					<button class="btn btn-tp-custom-green">비밀번호 찾기</button>
				</form>
			</div>
		</div>
		
		</div>
	</section>
	
	<%@ include file="../common/footer.jsp" %>
</body>
</html>