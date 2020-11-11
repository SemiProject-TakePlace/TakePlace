package com.kh.jsp.payrecord.model.service;

import static com.kh.jsp.common.JDBCTemplate.*;

import java.sql.Connection;

import com.kh.jsp.payrecord.model.dao.PayDAO;
import com.kh.jsp.payrecord.model.vo.PayRecord;
import com.kh.jsp.products.model.vo.Product;
import com.kh.jsp.reservation.model.dao.ReservationDAO;
import com.kh.jsp.reservation.model.vo.Reservation;

public class PayService {
	
	private Connection con;
	private PayDAO pDAO = new PayDAO();

	public Product selectOnePay(int pno) {
		con = getConnection();
		
		Product p = pDAO.selectOnePay(con, pno);
		
		if( p != null ) {
			// 예약 횟수 1 증가
			int result = pDAO.updatePayCount(con, pno);
			
			if(result > 0 ) {
				commit(con);
			} else {
				rollback(con);
			}
		}
		
		close(con);
		
		//System.out.println(p);
		
		return p;
	}
	
//	public Reservation selectOnePayReservation(int preqno) {
//		con = getConnection();
//		
//		Reservation r = pDAO.selectOneReservation(con, preqno);
//		
//		close(con);
//		
//		System.out.println(r);
//		
//		return r;
//	}

	public int insertPay(PayRecord pr) {
		con = getConnection();
		
		int result = pDAO.insertPay(con, pr);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
		
	}

	

}
