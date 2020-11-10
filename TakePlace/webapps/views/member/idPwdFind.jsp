<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Take Place : ID/비밀번호 찾기</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/common/bootstrap.min.css" type="text/css" />
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/common/common.css" type="text/css" />
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/main/main.css" type="text/css" />

<script src="<%= request.getContextPath() %>/resources/js/common/jquery-3.5.1.min.js"></script>
<script src="<%= request.getContextPath() %>/resources/js/common/bootstrap.min.js"></script>
<script src="<%= request.getContextPath() %>/resources/js/common/jquery-ui.min.js"></script>

<style>

   .container>div {
      display: flex;
      text-align: center;
      margin: 50px;
   }
   
   .find {
      border: 1px solid black;
      width: 40%;
      display: inline-block;
      text-align: center;
      margin: 10px;
      flex: 1;
   }
   
   form {
      padding: 30px;
   }
   
   h2 {
      padding-bottom: 20px;
      margin-bottom: 30px;
      border-bottom: 2px solid #ccc;
   }
   
   .btn {
      margin-top: 30px;;
   }
   
   #btn {
   		text-align: center;
   }
</style>

</head>
<body>
   <%@ include file="../common/header.jsp" %>
   
   <section id="wrap-contents">
       <div class="container">
      
      <div>
         <div class="find">
            <form action="/takeplace/find.me">
               <h2>아이디 찾기</h2>
               <label for="findId" class="font-green inline-block" >이메일 주소</label>
                <input type="text" class="form-control inline-block" name="findId" id="findid" />
                <div id="msgId"></div>
               <input type="button" class="btn btn-tp-custom-green" value="아이디찾기" id="findId_submit" />
            </form>
         </div>
      
         <div class="find">
            <form action="/takeplace/find.me">
               <h2>비밀번호 찾기</h2>
               <label for="findPwd" class="font-green inline-block" >아이디</label>
                <input type="text" class="form-control inline-block" name="findPwd" id="findPwd" />
            
               <label for="findPwd2" class="font-green inline-block" >이메일 주소</label>
               <input type="text" class="form-control inline-block" name="findPwd2" id="findPwd2" />
               <div id="msgPwd"></div>
               <input type="button" class="btn btn-tp-custom-green" value="비밀번호 찾기" id="findPwd_submit" />
            </form>
         </div>
      </div>
     
      </div>
      
       
      <div id="btn">
         <button class="btn btn-tp-custom-green" onclick="location.href='signIn.jsp'">로그인 하기</button>
         &nbsp;&nbsp;
         <button class="btn btn-tp-custom-white" onclick="location.href='signUp.jsp'">회원가입 하기</button>
      </div>
      
   </section>
   
   <%@ include file="../common/footer.jsp" %>
</body>
<script type="text/javascript">
   $(document).ready(function() {
      
      // 아이디 찾기 
      $("#findId_submit").on("click", function() {
         var email_addr = $("#findid").val();
         
         // ajax 시작
         $.ajax({
            url : "/takeplace/find.me?command=findId",
            type : "post",
            data : {
               findId : email_addr
            },
            success : function(data) {
               if(data != 'fail'){
                     $("#msgId").html("");
                        
                  location.href  = "idFindSuccess.jsp?id=" + data.split(",")[0] +"&email=" + data.split(",")[1] 
                                 +"&mtype=" + data.split(",")[2] +"&joindate=" + data.split(",")[3];
                  
               } else { 
                     $("#msgId").html("<small class='form-text text-error'>일치하는 정보가 없습니다. 이메일 주소를 다시 확인해 주세요.</span>");

               }
               
            },
            error : function(data, status, error) {
               alert("오류가 발생했습니다. 관리자에게 문의 주세요! \n 에러코드 : " + error);
            }
         });
         
      });
      
      // 아이디 찾기 
      $("#findPwd_submit").on("click", function() {
         var findPwd = $("#findPwd").val(); 		// 아이디값
         var findPwd2 = $("#findPwd2").val();	    // 이메일 값
         
         // ajax 시작
         $.ajax({
            url : "/takeplace/find.me?command=findPwd",
            type : "post",
            data : {
            	findPwd : findPwd,
            	findPwd2 : findPwd2
            },
            success : function(data) {
               if(data != 'fail'){
                     $("#msgPwd").html("");
                     alert("임시 비밀번호가 발급되었습니다. 메일함을 확인해 주세요")
                  
               } else { 
                     $("#msgPwd").html("<small class='form-text text-error'>일치하는 정보가 없습니다. 입력하신 정보를 다시 확인해 주세요.</span>");

               }
               
            },
            error : function(data, status, error) {
               alert("오류가 발생했습니다. 관리자에게 문의 주세요! \n 에러코드 : " + error);
            }
         });
         
      });
      
      
      
   });
   


</script>
</html>