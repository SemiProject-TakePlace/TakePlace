<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>guest Manual</title>
<%@ include file="../../resources/css/common/common.jsp" %>

<%@ include file="../../resources/js/common/common.jsp" %>

<style>
h2 {
	margin-bottom: 30px;
}

#wrap-contents {
	width: 70%;
	margin: 0 auto;
	padding: top-150px;
}

#nav-tab {
	text-align: center;
}

.tab-content {
	margin: 0 auto;
}
</style>
</head>
<body>

	<%@ include file="../common/header.jsp"%>

	<section id="wrap-contents">
		<div class="container">
			<h2 class="font-bold content-title">이용 방법</h2>
		</div>

		<div style="border: 1px solid #82cbc4">
			<nav>
				<div class="nav nav-tabs" id="nav-tab" role="tablist">
					<!-- 3개 탭일때는 33.3% -->
					<a style="width: 50%" class="nav-link" id="nav-home-tab"
						onclick="goGuestManual()" data-toggle="tab" href="#nav-home"
						role="tab" aria-controls="nav-home" aria-selected="true">게스트
						이용방법</a> <a style="width: 50%" class="nav-link active"
						id="nav-profile-tab" data-toggle="tab" href="#nav-profile"
						role="tab" aria-controls="nav-profile" aria-selected="false">호스트
						이용방법</a>
				</div>

			</nav>


			<div class="tab-content" id="nav-tabContent">
				<div class="container">

					<br /> <br /> <br />

					<h3 class="font-green">가입하기</h3>

					<br />

					<p class="font-bold">호스트가 되기 위한 조건이 있나요?</p>
					<p class="font-regular">
						공간을 공유 가능한 분이라면 공간 소유주, 운영자, 거주자 등 누구나 테이크플레이스 호스트가 될 수 있습니다. <br />
						* 가입하기 위하여 회사명, 사업자명, 사업자 등록 번호 등이 요구될 수 있습니다.
					</p>

					<br />

					<p class="font-bold">호스트 승인 여부는 언제 알 수 있나요?</p>
					<p class="font-regular">호스트 승인 여부는 1~2일 안에 마이페이지 '예약 현황 조회'에서
						확인 하실 수 있습니다.</p>

					<br /> <br />

					<h3 class="font-green">이용하기</h3>

					<br />

					<p class="font-bold">프로필 수정은 어떻게 해야하나요?</p>
					<p class="font-regular">마이페이지>프로필 페이지의 '회원 정보 수정' 버튼을 누르면 비밀번호,
						이메일을 수정하실 수 있습니다.</p>

					<br />

					<p class="font-bold">공간 등록은 어떻게 해야하나요?</p>
					<p class="font-regular">로그인 후 Take Place 메인 페이지의 '공간 등록하러 가기'
						버튼을 누르신 후 공간을 등록하시면 됩니다. 관리자의 승인 후 공간 유형에서 등록된 공간을 확인하시거나 마이페이지>내
						상품 목록에서 확인 하실 수 있습니다.</p>

					<br />

					<p class="font-bold">예약 신청을 거절 할 수 있나요?</p>
					<p class="font-regular">마이페이지>예약 현황 조회에서 예약 현황을 조회하신 후 '비승인'버튼을
						누르시면 됩니다.</p>
					<br /> <br /> <br /> <br />
				</div>
			</div>
		</div>

	</section>

	<script>
		function goGuestManual() {
			location.href = "/takeplace/views/manual/guestManual.jsp";
		}
	</script>

	<%@ include file="../common/footer.jsp"%>

</body>
</html>