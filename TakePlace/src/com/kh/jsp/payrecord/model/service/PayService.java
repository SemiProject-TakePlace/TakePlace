package com.kh.jsp.payrecord.model.service;

import static com.kh.jsp.common.JDBCTemplate.*;

import java.sql.Connection;

import com.kh.jsp.payrecord.model.dao.PayDAO;
import com.kh.jsp.reservation.model.vo.Reservation;

public class PayService {
	
	private Connection con;
	private PayDAO pDAO = new PayDAO();

	public Reservation selectOnePay(int pno, int preqno) {
		con = getConnection();
		
		Reservation r = pDAO.selectOnePay(con, pno, preqno);
		
		if( r != null ) {
			// PRODUCT 테이블 예약 횟수 1 증가
			int result = pDAO.updatePayCount(con, preqno, pno);
			
			// RESERVATION 테이블 결제 여부 변경
			int result2 = pDAO.updateIsPay(con, preqno);
			
			//System.out.println("result = " + result + ", result2 = " + result2);
			
			if(result > 0 || result2 > 0) {
				commit(con);
			} else {
				rollback(con);
			}
		}
		
		close(con);
		
		//System.out.println(p);
		
		return r;
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

	public int insertPay(int mno, int preqno) {
		con = getConnection();
		
		int result = pDAO.insertPay(con, mno, preqno);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
		
	}

	

}
