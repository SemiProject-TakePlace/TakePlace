package com.kh.jsp.payrecord.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jsp.payrecord.model.service.PayService;
import com.kh.jsp.products.model.vo.Product;
import com.kh.jsp.reservation.model.service.ReservationService;
import com.kh.jsp.reservation.model.vo.Reservation;

/**
 * Servlet implementation class SelectPay
 */
@WebServlet("/selectPay.pa")
public class SelectPay extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectPay() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
      int pno = Integer.parseInt(request.getParameter("pno"));
      int preqno = Integer.parseInt(request.getParameter("preqno"));
      
      System.out.println("pno= " + pno + ", preqno : " + preqno);

      PayService ps = new PayService();

      String page = null;
      
      try {
    	  
		 request.setAttribute("pno", pno);
		 request.setAttribute("preqno", preqno);
         
         Product p = ps.selectOnePay(pno);
         
         request.setAttribute("product", p);
         
         // Reservation r = ps.selectOnePayReservation(preqno);
         
         // request.setAttribute("preqno", preqno);
         // System.out.println(preqno);
         
         // System.out.println(pno);
         
         page = "views/payrecord/pay.jsp";
         
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
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      doGet(request, response);
   }

}