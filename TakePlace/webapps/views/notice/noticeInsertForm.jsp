<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/common/bootstrap.min.css" type="text/css" />
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/common/common.css" type="text/css" />
<!-- 화면 작아졌을 때 header nav dropdown시 필요함 -->
<script src="<%= request.getContextPath() %>/resources/js/common/jquery-3.5.1.min.js"></script>
<script src="<%= request.getContextPath() %>/resources/js/common/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>공지사항 작성 페이지</title>
<style>
.container{display:flex;
justify-content: center;

margin-top: 100px;}
</style>
</head>
<body>
	<%@ include file="../common/header.jsp" %>
	<% if(mem != null && mem.getMtype().equals("ADMIN")) {/*널포 방지용 !=NULL*/ %>
	<div class="outer">
		<br>
			<div class="container">

		<div class="row">
			<form method="post" action="<%= request.getContextPath() %>/nInsert.no">
				<table class="table table-striped"
					style="text-align: center;">
					<thead>
						<tr>
							<th colspan="2"
								style="background-color: #eeeeee; text-align: center;">공지사항 작성</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" class="form-control" placeholder="글 제목" name="title" maxlength="100"/></td>
						</tr>
						<tr>
							<td><textarea class="form-control" placeholder="글 내용" name="content" maxlength="3000" style="height: 400px; width:700px;"></textarea></td>
						</tr>
					</tbody>
				</table>	
				<input type="submit" class="btn btn-primary pull-right" value="글쓰기"
    style="margin-left: 12px;"
				 />
			</form>
		</div>

	</div>


	</div>
	<% } else {
		request.setAttribute("msg", "관계자 외에 접근이 불가능한 페이지입니다.");
		request.getRequestDispatcher("view/common/errorPage.jsp").forward(request, response);
	} %>
	<%@ include file="../common/footer.jsp" %>
</body>
</html>