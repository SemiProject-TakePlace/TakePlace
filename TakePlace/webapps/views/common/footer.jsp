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
             <p>Copyrights © 2020 Design by <span class="font-green">Take Place</span></p>
           </div> 
         </div> 
       </div>
     </footer>

</body>
</html>