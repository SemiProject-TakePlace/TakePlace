package com.kh.jsp.reservation.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.util.Properties;

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

	public Reservation selectOne(Connection con, int preqno) {
		
		
		
		return null;
	}

}
