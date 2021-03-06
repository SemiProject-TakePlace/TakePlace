package com.kh.jsp.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.jsp.common.exception.MemberException;
import com.kh.jsp.member.model.service.MemberService;
import com.kh.jsp.member.model.vo.AllMember;

/**
 * Servlet implementation class deleteHost
 */
@WebServlet("/deleteH.me")
public class deleteHost extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deleteHost() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 회원 아이디 가져오기
		HttpSession session = request.getSession(false);
		
		String id = ((AllMember)session.getAttribute("member")).getId();
		int mno = ((AllMember)session.getAttribute("member")).getMno();
		
		System.out.println("회원 기존 아이디  : " + id + " mno : " + mno);
		
		MemberService ms = new MemberService();
		
		try {
			ms.deleteHostT(mno);
			ms.deleteHost(id);
			
			System.out.println("회원 탈퇴 성공!");
			
			session.invalidate();
			
			response.sendRedirect("index");
			
		} catch(MemberException e) {
			request.setAttribute("error-msg", "회원 탈퇴 수행 중 에러 발생!");
			request.setAttribute("exception", e);
			
			request
			.getRequestDispatcher("views/common/errorPage.jsp")
			.forward(request, response);
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
