package com.kh.jsp.mypage.controller;

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
 * Servlet implementation class SelectMyProductList
 */
@WebServlet("/prdouctList.my")
public class SelectMyProductList extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectMyProductList() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      System.out.println("정상");
      ArrayList<Product> list = new ArrayList<>();
      
      list = new ProductService().selectList();
      
      System.out.println(list);
      
      String page = "";
      
      if(list != null) {
         request.setAttribute("list", list);
         page = "views/mypage/host/products/productsList.jsp";
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