<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Take Place : 회원가입</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/common/bootstrap.min.css" type="text/css" />
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/common/common.css" type="text/css" />
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/main/main.css" type="text/css" />

<script src="<%= request.getContextPath() %>/resources/js/common/jquery-3.5.1.min.js"></script>
<script src="<%= request.getContextPath() %>/resources/js/common/bootstrap.min.js"></script>
<script src="<%= request.getContextPath() %>/resources/js/common/jquery-ui.min.js"></script>

<style>
   form {
      padding: 30px;
   }
</style>
</head>
<body>
   <%@ include file="../common/header.jsp" %>
   
   <section id="wrap-contents">
      <div class="container">
         <nav>
              <div class="nav nav-tabs" id="nav-tab" role="tablist">
                <a style="width: 50%" class="nav-link active" id="nav-gest-tab" data-toggle="tab" href="#nav-gest" role="tab" aria-controls="nav-gest" aria-selected="true">게스트 회원가입</a>
                <a style="width: 50%" class="nav-link" id="nav-host-tab" data-toggle="tab" href="#nav-host" role="tab" aria-controls="nav-host" aria-selected="false">호스트 회원가입</a>
              </div>
         </nav>
            
         <div class="tab-content" id="nav-tabContent">
         <!-- 회원가입 시작 -->
              <div class="tab-pane fade show active" id="nav-gest" role="tabpanel" aria-labelledby="nav-gest-tab">
                <div style="border: 1px solid #82cbc4">
                
                <form action="#" method="post" id="create_gestAccount" name="gestForm">
                <!-- 게스트 회원가입 -->
             <div class="form-group">
                <label for="userid" class="font-green inline-block" >아이디</label>
                <input type="text" class="form-control inline-block" id="userid" aria-describedby="emailHelp" placeholder="아이디 입력" maxlength="20">
                <small id="infoId" class="form-text text-muted">5~20자 이상의 영문 소문자, 숫자만 사용 가능합니다.</small>
                <small id="validationId" class="form-text text-error" style="display:none;">5~20자 이상의 영문 소문자, 숫자만 사용 가능합니다.</small>
                <small id="requiredId" class="form-text text-error" style="display:none;">필수 입력 사항 입니다.</small>
                <small id="chkId" class="form-text text-emuted" style="display:none; color: green;">사용 가능한 아이디 입니다.</small>
                <input id="duplicationId" type="hidden" value="idUncheck"> <!-- 아아디 중복체크용 -->
              </div>
                 
              <div class="form-group">
                <label for="userNick" class="font-green inline-block" >닉네임</label>
                <input type="text" class="form-control inline-block" id="userNick" aria-describedby="emailHelp" placeholder="닉네임 입력">
                <small id="infoNick" class="form-text text-muted">한글 또는 영소문자를 조합하여 6자 이상 입력하세요.</small>
                <small id="validationNick" class="form-text text-error" style="display:none;">한글 또는 영소문자를 조합하여 6자 이상 입력하세요.</small>
                <small id="requiredNick" class="form-text text-error " style="display:none;">필수 입력 사항 입니다.</small>
                <small id="chkNick" class="form-text text-emuted" style="display:none; color: green;">사용 가능한 닉네임 입니다.</small>
              </div>
              
              <div class="form-group">
                <label for="userpwd" class="font-green inline-block" >비밀번호</label>
                <input type="password" class="form-control inline-block" id="userpwd" aria-describedby="emailHelp" placeholder="비밀번호 입력" maxlength="30">
                <small id="infoPwd" class="form-text text-muted">영대문자, 숫자, 특수문자를 조합하여 8~30자를 입력하세요.</small>
                <small id="validationPwd" class="form-text text-error" style="display:none;">영대문자, 숫자, 특수문자를 조합하여 8~30자를 입력하세요.</small>
                <small id="requiredPwd" class="form-text text-error" style="display:none;">필수 입력 사항 입니다.</small>
              	 <small id="chkPwd" class="form-text text-emuted" style="display:none; color: green;">사용 가능한 비밀번호 입니다.</small>
              </div>
              
              <div class="form-group">
                  <label for="pwdchk" class="font-green inline-block" >비밀번호 확인</label>
                <input type="password" class="form-control inline-block" id="pwdchk" aria-describedby="emailHelp" placeholder="비밀번호 입력 확인">
                <small id="requiredPwdchk" class="form-text text-error requiredId" style="display:none;">필수 입력 사항 입니다.</small>
                <small id="validationPwdchk" class="form-text text-error" style="display:none;">비밀번호가 일치하지 않습니다.</small>
              </div>
              
              <div class="form-group">
                  <label for="userEmail" class="font-green inline-block" >이메일</label>
                <input type="text" class="form-control inline-block" id="userEmail" aria-describedby="emailHelp" placeholder="이메일 입력">
                 <button class="btn btn-tp-custom-green">이메일 인증</button>
              </div>
              
              <button type="button" class="btn btn-tp-custom-green" onclick="signUp();">회원가입</button>
                
                </form>
                
                </div>
              </div>
              
              <!-- ----------------------------------------------------------- -->
              
              <div class="tab-pane fade" id="nav-host" role="tabpanel" aria-labelledby="nav-host-tab">
                
                 <div style="border: 1px solid #82cbc4">
                 <form action="#" method="post" id="create_hostAccount">
                 <!-- 호스트 회원가입 -->
                  <div class="form-group">
                  <label for="companyName" class="font-green inline-block" >회사명</label>
                <input type="text" class="form-control inline-block" id="companyName" aria-describedby="emailHelp" placeholder="회사명 입력">
              </div>
                 
                <div class="form-group">
                  <label for="hostName" class="font-green inline-block" >사업자명</label>
                <input type="text" class="form-control inline-block" id="hostName" aria-describedby="emailHelp" placeholder="사업자명 입력">
              </div>
              
              <div class="form-group">
                  <label for="companyNo" class="font-green inline-block" >사업자 등록 번호</label>
                <input type="password" class="form-control inline-block" id="companyNo" aria-describedby="emailHelp" placeholder="사업자 등록 번호 입력">
              </div>
              
              <div class="form-group">
                  <label for="hostid" class="font-green inline-block" >아이디</label>
                <input type="text" class="form-control inline-block" id="hostid" aria-describedby="emailHelp" placeholder="아이디 입력" maxlength="">
                <small id="hostinfoId" class="form-text text-muted">5~20자 이상의 영문 소문자, 숫자만 사용 가능합니다.</small>
                <small id="hostvalidationId" class="form-text text-error" style="display:none;">5~20자 이상의 영문 소문자, 숫자만 사용 가능합니다.</small>
                <small id="hostrequiredId" class="form-text text-error" style="display:none;">필수 입력 사항 입니다.</small>
                <small id="hostchkId" class="form-text text-emuted" style="display:none; color: green;">사용 가능한 아이디 입니다.</small>
                
                 <!-- <button class="btn btn-tp-custom-green">중복확인</button> -->
              </div>
              
              <div class="form-group">
                  <label for="hostpwd" class="font-green inline-block" >비밀번호</label>
                <input type="password" class="form-control inline-block" id="hostpwd" aria-describedby="emailHelp" placeholder="비밀번호 입력">
                <small id="hostinfoPwd" class="form-text text-muted">영대문자, 숫자, 특수문자를 조합하여 8~30자를 입력하세요.</small>
                <small id="hostvalidationPwd" class="form-text text-error" style="display:none;">영대문자, 숫자, 특수문자를 조합하여 8~30자를 입력하세요.</small>
                <small id="hostrequiredPwd" class="form-text text-error" style="display:none;">필수 입력 사항 입니다.</small>
                <small id="hostchkPwd" class="form-text text-emuted" style="display:none; color: green;">사용 가능한 비밀번호 입니다.</small>
              </div>
              
              <div class="form-group">
                  <label for="pwdchk2" class="font-green inline-block" >비밀번호 확인</label>
                <input type="password" class="form-control inline-block" id="pwdchk2" aria-describedby="emailHelp" placeholder="비밀번호 입력 확인">
                <small id="hostrequiredPwd" class="form-text text-error requiredId" style="display:none;">필수 입력 사항 입니다.</small>
                <small id="hostvalidationPwd" class="form-text text-error" style="display:none;">비밀 번호가 일치하지 않습니다.</small>
              </div>
              
              <div class="form-group">
                  <label for="hostemail" class="font-green inline-block" >이메일</label>
                <input type="text" class="form-control inline-block" id="userEmail" aria-describedby="emailHelp" placeholder="이메일 입력">
                 <button class="btn btn-tp-custom-green">이메일 인증</button>
              </div>
              
              <button type="button" class="btn btn-tp-custom-green" onclick="signUp();">회원가입</button>
                
                </form>
                </div>
                </div>
         </div>                            
   </div>
          <!-- 회원가입 종료-->
    
   </section>

   <!------------------------- 유효성 체크 함수 ----------------------->
      <script type="text/javascript">
      // 엔터 전송 방지
      $('input').keydown(function() {
         if (event.keyCode === 13) {
           event.preventDefault();
         };
       });
      
      function chk(re, e){
          if(re.test(e.value)){
             return true;
          }
          
          e.value = "";
          e.focus();
          return false;
       }
      
      $(document).ready(function() {
        
    	  $("#userid").on("blur", function() {
              var userId = document.getElementById("userid").value;
              var idReg = /^[a-zA-Zㄱ-힣0-9]*$/;
              var duplicationChk = document.getElementById("duplicationId").value; 
              
            // 중복검사된 아이디 인지 확인
              if(duplicationChk != "idUncheck"){
                 $("#duplicationId").value("idUncheck");
                 // 중복체크 후 다시 아이디 창이 새로운 아이디를 입력했을 때
               // 다시 중복체크를 하도록 한다.
              }      
              
              if(userId == "" || userId == null){
                 // id를 입력하지 않았으면 info메세지를 지우고 require 메세지를 띄운다
               $("#infoId").css("display", "none");
               $("#requiredId").css("display", "block");
               $("#chkId").css("display", "none");
              } else {
                 if(userId.length >= 5){
                    if(!chk(idReg, userId)){
                      // 유효성 검사 통과 X / 빨간 글씨로 안내
                      $("#infoId").css("display", "none");
                      $("#requiredId").css("display", "none");
                      $("#validationId").css("display", "block");
                      $("#chkId").css("display", "none");
                     } else {
                      // 유효성 검사 통과 / 사용가능 아이디 문구
                      $("#infoId").css("display", "none");
                      $("#requiredId").css("display", "none");
                      $("#validationId").css("display", "none");
                      $("#chkId").css("display", "block");
                        
                      /*                    
					  // 중복검사 실행
                      $.ajax(
                         url : ".do?commmand" + userId, // 커맨드 입력
                         type : get,
                         success function(data) {
                            // Controller 작성되면 할예정
                              $("#duplicationId").value("idcheck");

                        },
                        error : function(request, status, error){
                           alert("오류 발생 : " + error);
                        }
                      ); */
                      
                     }   
                    
                 } else {
                  // 아이디의 길이가 5미만일 때
                  // 아이디의 길이가 20이 초과되지않게 input에 max langth 20
                  $("#infoId").css("display", "none");
                  $("#requiredId").css("display", "none");
                  $("#validationId").css("display", "block");
                  $("#chkId").css("display", "none");
                 }
              }
              
      });
    	  
    	  $("#userNick").on("blur", function() {
              var userNick = document.getElementById("userNick").value;
              // 닉네임 정규식 특수문자
              var NickReg = /^[A-Za-z0-9_\-]{5,20}$/
           
              if(userNick == "" || userpwd == null){
                 // 비밀번호를 입력하지 않았으면 info메세지를 지우고 require 메세지를 띄운다
               $("#infoNick").css("display", "none");
               $("#requiredNick").css("display", "block");
               $("#chkNick").css("display", "none");
              } else {
                 if(userNick.length >= 8){
                    if(!chk(NickReg, userNick)){
                      // 유효성 검사 통과 X / 빨간 글씨로 안내
                      $("#infoNick").css("display", "none");
                      $("#requiredPNick").css("display", "none");
                      $("#validationNick").css("display", "block");
                      $("#chkNick").css("display", "none");
                     } else {
                      // 유효성 검사 통과 / 사용가능 닉네임 문구
                      $("#infoNick").css("display", "none");
                      $("#requiredNick").css("display", "none");
                      $("#validationNick").css("display", "none");
                      $("#chkNick").css("display", "block");
                      
                     }   
                    
                 } else {
                  // 닉네임의 길이가 6미만일 때
                  // 닉네임의 길이가 30이 초과되지않게 input에 max langth 30
                  $("#infoNick").css("display", "none");
                  $("#requiredNick").css("display", "none");
                  $("#validationNick").css("display", "block");
                  $("#chkNick").css("display", "none");
                 }
              }
                   
      });
            
     
    	  $("#userpwd").on("blur", function() {
              var userpwd = document.getElementById("userpwd").value;
              // 비밀번호 정규식 특수문자 / 문자 / 숫자 포함 형태의 8~30
              var pwdReg = /^[A-Za-z0-9_\-]{5,20}$/
           
              if(userpwd == "" || userpwd == null){
                 // 비밀번호를 입력하지 않았으면 info메세지를 지우고 require 메세지를 띄운다
               $("#infoPwd").css("display", "none");
               $("#requiredPwd").css("display", "block");
               $("#chkPwd").css("display", "none");
              } else {
                 if(userpwd.length >= 8){
                    if(!chk(pwdReg, userpwd)){
                      // 유효성 검사 통과 X / 빨간 글씨로 안내
                      $("#infoPwd").css("display", "none");
                      $("#requiredPwd").css("display", "none");
                      $("#validationPwd").css("display", "block");
                      $("#chkId").css("display", "none");
                     } else {
                      // 유효성 검사 통과 / 사용가능 비밀번호 문구
                      $("#infoPwd").css("display", "none");
                      $("#requiredPwd").css("display", "none");
                      $("#validationPwd").css("display", "none");
                      $("#chkPwd").css("display", "block");
                      
                     }   
                    
                 } else {
                  // 아이디의 길이가 8미만일 때
                  // 아이디의 길이가 30이 초과되지않게 input에 max langth 30
                  $("#infoPwd").css("display", "none");
                  $("#requiredPwd").css("display", "none");
                  $("#validationPwd").css("display", "block");
                  $("#chkPwd").css("display", "none");
                 }
              }             
       
      });
    	 
    	  $("#pwdchk").on("blur", function() {
              var pwdchk = document.getElementById("pwdchk").value;
           
              if(pwdchk == "" || pwdchk == null){           
               $("#requiredPwdchk").css("display", "block");
               $("#chkPwdchk").css("display", "none");
              } else {
                 if($('#userpwd').val() != $('#pwdchk').val()) {
                	 $("#requiredPwdchk").css("display", "none");
                     $("#validationPwdchk").css("display", "block");
              } else {
            	  $("#validationPwdchk").css("display", "none");
              }
     	 }
    });  
    	  
    	  ///////////////////////  호스트 유효성 검사 ////////////////////////////
    	  
    	  $("#hostid").on("blur", function() {
              var hostid = document.getElementById("hostid").value;
              var idReg = /^[A-Za-z0-9_\-]{5,20}$/
            
              if(hostid == "" || hostid == null){
               // id를 입력하지 않았으면 info메세지를 지우고 require 메세지를 띄운다
               $("#hostinfoId").css("display", "none");
               $("#hostrequiredId").css("display", "block");
               $("#hostchkId").css("display", "none");
              } else {
                 if(hostid.length >= 5){
                    if(!chk(idReg, hostid)){
                      // 유효성 검사 통과 X / 빨간 글씨로 안내
                      $("#hostinfoId").css("display", "none");
                      $("#hostrequiredId").css("display", "none");
                      $("#hostvalidationId").css("display", "block");
                      $("#hostchkId").css("display", "none");
                     } else {
                      // 유효성 검사 통과 / 사용가능 아이디 문구
                      $("#hostinfoId").css("display", "none");
                      $("#hostrequiredId").css("display", "none");
                      $("#hostvalidationId").css("display", "none");
                      $("#hostchkId").css("display", "block");
                      
                     }   
                    
                 } else {
                  // 아이디의 길이가 5미만일 때
                  // 아이디의 길이가 20이 초과되지않게 input에 max langth 20
                  $("#hostinfoId").css("display", "none");
                  $("#hostrequiredId").css("display", "none");
                  $("#hostvalidationId").css("display", "block");
                  $("#hostchkId").css("display", "none");
                 }
              }
              
      });  
    	  
    	  
    	  // <input type="password" class="form-control inline-block" id="hostpwd" aria-describedby="emailHelp" placeholder="비밀번호 입력">
          // <small id="hostinfoPwd" class="form-text text-muted">영대문자, 숫자, 특수문자를 조합하여 8~30자를 입력하세요.</small>
          // <small id="hostvalidationPwd" class="form-text text-error" style="display:none;">영대문자, 숫자, 특수문자를 조합하여 8~30자를 입력하세요.</small>
          // <small id="hostrequiredPwd" class="form-text text-error" style="display:none;">필수 입력 사항 입니다.</small>
          // <small id="hostchkPwd" class="form-text text-emuted" style="display:none; color: green;">사용 가능한 비밀번호 입니다.</small>
    	  
          $("#hostpwd").on("blur", function() {
              var hostpwd = document.getElementById("hostpwd").value;
              // 비밀번호 정규식 특수문자 / 문자 / 숫자 포함 형태의 8~30
              var pwdReg = /^[A-Za-z0-9_\-]{5,20}$/
           
              if(hostpwd == "" || hostpwd == null){
                 // 비밀번호를 입력하지 않았으면 info메세지를 지우고 require 메세지를 띄운다
               $("#hostinfoPwd").css("display", "none");
               $("#hostrequiredPwd").css("display", "block");
               $("#hostchkPwd").css("display", "none");
              } else {
                 if(hostpwd.length >= 8){
                    if(!chk(pwdReg, hostpwd)){
                      // 유효성 검사 통과 X / 빨간 글씨로 안내
                      $("#hostinfoPwd").css("display", "none");
                      $("#hostrequiredPwd").css("display", "none");
                      $("#hostvalidationPwd").css("display", "block");
                      $("#hostchkId").css("display", "none");
                     } else {
                      // 유효성 검사 통과 / 사용가능 비밀번호 문구
                      $("#hostinfoPwd").css("display", "none");
                      $("#hostrequiredPwd").css("display", "none");
                      $("#hostvalidationPwd").css("display", "none");
                      $("#hostchkPwd").css("display", "block");
                      
                     }   
                    
                 } else {
                 
                  $("#hostinfoPwd").css("display", "none");
                  $("#hostrequiredPwd").css("display", "none");
                  $("#hostvalidationPwd").css("display", "block");
                  $("#hostchkPwd").css("display", "none");
                 }
              }             
       	
      });
          
          /*
          
              <div class="form-group">
                  <label for="pwdchk2" class="font-green inline-block" >비밀번호 확인</label>
                <input type="password" class="form-control inline-block" id="pwdchk2" aria-describedby="emailHelp" placeholder="비밀번호 입력 확인">
                <small id="hostrequiredPwd2" class="form-text text-error requiredId" style="display:none;">필수 입력 사항 입니다.</small>
                <small id="hostvalidationPwd2" class="form-text text-error" style="display:none;">비밀 번호가 일치하지 않습니다.</small>
              </div>
              
          */
    	  
          $("#pwdchk2").on("blur", function() {
              var pwdchk2 = document.getElementById("pwdchk2").value;
           
              if(pwdchk2 == "" || pwdchk2 == null){           
               $("#hostrequiredPwd").css("display", "block");
               $("#hostvalidationPwd").css("display", "none");
              } else {
                 if($('#hostpwd').val() != $('#pwdchk2').val()) {
                	 $("#hostrequiredPwd").css("display", "none");
                     $("#hostvalidationPwd").css("display", "block");
              } else {
            	  $("#hostvalidationPwd").css("display", "none");
              }
     	 }
    });  
});
      

    
   
   </script>
   
   
   <%@ include file="../common/footer.jsp" %>
</body>
</html>