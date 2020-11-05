package com.kh.jsp.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jsp.member.model.service.MemberService;
import com.kh.jsp.member.model.vo.Member;

/**
 * Servlet implementation class findId
 */
@WebServlet("/findId.me")
public class findId extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public findId() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = request.getParameter("findId");
		
		Member m = new Member(email);
		
		MemberService ms = new MemberService();

		m = ms.findId(m);
		
		if(m != null) {
			 
			
			 response.sendRedirect("views/member/idFindSuccess.jsp");
			 
		} else {
			
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out= response.getWriter();

			out.print("<script type='text/javascript'>");
            out.print("alert('입력하신 정보와 일치하는 정보가 없습니다.');");
            out.print("location.href='views/member/idPwdFind.jsp'");
            out.print("</script>");
            out.flush();
			
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
