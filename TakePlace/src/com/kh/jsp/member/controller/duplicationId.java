   package com.kh.jsp.member.controller;
   
   import java.io.IOException;
   import javax.servlet.ServletException;
   import javax.servlet.annotation.WebServlet;
   import javax.servlet.http.HttpServlet;
   import javax.servlet.http.HttpServletRequest;
   import javax.servlet.http.HttpServletResponse;
   
   import com.kh.jsp.member.model.service.MemberService;
   import com.kh.jsp.member.model.vo.Member;
   
   /**
    * Servlet implementation class duplicationId
    */
   @WebServlet("/duplicationId.me")
   public class duplicationId extends HttpServlet {
      private static final long serialVersionUID = 1L;
          
       /**
        * @see HttpServlet#HttpServlet()
        */
       public duplicationId() {
           super();
           // TODO Auto-generated constructor stub
       }
   
      /**
       * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
       */
      protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         // TODO Auto-generated method stub
         doPost(request, response);
      }
   
      /**
       * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
       */
      protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         // TODO Auto-generated method stub
         // doGet(request, response);
         
            String command = request.getParameter("command");
            
            System.out.println(command);
            
            if(command.equals("idChk")){
               idChk(request, response);
            }
            
            if(command.equals("nickChk")){
               nickChk(request, response);
            }
           
           return;
   
         
      }

      private void nickChk(HttpServletRequest request, HttpServletResponse response) {
         // TODO Auto-generated method stub
    	 // 닉네임 중복 검사 메소드
    	 
    	  String userNick = request.getParameter("userNick");
    	  // System.out.println("가져온유저닉네임 : " + userNick);
    	  
    	  MemberService ms = new MemberService();
          
          String result = ms.duplicationNick(userNick);
          // System.out.println("받아온 유저닉네임 : " + result);
          
          if(userNick.equals(result)){
              System.out.println("중복 아이디 있음" + result);
              try {
				response.getWriter().write("duplication");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
              
         
           } else {
              System.out.println("중복 아이디 없음" + result);
              
              try {
				response.getWriter().write("success");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
           }
           
          return;
         
      }

      private void idChk(HttpServletRequest request, HttpServletResponse response) throws IOException {
         // TODO Auto-generated method stub
         // 아이디 중복 검사 메소드
         

         String id = request.getParameter("userId");
         // System.out.println(id);
          
           MemberService ms = new MemberService();
           
           String result = ms.duplicationId(id);
          
           if(id.equals(result)){
              System.out.println("중복 아이디 있음" + result);
              response.getWriter().write("duplication");
              
         
           } else {
              System.out.println("중복 아이디 없음" + result);
              
              response.getWriter().write("success");
           }
           
          return;
         
      }
   
   }