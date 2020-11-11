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
import com.kh.jsp.mypage.model.vo.PageInfo;

/**
 * Servlet implementation class ApprovalProductList
 */
@WebServlet("/approvalProductList.mp")
public class ApprovalProductList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ApprovalProductList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<ManageProduct> approvalList = new ArrayList<>();
		ManageProductService mps = new ManageProductService();
		
				
		approvalList = mps.selectApprovalList();
		
		String page = null;
		
		if(approvalList != null && approvalList.size() > 0) {
			
			request.setAttribute("list", approvalList);
			page ="views/mypage/manager/products/approval.jsp";
	} else {
			request.setAttribute("error-msg", "공간 리스트 조회 실패");
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
