<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Intro</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/common/bootstrap.min.css"	type="text/css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/common/common.css" type="text/css" />
<script	src="<%=request.getContextPath()%>/resources/js/common/jquery-3.5.1.min.js"></script>
<script	src="<%=request.getContextPath()%>/resources/js/common/bootstrap.min.js"></script>
<style>
.centimg{
 display:block;
 margin:0 auto;
  width:750px;
  height:400px;
}
p{font-size:20px;
  text-align:center;}

.skyblue{font-weight:bold;
     color:skyblue;
}
.navy{font-weight:bold;
     color:skyblue;
}
table{
margin-left:18%;
width:70%;
text-align:center;}

</style>
</head>
<body>
<%@ include file="../common/header.jsp"%>
<section id="wrap-contents">
<h2 class="font-bold" align="center">나와 당신이 '우리'가 되는 곳. <br>테이크 플레이스</h2>
<img src="../../resources/images/intro/camera.jpg" alt="카메라"  class="centimg"> <br><hr><br>
<p>테이크 플레이스는 스터디 모임부터 파티, 공동작업 등 <br>
다양한 목적으로 공간을 찾는 '게스트'와, 공간을 빌려주는 '호스트'를 서로 이어주는 <span class="skyblue">공간 공유 플랫폼입니다.</span></p>
<br><br><br><br>
<h3 class="font-bold" align="center">모임 공간이 필요하신가요?</h3>
<img src="../../resources/images/intro/people.jpg" alt="사람들"  class="centimg">

<p>개인 컨텐츠 제작, 생일 파티, 각종 촬영 장소까지 <br>
게스트 여러분들이 찾는 모든 공간들이 이곳에 있습니다. <br><span class="text-primary">소중한 이들과 소중한 시간을 나누세요!</span></p>
<br><br><br><br>

<h3 class="font-bold" align="center">공유할 공간이 있으신가요?</h3>
<img src="../../resources/images/intro/room.jpg" alt="방"  class="centimg">
<p><br>
호스트 여러분들만의 특별한 공간을 등록하세요. <br><span class="text-primary">공간을 나누고 수익을 창출하세요!</span></p>

<br><br><br><br><h3 class="font-bold" align="center">저희 테이크 플레이스는..</h3><br><br>
<table>
<tr>
<td  align="center"><img src="../../resources/images/intro/clock.png" alt="빨라" width=150px></td>
<td align="center"><img src="../../resources/images/intro/shield.png" alt="안전해" width=150px></td>
<td align="center"><img src="../../resources/images/intro/click.png" alt="쉬워" width=150px></td>
</tr>

<tr>
<td>최초 가입부터 공간 예약 및 결제까지,<br>하나의 흐름으로 빠르게 진행됩니다.</td>
<td>관리자의 엄격한 심사를 통해<br>안전한 공간 이용이 가능합니다.</td>
<td>간결한 인터페이스로 초심자도 사용하기 쉽습니다.<br>지금 바로 시작하세요!</td>
</tr>
</table>









</section>
<%@ include file="../common/footer.jsp"%>
</body>
</html>