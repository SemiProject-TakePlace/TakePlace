<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
              <a class="nav-link active" href="http://localhost:8088/takeplace/views/mypage/host/profile/hostPageProfile.jsp">프로필</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="http://localhost:8088/takeplace/views/mypage/host/products/productsList.jsp">내 상품 목록</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="http://localhost:8088/takeplace/views/mypage/host/reservation/reservationList.jsp">예약 현황</a>
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
                <li class="breadcrumb-item active" aria-current="page">프로필</li>
              </ol>
            </nav>
            <h2 class="content-title">프로필</h2>
            
            <!-- 여기서부터 자유롭게 컨텐츠 잡으면서 시작 -->
            
            
                <form id="updateForm" action="/takeplace/updateHost.me" method="post" name="hostForm">
                   <div class="form-group">
                      <label class="font-green inline-block" >아이디</label>
                      <label class="form-control inline-block" style="width : 350px;" ><%= mem.getId() %></label>
                    </div>
                    <div class="form-group">
                      <label class="font-green inline-block" >회사명</label>
                      <label class="form-control inline-block" style="width : 350px;" ><%= mem.getMname() %></label>
                    </div>
                    <div class="form-group">
                      <label class="font-green inline-block" >대표명</label>
                      <label class="form-control inline-block" style="width : 350px;" ><%= mem.getBsname() %></label>
                   </div>
                    <div class="form-group">
                      <label class="font-green inline-block" >사업자 등록번호</label>
                      <label class="form-control inline-block" style="width : 350px;" ><%= mem.getBsnum() %></label>
                    </div>
              
                    <div class="form-group">
                      <label class="font-green inline-block" >새 비밀번호</label>
                      <input type="password" name="hostPwd" class="form-control inline-block" aria-describedby="emailHelp" placeholder="비밀번호 입력" maxlength="30">
                      <small id="infoPwd" class="form-text text-muted">영대문자, 숫자, 특수문자를 조합하여 8~30자를 입력하세요.</small>
                    </div>
              
                    <div class="form-group">
                        <label class="font-green inline-block" >비밀번호 확인</label>
                      <input type="password" class="form-control inline-block" aria-describedby="emailHelp" placeholder="비밀번호 입력 확인">
                    </div>
              
                    <div class="form-group">
                      <label class="font-green inline-block" >이메일</label>
                      <input type="text" name="hostemail" class="form-control inline-block" aria-describedby="emailHelp" value="<%= mem.getEmail() %>">
                  
                    </div>
              </form>
              
              <div id="button">
              <button type="button" class="btn btn-tp-custom-green" onclick="updateHost();">수정 완료</button>&nbsp;&nbsp;
              <button type="button" class="btn btn-tp-custom-white" onclick="location.href='hostPageProfile.jsp'">취소</button>  
                
              </div>
              <script>
                 function updateHost() {
                    $("#updateForm").submit();
                 }
              </script>
            <!-- 여기가 컨텐츠 끝 -->
         </div>
      </div>
   </section>
   
   <%@ include file="../../../common/footer.jsp" %>
</body>
</html>