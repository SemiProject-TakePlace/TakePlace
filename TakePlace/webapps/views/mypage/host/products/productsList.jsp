<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.kh.jsp.products.model.vo.*, com.kh.jsp.common.model.vo.*" %>
<%
   ArrayList<Product> list = (ArrayList<Product>)request.getAttribute("list");
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Page UI</title>
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
   height : auto;
}

#tp-footer {
   margin-left: 225px; /*마이페이지에서만 sidebar 때문에  margin-left*/
}

.top8 h2 {
      margin-bottom: 30px;
   }
.top8-content {
      background : rgb(240, 240, 240);
   }



</style>

</head>
<body>

   <%@ include file="../../../common/header.jsp" %>
   
   <nav class="d-none d-md-block bg-light sidebar">
        <div class="sidebar-sticky">
          <ul class="nav flex-column">
            <li class="nav-item">
              <a class="nav-link" href="http://localhost:8088/takeplace/views/mypage/host/profile/hostPageProfile.jsp">프로필</a>
            </li>
            <li class="nav-item">
              <a class="nav-link active" href="<%= request.getContextPath() %>/prdouctList.my">내 상품 목록</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="<%= request.getContextPath()%>/selectRlist.me">예약 현황</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="<%= request.getContextPath()%>/selectQlist.me">문의 내역</a>
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
                <li class="breadcrumb-item active" aria-current="page">내 상품 목록</li>
              </ol>
            </nav>
            <h2 class="content-title">내 상품 목록</h2>
            
            <!-- 여기서부터 자유롭게 컨텐츠 잡으면서 시작 -->
            <div class="top8-content">
         <div class="product-card">
            <div class="row">
               <!-- 여기서부터 for문 사용하여 여러 개 상품 돌리기 -->
               
               <% for(Product p : list) { %>
               <% if(p.getBsNum().equals(mem.getBsnum())) { %>
                  <div class="col">
                     <input type="hidden" name="pno" id="pno" value="<%= p.getPno() %>" />
                     
                        <div class="card">
                          <img src="<%=request.getContextPath() %>/resources/images/product/<%= p.getMno()%>/<%= p.getProductFile() %>"
                             class="card-img-top" alt="대표이미지" width="238" height="158">
                             <div class="card-body">
                                   
                                  <h5 class="card-title font-bold"><%= p.getPname() %></h5>
                                  <p class="card-text"><%= p.getPprice() %>원</p>
                                  <small class="rating">평점 <span class="font-green"><%= p.getPrating() %></span></small>
                                  
                                                                         
                             </div>
                        </div>
                     </div>
                     <% } %>
                  <% } %>
                  
               
            </div>
         </div>
      </div>
      
      <br>
      <script>
   
      $(function () {
         $(".col").click(function() {
            var pno = $(this).children("#pno").val();
            location.href="<%= request.getContextPath()%>/selectOneProduct.pr?pno=" + pno;
         })
      });      
      
      
      
   
      
      
      
   </script>
            
            
            <!-- 여기가 컨텐츠 끝 -->
         </div>
      </div>
   </section>
   <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
   <%@ include file="../../../common/footer.jsp" %>
</body>
</html>