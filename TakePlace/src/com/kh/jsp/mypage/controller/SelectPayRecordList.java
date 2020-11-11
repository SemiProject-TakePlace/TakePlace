package com.kh.jsp.mypage.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jsp.mypage.model.service.MypageService;
import com.kh.jsp.payrecord.model.vo.PayRecord;

/**
 * Servlet implementation class SelectPayRecordList
 */
@WebServlet("/selectPlist.me")
public class SelectPayRecordList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectPayRecordList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<PayRecord> list = new ArrayList<>();
		MypageService ms = new MypageService();
		
		PayRecord p = new PayRecord();
		
		list = ms.selectPList(list);
		
		String page = "";
		
		request.setAttribute("Plist", list);
		page = "views/mypage/guest/pay/payList.jsp";
		
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
