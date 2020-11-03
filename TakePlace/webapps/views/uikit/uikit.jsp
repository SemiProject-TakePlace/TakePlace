<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ui kit</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/common/bootstrap.min.css" type="text/css" />
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/common/common.css" type="text/css" />

<!-- 화면 작아졌을 때 header nav dropdown시 필요함 -->
<script src="<%= request.getContextPath() %>/resources/js/common/jquery-3.5.1.min.js"></script>
<script src="<%= request.getContextPath() %>/resources/js/common/bootstrap.min.js"></script>

</head>
<body>

	<%@ include file="../common/header.jsp" %>

	<!-- 마이페이지 제외하고 #wrap-contents container로 영역 잡고 시작 -->
	<!-- 마이페이지는 왼쪽에 nav 때문에  다르게 사용한다. -->
	<section id="wrap-contents">
	
		<!-- -->
	
		<div class="container">
		
			<h3>font-weight</h3>
			<!-- common.css에 있음 -->
			<p class="font-regular">font-regular</p>
			<p class="font-medium">font-medium</p>
			<p class="font-bold">font-bold</p>
			
			<br />
			<br />
			<br />
		
			<h3>버튼</h3>
			<!-- common.css에 있음 -->
			<button class="btn btn-tp-custom-green">초록색 버튼</button>
			<button class="btn btn-tp-custom-white">하얀색 버튼</button>
			
			<br />
			<br />
			<br />
			
			<h3>form</h3>
			<!--  common.css에서 font-green, inline-block 처리 -->
			<!-- 입력 안하고 로그인버튼 눌러보거나, 요구사항에 맞지 않게 입력해보시오(에러문구 다름) -->
			<form id="frmLogin" method="post">
			  <div class="form-group">
			    <label for="exampleInputId1" class="font-green font-bold" >아이디</label>
		    	<div class="inline-block">
		    		<input type="text" class="form-control inline-block" id="exampleInputId1" aria-describedby="emailHelp">
		    		<small class="form-text text-muted infoId">5~20자 이상의 영문 소문자, 숫자만 사용 가능합니다.</small>
		    		<small class="form-text text-error validationId" style="display:none;">5~20자 이상의 영문 소문자, 숫자만 사용 가능합니다.</small>
		    		<small class="form-text text-error requiredId" style="display:none;">필수 입력 사항 입니다.</small>
		  		</div>
			  </div>
			  <button type="button" class="btn btn-tp-custom-green" onclick="submitLogin(this)">로그인</button>
			</form>
		
		<script>
		
			function submitLogin(obj) {
				
				var idReg = /^[a-z0-9]{5,20}$/; 
				var id = document.getElementById("exampleInputId1");

				
				if($("#exampleInputId1").length == 0 || $("#exampleInputId1").val() == "") {
					// id를 입력하지 않았으면 info메세지를 지우고 require 메세지를 띄운다
					$(".infoId").css("display", "none");
					$(".requiredId").css("display", "block");
					
				} else if ($("#exampleInputId1").length > 0){
					// id에 값이 들어있으나 정규식이 맞지 않으면 validation 메세지를 띄운다
					if(!chk(idReg, id)) {
						$(".infoId").css("display", "none");
						$(".requiredId").css("display", "none");
						$(".validationId").css("display", "block");
					} else {
						$(".infoId").css("display", "block");
						$(".requiredId").css("display", "none");
						$(".validationId").css("display", "none");
					}
				}
				
				else {
					$("#frmLogin").method = "post";
					$("#frmLogin").action = "";
					$("#frmLogin").submit();
					return;
				}
				
				
				event.preventDefault();
				
					
				function chk(re, e) {
				    if (re.test(e.value)) {
				      return true;
				    }

				    e.value = "";
				    e.focus();
				    return false;
				  }
				
			}
		</script>
		
		
		<h3>탭</h3>
		<!-- common.css에 있음 -->
		<nav>
		  <div class="nav nav-tabs" id="nav-tab" role="tablist">
		  	<!-- 3개 탭일때는 33.3% -->
		    <a style="width: 50%" class="nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">Home</a>
		    <a style="width: 50%" class="nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">Profile</a>
		  </div>
		</nav>
		<div class="tab-content" id="nav-tabContent">
		  <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">content1</div>
		  <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">content2</div>
		  <div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab">content3</div>
		</div>
		
		<br />
		<br />
		<br />
		
		<h3>모달</h3>
		
		<!-- Button trigger modal -->
		<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
		  Launch demo modal
		</button>
		
		<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered">
		    <div class="modal-content">
		      <div class="modal-body">
		      	샘플모달창입니다.<br>
		        ~~~하시겠습니까?
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-tp-custom-white" data-dismiss="modal">취소</button>
		        <button type="button" class="btn btn-tp-custom-green">확인</button>
		      </div>
		    </div>
		  </div>
		</div>
		
		<br />
		<br />
		<br />
		
		<h3>Breadcrumb</h3>
		<nav aria-label="breadcrumb">
		  <ol class="breadcrumb">
		    <li class="breadcrumb-item"><a href="#">Home</a></li>
		    <li class="breadcrumb-item"><a href="#">Library</a></li>
		    <li class="breadcrumb-item active" aria-current="page">Data</li>
		  </ol>
		</nav>
		
		<h3>아코디언</h3>
		<div class="accordion" id="accordionExample">
		  <div class="card">
		    <div class="card-header" id="headingOne">
		      <h2 class="mb-0">
		        <button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
		          Collapsible Group Item #1
		        </button>
		      </h2>
		    </div>
		
		    <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
		      <div class="card-body">
		        Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
		      </div>
		    </div>
		  </div>
		  <div class="card">
		    <div class="card-header" id="headingTwo">
		      <h2 class="mb-0">
		        <button class="btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
		          Collapsible Group Item #2
		        </button>
		      </h2>
		    </div>
		    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
		      <div class="card-body">
		        Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
		      </div>
		    </div>
		  </div>
		  <div class="card">
		    <div class="card-header" id="headingThree">
		      <h2 class="mb-0">
		        <button class="btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
		          Collapsible Group Item #3
		        </button>
		      </h2>
		    </div>
		    <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
		      <div class="card-body">
		        Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
		      </div>
		    </div>
		  </div>
		</div>
		
		
		
		</div>
	</section>
	
	<%@ include file="../common/footer.jsp" %>

</body>
</html>