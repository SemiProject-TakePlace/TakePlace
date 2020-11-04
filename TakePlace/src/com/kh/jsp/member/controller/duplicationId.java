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
      
      String id = request.getParameter("userId");
      System.out.println(id);
       
        MemberService ms = new MemberService();
        
        String result = ms.duplicationId(id);
       
        if(id.equals(result)){
           // System.out.println("중복 아이디 있음" + result);
           response.getWriter().write("duplication");
           
      
        } else {
           // System.out.println("중복 아이디 없음" + result);
           
           response.getWriter().write("success");
        }
        
        return;

      
   }

}