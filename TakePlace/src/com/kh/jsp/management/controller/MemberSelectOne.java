package com.kh.jsp.management.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jsp.management.model.service.ManageMemberService;
import com.kh.jsp.management.model.vo.ManageMember;

/**
 * Servlet implementation class MemberSelectOnt
 */
@WebServlet("/selectOne.ml")
public class MemberSelectOne extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberSelectOne() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type = request.getParameter("type");
		int mno = Integer.parseInt(request.getParameter("mno"));
		
		ManageMemberService mms = new ManageMemberService();
		
		ManageMember mm = mms.selectOne(type, mno);
		
		String page = null;

		if(mm != null) {
			request.setAttribute("member", mm);
			
			page = "views/mypage/manager/member/memberDetail.jsp";
		} else {
			request.setAttribute("error-msg", "멤버  조회 실패");
			page = "views/common/errorPage.jsp";
		}
		
		request.getRequestDispatcher(page).forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
