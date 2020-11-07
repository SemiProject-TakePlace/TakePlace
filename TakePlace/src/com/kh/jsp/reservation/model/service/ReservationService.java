package com.kh.jsp.reservation.model.service;

import static com.kh.jsp.common.JDBCTemplate.*;

import java.sql.Connection;

import com.kh.jsp.reservation.model.dao.ReservationDAO;
import com.kh.jsp.reservation.model.vo.Reservation;


public class ReservationService {
	
	private Connection con;
	private ReservationDAO rDAO = new ReservationDAO();

	public int insertReservation(Reservation r) {
		
		con = getConnection();
		
		int result = rDAO.insertReservation(con, r);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
		
	}
}
