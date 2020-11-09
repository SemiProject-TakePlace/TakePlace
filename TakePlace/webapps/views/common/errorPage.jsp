<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String msg = (String)request.getAttribute("error-msg");
	Exception e = (Exception)request.getAttribute("exception");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에러 페이지</title>
<%@ include file="../../resources/css/common/common.jsp" %>
<%@ include file="../../resources/js/common/common.jsp" %>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
</head>
<body>

<%@ include file="../common/header.jsp" %>

	<section id="wrap-contents">
		<div class="container" style="text-align: center;">
			<span class="font-green" style="font-size: 100px;">
				<i class="fas fa-exclamation-triangle"></i>
			</span>
			<h3 class="font-green font-bold mb-5">서비스 에러 발생</h3>
			<p class="mb-5">
				<span class="font-green"> ERROR </span> &nbsp;&nbsp;  <%= e.getMessage() %>
			</p>
			<p>관리자에게 문의 또는 연락해주세요.</p>
		</div>
	</section>

</body>
</html>