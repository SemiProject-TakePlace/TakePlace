package com.kh.jsp.member.controller;

import java.io.IOException;

import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jsp.member.model.service.MemberService;
import com.kh.jsp.member.model.vo.AllMember;

/**
 * Servlet implementation class insertHost
 */
@WebServlet("/insertH.me")
public class insertHost extends HttpServlet implements Servlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public insertHost() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("hostid");
		String mName = request.getParameter("companyName");
		String pwd = request.getParameter("pwd");
		String mType = request.getParameter("mType");
		String email = request.getParameter("hostEmail");
		
		String bsNum = request.getParameter("companyNo");
		String bsName = request.getParameter("hostName");

		AllMember m = new AllMember(id, mName, pwd, mType, email, bsNum, bsName);
		
		System.out.println("가입 정보 확인 : " + m);	
		MemberService ms = new MemberService();
		
		ms.insertHost(m); // 회원가입 공통 정보 담기
		m = ms.selectOneHost(m); // 공통 정보 담은 후 mno 조회
		
		AllMember hostInfo = new AllMember(m.getMno(), id, mName, pwd, m.getJoindate(), m.getChdate(), mType, email,
				bsNum, bsName, 0, "N");
		
		ms.insertHostInfo(m, hostInfo); // 조회한 mno에 호스트 추가 정보 담기
		
		System.out.println("회원 가입 성공!");
		response.sendRedirect("/takeplace/views/member/hostSuccess.jsp");
		
	}

	
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
