package com.kh.jsp.products.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.jsp.common.MyRenamePolicy;
import com.kh.jsp.member.model.vo.Host;
import com.kh.jsp.products.model.service.ProductService;
import com.kh.jsp.products.model.vo.Product;
import com.kh.jsp.products.model.vo.ProductImages;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class updateProduct
 */
@WebServlet("/updateProduct.pr")
public class UpdateProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Host ho = (Host)session.getAttribute("host");

	      int maxSize = 1024 * 1024 * 10; // 10MB
	
	      if (! ServletFileUpload.isMultipartContent(request)) {  
	    	  request.setAttribute("exception", new Exception("공간 유형 등록 오류"));
	    	  request.setAttribute("error-msg", "멀티파트 전송이 아님");
	    	  request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
	      }
		
		String root = request.getServletContext().getRealPath("/resources/images");
		
		String savePath = root + "/product/" + ho.getMno() + "/";
		
		File folder = new File(savePath);
		if(!folder.exists()) {
			folder.mkdir();
		}
		
	      MultipartRequest mre = new MultipartRequest(request, savePath, maxSize, "UTF-8",
	                           new MyRenamePolicy());
	      
	      int pno = Integer.parseInt(mre.getParameter("pno"));
	      
	      ProductService ps = new ProductService();
	      
	      HashMap<String, Object> hmap = ps.selectOne(pno);
	      
	      ArrayList<String> originNames = new ArrayList<>();
	      ArrayList<String> changeNames = new ArrayList<>();

	      Enumeration<String> files = mre.getFileNames();
	      
	      while (files.hasMoreElements()) {
	    	  
	         String tagName = files.nextElement();
	         
	         originNames.add(mre.getOriginalFileName(tagName));
	         changeNames.add(mre.getFilesystemName(tagName));

	      }
	      
	      
	      Product p = (Product)hmap.get("product");
	      
	      // p.setBsNum(mre.getParameter("bsNum"));
	      // p.setPcity(mre.getParameter("pCity"));
	      // p.setPtype(mre.getParameter("pType"));
	      p.setPname(mre.getParameter("pName"));
	      p.setPprice(Integer.parseInt(mre.getParameter("pPrice")));      
	      p.setPableDate(mre.getParameter("pAbleDate")); 
	      //p.setPaddress(mre.getParameter("pZipCode") + ", " +
	     //		  		mre.getParameter("pAddress1") + ", " +
	    //		  		mre.getParameter("pAddress2"));
	      p.setPguide(mre.getParameter("pGuide"));
	      p.setPwarn(mre.getParameter("pWarn"));

	      ArrayList<ProductImages> list = (ArrayList<ProductImages>)hmap.get("productImages");
	      
	      
	      for(int i = originNames.size() -1; i >= 0; i--) {
	    	  int j = originNames.size() - i - 1;
	    	  
	    	  if(originNames.get(i) != null) {
	    		  new File(savePath + list.get(j).getChangeName()).delete();
	    		  
	    		  list.get(j).setImgPath(savePath);
	    		  list.get(j).setOriginName(originNames.get(i));
	    		  list.get(j).setChangeName(changeNames.get(i));
	    	  }
	      }
	      
	      int result = ps.updateProductImages(p, list);
		
		if(result > 0) {
			response.sendRedirect("index.jsp");
			// 승인 기다려달라는 페이지 만들어서 거기로 보내야함
		} else {
			request.setAttribute("exception", new Exception("사진 추가 에러!"));
	        request.setAttribute("error-msg", "사진 추가에 실패하였습니다. 관리자에게 문의하세요.");
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