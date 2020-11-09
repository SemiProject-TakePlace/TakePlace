package com.kh.jsp.productReview.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jsp.productReview.model.service.ProductReviewService;
import com.kh.jsp.productReview.model.vo.ProductReview;

/**
 * Servlet implementation class InsertProductReview
 */
@WebServlet("/insertProductReview.re")
public class InsertProductReview extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertProductReview() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mname = request.getParameter("mname");
		int mno = Integer.parseInt(request.getParameter("mno"));
		int pno = Integer.parseInt(request.getParameter("pno"));
		String rcontent = request.getParameter("reviewContent");
		int rrating = Integer.parseInt(request.getParameter("pRating"));
		int refrno = Integer.parseInt(request.getParameter("refrno"));
		int rlevel = Integer.parseInt(  request.getParameter("rlevel"));
		
			
		ProductReview review = new ProductReview(pno, mno, mname, rcontent, refrno, rrating, rlevel);
		
		int result = new ProductReviewService().insertReview(review);
		
		if(result > 0) {
			response.sendRedirect("selectOneProduct.pr?pno="+ pno);
		} else {
			request.setAttribute("error-msg", "후기 등록 실패");
			 request.getRequestDispatcher("views/common/errorPage.jsp")
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
