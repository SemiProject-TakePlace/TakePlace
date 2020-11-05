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

	/*
   	컨텐츠 상하 가운데 정렬 / 해상도에 따라 다르기때문에 우선 보류
	.join-content {
		position: absolute;
	    top: 45%;
	    left: 50%;
	    transform: translate(-50%, -50%);
	}
	
	*/
	
   form {
      padding: 30px;
      margin: 0 auto;
      width: 700px;
   }
   
</style>
</head>
<body>
	<%@ include file="../common/header.jsp" %>
   
   <section id="wrap-contents" class="footer-bottom">
      <div class="container join-content">
         <nav>
              <div class="nav nav-tabs" id="nav-tab" role="tablist">
                   <a style="width: 50%" class="nav-link active" id="nav-gest-tab" data-toggle="tab"
                   		href="#nav-gest" role="tab" aria-controls="nav-gest" aria-selected="true">게스트 회원가입</a>
                   <a style="width: 50%" class="nav-link" id="nav-host-tab" data-toggle="tab"
                   		href="#nav-host" role="tab" aria-controls="nav-host" aria-selected="false">호스트 회원가입</a>
              </div>
         </nav>
            
         <div class="tab-content" id="nav-tabContent">
         <!-- 회원가입 시작 -->
         <div class="tab-pane fade show active" id="nav-gest" role="tabpanel" aria-labelledby="nav-gest-tab">
             
             <div style="border: 1px solid #82cbc4">
                
             <form action="/takeplace/insertG.me" method="post" id="create_gestAccount" name="gestForm">
	             <!-- 게스트 회원가입 -->
	             <div class="form-group">
	                   <label for="userid" class="font-green font-bold" >아이디</label>
	                   <div class="inline-block">
		                   <input type="text" class="form-control" id="userid" name="guestId"
		                   		placeholder="아이디 입력" maxlength="20" required="required">
		                   <small id="infoId" class="form-text text-muted">5~20자 이상의 영문 소문자, 숫자만 사용 가능합니다.</small>
		                   <small id="validationId" class="form-text text-error" style="display:none;">5~20자 이상의 영문 소문자, 숫자만 사용 가능합니다.</small>
		               	   <small id="idErr" class="form-text text-error" style="display:none;">중복된 아이디 입니다.</small>
		                   <small id="requiredId" class="form-text text-error" style="display:none;">필수 입력 사항 입니다.</small>
		                   <small id="chkId" class="form-text text-emuted font-green" style="display:none;">사용 가능한 아이디 입니다.</small>
		                   <input id="duplicationId" type="hidden" value="idUncheck"> <!-- 아아디 중복체크용 -->
	              		</div>
	              </div>
	                 
	              <div class="form-group">
	                   <label for="userNick" class="font-green font-bold" >닉네임</label>
	                   <div class="inline-block">
		                   <input type="text" class="form-control" id="userNick" name="userNick"
		                   		 placeholder="닉네임 입력" required="required">
		                   <small id="infoNick" class="form-text text-muted">한글, 숫자, 영소문자를 조합하여 5자 이상 입력하세요.</small>
		                   <small id="validationNick" class="form-text text-error" style="display:none;">한글, 숫자, 영소문자를 조합하여 6자 이상 입력하세요.</small>
		                   <small id="nickErr" class="form-text text-error" style="display:none;">중복된 닉네임 입니다.</small>
		                   <small id="requiredNick" class="form-text text-error " style="display:none;">필수 입력 사항 입니다.</small>
		                   <small id="chkNick" class="form-text text-emuted font-green" style="display:none;">사용 가능한 닉네임 입니다.</small>
		              	   <input id="duplicationNick" type="hidden" value="NickUncheck"> <!-- 아아디 중복체크용 -->
	              		</div>
	              </div>
	              
	              <div class="form-group">
	                   <label for="userpwd" class="font-green font-bold" >비밀번호</label>
	                   <div class="inline-block">
		                   <input type="password" class="form-control" id="userpwd" name="guestPwd"
		                   		placeholder="비밀번호 입력" maxlength="30" required="required">
		                      
		                   <small id="infoPwd" class="form-text text-muted">영문자, 숫자, 특수문자를 조합하여 8~30자를 입력하세요.</small>
		                      <small id="validationPwd" class="form-text text-error" style="display:none;">영문자, 숫자, 특수문자를 조합하여 8~30자를 입력하세요.</small>
		                      <small id="requiredPwd" class="form-text text-error" style="display:none;">필수 입력 사항 입니다.</small>
		                     <small id="checkSpace" class="form-text text-error" style="display:none;">공백은 입력하실 수 없습니다.</small>
		                     <small id="chkPwd" class="form-text text-emuted font-green" style="display:none;">사용 가능한 비밀번호 입니다.</small>
	             		</div>
	              </div>
	              
	              <div class="form-group">
                    <label for="pwdchk" class="font-green font-bold" >비밀번호 확인</label>
                   		<div class="inline-block">
		                   <input type="password" class="form-control" id="pwdchk"
		                   		 placeholder="비밀번호 입력 확인" required="required">
		                  
		                   <small id="requiredPwdchk" class="form-text text-error" style="display:none;">필수 입력 사항 입니다.</small>
		                   <small id="validationPwdchk" class="form-text text-error" style="display:none;">입력하신 비밀번호와 일치하지 않습니다.</small>
	              		</div>
	              </div>
	              
	              <div class="form-group">
                     <label for="userEmail" class="font-green font-bold" >이메일</label>
                     <div class="inline-block">
	                   <input type="text" class="form-control inline-block" id="userEmail" name="guestEmail"
	                   			placeholder="이메일 입력" required="required">
	                   
	                   <button type="button" class="btn btn-tp-custom-white">이메일 인증</button>
	                  </div>
	              </div>
	              
	              <div class="text-center">
	              	 <button type="button" class="btn btn-tp-custom-green mt-5" id="insertGuest" onclick="guestSignUp();">회원가입</button>
	              </div>
	           
              
              </form>
                
              </div>
          </div>
              
              <!-- ----------------------------------------------------------- -->
              
              <div class="tab-pane fade" id="nav-host" role="tabpanel" aria-labelledby="nav-host-tab">
                
                <div style="border: 1px solid #82cbc4">
	                <form action="/takeplace/insertH.me" method="post" id="create_hostAccount">
			                <!-- 호스트 회원가입 -->
			                <div class="form-group">
			                     <label for="companyName" class="font-green" >회사명</label>
				                 <div class="inline-block">
				                   <input type="text" class="form-control" id="companyName" name="companyName"
				                   		placeholder="회사명 입력" required="required">
		                   		</div>
			                 </div>
			                 
			                <div class="form-group">
			                     <label for="hostName" class="font-green" >사업자명</label>
			                   	<div class="inline-block">
			                   		<input type="text" class="form-control" id="hostName" name="hostName"
			                   			placeholder="사업자명 입력" required="required">
			              		</div>
			              </div>
			              
			              <div class="form-group">
			                     <label for="companyNo" class="font-green" >사업자 등록 번호</label>
			                   <div class="inline-block">
			                   	<input type="text" class="form-control" id="companyNo" name="companyNo"
			                   		placeholder="사업자 등록 번호 입력" required="required">
			              		</div>
			              </div>
			              
			              <div class="form-group">
			                     <label for="hostid" class="font-green">아이디</label>
			                   <div class="inline-block">
			                   
				                   <input type="text" class="form-control" id="hostid" name="hostid"
				                   			placeholder="아이디 입력" maxlength="" required="required">
				                  
				                   <small id="hostinfoId" class="form-text text-muted">5~20자 이상의 영문 소문자, 숫자만 사용 가능합니다.</small>
				                   <small id="hostvalidationId" class="form-text text-error" style="display:none;">5~20자 이상의 영문 소문자, 숫자만 사용 가능합니다.</small>
				                   <small id="hostidErr" class="form-text text-error" style="display:none;">중복된 아이디 입니다.</small>
				                   <small id="hostrequiredId" class="form-text text-error" style="display:none;">필수 입력 사항 입니다.</small>
				                   <small id="hostchkId" class="form-text text-emuted font-green" style="display:none;">사용 가능한 아이디 입니다.</small>
				             	   <input id="hostduplicationId" type="hidden" value="idUncheck"> <!-- 아아디 중복체크용 -->
			              	</div>
			              </div>
			              
			              <div class="form-group">
			                     <label for="hostpwd" class="font-green">비밀번호</label>
			                   <div class="inline-block">
				                   <input type="password" class="form-control" id="hostpwd" name="hostpwd"
				                   			placeholder="비밀번호 입력" required="required">
				                   
				                   <small id="hostinfoPwd" class="form-text text-muted">영대문자, 숫자, 특수문자를 조합하여 8~30자를 입력하세요.</small>
				                   <small id="hostvalidationPwd" class="form-text text-error" style="display:none;">영대문자, 숫자, 특수문자를 조합하여 8~30자를 입력하세요.</small>
				                   <small id="hostrequiredPwd" class="form-text text-error" style="display:none;">필수 입력 사항 입니다.</small>
				                   <small id="hostcheckSpace" class="form-text text-error" style="display:none;">공백은 입력하실 수 없습니다.</small>
				                   <small id="hostchkPwd" class="form-text text-emuted font-green" style="display:none;">사용 가능한 비밀번호 입니다.</small>
			             	</div>
			              </div>
			              
			              <div class="form-group">
			                     <label for="pwdchk2" class="font-green">비밀번호 확인</label>
			                     <div class="inline-block">
				                   <input type="password" class="form-control" id="pwdchk2"
				                   			placeholder="비밀번호 입력 확인" required="required">
				                   
				                   <small id="hostrequiredPwdchk" class="form-text text-error" style="display:none;">필수 입력 사항 입니다.</small>
				                   <small id="hostvalidationPwdchk" class="form-text text-error" style="display:none;">비밀 번호가 일치하지 않습니다.</small>
			              		</div>
			              </div>
			              
			              <div class="form-group">
			                     <label for="hostemail" class="font-green" >이메일</label>
			                     <div class="inline-block">
				                   <input type="text" class="form-control inline-block" id="hostEmail" name="hostEmail"
				                   			placeholder="이메일 입력" required="required">
				                  
				                   <button class="btn btn-tp-custom-white">이메일 인증</button>
			                   </div>
			              </div>
			              
			              <div class="text-center">
			              	<button type="button" class="btn btn-tp-custom-green mt-5" onclick="hostSignUp();">회원가입</button>
	                	</div>
	                </form>
                </div>
              </div>
         </div>                            
   </div>
          <!-- 회원가입 종료-->
    
   </section>

   <!------------------------------------------------->
      <script type="text/javascript">
      // 엔터 전송 방지
      $('input').keydown(function() {
         if (event.keyCode === 13) {
           event.preventDefault();
         };
       });
      
      // 정규식 테스트
      function chk(re, e){
          if(re.test(e)){
             return true;
          }
          return false;
       }
      
   	   // 공백 체크
	   function chkSpace(e) {
		   if(e.search(/\s/) != -1){
			   return true;
		   } else {
			   return false;
		   }
	   }
	   
   	   // 제대로 작성되었는지 확인용
	   var checkedId = "";
	   var checkedNick = "";
	   var checkedPwd = "";

	    // 모든 칸 제대로 입력시에만 가입 가능 (게스트)
	   function guestSignUp() {
			$("#create_gestAccount").submit();
			
		}
		
		$("#create_gestAccount").submit(function(event){
			if(checkedId != "true") {
				alert("아이디를 입력하지 않으셨거나 잘못입력하셨습니다.");
			} else if(checkedPwd != "true"){
				alert("비밀번호를 입력하지 않으셨거나 잘못입력하셨습니다.");
			} else if(checkedNick != "true"){
				alert("닉네임을 입력하지 않으셨거나 잘못입력하셨습니다.");
			} else if($("#userEmail").val() == ""){
					alert("이메일 미입력");
			} else if($("#pwdchk").val() == ""){
				alert("비밀번호 확인 칸을 입력하지 않으셨거나 잘못입력하셨습니다.");
			} else if ($('#pwdchk').val() != $('#userpwd').val()){
				alert("비밀번호 확인 칸을 잘못입력하셨습니다.");
			} else 
			
			return;
			event.preventDefault();
		});

		// 모든 칸 제대로 입력시에만 가입 가능 (호스트)
		function hostSignUp() {
				$("#create_hostAccount").submit();				
			}
	    
		$("#create_hostAccount").submit(function(event){
			
			if(checkedId != "true") {
				alert("아이디를 입력하지 않으셨거나 잘못입력하셨습니다.");
			} else if(checkedPwd != "true"){
				alert("비밀번호를 입력하지 않으셨거나 잘못입력하셨습니다.");
			} else if($("#hostEmail").val() == ""){
					alert("이메일 미입력");
			} else if($("#pwdchk2").val() == ""){
				alert("비밀번호 확인 칸을 입력하지않으셨습니다.");
			} else if($('#pwdchk2').val() != $('#hostpwd').val()){
				alert("비밀번호 확인 칸을 잘못입력하셨습니다.");
			} else if($("#companyName").val() == ""){
				
			} else if($("#companyNo").val() == ""){
				
			} else if($("#hostName").val() == ""){
				
			} else 
			return;
			event.preventDefault();
		});
      
	  //////////////////////// 유효성(게스트)  //////////////////////
      $(document).ready(function() {
         $("#userid").on("blur", function() {
              var userId = document.getElementById("userid").value;
              // 아이디 정규식 : 영소문자와 숫자만 사용 5~20글자
              var idReg = /^[a-z0-9]{5,20}$/; 
              var duplicationChk = document.getElementById("duplicationId").value; 
           
            // 중복검사된 아이디 인지 확인
              if(duplicationChk != "idUncheck"){
                 $("#duplicationId").val("idUncheck");
               // 중복체크 후 다시 아이디 창이 새로운 아이디를 입력했을 때
               // 다시 중복체크를 하도록 한다.
              }      
              
              if(userId == "" || userId == null){
                 // id를 입력하지 않았으면 info메세지를 지우고 require 메세지를 띄운다
               $("#infoId").css("display", "none");
               $("#requiredId").css("display", "block");
               $("#validationId").css("display", "none");
               $("#chkId").css("display", "none");
               $("#idErr").css("display", "none");
              } else {
                 if(userId.length >= 5){
                    if(!chk(idReg, userId)){
                      // 유효성 검사 통과 X / 빨간 글씨로 안내
                      $("#infoId").css("display", "none");
                      $("#requiredId").css("display", "none");
                      $("#validationId").css("display", "block");
                      $("#chkId").css("display", "none");
                      $("#idErr").css("display", "none");
                     } else {

                      // 아이디 중복검사 ajax
                      $.ajax({
                         url : "/takeplace/duplicationId.me?command=idChk" ,
                         type : "post" ,
                         data : {
                            userId : $("#userid").val()
                         },
                         success : function(data) {
                              // 유효성 검사 통과 / 사용가능 아이디 문구
                              
                              if(data == "success"){
                                  $("#infoId").css("display", "none");
                                  $("#requiredId").css("display", "none");
                                  $("#validationId").css("display", "none");
                                  $("#chkId").css("display", "block");
                                  $("#idErr").css("display", "none");                                                                    

                                  // 중복체크 통과
                                  $("#duplicationId").val("idCheck");
                                  checkedId = "true";
                              } else {
                                 // 중복체크 미 통과
                                 $("#infoId").css("display", "none");
                                  $("#requiredId").css("display", "none");
                                  $("#validationId").css("display", "none");
                                  $("#chkId").css("display", "none");
                                  $("#idErr").css("display", "block");

                              }
                                      
                     
                  },
                    error : function(status, error) {
                    alert("오류 입니다. 관리자에게 문의 하세요 ;ㅁ;");
                  }
                  
                      });
                      // ajax 종료
                      
                     }   
                    
                 } else {
                  // 아이디의 길이가 5미만일 때
                  // 아이디의 길이가 20이 초과되지않게 input에 max langth 20
                  $("#infoId").css("display", "none");
                  $("#requiredId").css("display", "none");
                  $("#validationId").css("display", "block");
                  $("#chkId").css("display", "none");
                  $("#idErr").css("display", "none"); 
                 }
              }
              
      });
         
         $("#userNick").on("blur", function() {
              var userNick = document.getElementById("userNick").value;
              // 닉네임 정규식 특수문자 한글, 영소문자, 숫자 사용가능 5자 이상 20자 이하
              var NickReg = /^[a-z0-9가-힣]{5,20}$/
              var duplicationChk = document.getElementById("duplicationNick").value; 
              
              // 중복검사된 아이디 인지 확인
              if(duplicationChk != "NickUncheck"){
                 $("#duplicationNick").val("NickUncheck");
               // 중복체크 후 다시 아이디 창이 새로운 아이디를 입력했을 때
               // 다시 중복체크를 하도록 한다.
              }      
              
              if(userNick == "" || userNick == null){
               // 닉네임 입력칸이 빈칸일 시 필수사항 문구 
               $("#infoNick").css("display", "none");
               $("#requiredNick").css("display", "block");
               $("#validationNick").css("display", "none");
               $("#chkNick").css("display", "none");
               $("#nickErr").css("display", "none");   
              } else {
                 if(userNick.length >= 5){
                    if(!chk(NickReg, userNick)){
                      // 유효성 검사 통과 X / 빨간 글씨로 안내
                      $("#infoNick").css("display", "none");
                      $("#requiredPNick").css("display", "none");
                      $("#validationNick").css("display", "block");
                      $("#chkNick").css("display", "none");
                      $("#nickErr").css("display", "none");   
                     } else {

                         // 닉네임 중복검사 ajax
                         $.ajax({
                            url : "/takeplace/duplicationId.me?command=nickChk" ,
                            type : "post" ,
                            data : {
                            	userNick : $("#userNick").val()
                            },
                            success : function(data) {
                                 // 유효성 검사 통과 / 사용가능 닉네임 문구
                                 
                                 if(data == "success"){
                                     $("#infoNick").css("display", "none");
                                     $("#requiredNick").css("display", "none");
                                     $("#validationNick").css("display", "none");
                                     $("#chkNick").css("display", "block");
                                     $("#nickErr").css("display", "none");                                                                    

                                     // 중복체크 통과
                                     $("#duplicationNick").val("NickCheck");
                                     checkedNick = "true";
                                     
                                 } else {
                                    // 중복체크 미 통과
                                     $("#infoNick").css("display", "none");
                                     $("#requiredNick").css("display", "none");
                                     $("#validationNick").css("display", "none");
                                     $("#chkNick").css("display", "none");
                                     $("#nickErr").css("display", "block");

                                 }
                                         
                        
                     },
                       error : function(status, error) {
                       alert("오류 입니다. 관리자에게 문의 하세요 ;ㅁ;");
                     }
                     
                         });
                         // ajax 종료
                         
                        }   
                       
                    }  else {
                  // 닉네임의 길이가 5미만일 때
                  $("#infoNick").css("display", "none");
                  $("#requiredNick").css("display", "none");
                  $("#validationNick").css("display", "block");
                  $("#chkNick").css("display", "none");
                  $("#nickErr").css("display", "none");   
                 }
              }
                   
      });
            
     
         $("#userpwd").on("blur", function() {
              var userpwd = document.getElementById("userpwd").value;
              // 비밀번호 정규식 특수문자 / 문자 / 숫자 포함 형태의 8~30
              var pwdReg = /^.*(?=^.{8,30}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/
           
              if(userpwd == "" || userpwd == null){
                 // 비밀번호를 입력하지 않았으면 info메세지를 지우고 require 메세지를 띄운다
               $("#infoPwd").css("display", "none");
               $("#requiredPwd").css("display", "block");
               $("#validationPwd").css("display", "none");
               $("#chkPwd").css("display", "none");
               $("#checkSpace").css("display", "none");
              } else {
                 if(userpwd.length >= 8){
                    if(!chk(pwdReg, userpwd)){
                      // 유효성 검사 통과 X / 빨간 글씨로 안내
                      $("#infoPwd").css("display", "none");
                      $("#requiredPwd").css("display", "none");
                      $("#validationPwd").css("display", "block");
                      $("#chkPwd").css("display", "none");
                      $("#checkSpace").css("display", "none");
                     } else if(chkSpace(userpwd)){
                    	  // 공백검사 (공백입력시)
                    	  $("#infoPwd").css("display", "none");
                          $("#requiredPwd").css("display", "none");
                          $("#validationPwd").css("display", "none");
                          $("#chkPwd").css("display", "none");
                          $("#checkSpace").css("display", "block");
                      } else if(!chkSpace(userpwd)){
                    	 // 유효성 검사 통과 / 사용가능 비밀번호 문구
                          $("#infoPwd").css("display", "none");
                          $("#requiredPwd").css("display", "none");
                          $("#validationPwd").css("display", "none");
                          $("#chkPwd").css("display", "block");
                          $("#checkSpace").css("display", "none");
                          checkedPwd = "true";
                     }   
                    
                 } else {
                  // 아이디의 길이가 8미만일 때
                  // 아이디의 길이가 30이 초과되지않게 input에 max langth 30
                  $("#infoPwd").css("display", "none");
                  $("#requiredPwd").css("display", "none");
                  $("#validationPwd").css("display", "block");
                  $("#chkPwd").css("display", "none");
                  $("#checkSpace").css("display", "none");
                 }
              }             
       
      });
        
         $("#pwdchk").on("blur", function() {
              var pwdchk = document.getElementById("pwdchk").value;
           
              if(pwdchk == "" || pwdchk == null){           
               $("#requiredPwdchk").css("display", "block");
               $("#validationPwdchk").css("display", "none");
              } else {
                 if($('#userpwd').val() != $('#pwdchk').val()) {
                    $("#requiredPwdchk").css("display", "none");
                    $("#validationPwdchk").css("display", "block");
              } else {
                 $("#validationPwdchk").css("display", "none");
                 checkedPwd2 = "ture";
              }
         }
    });  
         
         ///////////////////////  호스트 유효성 검사 ////////////////////////////
      
         $("#hostid").on("blur", function() {
              var hostid = document.getElementById("hostid").value;
              var idReg = /^[a-z0-9]{5,20}$/
              var duplicationChk = document.getElementById("hostduplicationId").value; 
              
              // 중복검사된 아이디 인지 확인
              if(duplicationChk != "idUncheck"){
                 $("#hostduplicationId").val("idUncheck");
               // 중복체크 후 다시 아이디 창에 새로운 아이디를 입력했을 때
               // 다시 중복체크를 하도록 한다.
              }      
              
              if(hostid == "" || hostid == null){
               // id를 입력하지 않았으면 info메세지를 지우고 required 메세지를 띄운다
               $("#hostinfoId").css("display", "none");
               $("#hostrequiredId").css("display", "block");
               $("#hostvalidationId").css("display", "none");
               $("#hostchkId").css("display", "none");
               $("#hostidErr").css("display", "none");
              } else {
                 if(hostid.length >= 5){
                    if(!chk(idReg, hostid)){
                      // 유효성 검사 통과 X / 빨간 글씨로 안내
                      $("#hostinfoId").css("display", "none");
                      $("#hostrequiredId").css("display", "none");
                      $("#hostvalidationId").css("display", "block");
                      $("#hostchkId").css("display", "none");
                      $("#hostidErr").css("display", "none");
                     } else {
                    	 
                    	 // 아이디 중복검사 ajax
                         $.ajax({
                            url : "/takeplace/duplicationId.me?command=idChk" ,
                            type : "post" ,
                            data : {
                               userId : $("#hostid").val()
                            },
                            success : function(data) {
                                 // 유효성 검사 통과 / 사용가능 아이디 문구
                                 
                                 if(data == "success"){
                                     $("#hostinfoId").css("display", "none");
                                     $("#hostrequiredId").css("display", "none");
                                     $("#hostvalidationId").css("display", "none");
                                     $("#hostchkId").css("display", "block");
                                     $("#hostidErr").css("display", "none");                                                                    

                                     // 중복체크 통과
                                     $("#hostduplicationId").val("idCheck");
                                     checkedId = "true";
                                 } else {
                                    // 중복체크 미 통과
                                     $("#hostinfoId").css("display", "none");
                                     $("#hostrequiredId").css("display", "none");
                                     $("#hostvalidationId").css("display", "none");
                                     $("#hostchkId").css("display", "none");
                                     $("#hostidErr").css("display", "block");

                                 }
                                         
                        
                     },
                       error : function(status, error) {
                       alert("오류 입니다. 관리자에게 문의 하세요 ;ㅁ;");
                     }
                     
                         });
                         // ajax 종료
                         
                        }   
                    
                 } else {
                  // 아이디의 길이가 5미만일 때
                  // 아이디의 길이가 20이 초과되지않게 input에 max langth 20
                  $("#hostinfoId").css("display", "none");
                  $("#hostrequiredId").css("display", "none");
                  $("#hostvalidationId").css("display", "block");
                  $("#hostchkId").css("display", "none");
                  $("#hostidErr").css("display", "none");
                 }
              }
              
      });  
         
          $("#hostpwd").on("blur", function() {
              var hostpwd = document.getElementById("hostpwd").value;
              // 비밀번호 정규식 특수문자 / 문자 / 숫자 포함 형태의 8~30
              var pwdReg =/^.*(?=^.{8,30}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/
           
              if(hostpwd == "" || hostpwd == null){
                 // 비밀번호를 입력하지 않았으면 info메세지를 지우고 require 메세지를 띄운다
               $("#hostinfoPwd").css("display", "none");
               $("#hostrequiredPwd").css("display", "block");
               $("#hostvalidationPwd").css("display", "none");
               $("#hostchkPwd").css("display", "none");
               $("#hostcheckSpace").css("display", "none"); 
              } else {
                 if(hostpwd.length >= 8){
                    if(!chk(pwdReg, hostpwd)){
                      // 유효성 검사 통과 X / 빨간 글씨로 안내
                      $("#hostinfoPwd").css("display", "none");
                      $("#hostrequiredPwd").css("display", "none");
                      $("#hostvalidationPwd").css("display", "block");
                      $("#hostchkPwd").css("display", "none");
                      $("#hostcheckSpace").css("display", "none"); 
                    
                    } else if(chkSpace(hostpwd)){
                    	 
                   	  $("#hostinfoPwd").css("display", "none");
                      $("#hostrequiredPwd").css("display", "none");
                      $("#hostvalidationPwd").css("display", "none");
                      $("#hostchkPwd").css("display", "none");
                      $("#hostcheckSpace").css("display", "block"); 
                    
                 	 } else if(!chkSpace(hostpwd)){
                      // 유효성 검사 통과 / 사용가능 비밀번호 문구
                      $("#hostinfoPwd").css("display", "none");
                      $("#hostrequiredPwd").css("display", "none");
                      $("#hostvalidationPwd").css("display", "none");
                      $("#hostchkPwd").css("display", "block");
                      $("#hostcheckSpace").css("display", "none"); 
                      checkedPwd = "true";
                     }   
                    
                 } else {
                 
                  $("#hostinfoPwd").css("display", "none");
                  $("#hostrequiredPwd").css("display", "none");
                  $("#hostvalidationPwd").css("display", "block");
                  $("#hostchkPwd").css("display", "none");
                  $("#hostcheckSpace").css("display", "none"); 
                 }
              }             
          
      });
        
          $("#pwdchk2").on("blur", function() {
              var pwdchk2 = document.getElementById("pwdchk2").value;

              if(pwdchk2 == "" || pwdchk2 == null){    // 만약 비밀번호 확인 인풋이 빈칸이라면        
               $("#hostrequiredPwdchk").css("display", "block"); // 필수 입력 사항입니다.
               $("#hostvalidationPwdchk").css("display", "none");  // none 
              } else { // 빈칸이 아니라면
                 if($('#hostpwd').val() != $('#pwdchk2').val()) { // 비밀번호값과 비밀번호 확인값이 다르다면
                    $("#hostrequiredPwdchk").css("display", "none");
                     $("#hostvalidationPwdchk").css("display", "block"); // 일치하지 않습니다.
              } else { // 일치시
                 $("#hostvalidationPwdchk").css("display", "none");
                 $("#hostrequiredPwdchk").css("display", "none");
                 checkedPwd2 = "ture"
                 }
            }
       });  
       
});
     

   </script>
   
   
   <%@ include file="../common/footer.jsp" %>
</body>
</html>