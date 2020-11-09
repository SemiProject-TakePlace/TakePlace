<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.jsp.notice.model.vo.*"%>

<% ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list"); %>
<% Member m= new Member(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notice</title> 
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/common/bootstrap.min.css" type="text/css" />
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/common/common.css" type="text/css" />
<!-- 화면 작아졌을 때 header nav dropdown시 필요함 -->
<script src="<%= request.getContextPath() %>/resources/js/common/jquery-3.5.1.min.js"></script>
<script src="<%= request.getContextPath() %>/resources/js/common/bootstrap.min.js"></script>

<style>
.tbl-accordion{
  margin: 0 auto;
  width: 900px;
  border: 1px solid #d9d9d9;
  thead{
    background: #d9d9d9;
  }
  // Inner table
  .tbl-accordion-nested{
    width: 100%;
    tr:nth-child(even){
      background-color: #eeeeee;
    }
    td, th{
      padding: 10px;
      border-bottom: 1px solid #d9d9d9;
    }
    .tbl-accordion-section{
      background:#333;
      color: #fff;
      cursor: pointer;
    }
  }  
}
.contwrap{
    margin-top: 150px;
    margin-bottom: 30px;
    margin-right: 15px;
    margin-left: 15px;
}
.search{display:flex;
justify-content: center;}
#ntitle{text-align:center; background:#B8E6E1;}
#ndate{ text-align:center; width:15%; background:#82CBC4; }
</style>
</head>
<body>
	<%@ include file="../common/header.jsp" %>
	
	<div class="contwrap">
	<h2 class="font-bold content-title" style="text-align:center;">공지사항</h2>
	<table cellpadding="0" cellspacing="0" class="tbl-accordion">
  <thead>
    <tr>
      <th id="ntitle">제목</th>
      <th id="ndate">작성일</th>
    </tr>
  </thead>
  <tbody>
     <% for(Notice n : list) { %>
    <tr>
      <td>
        <table cellpadding="0" cellspacing="0" class="tbl-accordion-nested">
          <thead>
         
            <tr>
              <td class="tbl-accordion-section" style="font-weight:bold;"><%=n.getNtitle() %></td>
            </tr>
          <thead>
          <tbody>
            <tr>
              <td><%= n.getNcontent() %></td>
            </tr>
          </tbody>
        </table>
      </td>
      <td><%= n.getCredate() %><td>	
    </tr>			 		
          <% } %>
  </tbody>
</table>
   <div class="search">
	<input type="search" id="keyword" placeholder="키워드를 입력하세요!" style="height:24px; padding-bottom:6px; padding-top:6px; border-top-width: 1px; margin-top: 16px;"> 
			<button type="button" onclick="search();" class="btn btn-tp-custom-green mt-3">검색하기</button>
					<% if(mem != null && mem.getMtype().equals("ADMIN")) {/*널포 방지용 !=NULL*/ %>
				<a class="nav-link btn btn-tp-custom-lightgreen mt-3" href="views/notice/noticeInsertForm.jsp">작성하기</a>
				<%} %>
	</div>
</div>
<%@ include file="../common/footer.jsp" %>
	<script>  
	//아코디언 테이블 
	$('.tbl-accordion-nested').each(function(){
		  var thead = $(this).find('thead');
		  var tbody = $(this).find('tbody');
		  
		  tbody.hide();
		  thead.click(function(){
		    tbody. slideToggle();
		  })
		});
	//검색창
		function search(){
			location.href="<%=request.getContextPath()%>/searchNotice.no?con="+$('#searchCondition').val()+"&keyword="+$('#keyword').val();
		}
	</script>
	
</body>
</html>