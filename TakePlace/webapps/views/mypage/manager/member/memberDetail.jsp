<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.jsp.management.model.vo.*"%>
<%
	ManageMember mm = (ManageMember)request.getAttribute("member");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 상세 조회</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/common/bootstrap.min.css" type="text/css" />
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/common/common.css" type="text/css" />

<script src="<%= request.getContextPath() %>/resources/js/common/jquery-3.5.1.min.js"></script>
<script src="<%= request.getContextPath() %>/resources/js/common/bootstrap.min.js"></script>
</head>
<style>
	.mypage-content {
		margin-left: 225px; /*마이페이지에서만 sidebar 때문에  margin-left*/
		width : 1250px;
		height : 910px;
	}
	
	#tp-footer {
		margin-left: 225px; /*마이페이지에서만 sidebar 때문에  margin-left*/
	}
	
	#mainWrapper{
	    width: 100%;
	    margin: 0 auto; /*가운데 정렬*/
	}
	
	.readonly {
	    margin: 7px 0;
	}
</style>

<body>
	<%@ include file="../../../common/header.jsp" %>
	
	<%@ include file="../../../common/managerSidebar.jsp" %>
	
	<section id="wrap-contents">
		<div class="mypage-content">
			<div class="container" >
				<nav aria-label="breadcrumb">
				  <ol class="breadcrumb">
				    <li class="breadcrumb-item">관리자 페이지</li>
				    <li class="breadcrumb-item">관리자</li>
				    <li class="breadcrumb-item">회원 관리</li>
				    <li class="breadcrumb-item active" aria-current="page">회원 상세 조회</li>
				  </ol>
				</nav>
				<h2 class="content-title">회원 관리</h2>
				
				<div class="form-group">
				    <label for="pAddress" class="font-green font-bold">회원 번호</label>
				    <div class="inline-block">
				    	<p id="pAddress" class="readonly"><%= mm.getMno() %></p>
				    </div>
				</div>
				
				<div class="form-group">
				    <label for="pAddress" class="font-green font-bold">아이디</label>
				    <div class="inline-block">
				    	<p id="pAddress" class="readonly"><%= mm.getId() %></p>
				    </div>
				</div>
				
				<div class="form-group">
				    <label for="pAddress" class="font-green font-bold">닉네임</label>
				    <div class="inline-block">
				    	<p id="pAddress" class="readonly"><%= mm.getMname() %></p>
				    </div>
				</div>
				
				<div class="form-group">
				    <label for="pAddress" class="font-green font-bold">이메일</label>
				    <div class="inline-block">
				    	<p id="pAddress" class="readonly"><%= mm.getEmail() %></p>
				    </div>
				</div>
				
				<div class="form-group">
				    <label for="pAddress" class="font-green font-bold">가입일</label>
				    <div class="inline-block">
				    	<p id="pAddress" class="readonly"><%= mm.getJoindate() %></p>
				    </div>
				</div>
				
				<div class="form-group">
				    <label for="pAddress" class="font-green font-bold">정보 수정일</label>
				    <div class="inline-block">
				    	<p id="pAddress" class="readonly"><%= mm.getChdate() %></p>
				    </div>
				</div>
				
				<% if( mm.getBsnum() != null)  {%>
				
				<div class="form-group">
				    <label for="pAddress" class="font-green font-bold">사업자 번호</label>
				    <div class="inline-block">
				    	<p id="pAddress" class="readonly"><%= mm.getBsnum() %></p>
				    </div>
				</div>
				
				<div class="form-group">
				    <label for="pAddress" class="font-green font-bold">사업자 이름</label>
				    <div class="inline-block">
				    	<p id="pAddress" class="readonly"><%= mm.getBsname() %></p>
				    </div>
				</div>
				
				<div class="form-group">
				    <label for="pAddress" class="font-green font-bold">호스트 평점</label>
				    <div class="inline-block">
				    	<p id="pAddress" class="readonly"><%= mm.getHrating() %></p>
				    </div>
				</div>
				
				<div class="form-group">
				    <label for="pAddress" class="font-green font-bold">가입 승인 여부</label>
				    <div class="inline-block">
				    	<p id="pAddress" class="readonly"><%= mm.getHisok() %></p>
				    </div>
				</div>
				
				<% } %>
				
				<div class="inline-block">
					<button type="button" class="btn btn-tp-custom-white mt-5"
						onclick="window.history.back()">리스트로 돌아가기</button>
						
					<% if( mm.getBsnum() != null && mm.getHisok().equals("N"))  {%>
						<form action="approvalHost.ml" method="post">
							<input type="hidden" name="mno" value="<%= mm.getMno() %>"/>
							<input type="hidden" name="confirmHost" value="<%= mm.getHisok() %>"/>
							 <button type="submit" class="btn btn-tp-custom-green mt-5"
								onclick="confirmHost()">승인하기</button>
						</form>
					<% } %>
				</div>		 
			  </div>
			</div>
		</div>
	</section>

</body>
</html>