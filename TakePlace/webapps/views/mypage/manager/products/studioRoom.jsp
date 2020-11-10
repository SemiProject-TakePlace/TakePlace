<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오피스룸 관리</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/common/bootstrap.min.css" type="text/css" />
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/common/common.css" type="text/css" />

<script src="<%= request.getContextPath() %>/resources/js/common/jquery-3.5.1.min.js"></script>
<script src="<%= request.getContextPath() %>/resources/js/common/bootstrap.min.js"></script>

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
				    <li class="breadcrumb-item active" aria-current="page">스튜디오</li>
				  </ol>
				</nav>
				<h2 class="content-title">스튜디오</h2>
				
				<table class="table table-hover">
				  <thead>
				    <tr>
				      <th scope="col">#</th>
				      <th scope="col">First</th>
				      <th scope="col">Last</th>
				      <th scope="col">Handle</th>
				    </tr>
				  </thead>
				  <tbody>
				    <tr>
				      <th scope="row">1</th>
				      <td>Mark</td>
				      <td>Otto</td>
				      <td>@mdo</td>
				    </tr>
				    <tr>
				      <th scope="row">2</th>
				      <td>Jacob</td>
				      <td>Thornton</td>
				      <td>@fat</td>
				    </tr>
				    <tr>
				      <th scope="row">3</th>
				      <td colspan="2">Larry the Bird</td>
				      <td>@twitter</td>
				    </tr>
				  </tbody>
				</table>
			</div>
		</div>
	</section>
	
	<%@ include file="../../../common/footer.jsp" %>
</body>
</html>