<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="com.kh.jsp.reservation.model.vo.*, com.kh.jsp.member.model.vo.*, com.kh.jsp.products.model.vo.*"%>
<%
	Reservation r = (Reservation)request.getAttribute("Reservation");
	
	Product p = (Product)request.getAttribute("product");
	
	//Host는 header에 이미 들어가져있음
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공간 대여 요청</title>
<%@ include file="../../resources/css/common/common.jsp" %>

<%@ include file="../../resources/js/common/common.jsp" %>

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
	
	<section id="wrap-contents">
		
		<div class="mb-5">
			<h3 class="font-bold">공간 대여 요청</h3>
			
			<br /><br />
			
			<form id="reHostRequest" method="post" name="reHostRequest"
				action="<%=request.getContextPath()%>/insertReservation.re?pno=<%=p.getPno()%>">
				
				<input type="hidden" name="pno" id="pno" value="<%=p.getPno()%>"/>
				<input type="hidden" name="selectDate" id="selectDate" value="<%=p.getPno()%>"/>
			
				<div class="form-group" id="rentName">
				    <label for="exampleInputId1" id="rentNameLabel" class="font-green font-bold" >예약자 이름</label>
				    	<div class="inline-block">
				    		<input type="text" class="form-control inline-block" id="rentName" name="rentName" aria-describedby="emailHelp">
				    		<small class="form-text text-muted infoId">예약자 본인의 이름을 적어주셔야 합니다.</small>
				    		<small class="form-text text-error validationId" style="display:none;">3~5자 사이의 한글만 사용 가능합니다.</small>
				    		<small class="form-text text-error requiredId" style="display:none;">필수 입력 사항 입니다.</small>
				  		</div>
				  </div>
			
				  <div class="form-group">
				    <label for="exampleInputId1" class="font-green font-bold" >예약자 전화번호</label>
			    	<div class="inline-block">
			    		<input type="text" class="form-control inline-block" name="rentTel" id="rentTel" title="전화번호를 입력하세요." placeholder="000-0000-0000" maxlength="13">
			    		<small class="form-text text-muted infoId">예약자 본인의 전화번호를 적어주셔야 합니다.</small>
			    		<small class="form-text text-error validationId" style="display:none;">13자 숫자만 사용 가능합니다.</small>
			    		<small class="form-text text-error requiredId" style="display:none;">필수 입력 사항 입니다.</small>
			  		</div>
				  </div>
				  
				  <div class="form-group">
				    <label for="exampleInputId1" id="hostNameLabel" class="font-green font-bold" >
				    <% if(mem.getMtype().equals("HOST")) {%>
			  				호스트명
			  			<% } else if (mem.getMtype().equals("GUEST")) {%>
			  				예약자 아이디
			  			<% } else if (mem.getMtype().equals("MANAGER")) {%>
		  					예약자 아이디
		  			<% } %>
				    </label>
			    	<div class="inline-block">
						<p class="font-regular" id="hostName"><%= mem.getMname() %></p>
			  		</div>
				  </div>
				  
				  <div class="form-group">
				    <label for="exampleInputId1" id="placeNameLabel" class="font-green font-bold" >공간 이름</label>
			    	<div class="inline-block">
						<p class="font-regular" id="placeName"><%= p.getPname() %></p>
			  		</div>
				  </div>
				  
				  <div class="form-group">
				    <label for="exampleInputId1" id="placeAddressLabel" class="font-green font-bold" >공간 주소</label>
			    	<div class="inline-block">
						<p class="font-regular" id="placeAddress"><%= p.getPaddress() %></p>
			  		</div>
				  </div>
				  
				  <div class="form-group">
				    <label for="exampleInputId1" id="rentDateLabel" class="font-green font-bold" >예약 날짜</label>
			    	<div class="inline-block">
			    		<input type="hidden" name="rentDate" value="<%= request.getParameter("selectDate") %>">
						<p class="font-regular" id="rentDate"><%= request.getParameter("selectDate") %></p>
			  		</div>
				  </div>
				  
				  <div class="form-group">
				    <label for="exampleInputId1" id="placeInfLabel" class="font-green font-bold" >시설 안내</label>
			    	<div class="inline-block">
						<p class="font-regular" id="placeInf"><%=p.getPguide()%></p>
			  		</div>
				  </div>
				  
				  <div class="form-group">
				  	<label for="exampleInputId1" id="requirementsLabel" class="font-green font-bold" >요구 사항</label>
				  	<div class="inline-block">
				  	<textarea name="requirements" placeholder="호스트에게 보낼 메시지를 입력해주세요." id="requirements" cols="80" rows="5" 
        			style="resize: none;"></textarea>
        			</div>
				  </div>
				  
				  <div class="form-group">
				    <label for="exampleInputId1" id="price-Label" class="font-green font-bold" >결제 가격</label> <br />
			    	<div class="inline-block">
				    	<input type="number" name="payAmount" id="payAmount" value=10000 />원
			  		</div>
				  </div>
				  
				  <div class="form-group">
				    <label for="exampleInputId1" id="price-title-Label" class="font-green font-bold" >결제 가격 안내</label> <br />
			    	<div class="inline-block">
						<p class="font-regular" id="price-title">결제 가격은 빌린 날짜 기준 X 10000원 입니다. (예시) 3일 대여 = 30000원 </p>
			  		</div>
				  </div>
				  
				  <br />
				  
				 <p class="font-regular" id="price">예약은 호스트에 의해 거절 될 수 있습니다.</p>
				  
				  <br /><br />
				  
			  <button type="submit" class="btn btn-tp-custom-green">HOST에게 예약 요청하기</button>
			  
			</form>
			
		</div>
		
		<script>
		
		<%--
		function submitRequest(){
			<%-- location.href="/takeplace/insertReservation.re?pno=<%=p.getPno()%>";
			location.href="<%= request.getContextPath() %>/insertReservation.re?pno=<%=p.getPno()%>";
		}
		--%>
		
		// 날짜 예약 요청 페이지로 날짜 넘기기
		$(document).ready(function(){
			<%--  $("#rentDate").text('<%= request.getParameter("selectDate")%>'); --%>
			 
		<%-- 	 
        $.ajax({
            type : "GET", //전송방식을 지정한다 (POST,GET)
            url : "/views/products/productsDetail.jsp",//호출 URL을 설정
            dataType : "text",//호출한 페이지의 형식
            error : function(){
                alert("날짜 전송 실패!!!!");
            },
            success : function(Parse_data){
                 $("#rentDate").text('<%= request.getParameter("selectDate")%>'); //요청 페이지에 있는 rentDate에 상품 페이지에서 받아온 selectDate 값을 넣는다.
               // $("#rentDate").append($('#selectDate'));
                alert("날짜 데이터 값 : " + Parse_data);
	            }
	             
	        }); --%>
	    });
		
		/*
		function telNo(obj){
			
			var patt = new RegExp("[0-9]{2,3}-[0-9]{3,4}-[0-9]{3,4}");
			var res = patt.test( $("#tlno").val(obj));
	
			if( !patt.test( $("#tlno").val(obj)) ){
			    alert("전화번호를 정확히 입력하여 주십시오.");
			    return false;
			}
			
		}
		*/
		</script>
		
	</section>
	
	<%@ include file="../common/footer.jsp" %>

</body>
</html>