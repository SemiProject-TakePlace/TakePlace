<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.kh.jsp.products.model.vo.*" %>
<%
	Product p = (Product)request.getAttribute("product");
	ArrayList<ProductImages> fileList
	 	= (ArrayList<ProductImages>)request.getAttribute("fileList");
	 
	ProductImages titleImg = fileList.get(0);
	ProductImages subImg1 = fileList.get(1);
	ProductImages subImg2= fileList.get(2);
	ProductImages subImg3 = fileList.get(3);
	ProductImages subImg4 = fileList.get(4);
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공간 수정</title>
<%@ include file="../../resources/css/common/common.jsp" %>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/common/datepicker.min.css" type="text/css" />

<%@ include file="../../resources/js/common/common.jsp" %>
<script src="<%= request.getContextPath() %>/resources/js/common/datepicker.min.js"></script>
<script src="<%= request.getContextPath() %>/resources/js/common/datepicker.en.js"></script>

<style>
	.readonly {
	    margin: 7px 0;
	}
	input[type="file"] {
		position: absolute;
		width: 1px;
		height: 1px;
		padding: 0;
		margin: -1px;
		overflow: hidden;
		clip:rect(0,0,0,0);
		border: 0;
	 }
	 
	.upload-name {
		width: 300px;
		display: inline-block;
		padding: .5em .75em;
		font-size: inherit; 
		font-family: inherit; 
		line-height: normal;
		vertical-align: middle;
		border: 1px solid #ced4da;
		-webkit-appearance: none;
		-moz-appearance: none; 
		appearance: none;
	}
</style>

