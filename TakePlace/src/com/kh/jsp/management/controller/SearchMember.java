package com.kh.jsp.management.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jsp.management.model.service.ManageMemberService;
import com.kh.jsp.management.model.vo.ManageMember;

/**
 * Servlet implementation class SearchMember
 */
@WebServlet("/searchMember.ml")
public class SearchMember extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchMember() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String condition = request.getParameter("con");
		String keyword = request.getParameter("keyword");
		
		ArrayList<ManageMember> list = new ArrayList<>();
		
		ManageMemberService mms = new ManageMemberService();
		
		String page = null;
		
		if(list != null) {
			list = mms.searchMember(condition, keyword);
			request.setAttribute("list", list);
			page = "views/mypage/manager/member/memberList.jsp";
		} else {
			request.setAttribute("error-msg", "멤버 검색 실패");
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
