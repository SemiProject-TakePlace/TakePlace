package com.kh.jsp.productReview.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.jsp.productReview.model.dao.ProductReviewDAO;
import com.kh.jsp.productReview.model.vo.ProductReview;

import static com.kh.jsp.common.JDBCTemplate.*;

public class ProductReviewService {
	
	private Connection con;
	
	private ProductReviewDAO prDAO = new ProductReviewDAO();
	
	public int insertReview(ProductReview review) {
		con = getConnection();
		
		int result = prDAO.insertReview(con, review);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}

	public ArrayList<ProductReview> selectList(int pno) {
		con = getConnection();
		
		ArrayList<ProductReview> rlist = prDAO.selectList(con, pno);
		
		close(con);
		
		return rlist;
	}

}
