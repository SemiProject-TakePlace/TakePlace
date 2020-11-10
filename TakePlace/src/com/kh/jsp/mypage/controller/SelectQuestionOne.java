package com.kh.jsp.mypage.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.kh.jsp.mypage.model.*;
import com.kh.jsp.mypage.model.service.MypageService;
import com.kh.jsp.mypage.model.vo.Question;

/**
 * Servlet implementation class SelectQuestionOne
 */
@WebServlet("/selectQone.me")
public class SelectQuestionOne extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectQuestionOne() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
      int inqNo = Integer.parseInt(request.getParameter("inqno"));
      
      Question m = new MypageService().selectOne(inqNo);
      
      String page = "";
      
      if( m != null ) {
         request.setAttribute("question", m);
         
         page = "views/mypage/guest/question/questionDetail.jsp";
      } else {
         
         request.setAttribute("error-msg", "게시글 상세조회 실패!");
         
         page = "views/common/errorPage.jsp";
         
      }
      
      request.getRequestDispatcher(page)
             .forward(request, response);
      
   }

   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      doGet(request, response);
   }

}