package com.kh.jsp.products.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jsp.products.model.service.ProductService;

/**
 * Servlet implementation class UpdateProductView
 */
@WebServlet("/updateProductView.pr")
public class UpdateProductView extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateProductView() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int pno = Integer.parseInt(request.getParameter("pno"));
		
		HashMap<String, Object> product = new ProductService().getUpdateView(pno);
		
		String page = "";
		
		if(product != null && product.get("product") != null) {
			request.setAttribute("product", product.get("product"));
			request.setAttribute("fileList", product.get("productImages"));
			
			page = "views/products/updateProduct.jsp";
		} else {
			request.setAttribute("exception", new Exception("공간 상세 조회 실패"));
			request.setAttribute("error-msg", "공간상세 조회 실패");
			
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
