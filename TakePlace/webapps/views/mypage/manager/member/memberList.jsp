<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*, com.kh.jsp.management.model.vo.*" %>
<%
	ArrayList<ManageMember> list = (ArrayList<ManageMember>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/common/bootstrap.min.css" type="text/css" />
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/common/common.css" type="text/css" />

<script src="<%= request.getContextPath() %>/resources/js/common/jquery-3.5.1.min.js"></script>
<script src="<%= request.getContextPath() %>/resources/js/common/bootstrap.min.js"></script>

<style>
	.mypage-content {
		margin-left: 225px; /*마이페이지에서만 sidebar 때문에  margin-left*/
	}
	
	.search-area {
		margin-bottom: 50px;
   	 	padding-bottom: 10px;
    	overflow: hidden;
	}
	.search-area .form-group {
	    margin: auto;
    	width: 50%;
	}
	.search-area #searchType {
		width: 150px;
	}
	
	#tp-footer {
		margin-left: 225px; /*마이페이지에서만 sidebar 때문에  margin-left*/
	}
	
	#mainWrapper{
	    width: 100%;
	    margin: 0 auto; /*가운데 정렬*/
	}
	td:hover {
		cursor:pointer;
	}
</style>

</head>
<body>

	<%@ include file="../../../common/header.jsp" %>
	
	<%@ include file="../../../common/managerSidebar.jsp" %>
	
	<section id="wrap-contents">
		<div class="mypage-content">
			<div class="container" >
				<nav aria-label="breadcrumb">
				  <ol class="breadcrumb">
				    <li class="breadcrumb-item"><a>관리자 페이지</a></li>
				    <li class="breadcrumb-item active" aria-current="page">회원 관리</li>
				  </ol>
				</nav>
				<h2 class="content-title">회원 관리</h2>
				<div class="row search-area mb-5">
					<div class="form-group justify-content-md-center col-10">
						<select id="searchType" class="form-control inline-block mr-2">
							<option value="id" selected>아이디</option>
							<option value="mname">이름</option>
							<option value="email">이메일</option>
						</select>
						<input type="search" id="keyword" class="form-control inline-block mr-2" placeholder="검색어를 입력하세요." onkeyup="enterkey()"> 
						<button type="button" class="btn btn-tp-custom-green mr-5" onclick="search()">검색</button>
					</div>
				</div>
					<nav>
	                	<div class="nav nav-tabs" id="nav-tab" role="tablist">
	                		<a style="width: 50%" class="nav-link" id="nav-guest-tab" data-toggle="tab" 
	                		role="tab" aria-controls="nav-guest" aria-selected="true">게스트</a>
	                		<a style="width: 50%" class="nav-link" id="nav-host-tab" data-toggle="tab" 
	    					 role="tab" aria-controls="nav-host" aria-selected="false">호스트</a>
	              		</div>
	         		</nav>
					<div class="tab-content pb-5" id="nav-tabContent" >
 					
		              <div class="tab-pane fade show active" role="tabpanel" >
		                <table class="table table-hover mt-5 text-center">
						  <thead>
						    <tr>
						      <th scope="col">회원 번호</th>
						      <th scope="col">아이디</th>
						      <th scope="col">이름</th>
						      <th scope="col">이메일</th>
						      <th scope="col">가입일</th>
						    </tr>
						  </thead>
						  <tbody>
						  <% for(ManageMember m : list) { %>
							    <tr id="memInfo">
							      <td><%= m.getMno() %></td>
							      <td><%= m.getId() %></td>
							      <td><%= m.getMname() %></td>
							      <td><%= m.getEmail() %></td>
							      <td><%= m.getJoindate() %></td>
							    </tr>
						    <% } %>
						  </tbody>
						</table>
		              </div>
	        	</div>
			</div>
		</div>
	</section>
		
	<%@ include file="../../../common/footer.jsp" %>
	
	<script>
		$(function () {
			$("#nav-guest-tab").click(function() {
				location.href="<%=request.getContextPath()%>/memberList.ml?type="+'guest';
			})
			$("#nav-host-tab").click(function() {
				location.href="<%=request.getContextPath()%>/memberList.ml?type="+'host';
			})
			
			if (location.href.indexOf("?type=guest") > -1 ) {
			     $("#nav-guest-tab").addClass("active");
			} else if (location.href.indexOf("?type=host") > -1 ) {
			     $("#nav-host-tab").addClass("active");
			}
			
			$("#memInfo td").click(function() {
				var mno = $(this).parent().children().eq(0).text();
				if (location.href.indexOf("?type=guest") > -1 ) {
					location.href="<%=request.getContextPath()%>/selectOne.ml?type="+'guest'+"&mno="+mno;
				} else if (location.href.indexOf("?type=host") > -1 ) {
					location.href="<%=request.getContextPath()%>/selectOne.ml?type="+'host'+"&mno="+mno;
				}
				
			});
			
		});
		
		function search() {
			location.href="<%=request.getContextPath()%>/searchMember.ml?con="+$('#searchType').val()+"&keyword="+$('#keyword').val();
		}
		
		function enterkey() {
	        if (window.event.keyCode == 13) {
	        	search();
	        }
		}
	</script>
</body>
</html>