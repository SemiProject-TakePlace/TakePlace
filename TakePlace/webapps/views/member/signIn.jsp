<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Take Place : 로그인</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/common/bootstrap.min.css" type="text/css" />
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/common/common.css" type="text/css" />
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/main/main.css" type="text/css" />

<script src="<%= request.getContextPath() %>/resources/js/common/jquery-3.5.1.min.js"></script>
<script src="<%= request.getContextPath() %>/resources/js/common/bootstrap.min.js"></script>
<script src="<%= request.getContextPath() %>/resources/js/common/jquery-ui.min.js"></script>

<style>
	
	h2 {
		padding-bottom: 10px;
		margin-bottom: 40px;
		border-bottom: 2px solid #ccc;
	}
	
		
	h2, #atag {
		text-align: center;
	}
	
	/*
	h2 {
		position: relative;
	}
	
	h2:before {
   		border-top: 2px solid #82cbc4;
    	content: "";
    	margin: 0 auto;
    	position: absolute;
    	top: 115%;
    	left: 0;
    	right: 0;
    	bottom: 0;
    	width: 30%;
    	z-index: -1;
	}
	*/

	 
	.form-group input{
		width: 50%;
	}
	
	.input-submit {
  		display: block;
 		width: 30%;
  		height: 40px;
  		padding: 6px 12px;
  		font-size: 15px;
  		line-height: 1.42857143;
  		color: #fff;
  		background-color: #82cbc4;
  		border: 1px solid #ccc;
  		border-radius: 3x;
  		-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
          		box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
  		-webkit-transition: border-color ease-in-out .15s, -webkit-box-shadow ease-in-out .15s;
       		-o-transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
          	   transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
	}
</style>

</head>
<body>
	<%@ include file="../common/header.jsp" %>
	
	<section id="wrap-contents" class="footer-bottom">
    	<div class="container">
			<h2 class="font-green">로그인</h2>
						
			<!-- 로그인 -->
			<form action="/takeplace/login.do" id="frmLogin" method="post"
				  style="margin: 0 auto; width: 50%;">
				
				<!-- 아이디 입력 -->
				<div class="form-group">
					<label for="userid" class="font-green inline-block" >아이디</label>
					<br><input type="text" class="form-control inline-block" id="userid" required="required" placeholder="아이디 입력">			
				</div>
			  	
			  	<!-- 비밀번호 입력 -->
			  	<div class="form-group">
					<label for="userpwd" class="font-green inline-block" >비밀번호</label>
					<br><input type="text" class="form-control inline-block" id="userpwd" required="required" placeholder="비밀번호 입력">
				</div>
			  	
			    <input type="submit" class="input-submit inline-block" value="로그인">
			</form>
			
			<br>
			
			<div id="atag">
				<a href="signUp.jsp">회원가입</a> &nbsp;&nbsp;&nbsp;
				<a href="find_IdPwd.jsp">ID/비밀번호 찾기</a>
			</div>
		</div>
	</section>
	
	<%@ include file="../common/footer.jsp" %>
</body>
</html>