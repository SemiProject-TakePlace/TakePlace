<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<style>
		 #tp-footer {
		 	background: #D5DAE0;
		 }
		 
		 #tp-footer .navbar-brand {
		 	margin-right: 0;
		 }
		 #tp-footer .link-info {
		 	display: block;
		    right: 0;
		    bottom: 25px;
		    font-size: 15px;
		 }
		 
		 #tp-footer .link-info li  {
		 	display: inline-block;
	 	    margin: 5px 0 0 6px;
	 	    padding-left: 11px;
		    font-size: 13px;
		    line-height: 19px;
		    position: relative;
		 }
		 
		 #tp-footer .link-info li:after {
	 	    content: "";
		    position: absolute;
		    left: 0;
		    top: 6px;
		    width: 1px;
		    height: 10px;
		    background-color: #6C7994;
		 }
    
	    #tp-footer .link-info li:first-child:after {
	    	width: 0;
	    }
	    
	    #tp-footer .link-info li a {
	    	color: #6C7994;
	    }
	    
	    #tp-footer p {
	    	display: block;
		    line-height: 22px;
		    font-size: 11px;
		    color: #898D94;
    	}
    	
    	#tp-footer p.address {
    		color: #4A5059;
    	}
    	
    	#tp-footer address {
    		font-size: 12px;
    	}
	</style>

</head>
<body>

	<footer id="tp-footer" class="footer pt-3 pb-3 mt-5">
       <div class="container-fluid">
         <div class="row top-footer">
           <div class="col-md-12 text-center">
           	<a class="navbar-brand" href="<%= request.getContextPath() %>/index.jsp">
	   			<img src="<%= request.getContextPath() %>/resources/images/common/logo-horizontal.png" alt="Take Place" width="160" height="66"/>
	   		</a>
	   		<ul class="link-info">
	   			<li>
	   				<a href="<%= request.getContextPath() %>/views/intro/intro.jsp">사이트 소개</a>
	   			</li>
	   			<li>
	   				<a href="<%= request.getContextPath() %>/views/howto/howto.jsp">이용방법</a>
	   			</li>
	   			<li>
	   				<a href="<%= request.getContextPath() %>/views/inquire/inquire.jsp">1:1 문의</a>
	   			</li>
	   		</ul>
	   		<p class="address">서울특별시 강남구 테헤란로 130 호산빌딩 5F/6F</p>
	   		<p>* 공간에 대한 문의사항은 해당 공간 호스트에게 직접 문의해주세요.</p>
	   		<p>Take Place는 통신판매중개자이며 통신판매의 당사자가 아닙니다. 따라서 Take Place는 공간 거래정보 및 거래에 대해 책임지지 않습니다.</p>
             <address>Copyrights &copy; 2020 Design by <span class="font-green">Take Place</span></address>
           </div> 
         </div> 
       </div>
     </footer>

</body>
</html>