package com.kh.jsp.mypage.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.jsp.member.model.vo.AllMember;
import com.kh.jsp.mypage.model.service.MypageService;
import com.kh.jsp.mypage.model.vo.Question;

/**
 * Servlet implementation class InsertQuestion
 */
@WebServlet("/insertQ.me")
public class InsertQuestion extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertQuestion() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String inqType = request.getParameter("inqType");
		String inqTitle = request.getParameter("inqName");
		String inqContent = request.getParameter("inqContent");
		String inqEmail = request.getParameter("inqEmail");
		String inqTel = request.getParameter("inqPhone");
		
		HttpSession session = request.getSession(false);
		int mno = ((AllMember)session.getAttribute("member")).getMno();
		
		Question q = new Question(inqType, inqTitle, inqTitle, inqEmail, inqTel);
		
		q.setmNo(mno);
		q.setInqType(inqType);
		q.setInqTitle(inqTitle);
		q.setInqContent(inqContent);
		q.setInqEmail(inqEmail);
		q.setInqTel(inqTel);
		
		MypageService ms = new MypageService();
		
		ms.insertInq(q, mno);
		
		System.out.println("insert q: " + q);
		
		response.sendRedirect("selectQlist.me");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
