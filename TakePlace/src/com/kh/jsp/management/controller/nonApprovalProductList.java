package com.kh.jsp.management.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jsp.management.model.service.ManageProductService;
import com.kh.jsp.management.model.vo.ManageProduct;

/**
 * Servlet implementation class ManageProductList
 */
@WebServlet("/nonApprovalProductList.mp")
public class nonApprovalProductList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public nonApprovalProductList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<ManageProduct> nonApprovalList = new ArrayList<>();

		ManageProductService mps = new ManageProductService();
		
		nonApprovalList = mps.selectNonApprovalList();
		
		String page = null;
		
		if(nonApprovalList != null && nonApprovalList.size() > 0) {
			request.setAttribute("list", nonApprovalList);
			page ="views/mypage/manager/products/nonApproval.jsp";
		} else {
			request.setAttribute("error-msg", "공간 비승인 리스트 조회 실패");
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
