<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.jsp.reservation.model.vo.*,com.kh.jsp.mypage.model.vo.*, java.util.*" %>
 <%
	ArrayList<Reservation> list = (ArrayList<Reservation>)request.getAttribute("list");
	
 	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Take Place : 예약 현황</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/common/bootstrap.min.css" type="text/css" />
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/common/common.css" type="text/css" />

<script src="<%= request.getContextPath() %>/resources/js/common/jquery-3.5.1.min.js"></script>
<script src="<%= request.getContextPath() %>/resources/js/common/bootstrap.min.js"></script>

<!-- 아이콘 사용시 연결 -->
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>

<style>

.sidebar {
  position: fixed;
  top: 0;
  bottom: 0;
  left: 0;
  z-index: 100; /* Behind the navbar */
  padding-top: 93px;
  box-shadow: inset -1px 0 0 rgba(0, 0, 0, .1);
  width: 225px;
}

.sidebar-sticky {
  position: relative;
  top: 0;
  height: calc(100vh - 48px);
  padding-top: .5rem;
  overflow-x: hidden;
  overflow-y: auto; /* Scrollable contents if viewport is shorter than content. */
}

@supports ((position: -webkit-sticky) or (position: sticky)) {
  .sidebar-sticky {
    position: -webkit-sticky;
    position: sticky;
  }
}

.sidebar .nav-link {
  font-weight: 500;
  color: #6C7994;
  padding: 15px 30px;
}

.sidebar .nav-link:hover {
  	color: #82cbc4;
	-webkit-transition: all 0.5s;
    -moz-transition: all 0.5s;
    -ms-transition: all 0.5s;
    -o-transition: all 0.5s;
    transition: all 0.5s;
}

.sidebar .nav-link .feather {
  margin-right: 4px;
  color: #999;
}

.sidebar .nav-link.active {
  color: #82cbc4;
}

.sidebar .nav-link:hover .feather,
.sidebar .nav-link.active .feather {
  color: inherit;
}

.sidebar-heading {
  font-size: .75rem;
  text-transform: uppercase;
}

.sidebar .nav-link svg {
	position: absolute;
    right: 18px;
    margin: 5px;
    font-size: 14px;
}

.mypage-content {
	margin-left: 225px; /*마이페이지에서만 sidebar 때문에  margin-left*/
	width : 1250px;
	height : 1000px;
}

#tp-footer {
	margin-left: 225px; /*마이페이지에서만 sidebar 때문에  margin-left*/
}

#button {
width : 1200px;
padding-left : 30%;
}

</style>

