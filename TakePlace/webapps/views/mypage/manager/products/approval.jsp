<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.kh.jsp.management.model.vo.*" %>
<%
	ArrayList<ManageProduct> list = (ArrayList<ManageProduct>)request.getAttribute("list");
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공간 승인 관리</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/common/bootstrap.min.css" type="text/css" />
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/common/common.css" type="text/css" />

<script src="<%= request.getContextPath() %>/resources/js/common/jquery-3.5.1.min.js"></script>
<script src="<%= request.getContextPath() %>/resources/js/common/bootstrap.min.js"></script>

<style>
	.mypage-content {
		margin-left: 225px; /*마이페이지에서만 sidebar 때문에  margin-left*/
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
				    <li class="breadcrumb-item"><a href="#">관리자 페이지</a></li>
				    <li class="breadcrumb-item"><a href="#">상품 관리</a></li>
				    <li class="breadcrumb-item active" aria-current="page">공간 승인 관리</li>
				  </ol>
				</nav>
				<h2 class="content-title">공간 승인 관리</h2>
				
				<table class="table table-hover mt-5 text-center">
				  <thead>
				    <tr>
				      <th scope="col">제품번호</th>
				      <th scope="col">호스트 이름</th>
				      <th scope="col">종류</th>
				      <th scope="col">위치</th>
				      <th scope="col">공간 이름</th>
				    </tr>
				  </thead>
				  <tbody>
				    <% for(ManageProduct p : list) { %>
					    <tr id="proInfo">
					      <td class="pno"><%= p.getPno() %></td>
					      <td><%= p.getMname() %></td>
					      <td><%= p.getPtype() %></td>
					      <td><%= p.getPcity() %></td>
					      <td><%= p.getPname() %></td>
					    </tr>
				    <% } %>
				  </tbody>
				</table>
			</div>
		</div>
	</section>
	
	<%@ include file="../../../common/footer.jsp" %>
	
	<script>
		$("#proInfo td").click(function() {
			var pno = $(this).parent().children().eq(0).text();
			console.log(pno);
			location.href="<%=request.getContextPath()%>/selectOneProduct.pr?pno=" + pno;
		});
	</script>
</body>
</html>