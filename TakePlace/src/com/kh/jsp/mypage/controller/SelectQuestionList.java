package com.kh.jsp.mypage.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.jsp.mypage.model.vo.PageInfo;
import com.kh.jsp.member.model.vo.AllMember;
import com.kh.jsp.mypage.model.service.MypageService;
import com.kh.jsp.mypage.model.vo.Question;

/**
 * Servlet implementation class SelectQuestionList
 */
@WebServlet("/selectQlist.me")
public class SelectQuestionList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectQuestionList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
				ArrayList<Question> list = new ArrayList<>();
				MypageService ms = new MypageService();
				
				// 페이징 처리에 필요한 변수들
				// 1, 2, 3, 4
				int startPage;
				
				// 마지막 페이지
				// 1 ... 10 / 11 ... 20
				int endPage;
				
				// 전체 게시글 갯수 기준 마지막 페이지
				int maxPage;
				
				// 현재 사용자가 보는 페이지
				int currentPage;
				
				// 한 페이지 당 보여줄 게시글 수
				int limit = 5;
				
				// 만약 사용자가 처음 목록을 조회했다면
				// 페이지는 1페이지가 되어야 함
				currentPage = 1;
				
				// 만약 사용자가 특정 페이지 번호를 가지고 있다면
				if(request.getParameter("currentPage") != null) {
					currentPage
					  = Integer.parseInt(request.getParameter("currentPage")); 
				}
				
				HttpSession session = request.getSession(false);
				int mno = ((AllMember)session.getAttribute("member")).getMno();
				
				// 총 게시글 수 가져오기
				int listCount = ms.getListCount(mno);
				
				maxPage = (int)((double)listCount/limit + 0.9);
				
				// 한 번에 보일 시작 페이지와 끝페이지
				// 1 ~ 10
				// 시작 : 1 / 끝 : 10
				// 11 ~ 20
				// 시작 : 11 / 끝 : 20
				startPage = (int)(((double)currentPage/limit + 0.9) - 1) * limit + 1;
				
				endPage = startPage + limit - 1;
				
				// 만약 마지막 페이지가 끝페이지 보다 작다면
				if(endPage > maxPage) {
					endPage = maxPage;
				}
				
				// -------------- 페이지 처리 끝! ㅎ.,ㅎ -------------- //
				
				list = ms.selectQList(mno, currentPage, limit);
				
				String page = "";
				
		
					PageInfo pi = new PageInfo(currentPage, listCount, limit, 
							                   maxPage, startPage, endPage);
					
					request.setAttribute("pi", pi);
					request.setAttribute("list", list);
					
					page = "views/mypage/guest/question/questionList.jsp";
				
				
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
