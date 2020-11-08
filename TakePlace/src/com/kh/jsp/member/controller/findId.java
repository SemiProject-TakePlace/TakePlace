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
 * Servlet implementation class findId
 */
@WebServlet("/find.me")
public class findId extends HttpServlet {
   private static final long serialVersionUID = 1L;

   /**
    * @see HttpServlet#HttpServlet()
    */
   public findId() {
      super();
      // TODO Auto-generated constructor stub
   }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
    *      response)
    */

   protected void doGet(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {

      String command = request.getParameter("command");

      System.out.println(command);

      if (command.equals("findId")) {
         findId(request, response);
      } else if (command.equals("findPwd")) {
         findPWd(request, response);
      }

   }

   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
    *      response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
      // TODO Auto-generated method stub
      doGet(request, response);
   }

   private void findId(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
      // TODO Auto-generated method stub
      // 아이디 찾기 메소드 호출
      String email = request.getParameter("findId");
      // System.out.println(email);

      Member m = new Member(email);

      MemberService ms = new MemberService();

      m = ms.findId(m);

      if (m != null) {
         response.getWriter().write(m.getId() + "," + m.getEmail() + "," + m.getMtype() + "," + m.getJoinDate());         
         // RequestDispatcher dispatch =
         // request.getRequestDispatcher("views/member/idFindSuccess.jsp");
         // dispatch.forward(request, response);

      } else {
         response.getWriter().write("fail");
      }
   }

   private void findPWd(HttpServletRequest request, HttpServletResponse response) {
      // TODO Auto-generated method stub
      // 비멀번호 찾기 메소드 호출
	   String id = request.getParameter("findPwd");
	   String email = request.getParameter("findPwd2");
	   
	   Member m = new Member(id, email);
	   // string string 메소드를 id pwd로 받아와서 이메일 값을 못받ㅇ옴,,,
	   MemberService ms = new MemberService();
	   
	
	   
	  
   }

}