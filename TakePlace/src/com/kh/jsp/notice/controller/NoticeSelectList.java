package com.kh.jsp.notice.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.jsp.common.exception.NoticeException;
import com.kh.jsp.member.model.vo.AllMember;
import com.kh.jsp.mypage.model.service.MypageService;
import com.kh.jsp.mypage.model.vo.Question;
import com.kh.jsp.notice.model.service.NoticeService;
import com.kh.jsp.notice.model.vo.Notice;

/**
 * Servlet implementation class NoticeSelectList
 */
@WebServlet("/noticeList.no")
public class NoticeSelectList extends HttpServlet {
	private static final long serialVersionUID = 10L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeSelectList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
ArrayList<Notice> list = new ArrayList<>();
		
		NoticeService ns = new NoticeService();
		
		String page = null; // 이동할 페이지 정보
		
		try {
			list = ns.selectList();
			System.out.println(list);
			request.setAttribute("list", list);
			page = "views/notice/noticeList.jsp";
			
		} catch (NoticeException e) {
			
			request.setAttribute("exception", e);
			request.setAttribute("error-msg", "공지사항 조회 실패!");
			
			page = "views/common/errorPage.jsp";
			
		} finally {
			System.out.println(page);
			request.getRequestDispatcher(page).forward(request, response);
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
