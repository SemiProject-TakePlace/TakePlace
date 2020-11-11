package com.kh.jsp.mypage.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.jsp.common.exception.NoticeException;
import com.kh.jsp.member.controller.mypage;
import com.kh.jsp.mypage.model.dao.MypageDAO;
import com.kh.jsp.mypage.model.vo.Question;
import com.kh.jsp.payrecord.model.vo.PayRecord;
import com.kh.jsp.productReview.model.vo.ProductReview;
import com.kh.jsp.products.model.vo.Product;
import com.kh.jsp.reservation.model.vo.Reservation;

import static com.kh.jsp.common.JDBCTemplate.*;
public class MypageService {
	private MypageDAO mDAO = new MypageDAO();
	private Connection con;
	
	public ArrayList<mypage> selectList() {
		return null;
	}
	
	public int getListCount(int mno) { //총게시글수
		con = getConnection();
		
		int result = mDAO.getListCount(con, mno);
		
		close(con);
		
		return result;
	}

	public ArrayList<Question> selectQList(int mno, int currentPage, int limit) {
		con = getConnection();
		
		ArrayList<Question> list = mDAO.selectQList(con, mno, currentPage, limit);
		
		close(con);
		
		return list;
	}
	
	public int insertInq(Question q, int mno) {
		con = getConnection();
		
		int result = mDAO.insertInq(con, q, mno);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}

	public Question selectOne(int inqNo) {
	      con = getConnection();
	      Question m = mDAO.selectOne(con, inqNo);
	      
	      close(con);
	      
	      return m;
	   }

	
	public int deleteQuestion(int inqno) throws NoticeException {
		con = getConnection();
		
		int result = mDAO.deleteQuestion(con, inqno);
		
		if( result > 0 ) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public ArrayList<Reservation> selectRList(ArrayList<Reservation> list) {
		con = getConnection();
		
		list = mDAO.selectRList(con, list);
		
		close(con);
		
		return list;
	}

	public ArrayList<PayRecord> selectPList(ArrayList<PayRecord> list) {
		con = getConnection();
		
		list = mDAO.selectPList(con, list);
		
		close(con);
		
		return list;
	}

	public ArrayList<ProductReview> selectrReviw(ArrayList<ProductReview> list, ArrayList<Product> plist) {
		con = getConnection();
		
		list = mDAO.selectrReviw(con, list, plist);
		
		close(con);
		
		return list;
	}

	public HashMap<String, Object> selectrReview(ArrayList<ProductReview> list, Product p) {
		con = getConnection();
		
		HashMap<String, Object> hmap = mDAO.selectrReview(con, list, p);
		
		close(con);
		
		return hmap;
	}

	
}

