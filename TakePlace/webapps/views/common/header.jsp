<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.jsp.member.model.vo.*"%>
<%
	Member mem = (Member)session.getAttribute("member");
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<style>
		#tp-header {
		  background-color: #fff;
		  border-bottom: 1px solid #ddd;
		  position: fixed;
		  left: 0;
		  top: 0;
		  right: 0;
		  width: 100%;
		  z-index: 999;
		  box-shadow: 2px 2px 10px 2px rgba(0, 0, 0, 0.2)
		}
		.tp-custom-navbar {
		  background-color: transparent;
		  border: none;
		  border-radius: 0;
		  margin-bottom: 0;
		  -webkit-transition: all 0.5s;
		  -moz-transition: all 0.5s;
		  -ms-transition: all 0.5s;
		  -o-transition: all 0.5s;
		  transition: all 0.5s;
		}
		.tp-custom-navbar .tp-custom-nav form input:focus {
			border-color: #82cbc4;
		}
		.tp-custom-navbar .tp-custom-nav li {
			margin: 0 10px;
		}
		.tp-custom-navbar .tp-custom-nav li a {
		  color: #333;
		  -webkit-transition: all 0.5s;
		  -moz-transition: all 0.5s;
		  -ms-transition: all 0.5s;
		  -o-transition: all 0.5s;
		  transition: all 0.5s;
		}
		.tp-custom-navbar .tp-custom-nav li a:hover {
			color: #82cbc4 !important;
		} 
		.tp-custom-navbar .tp-custom-nav .dropdown-menu {
		  background-color: #fff;
		  border-radius: 0;
		}
		.tp-custom-navbar .tp-custom-nav .dropdown-menu li a {
		  padding: 10px 20px;
		}
	</style>
</head>

<body>
	<header id="tp-header">
		<div class="container-fluid">
		   <nav class="navbar navbar-expand-md navbar-light tp-custom-navbar">
		   		<a class="navbar-brand" href="<%= request.getContextPath() %>/index.jsp">
		   			<img src="<%= request.getContextPath() %>/resources/images/common/logo-horizontal.png" alt="Take Place" width="160" height="66"/>
		   		</a>
			    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav">
			        <span class="navbar-toggler-icon"></span>
			    </button>
		
			    <div class="collapse navbar-collapse tp-custom-nav" id="navbarNav">
				    <form class="mr-auto form-inline my-2 my-lg-0">
				      <input class="form-control mr-sm-2" type="search" placeholder="공간유형/공간이름 검색" aria-label="Search">
				      <button class="btn btn-tp-custom-green my-2 my-sm-0" type="submit">검색</button>
				    </form>
				    
			        <ul class="navbar-nav mu-main-nav font-bold">
			        	<li class="nav-item">
		                	<a class="nav-link" href="<%= request.getContextPath() %>/views/intro/intro.jsp">사이트 소개</a>
			            </li>
			            <li class="nav-item">
		                	<a class="nav-link" href="<%= request.getContextPath() %>/productsList.pr">공간 유형</a>
			            </li>
			            <li class="nav-item">
		                	<a class="nav-link" href="<%= request.getContextPath() %>/noticeList">공지사항</a>

			            </li>
			            <li class="nav-item">
		                	<a class="nav-link" href="<%= request.getContextPath() %>/views/howto/howto.jsp">이용방법</a>
			            </li>
			            
			            <%if ( mem == null ) { %>
			            
			            <li class="nav-item">
		                	<a class="nav-link" href="<%= request.getContextPath() %>/views/member/signIn.jsp">로그인</a>
			            </li>
			            <li class="nav-item">
		                	<a class="nav-link" href="<%= request.getContextPath() %>/views/member/signUp.jsp">회원가입</a>
			            </li>
			            
			            <% } else { %>
			            
				            <div class="dropdown">
							  <a class="btn dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							    <span class="font-green"><%= mem.getMname() %></span> 님
							  </a>
							
							  <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
							  
							  
							  <%if ( mem.getMtype() == "1") { %>
							  
							  <a class="dropdown-item" href="<%= request.getContextPath() %>/views/mypage/guest/profile/guestPageProfile.jsp">마이페이지</a>
							    
							  <% } else { %>
							  
							  <a class="dropdown-item" href="<%= request.getContextPath() %>/views/mypage/host/profile/hostPageProfile.jsp">마이페이지</a>
							  
							  <% } %>
							    
							    <a class="dropdown-item" onclick="logout()">로그아웃</a>
							  </div>
							</div>
				
						
						<% } %>
						
			        </ul>
			    </div>
			</nav>
		</div>
	</header>
	
	<script>
		function mypage(){
			location.href="/takeplace/mypage.me"
		}
		function logout(){
			location.href="/takeplace/logout.me";
		}
		
	</script>
</body>
</html>