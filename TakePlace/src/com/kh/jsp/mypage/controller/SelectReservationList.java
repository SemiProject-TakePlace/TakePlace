package com.kh.jsp.mypage.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jsp.mypage.model.service.MypageService;
import com.kh.jsp.reservation.model.vo.Reservation;

/**
 * Servlet implementation class SelectReservationList
 */
@WebServlet("/selectRlist.me")
public class SelectReservationList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectReservationList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 게시판 목록 처리용 변수
		ArrayList<Reservation> list = new ArrayList<>();
		MypageService ms = new MypageService();
		
		Reservation r = new Reservation();
		
		list = ms.selectRList(list);
		
		String page = "";
		
		request.setAttribute("Rlist", list);
		page = "views/mypage/guest/reservation/reservationList.jsp";
		
//		if( list != null && list.size() > 0) {
//			
//			request.setAttribute("Rlist", list);
//			
//			page = "views/mypage/guest/reservation/reservationList.jsp";
//		} else {
//			request.setAttribute("error-msg", "예약내역 조회 실패");
//			page = "views/common/errorPage.jsp";
//		}
		
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
