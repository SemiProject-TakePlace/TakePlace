package com.kh.jsp.reservation.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Reservation implements Serializable{

	private static final long serialVersionUID = 1002L;
	
	private int preqno;
	private int pno;
	private String gname;
	private String gtel;
	private Date resDate;
	private String gdemand;
	private char pisOk;
	private char pisPaid;
	private char pisCncld;
	private int payAmount;
	
	public Reservation() {
		super();
	}

	public Reservation(int preqno, int pno, String gname, String gtel, Date resDate, String gdemand, char pisOk,
			char pisPaid, char pisCncld, int payAmount) {
		super();
		this.preqno = preqno;
		this.pno = pno;
		this.gname = gname;
		this.gtel = gtel;
		this.resDate = resDate;
		this.gdemand = gdemand;
		this.pisOk = pisOk;
		this.pisPaid = pisPaid;
		this.pisCncld = pisCncld;
		this.payAmount = payAmount;
	}

	@Override
	public String toString() {
		return "Reservation [preqno=" + preqno + ", pno=" + pno + ", gname=" + gname + ", gtel=" + gtel + ", resDate="
				+ resDate + ", gdemand=" + gdemand + ", pisOk=" + pisOk + ", pisPaid=" + pisPaid + ", pisCncld="
				+ pisCncld + ", payAmount=" + payAmount + "]";
	}

	public int getPreqno() {
		return preqno;
	}

	public void setPreqno(int preqno) {
		this.preqno = preqno;
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public String getGname() {
		return gname;
	}

	public void setGname(String gname) {
		this.gname = gname;
	}

	public String getGtel() {
		return gtel;
	}

	public void setGtel(String gtel) {
		this.gtel = gtel;
	}

	public Date getResDate() {
		return resDate;
	}

	public void setResDate(Date resDate) {
		this.resDate = resDate;
	}

	public String getGdemand() {
		return gdemand;
	}

	public void setGdemand(String gdemand) {
		this.gdemand = gdemand;
	}

	public char getPisOk() {
		return pisOk;
	}

	public void setPisOk(char pisOk) {
		this.pisOk = pisOk;
	}

	public char getPisPaid() {
		return pisPaid;
	}

	public void setPisPaid(char pisPaid) {
		this.pisPaid = pisPaid;
	}

	public char getPisCncld() {
		return pisCncld;
	}

	public void setPisCncld(char pisCncld) {
		this.pisCncld = pisCncld;
	}

	public int getPayAmount() {
		return payAmount;
	}

	public void setPayAmount(int payAmount) {
		this.payAmount = payAmount;
	}
	
	
	
	

}
