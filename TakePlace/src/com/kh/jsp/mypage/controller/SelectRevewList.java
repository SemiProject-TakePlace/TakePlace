package com.kh.jsp.mypage.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jsp.mypage.model.service.MypageService;
import com.kh.jsp.productReview.model.vo.ProductReview;
import com.kh.jsp.products.model.service.ProductService;
import com.kh.jsp.products.model.vo.Product;

/**
 * Servlet implementation class SelectRevewList
 */
@WebServlet("/selectReview.me")
public class SelectRevewList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectRevewList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			// 1. 게시판 목록 처리용 변수
			ArrayList<ProductReview> list = new ArrayList<>();
			Product p = new Product();
			MypageService ms = new MypageService();
			
			HashMap<String, Object> product = ms.selectrReview(list, p);
			
			// Reservation r = new Reservation();
			
			String page = "";
			
			if(product != null && product.get("list") != null) {
				request.setAttribute("list", product.get("list"));
				request.setAttribute("p", product.get("p"));
	
				page = "views/mypage/guest/review/reviewList.jsp";
				
			} else {
				request.setAttribute("exception", new Exception("이용 후기 조회 실패"));
				request.setAttribute("error-msg", "이용 후기 조회 실패");
				
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
