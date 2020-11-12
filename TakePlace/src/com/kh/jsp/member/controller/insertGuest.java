package com.kh.jsp.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jsp.common.exception.MemberException;
import com.kh.jsp.member.model.service.MemberService;
import com.kh.jsp.member.model.vo.AllMember;

/**
 * Servlet implementation class insertGeust
 */
@WebServlet("/insertG.me")
public class insertGuest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public insertGuest() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("guestId");
		String mName = request.getParameter("userNick");
		String pwd = request.getParameter("pwd");
		String mType = request.getParameter("mType");
		String email = request.getParameter("guestEmail");

		AllMember m = new AllMember(id, mName, pwd, mType, email);

		System.out.println("가입 정보 확인 : " + m);
		
		MemberService ms = new MemberService();
		
		try {
			ms.insertGuest(m);
			
			System.out.println("회원 가입 성공!");
			response.sendRedirect("index");
			
		} catch (MemberException e) {
			System.out.println("회원 가입 실패!");
			RequestDispatcher view
			   = request.getRequestDispatcher("views/common/errorPage.jsp");
			
			request.setAttribute("error-msg", "회원 가입 실패");
			request.setAttribute("exception", e);
			
			view.forward(request, response);
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
