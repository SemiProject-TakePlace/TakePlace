package com.kh.jsp.management.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jsp.common.model.vo.PageInfo;
import com.kh.jsp.management.model.service.ManageMemberService;
import com.kh.jsp.management.model.vo.ManageMember;

/**
 * Servlet implementation class ManageMemberList
 */
@WebServlet("/memberList.ml")
public class ManageMemberList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManageMemberList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<ManageMember> list = new ArrayList<>();
		
		ManageMemberService mms = new ManageMemberService();
		
		String type = request.getParameter("type");
		
		list = mms.selectMemberList(type);
		
		String page = null;
		
		if(list != null && list.size() > 0) {
			request.setAttribute("list", list);
			page = "views/mypage/manager/member/memberList.jsp";
		} else {
			request.setAttribute("error-msg", "멤버 리스트 목록 조회 실패");
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
