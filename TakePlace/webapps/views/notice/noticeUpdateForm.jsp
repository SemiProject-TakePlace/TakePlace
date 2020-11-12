<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.jsp.notice.model.vo.*"%>
<% Notice n = (Notice)request.getAttribute("notice"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/common/bootstrap.min.css" type="text/css" />
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/common/common.css" type="text/css" />
<!-- 화면 작아졌을 때 header nav dropdown시 필요함 -->
<script src="<%= request.getContextPath() %>/resources/js/common/jquery-3.5.1.min.js"></script>
<script src="<%= request.getContextPath() %>/resources/js/common/bootstrap.min.js"></script>
<meta charset="UTF-8">

<style>
.container{display:flex;
justify-content: center;
margin-top: 100px;}
</style>
<title>공지 사항 수정</title>
</head>
<body>
	<%@ include file="../common/header.jsp" %>
	<% if(mem != null && mem.getMtype().equals("MANAGER")){ %>
	<div class="container">
		<br>
		<div class="tableArea">
			<form id="updateForm" method="post">
				<table class="table table-striped"
					style="text-align: center;">
					<thead>
					  <tr>
					    <th colspan="2"
					     style="background-color: #eeeeee; text-align:center;">공지사항 수정
					     <input type="hidden" name="nno" value="<%= n.getNno()%>">  </th>
					  </tr>
					</thead>
					<tbody> 
						 <tr>
						 
						  <td>글 제목 </td>
					     	 <td colspan="3">
						    	<input type="text" size="50" name="title" 
							       value="<%= n.getNtitle()%>">
						    </td>
					    </tr>
			
					<tr>
						<td colspan="4">
							<textarea name="content" cols="60" rows="15" style="resize:none;"><%= n.getNcontent() %></textarea>
						</td>
					</tr>
					</tbody>
				</table>
				<button  class="btn btn-primary pull-right" onclick="complete();">수정완료</button>
				
				 <script>
					function complete(){
						$("#updateForm").attr("action","<%=request.getContextPath() %>/nUpdate.no");
						
					}
					</script>
					
				 </form>
				<br>
				</div>
			
		</div>
	
	<% } else {
		request.setAttribute("msg", "관계자 외에 접근이 불가능한 페이지입니다.");
		request.getRequestDispatcher("view/common/errorPage.jsp").forward(request, response);
	 } %>
	<%@ include file="../common/footer.jsp" %>
</body>
</html>