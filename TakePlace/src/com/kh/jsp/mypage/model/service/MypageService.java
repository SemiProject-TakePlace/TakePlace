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
	
	public int getListCount(int mno) { // 문의내역 총게시글수
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

	public HashMap<String, Object> selectRList(ArrayList<Reservation> list, Product p, int mno) {
		con = getConnection();
		
		HashMap<String, Object> hmap = mDAO.selectRList(con, list, p, mno);
		
		close(con);
		
		
		return hmap;
	}

	public ArrayList<PayRecord> selectPList(ArrayList<PayRecord> list) {
		con = getConnection();
		
		list = mDAO.selectPList(con, list);
		
		close(con);
		
		return list;
	}

	public int pisokChange(int preqno) {
		con = getConnection(); 
		
		int result = mDAO.pisokChange(con, preqno); 
		
		if(result > 0) { 
			commit(con);
		} else {
			rollback(con);
		} 
		
		close(con);
		
		return result;

	}

	public int pisokCancel(int preqno) {
		con = getConnection(); 
		
		int result = mDAO.pisokCancel(con, preqno); 
		
		if(result > 0) { 
			commit(con);
		} else {
			rollback(con);
		} 
		
		close(con);
		
		return result;

	}

	public int ListCountReview(int mno) { // 리뷰게시글 개수세기~!
		con = getConnection();
		
		int result = mDAO.ListCountReview(con, mno);
		
		close(con);
		
		return result;
	}

	public ArrayList<ProductReview> selectReview(int mno, int currentPage, int limit) {
		con = getConnection();
		
		ArrayList<ProductReview> list = mDAO.selectReview(con, mno, currentPage, limit);
		
		close(con);
		
		return list;
	}

	public int deleteROne(int preqno) throws NoticeException {
		con = getConnection();
		int result = mDAO.deleteROne(con, preqno);
	      
	      close(con);
	      
	      return result;
	   }
	
}