</head>
<body>

	<%@ include file="../../../common/header.jsp" %>
	
	<nav class="d-none d-md-block bg-light sidebar">
        <div class="sidebar-sticky">
          <ul class="nav flex-column">
            <li class="nav-item">
              <a class="nav-link" href="http://localhost:8088/takeplace/views/mypage/guest/profile/guestPageProfile.jsp">프로필</a>
            </li>
            <li class="nav-item">
              <a class="nav-link active" href="http://localhost:8088/takeplace/views/mypage/guest/reservation/reservationList.jsp">예약 현황</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="http://localhost:8088/takeplace/views/mypage/guest/pay/payList.jsp">결제 내역</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="http://localhost:8088/takeplace/views/mypage/guest/question/questionList.jsp">문의 내역</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="http://localhost:8088/takeplace/views/mypage/guest/use/useList.jsp">이용 내역</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="http://localhost:8088/takeplace/views/mypage/guest/review/reviewList.jsp">이용 후기</a>
            </li>
            
            
          </ul>
        </div>
   	</nav>
   	
   	<script>
   		var dropdown = document.getElementsByClassName("dropdown-btn");
		var i;
		
		for (i = 0; i < dropdown.length; i++) {
		  dropdown[i].addEventListener("click", function() {
			  console.log(this);
			  this.classList.toggle("active");
			  var dropdownContent = this.children;
			  var icon = dropdownContent[0].firstElementChild;
			  console.log(dropdownContent);
			  if (dropdownContent[1].style.display === "block") {
			 	dropdownContent[1].style.display = "none";
				icon.classList.add("fa-chevron-down");
				icon.style.color = "#6C7994";
			  } else {
			  	dropdownContent[1].style.display = "block";
			  	icon.classList.add("fa-chevron-up");
			  	icon.style.color = "#82cbc4";
			  }
		  });
		}
	</script>
	
	<section id="wrap-contents">
		<div class="mypage-content">
			<div class="container">
				<nav aria-label="breadcrumb">
				  <ol class="breadcrumb">
				    <li class="breadcrumb-item"><a href="#">Home</a></li>
				    <li class="breadcrumb-item"><a href="#">마이페이지</a></li>
				    <li class="breadcrumb-item active" aria-current="page">예약 현황</li>
				  </ol>
				</nav>
				<h2 class="content-title">예약 현황</h2>
				
				<!-- 여기서부터 자유롭게 컨텐츠 잡으면서 시작 -->
				<div class="tab-pane fade show active" id="nav-gest" role="tabpanel" aria-labelledby="nav-gest-tab">
                
                <nav>
		  			<div class="nav nav-tabs" id="nav-tab" role="tablist">
		  			<!-- 3개 탭일때는 33.3% -->
		    		<a style="width: 33.3%" class="nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">승인 대기 중</a>
		    		<a style="width: 33.3%" class="nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">승인 완료</a>
		    		<a style="width: 33.3%" class="nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-contact" aria-selected="false">예약 취소</a>
		  </div>
		</nav>
		<div class="tab-content" id="nav-tabContent">
		  
		  <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
			<!-- 승인 대기 중 -->
			<table align="center" id="listArea">
				<tr>
					<th width="300px">공간 명</th>					
					<th width="500px">대여시간</th>					
					<th width="500px">주소</th>					
					<th width="100px">예약취소</th>	
				</tr>
				<% for(Reservation r : list) { %>
				<tr>
					<td><%= r.getGname() %></td>
					<td><%= r.getResDate() %></td>
					<td><%= r.getGdemand() %></td>
					<td><button>취소</button></td>
				</tr>
				<% } %>
			</table>
			
			<%-- 페이지 처리 코드 넣기 --%>
		
		<div class="pagingArea" align="center">
		
		<button onclick="location.href='<%= request.getContextPath() %>/reservationList.me?currentPage=1'"></button>
			<%  if(currentPage <= 1){  %>
			<button disabled></button>
			<%  }else{ %>
			<button onclick="location.href='<%= request.getContextPath() %>/reservationList.me?currentPage=<%=currentPage - 1 %>'"></button>
			<%  } %>
			
			<% for(int p = startPage; p <= endPage; p++){
					if(p == currentPage){	
			%>
				<button disabled><%= p %></button>
			<%      }else{ %>
				<button onclick="location.href='<%= request.getContextPath() %>/reservationList.me?currentPage=<%= p %>'"><%= p %></button>
			<%      } %>
			<% } %>
				
			<%  if(currentPage >= maxPage){  %>
			<button disabled>></button>
			<%  }else{ %>
			<button onclick="location.href='<%= request.getContextPath() %>/selectList.bo?currentPage=<%=currentPage + 1 %>'"></button>
			<%  } %>
			<button onclick="location.href='<%= request.getContextPath() %>/selectList.bo?currentPage=<%= maxPage %>'">>></button>
		
		</div>
		
		  </div>
		  
		  <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
		  	<!-- 승인 완료 -->
		  	
		  </div>
		  
		  <div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab">
		  	<!-- 예약 취소 -->
		  	
		  </div>
		
		</div>
                
        </div>
              
				<!-- 여기가 컨텐츠 끝 -->
			</div>
		</div>
	</section>
	
	<%@ include file="../../../common/footer.jsp" %>
</body>
</html>