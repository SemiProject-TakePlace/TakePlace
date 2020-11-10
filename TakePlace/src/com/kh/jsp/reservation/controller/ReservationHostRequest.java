package com.kh.jsp.reservation.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jsp.products.model.vo.Product;
import com.kh.jsp.reservation.model.service.ReservationService;
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

		int pno = Integer.parseInt(request.getParameter("pno"));
		// 예약 테이블에 넣을 자료 다른 vo, dao 등에서 받아오기
		ReservationService rs = new ReservationService();

		String page = null;
		
		try {
			
			Product p = rs.selectOneReservation(pno);
			request.setAttribute("product", p);
			
			//System.out.println(pno);
			
			page = "views/reservation/reservationHostRequest.jsp";
			
		} catch (Exception e) {
			
			request.setAttribute("exception", e);
			request.setAttribute("error-msg", "예약 요청 실패!");
			
			page = "views/common/errorPage.jsp";
			
			e.printStackTrace();
		} finally {
			request.getRequestDispatcher(page).forward(request, response);
		}

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
