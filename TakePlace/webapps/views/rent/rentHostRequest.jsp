<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공간 대여 요청</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/common/bootstrap.min.css" type="text/css" />
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/common/common.css" type="text/css" />
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/main/main.css" type="text/css" />

<script src="<%= request.getContextPath() %>/resources/js/common/jquery-3.5.1.min.js"></script>
<script src="<%= request.getContextPath() %>/resources/js/common/bootstrap.min.js"></script>

<style>
.mb-5{
	width:70%;
	margin:0 auto;
	padding:top-200px;
}
#price{
	font-size:0.8em;
}
</style>
</head>
<body>

	<%@ include file="../common/header.jsp" %>
	
	<section id="wrap-contents" class="footer-bottom">
		
		<div class="mb-5">
			<h3 class="font-bold">공간 대여 요청</h3>
			
			<br /><br />
			
			<form id="frmLogin" method="post">
			
				<div class="form-group" id="rentName">
				    <label for="exampleInputId1" id="rentName" class="font-green font-bold" >예약자 이름</label>
				    	<div class="inline-block">
				    		<input type="text" class="form-control inline-block" id="rentName" aria-describedby="emailHelp">
				    		<small class="form-text text-muted infoId">예약자 본인의 이름을 적어주셔야 합니다.</small>
				    		<small class="form-text text-error validationId" style="display:none;">3~5자 사이의 한글만 사용 가능합니다.</small>
				    		<small class="form-text text-error requiredId" style="display:none;">필수 입력 사항 입니다.</small>
				  		</div>
				  </div>
			
				  <div class="form-group">
				    <label for="exampleInputId1" class="font-green font-bold" >예약자 전화번호</label>
			    	<div class="inline-block">
			    		<input type="text" class="form-control inline-block" name="tlno" id="tlno" title="전화번호를 입력하세요." placeholder="000-0000-0000" onclick="telNo(this)" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{3,4}" maxlength="13">
			    		<small class="form-text text-muted infoId">예약자 본인의 전화번호를 적어주셔야 합니다.</small>
			    		<small class="form-text text-error validationId" style="display:none;">13자 숫자만 사용 가능합니다.</small>
			    		<small class="form-text text-error requiredId" style="display:none;">필수 입력 사항 입니다.</small>
			  		</div>
				  </div>
				  
				  <div class="form-group">
				    <label for="exampleInputId1" id="hostName" class="font-green font-bold" >호스트명</label>
			    	<div class="inline-block">
						<p class="font-regular" id="hostName">font-regular</p>
			  		</div>
				  </div>
				  
				  <div class="form-group">
				    <label for="exampleInputId1" id="placeName" class="font-green font-bold" >공간 이름</label>
			    	<div class="inline-block">
						<p class="font-regular" id="placeName">font-regular</p>
			  		</div>
				  </div>
				  
				  <div class="form-group">
				    <label for="exampleInputId1" id="placeAddress" class="font-green font-bold" >공간 주소</label>
			    	<div class="inline-block">
						<p class="font-regular" id="placeAddress">font-regular</p>
			  		</div>
				  </div>
				  
				  <div class="form-group">
				    <label for="exampleInputId1" id="rentDate" class="font-green font-bold" >예약 날짜</label>
			    	<div class="inline-block">
						<p class="font-regular" id="rentDate">font-regular</p>
			  		</div>
				  </div>
				  
				  <div class="form-group">
				    <label for="exampleInputId1" id="placeInf" class="font-green font-bold" >시설 안내</label>
			    	<div class="inline-block">
						<p class="font-regular" id="placeInf">font-regular</p>
			  		</div>
				  </div>
				  
				  <div class="form-group">
				  	<label for="exampleInputId1" id="requirements" class="font-green font-bold" >요구 사항</label>
				  	<div class="inline-block">
				  	<textarea name="requirements" id="requirements" cols="80" rows="5" 
        			style="resize: none;">호스트에게 보낼 메시지를 입력해주세요.</textarea>
        			</div>
				  </div>
				  
				  <div class="form-group">
				    <label for="exampleInputId1" id="price-title" class="font-green font-bold" >결제 가격</label>
			    	<div class="inline-block">
						<p class="font-regular" id="price-title">font-regular</p>
			  		</div>
				  </div>
				  
				  <br />
				  
				 <p class="font-regular" id="price">예약은 호스트에 의해 거절 될 수 있습니다.</p>
				  
				  <br /><br />
				  
			  <button type="button" class="btn btn-tp-custom-green" onclick="submitRequest(this)">HOST에게 예약 요청하기</button>
			  
			</form>
			
		</div>
		
		<script>
		
		function telNo(obj){
			
			var patt = new RegExp("[0-9]{2,3}-[0-9]{3,4}-[0-9]{3,4}");
			var res = patt.test( $("#tlno").val(obj));
	
			if( !patt.test( $("#tlno").val(obj)) ){
			    alert("전화번호를 정확히 입력하여 주십시오.");
			    return false;
			}
			
		}
		
		function submitRequest(sr){
			location.href="/takeplace/rentHostRequest.re";
		}
		
		
		</script>
		
		
		
	</section>
	
	<%@ include file="../common/footer.jsp" %>

</body>
</html>