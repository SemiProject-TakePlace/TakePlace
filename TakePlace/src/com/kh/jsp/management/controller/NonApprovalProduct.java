package com.kh.jsp.management.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jsp.management.model.service.ManageProductService;
import com.kh.jsp.management.model.vo.ManageProduct;

/**
 * Servlet implementation class NonApprovalProduct
 */
@WebServlet("/nonApprovalProduct.mp")
public class NonApprovalProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NonApprovalProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int pno = Integer.parseInt(request.getParameter("pno"));
		
		ManageProduct mp = new ManageProduct(pno);
		
		ManageProductService mps = new ManageProductService();
		
		int result = mps.nonApprovalProduct(mp);
		
		if(result > 0) {
			response.sendRedirect("nonApprovalProductList.mp");
		} else {
			request.setAttribute("exception", new Exception("공간 비승인 에러"));
	        request.setAttribute("error-msg", "공간 비승인 에러");
	        request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
