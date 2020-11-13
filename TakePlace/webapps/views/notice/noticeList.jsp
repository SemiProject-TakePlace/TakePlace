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
 table{border-collapse:collapse;
    } 
  td{  
  border-bottom:2px solid gray; 
  }
  .tbl-accordion-nested{
    width: 100%;
    tr:nth-child(even){
      background-color: #eeeeee;
    }
    
    .tbl-accordion-section{
      background:#333;
      color: #fff;
      cursor: pointer;
    }
  }  
}
#wrap-contents container{
    margin-top: 150px;
    margin-bottom: 30px;
    margin-right: 15px;
    margin-left: 15px;
}
.search{display:flex;
justify-content: center;}
.nti{text-align:center; background:#B8E6E1; font-size:20px;}
#ndate{ text-align:center; width:15%; background:#82CBC4; font-size:20px; }
.del{width:50px; }
</style>
</head>
<body>
	<%@ include file="../common/header.jsp" %>
	
	<section id="wrap-contents" class="footer-bottom">
		<div class="container">
			<h2 class="content-title">공지사항</h2>
	<table cellpadding="0" cellspacing="0" class="tbl-accordion">
  <thead>
    <tr height="40px">
      <th class="nti">제목</th>
      <th id="ndate">작성일</th>
       <% if(mem != null && mem.getMtype().equals("MANAGER")) { %>
          <th class="nti" style="width:150px;">
              관리
          </th>
       <% } %>   
    </tr>
  </thead>
  <tbody>
     <% for(Notice n : list) { %>
    <tr style="border-bottom:1px solid #B8E6E1; padding=10px;">
      <td>
        <table cellpadding="0" cellspacing="0" class="tbl-accordion-nested">
          <thead>
         
            <tr>
              <td class="tbl-accordion-section" height="45px" style="font-weight:bold; padding-left:10px;"><%=n.getNtitle() %>
              </td>
            </tr>
          <thead>
          <tbody>
            <tr>
              <td><pre class="font-regular"><%= n.getNcontent() %></pre> </td>
            </tr>
          </tbody>
        </table>
      </td>
      <td style="text-align:center;" class="font-regular"><%= n.getCredate() %></td>	
        <% if(mem != null && mem.getMtype().equals("MANAGER")) { %>
          <td class="del" style="text-align:center;">
              <button onclick="deleteNotice('<%= n.getNno()%>');" class="btn btn-tp-custom-green mr-1">삭제</button>
              <button onclick="updateNotice('<%= n.getNno() %>');" class="btn btn-tp-custom-white ml-1">수정</button>
          </td>
        <% } %>
    </tr>			 		
          <% } %>
  </tbody>
</table>
   <div class="search">
	<input type="search" id="keyword" placeholder="키워드를 입력하세요!" style="height:24px; padding-bottom:6px; padding-top:6px; border-top-width: 1px; margin-top: 16px;"> 
			<button type="button" onclick="search();" class="btn btn-tp-custom-green mt-3">검색하기</button>
					<% if(mem != null && mem.getMtype().equals("MANAGER")) { %>
				<a class="nav-link btn btn-tp-custom-white mt-3" href="views/notice/noticeInsertForm.jsp">작성하기</a>
				<%} %>
	</div>
</div>

</section>
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
	
	function deleteNotice(nno){
		location.href='<%=request.getContextPath() %>/nDelete.no?nno='+nno;
	}
	function updateNotice(nno){
		location.href='<%=request.getContextPath() %>/nUpView.no?nno='+nno;
	}
	//검색창
		function search(){
			location.href="<%=request.getContextPath()%>/nSearch.no?keyword="+$('#keyword').val();
		}
	</script>
	
</body>
</html>