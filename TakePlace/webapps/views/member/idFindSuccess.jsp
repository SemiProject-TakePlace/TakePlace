<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Take Place : ID찾기 성공</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/common/bootstrap.min.css" type="text/css" />
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/common/common.css" type="text/css" />
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/main/main.css" type="text/css" />

<script src="<%= request.getContextPath() %>/resources/js/common/jquery-3.5.1.min.js"></script>
<script src="<%= request.getContextPath() %>/resources/js/common/bootstrap.min.js"></script>
<script src="<%= request.getContextPath() %>/resources/js/common/jquery-ui.min.js"></script>
</head>

<style>

	h2 {
      padding-bottom: 10px;
      margin-bottom: 40px;
      border-bottom: 2px solid #ccc;
      text-align: center;
   }
	
	.container { 
		text-align: center;
	}
	
	#logo {
		width: 200px;
		height: 100px;
	}
	
	#findBox {
		width: 80%;
		border:1px solid black;
		padding: 70px;
		margin: 30px;
		display: table;
	}
	
	.userinfobox {
		margin: 30px;
		display: table-cell;
	}
	
	#btn {
		text-align: center;
		padding-top: 30px;
	}
	
	#line {
		border-left: 1px solid black;
		display: table-cell;
		height: 100px
	}
	
</style>
<body>
	<%@ include file="../common/header.jsp" %>
	<section id="wrap-contents">
    	<div class="container">
    		
    		<h2>아이디 찾기 성공</h2>
    		
    		<small class="smalltag">고객님의 정보와 일치하는 아이디 입니다.</small>
    		
    		<div id="findBox">
    			<div id="userimage">
    				<img id="logo" src="<%= request.getContextPath() %>/resources/images/common/logo-horizontal.png" alt="유저이미지" />
    			</div>
    			
    			<div id ="line"></div>
    			
    			<div class="userinfobox">
    				<div class="userinfo">
	    				아이디 : 찾은 아이디 (회원유형 + 회원, 가입일)<br>
	    				이메일 : 찾은 이메일 
    				</div>
    				<div class="userinfo">
    				<br><br>TAKE PLACE를 이용해 주셔서 감사합니다.
    				</div>
    			</div>
    		</div>
    		
    		<small class="smalltag">고객님의 아이디찾기가 성공적으로 이루어졌습니다.</small>
		</div>
		
		<div id="btn">
			<button class="btn btn-tp-custom-green" onclick="location.href='signIn.jsp'">로그인 하기</button>
			&nbsp;&nbsp;
			<button class="btn btn-tp-custom-white" onclick="location.href='idPwdFind.jsp'">비밀번호 찾기</button>
		</div>
		
	</section>
	
	<%@ include file="../common/footer.jsp" %>
</body>
</html>