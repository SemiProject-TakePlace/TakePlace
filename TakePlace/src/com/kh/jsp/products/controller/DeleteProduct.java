package com.kh.jsp.products.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.jsp.common.MyRenamePolicy;
import com.kh.jsp.products.model.service.ProductService;
import com.kh.jsp.products.model.vo.Product;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class DeleteProduct
 */
@WebServlet("/deleteProduct.pr")
public class DeleteProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int pno = Integer.parseInt(request.getParameter("pno"));
		  
		ProductService ps = new ProductService();
		
		int result = ps.deleteProduct(pno);
		
		if(result > 0) {
			response.sendRedirect("index");
		} else {
			request.setAttribute("exception", new Exception("공간 삭제 오류"));
			request.setAttribute("error-msg", "공간 삭제 오류");
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
