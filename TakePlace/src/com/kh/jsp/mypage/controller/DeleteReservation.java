package com.kh.jsp.mypage.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jsp.common.exception.NoticeException;
import com.kh.jsp.mypage.model.service.MypageService;
import com.kh.jsp.mypage.model.vo.Question;
import com.kh.jsp.reservation.model.vo.Reservation;

/**
 * Servlet implementation class DeleteReservation
 */
@WebServlet("/deleteReservation.me")
public class DeleteReservation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteReservation() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 int preqno = Integer.parseInt(request.getParameter("preqno"));
		 
		 MypageService ms = new MypageService();
		 
		 try {
			ms.deleteROne(preqno);
			
			System.out.println("예약 취소 성공!");
			
			response.sendRedirect("selectRlist.me");
			
		} catch (NoticeException e) {
			request.setAttribute("error-msg", "예약 취소 중 에러 발생!");
			request.setAttribute("exception", e);
			
			request
			.getRequestDispatcher("views/common/errorPage.jsp")
			.forward(request, response);
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
