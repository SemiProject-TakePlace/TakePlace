package com.kh.jsp.reservation.controller;

import java.io.IOException;

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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int preqno = Integer.parseInt(request.getParameter("preqno"));
		
		ReservationService rs = new ReservationService();
		
		String page = "views/reservation/reservationWait.jsp";
		
		try {
			
			//Reservation r = rs.selectOne(preqno);
			//request.setAttribute("reservation", r);
			
			page = "views/notice/noticeDetail.jsp";
			
		} catch (Exception e) {
			
			request.setAttribute("exception", e);
			request.setAttribute("error-msg", "예약 요청 페이지 조회 실패!");
			
			page = "views/common/errorPage.jsp";
			
			e.printStackTrace();
		} finally {
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
