package com.kh.jsp.reservation.model.service;

import static com.kh.jsp.common.JDBCTemplate.*;

import java.sql.Connection;

import com.kh.jsp.products.model.vo.Product;
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

	public Product selectOneReservation(int pno) {

		con = getConnection();
		
		Product p = rDAO.selectOneReservation(con, pno);
		
		close(con);
		
		System.out.println(p);
		
		return p;
			
		
	}

	public Reservation selectOneReservationPreq(int preqno) {
		con = getConnection();
		
		Reservation r = rDAO.selectOneReservationPreq(con, preqno);
		
		close(con);
		
		System.out.println(r);
		
		return r;
	}

	public int selectCurrentPreqno(int pno, String mname) {
		con = getConnection();
		
		int result = rDAO.selectCurrentPreqno(con, pno, mname);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}

	

	

	
}
