<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공간 등록</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/common/bootstrap.min.css" type="text/css" />
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/common/common.css" type="text/css" />
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/main/main.css" type="text/css" />
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/common/datepicker.css" type="text/css" />

<script src="<%= request.getContextPath() %>/resources/js/common/jquery-3.5.1.min.js"></script>
<script src="<%= request.getContextPath() %>/resources/js/common/bootstrap.min.js"></script>
<script src="<%= request.getContextPath() %>/resources/js/common/bootstrap-datepicker.js"></script>
<script src="<%= request.getContextPath() %>/resources/js/common/bootstrap-datepicker.kr.js"></script>
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
			    <label for="pPrice" class="font-green font-bold">가격</label>
			    <div class="inline-block">
			    	<input type="text" name="pPrice" id="pPrice" class="form-control inline-block"/>
			    	<small class="form-text text-error requiredId" style="display:none;">필수 입력 사항 입니다.</small>
			  	</div>
			  </div>
			  
			  <div class="form-group">
			    <label for="pName" class="font-green font-bold">제목</label>
			    <div class="inline-block">
				    <input type="text" name="pName" id="pName" class="form-control inline-block" maxlength="25"/>
				    <small id="" class="form-text text-muted infoId">25자 이내로 입력해주세요.</small>
				    <small class="form-text text-error requiredId" style="display:none;">필수 입력 사항 입니다.</small>
				</div>			 
			  </div>
			  
			  <div class="form-group">
			    <label for="pAbleDate" class="font-green font-bold">예약 가능 날짜</label>
			    <div class="inline-block">
			    	<input type="text" id="pAbleDate" class="form-control inlne-block"/>
				    <small class="form-text text-error requiredId" style="display:none;">필수 입력 사항 입니다.</small>
				</div>			 
			  </div>
			  
			  <div class="form-group">
			    <label for="pAddress1" class="font-green font-bold">위치</label>
			    <div class="inline-block">
			    	<input type="text" name="pZipCode" id="pZipCode" class="form-control inline-block"/>
			    	<button type="button" class="btn btn-tp-custom-green" onclick="addrSearch()">검색</button>
			    	<input type="text" name="pAddress1" id="pAddress1" class="form-control inline-block"/>
			    	<input type="text" name="pAddress2" id="pAddress2" class="form-control inline-block"/>
				    <small class="form-text text-error requiredId" style="display:none;">필수 입력 사항 입니다.</small>
				</div>			 
			  </div>
			  
			  <div class="form-group">
			    <label for="pTitleImg" class="font-green font-bold">대표 이미지</label>
			    <div class="inline-block">
			    	<input class="upload-name" value="파일선택" disabled="disabled" />
			    	<input type="file" name="pTitleImg" id="pTitleImg" class="form-control inline-block title-upload-hidden"/>
			    	<button type="button" class="btn btn-tp-custom-green titleFileUpload">첨부파일 등록</button>
				    <small class="form-text text-error requiredId" style="display:none;">필수 입력 사항 입니다.</small>
				</div>			 
			  </div>
			  
			  <div class="form-group">
			    <label for="pSubImg" class="font-green font-bold">서브 이미지</label>
			    <div class="inline-block">
			    	<input class="upload-name" value="파일선택" disabled="disabled" />
			    	<input type="file" name="pSubImg" id="pSubImg" class="form-control inline-block sub-upload-hidden"
			    			multiple="multiple" accept="image/jpg, image/jpeg" />
			    	<button type="button" class="btn btn-tp-custom-green subFileUpload">첨부파일 등록</button>
			    	<small class="form-text text-muted infoMsg">최대 4장까지 가능합니다.</small>
				    <small class="form-text text-error requiredMsg" style="display:none;">필수 입력 사항 입니다.</small>
				</div>			 
			  </div>
			  
			  <div class="form-group">
			    <label for="pGuide" class="font-green font-bold">시설 안내</label>
			    <div class="inline-block">
			    	<textarea name="pGuide" id="pGuide" cols="70" rows="10" placeholder="시설 안내사항을 입력해주세요.(전화번호 등)"></textarea>
				    <small class="form-text text-error requiredId" style="display:none;">필수 입력 사항 입니다.</small>
				</div>			 
			  </div>
			  
			  <div class="form-group">
			    <label for="pGuide" class="font-green font-bold">유의 사항</label>
			    <div class="inline-block">
			    	<textarea name="pGuide" id="pGuide" cols="70" rows="10" placeholder="유의 사항을 입력해주세요."></textarea>
				    <small class="form-text text-error requiredId" style="display:none;">필수 입력 사항 입니다.</small>
				</div>			 
			  </div>
			  
			  <div class="text-center mt-5">
			  	<button type="button" class="btn btn-tp-custom-green" onclick="">등록 요청 하기</button>
			  </div>
			</form>
			
			<script>
				$(function() {	
					$('#pAbleDate').datepicker({
					    format: "yyyy-mm-dd",	//데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
					    startDate: '-10d',	//달력에서 선택 할 수 있는 가장 빠른 날짜. 이전으로는 선택 불가능 ( d : 일 m : 달 y : 년 w : 주)
					    endDate: '+10d',	//달력에서 선택 할 수 있는 가장 느린 날짜. 이후로 선택 불가 ( d : 일 m : 달 y : 년 w : 주)
					    autoclose : true,	//사용자가 날짜를 클릭하면 자동 캘린더가 닫히는 옵션
					    calendarWeeks : false, //캘린더 옆에 몇 주차인지 보여주는 옵션 기본값 false 보여주려면 true
					    clearBtn : false, //날짜 선택한 값 초기화 해주는 버튼 보여주는 옵션 기본값 false 보여주려면 true
					    datesDisabled : ['2019-06-24','2019-06-26'],//선택 불가능한 일 설정 하는 배열 위에 있는 format 과 형식이 같아야함.
					    daysOfWeekDisabled : [0,6],	//선택 불가능한 요일 설정 0 : 일요일 ~ 6 : 토요일
					    daysOfWeekHighlighted : [3], //강조 되어야 하는 요일 설정
					    disableTouchKeyboard : false,	//모바일에서 플러그인 작동 여부 기본값 false 가 작동 true가 작동 안함.
					    immediateUpdates: false,	//사용자가 보는 화면으로 바로바로 날짜를 변경할지 여부 기본값 :false 
					    multidate : false, //여러 날짜 선택할 수 있게 하는 옵션 기본값 :false 
					    multidateSeparator :",", //여러 날짜를 선택했을 때 사이에 나타나는 글짜 2019-05-01,2019-06-01
					    templates : {
					        leftArrow: '&laquo;',
					        rightArrow: '&raquo;'
					    }, //다음달 이전달로 넘어가는 화살표 모양 커스텀 마이징 
					    showWeekDays : true ,// 위에 요일 보여주는 옵션 기본값 : true
					    title: "테스트",	//캘린더 상단에 보여주는 타이틀
					    todayHighlight : true ,	//오늘 날짜에 하이라이팅 기능 기본값 :false 
					    toggleActive : true,	//이미 선택된 날짜 선택하면 기본값 : false인경우 그대로 유지 true인 경우 날짜 삭제
					    weekStart : 0 ,//달력 시작 요일 선택하는 것 기본값은 0인 일요일 
					    language : "ko"	//달력의 언어 선택, 그에 맞는 js로 교체해줘야한다.
					    
					})//datepicker end
					.on("changeDate", function(e) {
			            //이벤트의 종류
			            //show : datePicker가 보이는 순간 호출
			            //hide : datePicker가 숨겨지는 순간 호출
			            //clearDate: clear 버튼 누르면 호출
			            //changeDate : 사용자가 클릭해서 날짜가 변경되면 호출 (개인적으로 가장 많이 사용함)
			            //changeMonth : 월이 변경되면 호출
			            //changeYear : 년이 변경되는 호출
			            //changeCentury : 한 세기가 변경되면 호출 ex) 20세기에서 21세기가 되는 순간
			            
			            console.log(e);// 찍어보면 event 객체가 나온다.
			            //간혹 e 객체에서 date 를 추출해야 하는 경우가 있는데 
			            // e.date를 찍어보면 Thu Jun 27 2019 00:00:00 GMT+0900 (한국 표준시)
			            // 위와 같은 형태로 보인다. 
			            // 추후에 yyyy-mm-dd 형태로 변경하는 코드를 업로드 하겠습니다. 
			       });
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