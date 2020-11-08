package com.kh.jsp.mypage.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.jsp.member.controller.mypage;
import com.kh.jsp.member.model.service.MemberService;
import com.kh.jsp.member.model.vo.Member;
import com.kh.jsp.mypage.model.service.MypageService;

@WebServlet("/hostpageprofile.me")
public class HostPageProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public HostPageProfile() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		
		Member m = new Member(userId, userPwd);
		
		MemberService ms = new MemberService();
		
		m = ms.selectMember(m);
		
		if(m != null) {
			HttpSession session = request.getSession();
		
			session.setAttribute("member", m);
			
			response.sendRedirect("/views/mypage/host/profile/hostPageProfile.jsp");
			
		} else {
			request.setAttribute("error-msg", "회원 로그인 실패!");
			
			RequestDispatcher view 
			    = request.getRequestDispatcher("index.jsp");
			
			view.forward(request, response);
			
		}
	
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

