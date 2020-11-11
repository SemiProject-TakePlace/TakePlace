package com.kh.jsp.mypage.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.jsp.member.model.vo.AllMember;
import com.kh.jsp.mypage.model.service.MypageService;
import com.kh.jsp.products.model.vo.Product;
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
		Product p = new Product();
		MypageService ms = new MypageService();
		
		HashMap<String, Object> product = ms.selectRList(list, p);
	
		String page = "";
		
		if(product != null && product.get("list") != null) {
			
			HttpSession session = request.getSession();
			AllMember m = (AllMember)session.getAttribute("member");
			
			int mno = ms.selectCurrentMno(m.getMno());
			System.out.println(mno);
			
			request.setAttribute("list", product.get("list"));
			request.setAttribute("p", product.get("p"));
			request.setAttribute("mno", mno);

			page = "views/mypage/guest/reservation/reservationList.jsp";
			
		} else {
			request.setAttribute("exception", new Exception("예약 현황 조회 실패"));
			request.setAttribute("error-msg", "예약 현화 조회 실패");
			
			page ="views/common/errorPage.jsp";
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
