<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.jsp.payrecord.model.vo.*, java.util.*" %>
<%
   ArrayList<PayRecord> list = (ArrayList<PayRecord>)request.getAttribute("Plist");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Take Place : 결제 내역</title>
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
   height : 910px;
}

#tp-footer {
   margin-left: 225px; /*마이페이지에서만 sidebar 때문에  margin-left*/
}

.outer{
      width:auto;
      height:600px;
      margin-left:auto;
      margin-right:auto;
      margin-top:50px;
   }
   
   
   
 

    #mainWrapper{
        width: 100%;
        margin: 0 auto; /*가운데 정렬*/
    }

    #mainWrapper > ul > li:first-child {
        text-align: center;
        
        
        
        vertical-align:middle;
        line-height:30px;
}

    #ulTable {margin-top:10px;}
    

    #ulTable > li:first-child > ul > li {
        background-color:#82cbc4;
        color: #ffffff;
        height : 50px;
        font-size: 110%;
        text-align:center;
        align : center;
        padding : 15px;
}

    #ulTable > li > ul {
        clear:both;
        padding:0px auto;
        position:relative;
        min-width:40px;
}
    #ulTable > li > ul > li { 
        float:left;
        padding : 10px;
        height : 50px;
        border-bottom:1px solid silver;
        vertical-align:baseline;
}    

    #ulTable > li > ul > li:first-child                  {width:10%;}
    #ulTable > li > ul > li:first-child +li              {width:20%;} 
    #ulTable > li > ul > li:first-child +li+li           {width:30%;} 
    #ulTable > li > ul > li:first-child +li+li+li        {width:20%;} 
    #ulTable > li > ul > li:first-child +li+li+li+li     {width:10%;} 
    #ulTable > li > ul > li:first-child +li+li+li+li+li  {width:10%;} 

    #divPaging {
        clear:both; 
        margin:0 auto; 
        width:365px; 
        height:100px;
        padding :40px;
      
}

    #divPaging > div {
        float:left;
        width: 30px;
        margin:10px;
        text-align:center;
       
}

    #liSearchOption {
       clear:both;
       
       align : center;
       width : auto;
       height : 100px;
       
       padding : 50px 50px 50px 325px;
    }
    #liSearchOption > div {
        margin:0 auto; 
        margin-top: 30px; 
        width:auto; 
        height:100px;
        align : center;

}


/*
.liContext:hover {
   background: rgba(0, 0, 0, 0.1);
}
*/

   

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
             <a class="nav-link" href="<%= request.getContextPath()%>/selectRlist.me">예약 현황</a>
            </li>
            <li class="nav-item">
              <a class="nav-link active" href="<%= request.getContextPath()%>/selectPlist.me">결제 내역</a>
            </li>
            <li class="nav-item">
               <a class="nav-link" href="<%= request.getContextPath()%>/selectQlist.me">문의 내역</a>
            </li>
            <li class="nav-item">
               <a class="nav-link" href="<%= request.getContextPath()%>/selectReview.me">이용 후기</a>
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
         <div class="container" >
            <nav aria-label="breadcrumb">
              <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="#">Home</a></li>
                <li class="breadcrumb-item"><a href="#">마이페이지</a></li>
                <li class="breadcrumb-item active" aria-current="page">결제 내역</li>
              </ol>
            </nav>
            <h2 class="content-title">결제 내역</h2>
            
            <!-- 여기서부터 자유롭게 컨텐츠 잡으면서 시작 -->
            
            <div class="tab-content" id="nav-tabContent" >
         
              
                <div class ="outer">
                
                <form action="#" method="post" id="create_waitingAccount" name="waitingForm">
             
                <div class="outer">
                      <div id="mainWrapper">
                          <ul>
                              <li>
                                  <ul id ="ulTable">
                                      <li>                                 
                                          <ul>
                                              <li>No</li>
                                              <li>공간 명</li>
                                              <li>상세 주소</li>
                                              <li>예약 확정 날짜</li>
                                              <li>결제 방법</li>
                                              <li>결제 상태</li>
                                       </ul>                                        
                                      </li>
                                      <!-- 게시물이 출력될 영역 -->
                                      <% int count=0; %>                                  
                                      <% for(PayRecord p : list) { %>
                                   			 <% count++;%>
                                   		<% } %>
                                   		
                                   		 <% for(PayRecord p : list) { %>
                                      <li id="liContext">
                                          <ul>
                                              <li><%= count-- %></li>
                                              <li><%= p.getPname() %></li>
                                              <li><%= p.getPaddress() %></li>
                                              <li><%= p.getPayDate() %></li>
                                     		  <li><%= p.getPayMethod() %></li>
                                     		  <% if(p.getPayStatus() == 'Y'){ %>
                                          	  <li>결제 완료</li>
                                          	    <% } else { %>
                                          	    <li>결제 취소</li>
                                          	    <% } %>   
                                          </ul>
                                      </li>
                                    
                                    <% } %>                              
                                  </ul>
                              </li>
                              </ul>
                             
                                  </div> 
                                 
                               </div>
                         
                </form>
                
                
                </div>   
              
         </div>
         
            
            <!-- 여기가 컨텐츠 끝 -->
         </div>
      </div>
   </section>
   
   <%@ include file="../../../common/footer.jsp" %>
</body>
</html>