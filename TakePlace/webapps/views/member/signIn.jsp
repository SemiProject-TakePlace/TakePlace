<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.jsp.member.model.vo.*" %>
<%
   Member m = (Member)session.getAttribute("member");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Take Place : 로그인</title>
<%@ include file="../../resources/css/common/common.jsp" %>
<%@ include file="../../resources/js/common/common.jsp" %>

<style>
   
   h2 {
      padding-bottom: 10px;
      margin-bottom: 40px;
      border-bottom: 2px solid #ccc;
   }

   h2, .to-login, #box {
      text-align: center;
   }
   
   /*
   	컨텐츠 상하 가운데 정렬 / 해상도에 따라 다르기때문에 우선 보류
   .login-content {
	   	position: absolute;
	    top: 45%;
	    left: 50%;
	    transform: translate(-50%, -50%);
   }
   */
 
   .to-login a:hover {
   		color: #82cbc4;
   }
  
   
</style>

</head>
<body>
   <%@ include file="../common/header.jsp" %>
   
   <section id="wrap-contents" class="footer-bottom">
       <div class="container login-content">
         <h2 class="font-bold font-green content-title">로그인</h2>
                  
         <!-- 로그인 -->
         <form action="/takeplace/signIn.me" id="frmLogin" method="post" style="margin: 0 auto; width: 50%;">
            
            <!-- 아이디 입력 -->
            <div class="form-group">
               <label for="userid" class="font-green inline-block" >아이디</label>
               <div class="inline-block">
               		<input type="text" class="form-control inline-block" name="userId" id="userid" required="required" placeholder="아이디 입력">         
            	</div>
            </div>
              
              <!-- 비밀번호 입력 -->
              <div class="form-group">
                  <label for="userpwd" class="font-green inline-block" >비밀번호</label>
                  <div class="inline-block">
                  	<input type="password" class="form-control inline-block" name="userPwd" id="userpwd" required="required" placeholder="비밀번호 입력">
              	</div>
              </div>
              
              <div id="box">
              <div id="message" class="mb-3"></div>
              <button type="button" class="btn btn-tp-custom-green mt-3" value="로그인" id="loginSubmit">로그인</button>
              </div>
         </form>
         
         <br>
         
         <div class="to-login">
            <a class="font-green ml-3 mr-3" href="signUp.jsp">회원가입</a>
            <a class="font-green ml-3 mr-3" href="idPwdFind.jsp">ID/비밀번호 찾기</a>
         </div>
      </div>
   </section>
   
   <%@ include file="../common/footer.jsp" %>
</body>
<script type="text/javascript">
   $(document).ready(function() {
      $("#loginSubmit").click(function() {
         var userid = $("#userid").val();
         var userpwd = $("#userpwd").val();
         
         // ajax 시작
         $.ajax({
            url : "/takeplace/signIn.me",
            type : "POST",
            data : {
               userId :  $("#userid").val(),
               userPwd : $("#userpwd").val()
            },
            // dataType
            success : function(data) {
               if(data != "fail"){
                  window.location.href="<%= request.getContextPath() %>/index";
               } else {
            	   $("#message").html("<small class='form-text text-error'>아이디 또는 비밀번호가 잘못되었습니다.</span>");
               }
               
            },
            error : function(request, status, error) {
               alert("오류가 발생했습니다. 관리자에게 문의 주세요:)");
            }
         });
         // ajax 종료
         
         
      });
   });

</script>
</html>