<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<body>

	<%@ include file="../common/header.jsp" %>
	
	<section id="wrap-contents">
		<div class="container">
			<h2 class="content-title">공간 등록</h2>
			
			<form id="addProducts" method="post" action="/">
			  <div class="form-group">
			    <label for="pCity" class="font-green font-bold">지역</label>
			    <select name="pCity" id="pCity" class="form-control inline-block">
			    	<option value="seo" selected>서울</option>
			    	<option value="gyg">경기</option>
			    	<option value="gan">강원</option>
			    	<option value="chu">충청</option>
			    	<option value="jnl">전라</option>
			    	<option value="gys">경상</option>
			    	<option value="jej">제주</option>
			    </select>
			    <small class="form-text text-error requiredId" style="display:none;">필수 입력 사항 입니다.</small>
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
				    <small class="form-text text-error requiredId" style="display:none;">필수 입력 사항 입니다.</small>
			  	</div>
			  </div>
			  
			  <div class="form-group">
			    <label for="pName" class="font-green font-bold">제목</label>
			    <div class="inline-block">
				    <input type="text" name="pName" id="pName" class="form-control" maxlength="25"/>
				    <small id="" class="form-text text-muted infoId">25자 이내로 입력해주세요.</small>
				    <small class="form-text text-error requiredId" style="display:none;">필수 입력 사항 입니다.</small>
				</div>			 
			  </div>
			  
			  <div class="form-group">
			    <label for="pPrice" class="font-green font-bold">가격</label>
			    <div class="inline-block">
			    	<input type="text" name="pPrice" id="pPrice" class="form-control inline-block"/>
			    	<small class="form-text text-error requiredId" style="display:none;">필수 입력 사항 입니다.</small>
			  	</div>
			  </div>
			  
			  <div class="form-group">
			    <label for="pAbleDate" class="font-green font-bold">예약 가능 날짜</label>
			    <div class="inline-block">
			    	 <input type="text" id="pAbleDate" data-range="true" data-multiple-dates-separator=" - "
    				data-language="en"class="form-control inlne-block" data-timepicker="true"/>
				    <small class="form-text text-error requiredId" style="display:none;">필수 입력 사항 입니다.</small>
				</div>			 
			  </div>
			  
			  <div class="form-group">
			    <label for="pAddress1" class="font-green font-bold">위치</label>
			    <div class="inline-block">
			    	<input type="text" name="pZipCode" id="pZipCode" class="form-control inline-block mb-1"/> <br>
			    	<input type="text" name="pAddress1" id="pAddress1" class="form-control inline-block mb-1"/> <br>
			    	<input type="text" name="pAddress2" id="pAddress2" class="form-control inline-block" placeholder="상세 주소 입력"/>
			    	<button type="button" class="btn btn-tp-custom-white" onclick="addrSearch()">검색</button>
				    <small class="form-text text-error requiredId" style="display:none;">필수 입력 사항 입니다.</small>
				</div>			 
			  </div>
			  
			  <div class="form-group">
			    <label for="pTitleImg" class="font-green font-bold">대표 이미지</label>
			    <div class="inline-block">
			    	<input class="upload-name" value="파일선택" disabled="disabled" />
			    	<input type="file" name="pTitleImg" id="pTitleImg" class="form-control inline-block title-upload-hidden"/>
			    	<button type="button" class="btn btn-tp-custom-white titleFileUpload">첨부파일 등록</button>
				    <small class="form-text text-error requiredId" style="display:none;">필수 입력 사항 입니다.</small>
				</div>			 
			  </div>
			  
			  <div class="form-group">
			    <label for="pSubImg" class="font-green font-bold">서브 이미지</label>
			    <div class="inline-block">
			    	<input class="upload-name" value="파일선택" disabled="disabled" />
			    	<input type="file" name="pSubImg" id="pSubImg" class="form-control inline-block sub-upload-hidden"
			    			multiple="multiple" accept="image/jpg, image/jpeg" />
			    	<button type="button" class="btn btn-tp-custom-white subFileUpload">첨부파일 등록</button>
			    	<small class="form-text text-muted infoMsg">최대 4장까지 가능합니다.</small>
				    <small class="form-text text-error requiredMsg" style="display:none;">필수 입력 사항 입니다.</small>
				</div>			 
			  </div>
			  
			  <div class="form-group">
			    <label for="pGuide" class="font-green font-bold">시설 안내</label>
			    <div class="inline-block">
			    	<textarea name="pGuide" id="pGuide" cols="100" rows="7" placeholder="시설 안내사항을 입력해주세요.(전화번호 등)"></textarea>
				    <small class="form-text text-error requiredId" style="display:none;">필수 입력 사항 입니다.</small>
				</div>			 
			  </div>
			  
			  <div class="form-group">
			    <label for="pGuide" class="font-green font-bold">유의 사항</label>
			    <div class="inline-block">
			    	<textarea name="pWarn" id="pGuide" cols="100" rows="7" placeholder="유의 사항을 입력해주세요."></textarea>
				    <small class="form-text text-error requiredId" style="display:none;">필수 입력 사항 입니다.</small>
				</div>			 
			  </div>
			  
			  <div class="text-center mt-5">
			  	<button type="button" class="btn btn-tp-custom-green" onclick="">등록 요청 하기</button>
			  </div>
			</form>
			
			<script>
				$(function() {
					// Create start date
				    var start = new Date(),
				        prevDay,
				        startHours = 9;

				    // 09:00 AM
				    start.setHours(9);
				    start.setMinutes(0);

				    // If today is Saturday or Sunday set 10:00 AM
				    if ([6, 0].indexOf(start.getDay()) != -1) {
				        start.setHours(10);
				        startHours = 10
				    }

				    $("#pAbleDate").datepicker({
				    	multipleDates: true,
				        timepicker: true,
				        language: "en",
				        minDate: start,
				        startDate: start,
				        minHours: startHours,
				        dateFormat: "yyyy/mm/dd",
				        // maxHours: 18,
				        onSelect: function (fd, d, picker) {
				            // Do nothing if selection was cleared
				            if (!d) return;
				            
				           console.log(fd);
				            var day = d[0].getDay();
				       

				            // Trigger only if date is changed
				            if (prevDay != undefined && prevDay == day) return;
				            prevDay = day;

				            // If chosen day is Saturday or Sunday when set
				            // hour value for weekends, else restore defaults
				            if (day == 6 || day == 0) {
				                picker.update({
				                    minHours: 10,
				                    maxHours: 24
				                })
				            } else {
				                picker.update({
				                    minHours: 9,
				                    maxHours: 24
				                })
				            }
				        }
				    })
					// Access instance of plugin
					
					// 이렇게하면 value 값을 넣을 수 있음
					// $('#test').data('datepicker').selectDate(new Date(new Date().getFullYear(), new Date().getMonth(), 10));
				    $("#pAbleDate").data('datepicker')
					
				});//ready end
				
				$(function() {
					var titleFileTarget = $('.title-upload-hidden');
					var subFileTarget = $(".sub-upload-hidden");
					titleFileTarget.on('change', function(){
						// 대표 이미지 값이 변경되면 
						if(window.FileReader){ // modern browser
							var filename = $(this)[0].files[0].name;
						} else { // old IE
							var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출
						} 
						
						// 추출한 파일명 삽입 
						$(this).siblings('.upload-name').val(filename); 
					}); 
					
					subFileTarget.on('change', function(){
						if(window.FileReader){
							var filename = $(this)[0].files.length + "개 선택하셨습니다.";
							console.log($(this)[0].files.length);
						}
						
						// 추출한 파일명 삽입 
						$(this).siblings('.upload-name').val(filename); 
					});
					
					
					$(".titleFileUpload").click(function() {
		   				$("#pTitleImg").click();
		   			});
					
					$(".subFileUpload").click(function() {
		   				$("#pSubImg").click();
		   				
		   				var pSubImgs = $("#pSubImg");
		   		        if (parseInt(pSubImgs.get(0).files.length) > 4){
		   		         alert("You can only upload a maximum of 2 files");
		   		         $("#infoMsg").css("color", "red");
		   		        }
		   				
		   			});
					
					
				});

		
				// 참조 API : http://postcode.map.daum.net/guide
				function addrSearch() {
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
			
		</div>
	
	</section>
	
	<%@ include file="../common/footer.jsp" %>
</body>
</html>