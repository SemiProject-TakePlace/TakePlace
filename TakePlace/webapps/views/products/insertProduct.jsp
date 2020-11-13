<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="com.kh.jsp.member.model.vo.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공간 등록</title>
<%@ include file="../../resources/css/common/common.jsp" %>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/common/datepicker.min.css" type="text/css" />

<%@ include file="../../resources/js/common/common.jsp" %>
<script src="<%= request.getContextPath() %>/resources/js/common/datepicker.min.js"></script>
<script src="<%= request.getContextPath() %>/resources/js/common/datepicker.en.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<style>
h2 {
	margin-bottom: 50px;
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
<body>mem.getMtype().equals("MANAGER") || mem.getHisok().equals("Y"))

	<%@ include file="../common/header.jsp" %>
	<% if(mem != null && !mem.getMtype().equals("GUEST")) { %>
	<% if(mem.getMtype().equals("MANAGER") || mem.getHisok().equals("Y")) { %>
	<section id="wrap-contents">
		<div class="container">
			<h2 class="content-title">공간 등록</h2>
			<form id="insertProduct" method="post" name="insertProduct"
					action="<%=request.getContextPath()%>/insertProduct.pr"
					enctype="multipart/form-data">
				
				<input type="hidden" name="bsNum" id="bsNum" value="<%=mem.getBsnum()%>"/>
				
			  <div class="form-group">
			    <label for="pCity" class="font-green font-bold">지역</label>
			    <select name="pCity" id="pCity" class="form-control inline-block">
			    	<option value="서울" selected>서울</option>
			    	<option value="경기">경기</option>
			    	<option value="강원">강원</option>
			    	<option value="충청">충청</option>
			    	<option value="전라">전라</option>
			    	<option value="경상">경상</option>
			    	<option value="제주">제주</option>
			    </select>
			  </div>
			  
			  <div class="form-group">
			    <label for="pType" class="font-green font-bold">공간유형</label>
			    <div class="inline-block">
				    <select name="pType" id="pType" class="form-control inline-block">
				    	<option value="study" selected>스터디룸</option>
				    	<option value="studio">스튜디오</option>
				    	<option value="seminar">세미나룸</option>
				    	<option value="party">파티룸</option>
				    	<option value="office">오피스</option>
				    </select>
			  	</div>
			  </div>
			  
			  <div class="form-group">
			    <label for="pName" class="font-green font-bold">제목</label>
			    <div class="inline-block">
				    <input type="text" name="pName" id="pName" class="form-control" maxlength="25"/>
				    <small id="infoName" class="form-text text-muted">25자 이내로 입력해주세요.</small>
				    <small id="reqName" class="form-text text-error" style="display:none;">필수 입력 사항 입니다.</small>
				</div>			 
			  </div>
			  
			  <div class="form-group">
			    <label for="pPrice" class="font-green font-bold">가격</label>
			    <div class="inline-block">
			    	<input type="text" name="pPrice" id="pPrice" class="form-control inline-block"/>
			    	<small id="infoPrice" class="form-text text-muted">하루 기준의 금액을 입력해주세요.</small>
			    	<small id="reqPrice" class="form-text text-error" style="display:none;">필수 입력 사항 입니다.</small>
			  	</div>
			  </div>
			  
			  <div class="form-group">
			    <label for="pAbleDate" class="font-green font-bold">예약 가능 날짜</label>
			    <div class="inline-block">
			    	 <input type="text" name="pAbleDate" id="pAbleDate" data-range="true" data-multiple-dates-separator=" - "
    				data-language="en"class="form-control inlne-block" autocomplete="off"/>
    				<small id="infoDate" class="form-text text-muted">예약 받을 날짜의 범위를 입력해주세요.<br>
    				하루만 입력하시면 예약 마감일은 선택한 날의 23시 59분까지입니다.</small>
				    <small id="reqDate" class="form-text text-error" style="display:none;">필수 입력 사항 입니다.</small>
				</div>			 
			  </div>
			  
			  <div class="form-group">
			    <label for="pAddress1" class="font-green font-bold">위치</label>
			    <div class="inline-block">
			    	<input type="text" name="pZipCode" id="pZipCode" class="form-control inline-block mb-1" readonly/> <br>
			    	<input type="text" name="pAddress1" id="pAddress1" class="form-control inline-block mb-1" readonly/> <br>
			    	<input type="text" name="pAddress2" id="pAddress2" class="form-control inline-block" placeholder="상세 주소 입력"/>
			    	<button type="button" class="btn btn-tp-custom-white" onclick="searchAddr()">검색</button>
				    <small id="reqAddr" class="form-text text-error" style="display:none;">필수 입력 사항 입니다.</small>
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
				    	<img class="titleImg"/>
                     </div>
				</div>			 
			  </div>
			  
			   <div class="form-group">
			    <label for="pSubImg" class="font-green font-bold">서브 이미지</label>
			    <div class="inline-block">
				    <div id="subImgArea">
                       <img id="subImg1" width="120" height="100"/>
                       <img id="subImg2" width="120" height="100"/>
                       <img id="subImg3" width="120" height="100"/>
                       <img id="subImg4" width="120" height="100"/>
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
			    	<textarea name="pGuide" id="pGuide" cols="100" rows="7" placeholder="시설 안내 사항을 입력해주세요(전화번호 등)."></textarea>
				    <small id="reqGuide" class="form-text text-error" style="display:none;">필수 입력 사항 입니다.</small>
				</div>			 
			  </div>
			  
			  <div class="form-group">
			    <label for="pWarn" class="font-green font-bold">유의 사항</label>
			    <div class="inline-block">
			    	<textarea name="pWarn" id="pWarn" cols="100" rows="7" placeholder="유의 사항을 입력해주세요."></textarea>
				    <small id="reqWarn" class="form-text text-error" style="display:none;">필수 입력 사항 입니다.</small>
				</div>			 
			  </div>
			  <small class="form-text text-error">공간 등록을 요청하시면 1시간 이내에 승인/비승인 처리를 해드립니다.(평일 오전 10시 ~ 오후 6시)</small>
			  
			  <div class="text-center mt-5">
			  	<button type="button" class="btn btn-tp-custom-green" onclick="submitProduct()">등록 요청 하기</button>
			  </div>
			</form>
		</div>
	</section>
		<% } } else {
		request.setAttribute("error-msg", "호스트 외에 접근이 불가능한 페이지입니다.");
		request.getRequestDispatcher("../common/errorPage.jsp").forward(request, response);
	} %>
	
	<%@ include file="../common/footer.jsp" %>
	
	<script>
		function submitProduct() {
		
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
			
			if($("#pZipCode").val().length == 0 || $("#pZipCode").val() == "" ||
				$("#pAddress1").val().length == 0 || $("#pAddress1").val() == "" ||
				$("#pAddress2").val().length == 0 || $("#pAddress2").val() == "" ) {
				$("#reqAddr").css("display", "block");
				isError = true;
				
				$("#pAddress2").focusout(function () {
					$("#reqAddr").css("display", "none");
				});
				
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
				$("#insertProduct").submit();
			}
		}
		
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
	
	<script>
		// 참조 API : http://postcode.map.daum.net/guide
		function searchAddr() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var fullAddr = ''; // 최종 주소 변수
	                var extraAddr = ''; // 조합형 주소 변수

	                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    fullAddr = data.roadAddress;

	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    fullAddr = data.jibunAddress;
	                }

	                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
	                if(data.userSelectedType === 'R'){
	                    //법정동명이 있을 경우 추가한다.
	                    if(data.bname !== ''){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있을 경우 추가한다.
	                    if(data.buildingName !== ''){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
	                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
	                }

	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                $("#pZipCode").val(data.zonecode); //5자리 새우편번호 사용
	                
	                $("#pAddress1").val(fullAddr);

	                // 커서를 상세주소 필드로 이동한다.
	                $("#pAddress2").focus();
	            }
	        }).open();
	    };
	    
	</script>
	
</body>
</html>