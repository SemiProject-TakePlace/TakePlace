<%@page import="java.security.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" import="java.util.*, java.text.SimpleDateFormat"%>
<%
   String email  = request.getParameter("email");
   String id = request.getParameter("id");
   String mtype = request.getParameter("mtype");

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Take Place : ID찾기 성공</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/common/bootstrap.min.css" type="text/css" />
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/common/common.css" type="text/css" />
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/main/main.css" type="text/css" />

<script src="<%= request.getContextPath() %>/resources/js/common/jquery-3.5.1.min.js"></script>
<script src="<%= request.getContextPath() %>/resources/js/common/bootstrap.min.js"></script>
<script src="<%= request.getContextPath() %>/resources/js/common/jquery-ui.min.js"></script>
</head>
<style>

   h2 {
      padding-bottom: 30px;
      margin-bottom: 40px;
      border-bottom: 2px solid #ccc;
      text-align: center;
   }
   
   .container { 
      text-align: center;
   }
   
   #logo {
      width: 200px;
      height: 100px;
      margin-right: 30px;
   }
   
   #findBox {
      width: 80%;
      border:1px solid black;
      padding: 50px;
      margin: 0 auto;
      display: table;
   }
   
   .userinfobox {
	  font-size: 1.2em;	
      margin: 30px;
   }
   
   .userinfo {
   	  margin-left: 50px;
   }
   
   #btn {
      text-align: center;
      padding-top: 30px;
   }
   
   #line {
      border-left: 1px solid black;
      display: table-cell;
      height: 100px
   }
   
   .smalltag {
   		margin: 30px;
   }
   
</style>
<body>
   <%@ include file="../common/header.jsp" %>
   <section id="wrap-contents">
       <div class="container">
          
          <h2>아이디 찾기 성공</h2>
          
          <div class="smalltag">
          	<small>고객님의 정보와 일치하는 아이디 입니다.</small>
          </div>
          
          <div id="findBox">
             <div id="userimage">
                <img id="logo" src="<%= request.getContextPath() %>/resources/images/common/logo-horizontal.png" alt="유저이미지" />
             </div>
             
             <div id ="line"></div>
             
             
             <div class="userinfobox">
                <div class="userinfo" style="text-align: left;">
                   	아이디 : <%=id %> (<%=mtype %> 회원)<br>
                  	 이메일 : <%=email %>
                </div>
                <div class="takeplace">
                <br><br><p style="color: #82cbc4; display: inline; font-weight: bold;">TAKE PLACE</p>를 이용해 주셔서 감사합니다.
                </div>
             </div>
             
          </div>
          
          <div class="smalltag">
          	<small>고객님의 아이디찾기가 성공적으로 이루어졌습니다.</small>
          </div>
      </div>
      
      <div id="btn">
         <button class="btn btn-tp-custom-green" onclick="location.href='signIn.jsp'">로그인 하기</button>
         &nbsp;&nbsp;
         <button class="btn btn-tp-custom-white" onclick="location.href='idPwdFind.jsp'">비밀번호 찾기</button>
      </div>
      
   </section>
   
   <%@ include file="../common/footer.jsp" %>
</body>
</html>