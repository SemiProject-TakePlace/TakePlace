package com.kh.jsp.reservation.model.dao;

import static com.kh.jsp.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import com.kh.jsp.common.exception.NoticeException;
import com.kh.jsp.reservation.model.vo.Reservation;

public class ReservationDAO {
	
private Properties prop;
	
	public ReservationDAO() {
		prop = new Properties();
		
		String filePath = ReservationDAO.class
						.getResource("/config/reservation-sql.properties")
						.getPath();
		
		try {
			prop.load(new FileReader(filePath));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}


	public int insertReservation(Connection con, Reservation r) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertReservation");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, r.getPno());
			pstmt.setString(2, r.getGname());
			pstmt.setString(3, r.getGtel());
			//pstmt.setDate(4,r.getResDate());
			pstmt.setString(5, r.getGdemand());
			pstmt.setInt(6, r.getPayAmount());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

}
