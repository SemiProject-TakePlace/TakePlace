package com.kh.jsp.reservation.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.jsp.common.exception.NoticeException;
import com.kh.jsp.member.model.vo.AllMember;
import com.kh.jsp.notice.model.vo.Notice;
import com.kh.jsp.products.model.vo.Product;
import com.kh.jsp.reservation.model.service.ReservationService;
import com.kh.jsp.reservation.model.vo.Reservation;

/**
 * Servlet implementation class ReservationInsert
 */
@WebServlet("/insertReservation.re")
public class InsertReservation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertReservation() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 예약 테이블에 넣을 자료 
		// int preqno = Integer.parseInt(request.getParameter("preqno")); // 예약 고유 번호 - 시퀀스로 처리
		
		int pno = Integer.parseInt(request.getParameter("pno")); // 공간 고유 번호
		
		String rentName = request.getParameter("rentName"); // 예약자 이름
		String rentTel = request.getParameter("rentTel"); // 예약자 전화번호
		String rentDate = request.getParameter("rentDate"); // 예약 날짜
		String requirements = request.getParameter("requirements"); // 예약자 요구사항
		
		//int payAmount = Integer.parseInt(request.getParameter("payAmount")); // 결제 요금
		//String payAmount = request.getParameter("payAmount"); // 결제 요금

		Reservation r = new Reservation(pno, rentName, rentTel, rentDate, requirements);

		// r.setPno(preqno);
		r.setPno(pno);
		r.setGname(rentName);
		r.setGtel(rentTel);
		r.setResDate(rentDate);
		r.setGdemand(requirements);
		
		//r.setPayAmount(payAmount);

		ReservationService rs = new ReservationService();

		//String page = "views/reservation/reservationWait.jsp";
		//String page = "views/payrecord/pay.jsp";
		String page = "selectPay.pa";
		
		System.out.println(r);

		try {

			rs.insertReservation(r);
			//response.sendRedirect("selectPay.pa");
			
			Product p = rs.selectOneReservation(pno);
			request.setAttribute("product", p);
			
			HttpSession session = request.getSession();
			AllMember m = (AllMember)session.getAttribute("member");
			System.out.println(pno + m.getMname());
			
			int preqno = rs.selectCurrentPreqno(pno, m.getMname());
			System.out.println(preqno);
			
			r = rs.selectOneReservationPreq(preqno);
			request.setAttribute("reservation", r);
			
			page = "selectPay.pa";

		} catch (Exception e) {

			request.setAttribute("exception", e);
			request.setAttribute("error-msg", "예약 요청 페이지 조회 실패!");

			page = "views/common/errorPage.jsp";

			e.printStackTrace();
		}
		
		finally { request.getRequestDispatcher(page).forward(request, response); }
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
