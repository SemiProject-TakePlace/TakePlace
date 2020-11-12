package com.kh.jsp.payrecord.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jsp.payrecord.model.service.PayService;
import com.kh.jsp.payrecord.model.vo.PayRecord;
import com.kh.jsp.reservation.model.service.ReservationService;
import com.kh.jsp.reservation.model.vo.Reservation;

/**
 * Servlet implementation class PayLink
 */
@WebServlet("/insertPay.pa")
public class InsertPay extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertPay() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/*
		 * String page = "views/payrecord/paySuccess.jsp";
		 * 
		 * request.getRequestDispatcher(page).forward(request, response);
		 */
		
		
		int mno = Integer.parseInt(request.getParameter("mno")); // 회원 번호
		int preqno = Integer.parseInt(request.getParameter("preqno")); // 예약 고유 번호
		
		int price = Integer.parseInt(request.getParameter("price"));
		int num = Integer.parseInt(request.getParameter("num"));
		
		request.setAttribute("price", price);
		request.setAttribute("num", num);

		PayRecord pr = new PayRecord();

		//r.setPno(preqno);
		pr.setMno(mno);
		pr.setPreqno(preqno);
		
		//r.setPayAmount(payAmount);

		PayService ps = new PayService();

		//String page = "views/reservation/reservationWait.jsp";
		String page = "views/payrecord/pay.jsp";
		
		System.out.println(pr);

		try {

			ps.insertPay(pr);
			//response.sendRedirect("views/payrecord/paySuccess.jsp");
			
			page = "views/payrecord/paySuccess.jsp";

		} catch (Exception e) {

			request.setAttribute("exception", e);
			request.setAttribute("error-msg", "예약 요청 페이지 조회 실패!");

			page = "views/common/errorPage.jsp";

			e.printStackTrace();
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
