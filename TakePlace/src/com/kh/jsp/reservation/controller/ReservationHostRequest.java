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

import com.kh.jsp.reservation.model.service.ReservationService;
import com.kh.jsp.reservation.model.vo.Reservation;

/**
 * Servlet implementation class rentHostRequest
 */
@WebServlet("/ReservationHostRequest.re")
public class ReservationHostRequest extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ReservationHostRequest() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int preqno = Integer.parseInt(request.getParameter("preqno"));

		int pno = Integer.parseInt(request.getParameter("pno")); // 공간 고유 번호
		String rentName = request.getParameter("rentName"); // 예약자 이름
		String rentTel = request.getParameter("rentTel"); // 예약자 전화번호
		int payAmount = Integer.parseInt(request.getParameter("payAmount")); // 총 결제 금액 
		
		// 예약 날짜 및 시간 (수정하기)
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date resDate = null;
		try {
			resDate = new Date(sdf.parse(request.getParameter("date")).getTime());
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		
		String requirements = request.getParameter("requirements"); // 예약자 요구사항

		Reservation r = new Reservation();

		r.setPno(pno);
		r.setGname(rentName);
		r.setGtel(rentTel);
		//r.setResDate(resDate);
		r.setGdemand(requirements);
		r.setPayAmount(payAmount);

		ReservationService rs = new ReservationService();

		String page = "views/reservation/reservationWait.jsp";

		try {

			// Reservation r = rs.selectOne(preqno);
			// request.setAttribute("reservation", r);

			rs.insertReservation(r);
			response.sendRedirect("ReservationWait.re");

		} catch (Exception e) {

			request.setAttribute("exception", e);
			request.setAttribute("error-msg", "예약 요청 페이지 조회 실패!");

			page = "views/common/errorPage.jsp";

			e.printStackTrace();
		}
		/*
		 * finally { request.getRequestDispatcher(page).forward(request, response); }
		 */

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
