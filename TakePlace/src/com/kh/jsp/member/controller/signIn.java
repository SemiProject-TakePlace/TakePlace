package com.kh.jsp.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.jsp.member.model.service.MemberService;
import com.kh.jsp.member.model.vo.Member;

/**
 * Servlet implementation class signIn
 */
@WebServlet("/signIn.me")
public class signIn extends HttpServlet {
   private static final long serialVersionUID = 1L;

   /**
    * @see HttpServlet#HttpServlet()
    */
   public signIn() {
      super();
      // TODO Auto-generated constructor stub
   }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
    *      response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response, PrintWriter out) throws ServletException, IOException {
      doPost(request, response);

   }

   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
    *      response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         // doGet(request, response);
         String command = request.getParameter("command");
         
         if(command.equals("idChk")){
            idChk(request, response);
         }
         
         if(command.equals("nickChk")){
            nickChk(request, response);
         }

   }
   
   private void nickChk(HttpServletRequest request, HttpServletResponse response) {
   
         }

   private void idChk(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
      
       String id = request.getParameter("userId");
       String pwd = request.getParameter("userPwd");

       Member m = new Member(id, pwd);

       MemberService ms = new MemberService();

       m = ms.selectMember(m);

       if (m != null) {
          HttpSession session = request.getSession();
          session.setAttribute("member", m);

          response.sendRedirect("index.jsp");

       } else {
          response.getWriter().write("fail");
          
          request.setAttribute("error-msg", "회원 로그인 실패!");
          
          return;

       }
   }

}