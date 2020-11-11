package com.kh.jsp.payrecord.model.dao;

import static com.kh.jsp.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.kh.jsp.common.exception.NoticeException;
import com.kh.jsp.payrecord.model.vo.PayRecord;
import com.kh.jsp.products.model.vo.Product;
import com.kh.jsp.reservation.model.dao.ReservationDAO;
import com.kh.jsp.reservation.model.vo.Reservation;

public class PayDAO {
	
	private Properties prop;
	
	public PayDAO() {
		prop = new Properties();
		
		String filePath = ReservationDAO.class
						.getResource("/config/pay-sql.properties")
						.getPath();
		
		try {
			prop.load(new FileReader(filePath));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public Product selectOnePay(Connection con, int pno) {
		Product p = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectOnePay");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, pno);
			
			rset = pstmt.executeQuery();
			
			if (rset.next()) {
				p = new Product();
				
	            p.setPno(rset.getInt("pno"));
	            p.setPname(rset.getString("pname"));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		System.out.println(p);
		
		
		
		return p;
	}

	public int insertPay(Connection con, PayRecord pr) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertPay");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, pr.getMno());
			pstmt.setInt(2, pr.getPreqno());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updatePayCount(Connection con, int pno) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updatePayCount");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, pno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public Reservation selectOneReservation(Connection con, int preqno) {
		Reservation r = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectOnePayReservation");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, preqno);
			
			rset = pstmt.executeQuery();
			
			if (rset.next()) {
				r = new Reservation();
				
	            r.setPno(rset.getInt("preqno"));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		System.out.println(r);
		
		
		
		return r;
	}

}
