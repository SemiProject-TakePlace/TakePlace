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
import com.kh.jsp.member.model.vo.AllMember;

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
      
       String id = request.getParameter("userId");
       String pwd = request.getParameter("pwd");

//       Member m = new Member(id, pwd);
//       Host h = new Host(id, pwd);
       
       AllMember m = new AllMember(id, pwd);

       MemberService ms = new MemberService();

       m = ms.selectMember(m);
       
       if (m != null) {
    	   
    	   if(m.getMtype().equals("HOST")) {
    		   
    	   
    		   if(m.getHisok().equals("N")) { // 승인 받지않은 호스트

    			   request.setAttribute("error-msg", "관리자의 승인을 기다려주세요!");
    			   // 왜 안가냐.. 에러페이지로....?
    			   request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
    			   
    	     
    	  } else if(m.getHisok().equals("Y")) { // 승인 받은 호스트
            HttpSession session = request.getSession();
            
            session.setAttribute("member", m);
            
            response.sendRedirect("index");
  	        
    	  }

       } else { // 게스트와 매니저는 그냥 로그인 가능
    	   HttpSession session = request.getSession();
           
           session.setAttribute("member", m);
           
           response.sendRedirect("index");

       		}

       } else { // m이 null 즉, 잘못된 정보로 로그인 시 ajax로..
           response.getWriter().write("fail");
           
           request.setAttribute("error-msg", "회원 로그인 실패!");
           
           return;
       }
   }
}

