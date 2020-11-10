package com.kh.jsp.mypage.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jsp.common.exception.NoticeException;
import com.kh.jsp.mypage.model.service.MypageService;
import com.kh.jsp.mypage.model.vo.Question;
import com.kh.jsp.notice.model.service.NoticeService;

/**
 * Servlet implementation class deleteQuestion
 */
@WebServlet("/deleteQ.me")
public class deleteQuestion extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deleteQuestion() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int inqno = Integer.parseInt(request.getParameter("inqno"));
		
		MypageService ms = new MypageService();
		
		try {
			int result = ms.deleteQuestion(inqno);
			
			response.sendRedirect("selectQlist.me");
			
			System.out.println("삭제 성공");
			
		} catch (NoticeException e) {
			
			request.setAttribute("exception", e);
			
			request.setAttribute("error-msg", "삭제 오류 발생!");
			
			request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