</head>
<body>
	<%@ include file="../common/header.jsp" %>
	
	<section id="wrap-contents">
		<div class="container">
			<h2 class="content-title">공간 수정</h2>
			
			<form id="manage-product" method="post" enctype="multipart/form-data">
				
				<input type="hidden" name="pno" value="<%= p.getPno() %>"/>
				<input type="hidden" name="mno" value="<%= mem.getMno() %>"/>
				
			  <div class="form-group">
			    <label for="pCity" class="font-green font-bold">지역</label>
			    <p id="pCity" class="readonly"><%= p.getPcity() %></p>
			  </div>
			  
			  <div class="form-group">
			    <label for="pType" class="font-green font-bold">공간유형</label>
			    <% if(p.getPtype().equals("STUDY")) {%>
	  				<p id="pType" class="readonly">스터디룸</p>
	  			<% } else if (p.getPtype().equals("STUDIO")) {%>
	  				<p id="pType" class="readonly">스튜디오</p>
	  			<% } else if (p.getPtype().equals("SEMINAR")) {%>
	  				<p id="pType" class="readonly">세미나룸</p>
	  			<% } else if (p.getPtype().equals("PARTY")) {%>
	  				<p id="pType" class="readonly">파티룸</p>
	  			<% } else if (p.getPtype().equals("OFFICE")) {%>
	  				<p id="pType" class="readonly">오피스</p>
	  			<% } %>
			  </div>
			  
			  <div class="form-group">
			    <label for="pName" class="font-green font-bold">제목</label>
			    <div class="inline-block">
				    <input type="text" name="pName" id="pName" class="form-control" maxlength="25" value="<%= p.getPname() %>"/>
				    <small id="infoName" class="form-text text-muted">25자 이내로 입력해주세요.</small>
				    <small id="reqName" class="form-text text-error" style="display:none;">필수 입력 사항 입니다.</small>
				</div>			 
			  </div>
			  
			  <div class="form-group">
			    <label for="pPrice" class="font-green font-bold">가격</label>
			    <div class="inline-block">
			    	<input type="text" name="pPrice" id="pPrice" class="form-control" value="<%= p.getPprice() %>"/>
			    	<small id="infoPrice" class="form-text text-muted">하루 기준의 금액을 입력해주세요.</small>
			    	<small id="reqPrice" class="form-text text-error" style="display:none;">필수 입력 사항 입니다.</small>
			  	</div>
			  </div>
			  
			  <div class="form-group">
			    <label for="pAbleDate" class="font-green font-bold">예약 가능 날짜</label>
			    <div class="inline-block">
			    	<input type="text" name="pAbleDate" id="pAbleDate" data-range="true" data-multiple-dates-separator=" - "
    				data-language="en"class="form-control inlne-block" autocomplete="off" value="<%= p.getPableDate() %>"/>
    				<small id="infoDate" class="form-text text-muted">예약 받을 날짜의 범위를 입력해주세요.<br>
    				하루만 입력하시면 예약 마감일은 선택한 날의 23시 59분까지입니다.</small>
				     <small id="reqDate" class="form-text text-error" style="display:none;">필수 입력 사항 입니다.</small>
				</div>			 
			  </div>
			  
			  <div class="form-group">
			    <label for="pAddress" class="font-green font-bold">위치</label>
			    <div class="inline-block">
			    	<p id="pAddress" class="readonly"></p>
				</div>			 
			  </div>
			  
			   <div class="form-group">
			    <label for="pTitleImg" class="font-green font-bold">대표 이미지</label>
			    <div class="inline-block">
			    	<input class="upload-name" value="파일선택" disabled="disabled" />
			    	<input type="file" name="pTitleImg" id="pTitleImg" accept="image/*"
			    			class="form-control inline-block title-upload-hidden"/>
			    	
			    	<button type="button" class="btn btn-tp-custom-white titleFileUpload">첨부파일 등록</button>
				    <small id="reqTitleImg" class="form-text text-error" style="display:none;">필수 입력 사항 입니다.</small>
				    
				    <div id="titleImgArea">
				    	<img class="titleImg" width="120" height="100"
				    	src="<%=request.getContextPath() %>/resources/images/product/<%= p.getMno()%>/<%= titleImg.getChangeName() %>"/>
                     </div>
				</div>			 
			  </div>
			  
			   <div class="form-group">
			    <label for="pSubImg" class="font-green font-bold">서브 이미지</label>
			    <div class="inline-block">
				    <div id="subImgArea">
				    	<% if(subImg1.getChangeName() != null) { %>
                       <img id="subImg1" width="120" height="100"
                       		src="<%=request.getContextPath() %>/resources/images/product/<%= p.getMno()%>/<%= subImg1.getChangeName() %>"/>
                       <% } %>
                       <% if(subImg2.getChangeName() != null) { %>
                       <img id="subImg2" width="120" height="100"
                       	src="<%=request.getContextPath() %>/resources/images/product/<%= p.getMno()%>/<%= subImg2.getChangeName() %>"/>
                       <% } %>
                       <% if(subImg3.getChangeName() != null) { %>
                       <img id="subImg3" width="120" height="100"
                       src="<%=request.getContextPath() %>/resources/images/product/<%= p.getMno()%>/<%= subImg3.getChangeName() %>"/>
                       <% } %>
                       <% if(subImg4.getChangeName() != null) { %>
                       <img id="subImg4" width="120" height="100"
                        src="<%=request.getContextPath() %>/resources/images/product/<%= p.getMno()%>/<%= subImg4.getChangeName() %>"/>
                       <% } %>
                    </div>
                    <small id="infoSubImg" class="form-text text-muted">사진은 4장 모두 추가해야합니다.</small>
				</div>			 
			  </div>
			  
			  <div class="fileArea" id="fileArea">
	    			<input type="file" name="subImgInput1" id="subImgInput1" onchange="loadImg(this,1);" />
		            <input type="file" name="subImgInput2" id="subImgInput2" onchange="loadImg(this,2);" />
		            <input type="file" name="subImgInput3" id="subImgInput3" onchange="loadImg(this,3);" />
		            <input type="file" name="subImgInput4" id="subImgInput4" onchange="loadImg(this,4);" />
			  </div>
			  
			  <div class="form-group">
			    <label for="pGuide" class="font-green font-bold">시설 안내</label>
			    <div class="inline-block">
			    	<textarea name="pGuide" id="pGuide" cols="100" rows="7"><%= p.getPguide() %></textarea>
				    <small id="reqGuide" class="form-text text-error" style="display:none;">필수 입력 사항 입니다.</small>
				</div>			 
			  </div>
			  
			  <div class="form-group">
			    <label for="pWarn" class="font-green font-bold">유의 사항</label>
			    <div class="inline-block">
			    	<textarea name="pWarn" id="pWarn" cols="100" rows="7"><%= p.getPwarn() %></textarea>
				    <small id="reqWarn" class="form-text text-error" style="display:none;">필수 입력 사항 입니다.</small>
				</div>			 
			  </div>
			  
			  <div class="text-center mt-5">
			  	<button type="button" class="btn btn-tp-custom-green" onclick="submitUpdate()">수정 요청 하기</button>
			  </div>
			</form>
			
			<script>
				function submitUpdate() {
				
					var isError = false;
					
					if($("#pName").val().length == 0 || $("#pName").val() == "") {
						$("#infoName").css("display", "none");
						$("#reqName").css("display", "block");
						isError = true;
						
						$("#pName").focusout(function () {
							$("#reqName").css("display", "none");
						})
						
					}
					
					if($("#pPrice").val().length == 0 || $("#pPrice").val() == "") {	
						$("#reqPrice").css("display", "block");
						isError = true;
						
						$("#pPrice").focusout(function () {
							$("#reqPrice").css("display", "none");
						})
					}
					
					if($("#pAbleDate").val().length == 0 || $("#pAbleDate").val() == "") {
						$("#reqDate").css("display", "block");
						isError = true;
						
						$("#pAbleDate").focusout(function () {
							$("#reqDate").css("display", "none");
						})
					
					}
					
					if($("#pTitleImg").val().length == 0 || $("#pTitleImg").val() == "") {
						$("#reqTitleImg").css("display", "block");
						isError = true;
					} else {
						$("#reqTitleImg").css("display", "none");
					}
					
					if($("#pGuide").val().length == 0 || $("#pGuide").val() == "") {
						$("#reqGuide").css("display", "block");
						isError = true;
						
						$("#pGuide").focusout(function () {
							$("#reqGuide").css("display", "none");
						});
					} 
					
					
					if($("#pWarn").val().length == 0 || $("#pWarn").val() == "") {
						$("#reqWarn").css("display", "block");
						isError = true;
						
						$("#pWarn").focusout(function () {
							$("#reqWarn").css("display", "none");
						});
					} 
					
					submitForm(isError);
					
				}
				
				function submitForm(isError) {
					if(isError) {
						return;
					} else {
						<%--$("#manage-product").action = "<%= request.getContextPath() %>/updateProduct.pr"; --%>
						$("#manage-product").submit();
					}
				}
				
			</script>
			
			<script>
				 var addr = "<%= p.getPaddress() %>";
			     var splitAddr = addr.split(', ');
		    	 $("#pAddress").text(splitAddr[0] + " " + splitAddr[1] + " " + splitAddr[2] )
			</script>
			
			<script>
				$(function() {
					// Create start date
				    var start = new Date(), prevDay;
			
				    $("#pAbleDate").datepicker({
				    	multipleDates: true,
				        language: "en",
				        minDate: start,
				        startDate: start,
				        dateFormat: "yyyy/mm/dd",
				        onSelect: function (fd, d, picker) {
				            // Do nothing if selection was cleared
				            
				            if (!d) return;
				           
				            var day = d[0].getDay();
				       
				            // Trigger only if date is changed
				            if (prevDay != undefined && prevDay == day) return;
				            prevDay = day;
				        }
				    
				    })
				});
				
			</script>
			
			<script>
			
				// 사진 게시글 미리 보기 기능 구현
		   		$(function() {
		   			
		   			$(".titleFileUpload").click(function() {
		   				$("#pTitleImg").click();
		   			});
		   			
		   			var titleFileTarget = $('.title-upload-hidden');
					
					titleFileTarget.on('change', function(e){
						// 대표 이미지 값이 변경되면 
						if(window.FileReader){ // modern browser
							var filename = $(this)[0].files[0].name;
						} else { // old IE
							var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출
						} 
						
						// 추출한 파일명 삽입 
						$(this).siblings('.upload-name').val(filename); 
		   				  
		   				if($(this)[0].files[0]) {
			   				var reader = new FileReader();
			   				
			   				reader.onload = function(e) {
			   					
			   					
			   					$("#titleImgArea").children(".titleImg").attr('src', e.target.result)
			   				  	.css('width', "120")
			   				  	.css("height", "100")
			   				
			   				}
			   				
			   				reader.readAsDataURL($(this)[0].files[0]);
			   			}
					}); 
				
					
					$("#subImg1").click(function() {
		   				$("#subImgInput1").click();
		   			});
		   			$("#subImg2").click(function() {
		   				$("#subImgInput2").click();
		   			});
		   			$("#subImg3").click(function() {
		   				$("#subImgInput3").click();
		   			});
		   			$("#subImg4").click(function() {
		   				$("#subImgInput4").click();
		   			});
		   			
		   			$("#fileArea").hide();
					
		   		});
				
		   		function loadImg(img, num) {
		   			if(img.files && img.files[0]) {
		   				var reader = new FileReader();
		   				
		   				reader.onload = function(e) {
		   					switch(num) {
		   					case 1: $("#subImg1").attr("src", e.target.result);
   									break;
		   					case 2: $("#subImg2").attr("src", e.target.result);
									break;
		   					case 3: $("#subImg3").attr("src", e.target.result);
									break;
		   					case 4: $("#subImg4").attr("src", e.target.result);
									break;
		   					}
		   				}
		   				
		   				reader.readAsDataURL(img.files[0]);
		   			}
		   		};

			</script>
			
		</div>
	
	</section>
	
	<%@ include file="../common/footer.jsp" %>

</body>
</html>