<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 하기 작성 페이지</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/common/bootstrap.min.css" type="text/css" />
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/common/common.css" type="text/css" />

<script src="<%= request.getContextPath() %>/resources/js/common/jquery-3.5.1.min.js"></script>
<script src="<%= request.getContextPath() %>/resources/js/common/bootstrap.min.js"></script>

<style>
h2 {
	margin-bottom: 50px;
}
 
button {
	width: 150px;
	height: 50px;
	margin: 10px;
}
</style>

</head>
<body>

	<%@ include file="../../../common/header.jsp" %>
	
	<section id="wrap-contents">
		<div class="container">
			<h2 class="content-title">문의 하기</h2>
			<form action="<%= request.getContextPath() %>/insertQ.me" method="post" id="questionForm" name="questionForm">
			
			  <div class="form-group">
			    <label for="inqType" class="font-green font-bold">문의 유형</label>
			    <select name="inqType" id="inqType" class="form-control inline-block">
			    	<option value="전체" selected>전체</option>
			    	<option value="회원">회원</option>
			    	<option value="예약 및 결제">예약 및 결제</option>
			    	<option value="취소 및 환불">취소 및 환불</option>
			    	<option value="기타">기타</option>
			    </select>
			  </div>
			  <div class="form-group">
			    <label for="inqName" class="font-green font-bold">문의 제목</label>
			    <div class="inline-block">
				    <input type="text" name="inqName" id="inqName" class="form-control" maxlength="25"/>
				    <small id="infoName" class="form-text text-muted">25자 이내로 입력해주세요.</small>
				    <small id="reqName" class="form-text text-error" style="display:none;">필수 입력 사항 입니다.</small>
				</div>			 
			  </div>
			
			  <div class="form-group">
			    <label for="inqContent" class="font-green font-bold">문의 내용</label>
			    <div class="inline-block">
			    	<textarea name="inqContent" id="inqContent" cols="100" rows="7" placeholder="문의 내용을 입력해주세요."></textarea>
				    <small id="reqContent" class="form-text text-error" style="display:none;">필수 입력 사항 입니다.</small>
				</div>			 
			  </div>
		
			 <div class="form-group">
			    <label for="inqEmail" class="font-green font-bold">이메일 주소</label>
			    <div class="inline-block">
				    <input type="text" name="inqEmail" id="inqEmail" class="form-control" placeholder="이메일  주소를 입력해주세요." maxlength="25"/>
				</div>			 
			  </div>
			  
			   <div class="form-group">
			    <label for="inqPhone" class="font-green font-bold">휴대폰 번호</label>
			    <div class="inline-block">
				    <input type="text" name="inqPhone" id="inqPhone" class="form-control" placeholder="휴대폰 번호를 입력해주세요." maxlength="25"/>
				</div>			 
			  </div>
			
			  <div class="text-center mt-5">
			  	<button type="button" class="btn btn-tp-custom-green" onclick="submitInq();">문의 하기</button>
			  	<button type="button" class="btn btn-tp-custom-white">취소</button>
			  </div>
			</form>
			
			<script>
				function submitInq() {
					$('#questionForm').submit();
				}
			</script>
			
		</div>
	
	</section>
	
	<%@ include file="../../../common/footer.jsp" %>
</body>
</html>