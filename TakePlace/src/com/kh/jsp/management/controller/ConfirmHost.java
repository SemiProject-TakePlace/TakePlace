package com.kh.jsp.management.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jsp.common.exception.MemberException;
import com.kh.jsp.management.model.service.ManageMemberService;
import com.kh.jsp.management.model.vo.ManageMember;

/**
 * Servlet implementation class ConfirmHost
 */
@WebServlet("/approvalHost.ml")
public class ConfirmHost extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ConfirmHost() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int mno = Integer.parseInt(request.getParameter("mno"));
		String confirmHost = request.getParameter("confirmHost");
		
		ManageMember mm = new ManageMember(mno, confirmHost);
		
		ManageMemberService mms = new ManageMemberService();
		
		int result = mms.confirmHost(mm);
		
		if(result > 0) {
			response.sendRedirect("selectOne.ml?type=host&mno="+mno);
		} else {
			request.setAttribute("exception", new Exception("호스트 회원가입 승인 에러"));
	        request.setAttribute("error-msg", "호스트 회원 가입 승인 에러");
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
