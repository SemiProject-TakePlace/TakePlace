package com.kh.jsp.reservation.model.service;

import static com.kh.jsp.common.JDBCTemplate.*;

import java.sql.Connection;

import com.kh.jsp.reservation.model.dao.ReservationDAO;
import com.kh.jsp.reservation.model.vo.Reservation;


public class ReservationService {
	
	private Connection con;
	private ReservationDAO rDAO = new ReservationDAO();
/*
	public Reservation selectOne(int preqno) {
		
		con = getConnection();
		
		Reservation r = rDAO.selectOne(con, preqno);
		
		if( r != null ) {
			// 조회수 1 증가
			int result = rDAO.updateReadCount(con, preqno);
			
			if(result > 0 ) {
				commit(con);
			} else {
				rollback(con);
			}
		}
		
		
		close(con);
		
		return r;
		
	}
*/
}
