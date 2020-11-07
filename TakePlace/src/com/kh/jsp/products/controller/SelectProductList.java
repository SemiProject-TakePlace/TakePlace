package com.kh.jsp.products.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jsp.products.model.service.ProductService;
import com.kh.jsp.products.model.vo.Product;

/**
 * Servlet implementation class SelectProductList
 */
@WebServlet("/selectProductList.pr")
public class SelectProductList extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectProductList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type = request.getParameter("type");

		ArrayList<Product> list = new ArrayList<>();

		ProductService ps = new ProductService();

		list = ps.selectProductList(type);

		String page = null;

		if(list != null) {
			request.setAttribute("list", list);
			page = "views/products/productsList.jsp";
		} else {
			request.setAttribute("error-msg", "공간 유형 리스트 목록 조회 실패");
			page = "views/common/errorPage.jsp";
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