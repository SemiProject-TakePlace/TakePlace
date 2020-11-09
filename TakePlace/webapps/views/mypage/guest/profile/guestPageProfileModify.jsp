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
              <a class="nav-link active" href="http://localhost:8088/takeplace/views/mypage/guest/profile/guestPageProfile.jsp">프로필</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="http://localhost:8088/takeplace/views/mypage/guest/reservation/reservationList.jsp">예약 현황</a>
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
				    <li class="breadcrumb-item active" aria-current="page">프로필</li>
				  </ol>
				</nav>
				<h2 class="content-title">프로필</h2>
				
				<!-- 여기서부터 자유롭게 컨텐츠 잡으면서 시작 -->
				<div class="tab-pane fade show active" id="nav-gest" role="tabpanel" aria-labelledby="nav-gest-tab">
                
                
                <form action="/takeplace/updateGuest.me" method="post" id="update_gestAccount" name="update_gestAccount">
                
             <div class="form-group">
                <label for="userid" class="font-green inline-block" >아이디</label>
                <label class="form-control inline-block" style="width : 350px;" ><%= mem.getId() %></label>
              </div>
                 
              <div class="form-group">
                <label for="userNick" class="font-green inline-block" >닉네임</label>
                <input type="text" class="form-control inline-block" id="userNick" name="userNick" aria-describedby="emailHelp" value="<%= mem.getMname()%>">
              	&nbsp;&nbsp; 
		        <small id="validationNick" class="form-text text-error" style="display:none;">한글, 숫자, 영소문자를 조합하여 5자 이상 입력하세요.</small>
		        <small id="nickErr" class="form-text text-error" style="display:none;">중복된 닉네임 입니다.</small>
		        <small id="requiredNick" class="form-text text-error " style="display:none;">필수 입력 사항 입니다.</small>
		        <small id="chkNick" class="form-text text-emuted" style="display:none; color: green;">사용 가능한 닉네임 입니다.</small>
		        <input id="duplicationNick" type="hidden" value="NickUncheck"> <!-- 아아디 중복체크용 -->
              </div>
              
              <div class="form-group">
                <label for="userpwd" class="font-green inline-block" >새 비밀번호</label>
                <input type="password" class="form-control inline-block" id="userpwd" name="userpwd" aria-describedby="emailHelp" placeholder="비밀번호 입력" maxlength="30">
                &nbsp;&nbsp; 
                <small id="infoPwd" class="form-text text-muted">영문자, 숫자, 특수문자를 조합하여 8~30자를 입력하세요.</small>
                <small id="validationPwd" class="form-text text-error" style="display:none;">영문자, 숫자, 특수문자를 조합하여 8~30자를 입력하세요.</small>
		        <small id="requiredPwd" class="form-text text-error" style="display:none;">필수 입력 사항 입니다.</small>
		        <small id="checkSpace" class="form-text text-error" style="display:none;">공백은 입력하실 수 없습니다.</small>
		        <small id="chkPwd" class="form-text text-emuted" style="display:none; color: green;">사용 가능한 비밀번호 입니다.</small>
              </div>
              
              <div class="form-group">
                 <label for="pwdchk" class="font-green inline-block" >비밀번호 확인</label>
                 <input type="password" class="form-control inline-block" id="pwdchk" name="pwdchk" aria-describedby="emailHelp" placeholder="비밀번호 입력 확인">
              	  &nbsp;&nbsp;
              	 <small id="requiredPwdchk" class="form-text text-error" style="display:none;">필수 입력 사항 입니다.</small>
		         <small id="validationPwdchk" class="form-text text-error" style="display:none;">입력하신 비밀번호와 일치하지 않습니다.</small>
              </div>
              
              <div class="form-group">
                 <label for="userEmail" class="font-green inline-block" >이메일</label>
                 <input type="text" class="form-control inline-block" id="userEmail" name="userEmail" aria-describedby="emailHelp" value="<%= mem.getEmail()%>">
                 &nbsp;&nbsp; <button class="btn btn-tp-custom-green">이메일 인증</button>
                 
                 <small id="emailErr" class="form-text text-error" style="display:none;">중복된 이메일 입니다.</small>
	             <input id="duplicationEmail" type="hidden" value="EmailUncheck"> <!-- 이메일 중복체크용 -->             
              </div>
             
              
              <div id="button">
              <button type="button" class="btn btn-tp-custom-green" onclick="guestUpdate();">수정 완료</button>&nbsp;&nbsp;

              </div>
               </form>
               </div>
				<!-- 여기가 컨텐츠 끝 -->
			</div>
			
		</div>
		
	</section>
	
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
	   var checkedNick = "";
	   var checkedPwd = "";
	   var checkedEmail = "";
	   
	    // 모든 칸 제대로 입력시에만 가입 가능 (게스트)
	   function guestUpdate() {
			$("#update_gestAccount").submit();
			
		}
		
		$("#update_gestAccount").submit(function(event){
			if(checkedNick != "true"){
				alert("닉네임을 입력하지 않으셨거나 잘못입력하셨습니다.");
			} else if($("#userEmail").val() == ""){
					alert("이메일 미입력");
			} else if($("#pwdchk").val() == ""){
				alert("비밀번호 확인 칸을 입력하지 않으셨거나 잘못입력하셨습니다.");
			} else if ($('#pwdchk').val() != $('#userpwd').val()){
				alert("비밀번호 확인 칸을 잘못입력하셨습니다.");
			} else if(checkedEmail != "true"){
				alert("이메일 중복");
			} else {
				return;
				event.preventDefault();}
			
		});
		
	      $(document).ready(function() {
	    	  $("#userNick").on("blur", function() {
	              var userNick = document.getElementById("userNick").value;
	              // 닉네임 정규식 특수문자 한글, 영소문자, 숫자 사용가능 5자 이상 20자 이하
	              var NickReg = /^[a-z0-9가-힣]{5,20}$/
	              var duplicationChk = document.getElementById("duplicationNick").value; 
	              
	              // 중복검사된 닉네임 인지 확인
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
	                                	 if("<%=mem.getMname() %>" == $("#userNick").val()){
	                                		 // 기존 닉네임이랑 같다면 중복 xx
	                                		 $("#infoNick").css("display", "none");
		                                     $("#requiredNick").css("display", "none");
		                                     $("#validationNick").css("display", "none");
		                                     $("#chkNick").css("display", "block");
		                                     $("#nickErr").css("display", "none");       
		                                     
	                                		 $("#duplicationNick").val("NickCheck");
		                                     checkedNick = "true";
	                                	 } else {
	                                    // 중복체크 미 통과
	                                     $("#infoNick").css("display", "none");
	                                     $("#requiredNick").css("display", "none");
	                                     $("#validationNick").css("display", "none");
	                                     $("#chkNick").css("display", "none");
	                                     $("#nickErr").css("display", "block");
	                                     checkedNick = "";
	                                 }
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
	                 $("#requiredPwdchk").css("display", "none");
	                 checkedPwd2 = "ture";
	             	 }
	        	 }
	    	});
	         
	         $("#userEmail").on("blur", function() {
	             var userEmail = document.getElementById("userEmail").value;
	             var duplicationChk = document.getElementById("duplicationEmail").value; 
	             
	             // 중복검사된 이메일 인지 확인
	             if(duplicationChk != "EmailUncheck"){
	                $("#duplicationEmail").val("EmailUncheck");
	              // 중복체크 후 다시 닉네임 창이 새로운 아이디를 입력했을 때
	              // 다시 중복체크를 하도록 한다.
	             }      
	             
	             // 이메일 중복검사 ajax
	             $.ajax({
	                  url : "/takeplace/duplicationId.me?command=emailChk",
	                  type : "post" ,
	                  data : {
	                          userEmail : $("#userEmail").val()
	                  		},
	                  success : function(data) {
	                               
	                  		if(data == "success"){                                                                 

	                           // 중복체크 통과
	                           $("#duplicationEmail").val("EmailCheck");
	                           $("#emailErr").css("display", "none");
	                           checkedEmail = "true";
	                                    
	                           } else {
	                        	   if("<%=mem.getEmail()%>" == $("#userEmail").val()){
	                        	   	 // 기존 값이랑 같다면 중복체크 xx
	                        		   $("#duplicationEmail").val("EmailCheck");
	    	                           $("#emailErr").css("display", "none");
	    	                           checkedEmail = "true";
	                        	     } else {
	                        		 // 중복체크 미 통과
	                                 $("#emailErr").css("display", "block");
	                                 checkedEmail = "";
	                        	    }
	                           }
	                    	},
	                      error : function(status, error) {
	                      alert("오류 입니다. 관리자에게 문의 하세요 ;ㅁ;");
	                    }
	                    
	                 });
	                // ajax 종료
	           });   
	         
	      });
	      
	   </script>
	
	<%@ include file="../../../common/footer.jsp" %>
</body>
</html>