package com.kh.jsp.productReview.model.dao;

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

import com.kh.jsp.productReview.model.vo.ProductReview;

public class ProductReviewDAO {
	
	private Properties prop;
	
	public ProductReviewDAO() {
		prop = new Properties();
		
		String filePath = ProductReviewDAO.class
							.getResource("/config/review-sql.properties")
							.getPath();
		
		try {
			prop.load(new FileReader(filePath));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}
	
	public int insertReview(Connection con, ProductReview review) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertReview");
		
		try {
			pstmt = con.prepareStatement(sql);
		
			pstmt.setInt(1, review.getPno());
			pstmt.setInt(2, review.getMno());
			pstmt.setString(3, review.getRcontent());
			// 첫 댓글은 참조하는 댓글이 없다.
			// 따라서 refrno 가 0으로 온다.
			if(review.getRefrno() > 0 ) {
				pstmt.setInt(4, review.getRefrno());
			} else {
				pstmt.setNull(4, java.sql.Types.NULL);
			}
			pstmt.setInt(5, review.getRrating());
			pstmt.setInt(6, review.getRlevel());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int insertReply(Connection con, ProductReview reply) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertReply");
		
		try {
			pstmt = con.prepareStatement(sql);
		
			pstmt.setInt(1, reply.getPno());
			pstmt.setInt(2, reply.getMno());
			pstmt.setString(3, reply.getRcontent());
			// 첫 댓글은 참조하는 댓글이 없다.
			// 따라서 refrno 가 0으로 온다.
			if(reply.getRefrno() > 0 ) {
				pstmt.setInt(4, reply.getRefrno());
			} else {
				pstmt.setNull(4, java.sql.Types.NULL);
			}
			pstmt.setInt(5, reply.getRlevel());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	

	public ArrayList<ProductReview> selectList(Connection con, int pno) {
		ArrayList<ProductReview> rlist = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pno);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				ProductReview pr = new ProductReview();
				pr.setRno(rset.getInt("rno"));
				pr.setPno(rset.getInt("pno"));
				pr.setMno(rset.getInt("mno"));
				pr.setRcontent(rset.getString("rcontent"));
				pr.setRefrno(rset.getInt("ref_rno"));
				pr.setRrating(rset.getInt("rrating"));
				pr.setRdate(rset.getDate("rdate"));
				pr.setRlevel(rset.getInt("rlevel"));
				pr.setMname(rset.getString("mname"));
				
				rlist.add(pr);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return rlist;
	}

}
