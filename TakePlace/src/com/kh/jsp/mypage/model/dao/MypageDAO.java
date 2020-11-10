package com.kh.jsp.mypage.model.dao;

import static com.kh.jsp.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.jsp.common.exception.NoticeException;
import com.kh.jsp.mypage.model.vo.Question;
import com.kh.jsp.payrecord.model.vo.PayRecord;
import com.kh.jsp.reservation.model.vo.Reservation;

public class MypageDAO {
	private Properties prop;

	public MypageDAO() {
		prop = new Properties();
		
		String filePath = MypageDAO.class
								.getResource("/config/mypage-sql.properties")
								.getPath();
		try{
			prop.load(new FileReader(filePath));
			
		} catch (FileNotFoundException e) {
			
			e.printStackTrace();
		
		} catch(IOException e) {
			
			e.printStackTrace();
		
		}
	}
	 
	////////////////////////  문의 내역  //////////////////////////////
	public int getListCount(Connection con, int mno) {
		int result = 0; 
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("listCount");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, mno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}
	
	public ArrayList<Question> selectQList(Connection con, int mno, int currentPage, int limit) {
		ArrayList<Question> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectQList");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			// 1. 마지막 행의 번호
			// 2. 첫 행의 번호
			int startRow = (currentPage - 1) * limit + 1; 
			int endRow = startRow + limit - 1;

			pstmt.setInt(1, mno);
			pstmt.setInt(2, endRow);
			pstmt.setInt(3, startRow);
						
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				Question q = new Question();
				
				q.setmNo(mno);
				q.setInqNo(rset.getInt("inqno"));
				q.setInqType(rset.getString("inqtype"));
				q.setInqTitle(rset.getString("inqtitle"));
				q.setInqContent(rset.getString("inqcontent"));
				q.setInqEmail(rset.getString("inqemail"));
				q.setInqTel(rset.getString("inqtel"));
				q.setInqIsdone(rset.getString("inqisdone"));
				
				list.add(q);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			close(rset);
			close(pstmt);
		}	
		return list;
	}
	
	public int insertInq(Connection con, Question q, int mno) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertInq");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, mno);
			pstmt.setString(2, q.getInqType());
			pstmt.setString(3, q.getInqTitle());
			pstmt.setString(4, q.getInqContent());
			pstmt.setString(5, q.getInqEmail());
			pstmt.setString(6, q.getInqTel());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public Question selectOne(Connection con, int inqNo) {
	      
	      Question m = null;
	      PreparedStatement pstmt = null;
	      ResultSet rset = null;
	      
	      String sql = prop.getProperty("selectOne");
	      
	      try {
	         pstmt = con.prepareStatement(sql);
	         
	         pstmt.setInt(1, inqNo);
	         
	         rset = pstmt.executeQuery();
	         
	         if ( rset.next() ) {
	            m = new Question();
	            
	            m.setInqNo(rset.getInt("inqno"));
	               m.setmNo(rset.getInt("mno"));
	               m.setInqType(rset.getString("inqtype"));
	               m.setInqTitle(rset.getString("inqtitle"));
	               m.setInqContent(rset.getString("inqcontent"));
	               m.setInqEmail(rset.getString("inqemail"));
	               m.setInqTel(rset.getString("inqtel"));
	               m.setInqIsdone(rset.getString("inqisdone"));

	         }
	         
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         close(rset);
	         close(pstmt);
	      }      
	      
	      return m;
	   }
	
	public int deleteQuestion(Connection con, int inqno) throws NoticeException {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteQuestion");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, inqno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			
			throw new NoticeException("[DAO] : " + e.getMessage());
		} finally { 
			
			close(pstmt);
		}
				
		return result;
	}
	
	////////////////////////// 예약내역(게스트) ////////////////////////////////////
	
	
	public ArrayList<Reservation> selectRList(Connection con, ArrayList<Reservation> list) {
		list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectRList");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				Reservation r = new Reservation();
				
				r.setPreqno(rset.getInt("preqno"));
				r.setPno(rset.getInt("pno"));
				r.setGname(rset.getNString("gname"));
				r.setGtel(rset.getNString("gtel"));
				r.setResDate(rset.getNString("resDate"));
				r.setGdemand(rset.getNString("gdemand"));
				r.setPisOk(rset.getString("pisOk").charAt(0));
				r.setPisPaid(rset.getNString("pisPaid").charAt(0));
				r.setPisCncld(rset.getNString("pisCncld").charAt(0));
				r.setPayAmount(rset.getInt("payAmount"));
				
				list.add(r);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			close(rset);
			close(pstmt);
		}	
		return list;
	}

	public ArrayList<PayRecord> selectPList(Connection con, ArrayList<PayRecord> list) {
		list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectPList");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				PayRecord p = new PayRecord();
				
				p.setPayno(rset.getInt("payno"));
				p.setMno(rset.getInt("mno"));
				p.setPreqno(rset.getInt("preqno"));
				p.setPayDate(rset.getDate("paydate"));
				p.setPayMethod(rset.getString("paymethod"));
				p.setPayAmount(rset.getInt("payamount"));
				p.setPayStatus(rset.getNString("paystatus").charAt(0));
				
				list.add(p);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			close(rset);
			close(pstmt);
		}	
		return list;
	}

}


















