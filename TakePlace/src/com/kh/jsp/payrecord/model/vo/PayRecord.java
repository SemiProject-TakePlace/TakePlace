package com.kh.jsp.payrecord.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class PayRecord implements Serializable{

	private static final long serialVersionUID = 1003L;
	
	private int payno;
	private int mno;
	private int preqno;
	private Date payDate;
	private String payMethod;
	private int payAmount;
	private char payStatus;
	
	private String pname;
	private String paddress;
	
	public PayRecord() {
		super();
	}


	public PayRecord(int payno, int mno, int preqno, Date payDate, String payMethod, int payAmount, char payStatus, String gname) {
		super();
		this.payno = payno;
		this.mno = mno;
		this.preqno = preqno;
		this.payDate = payDate;
		this.payMethod = payMethod;
		this.payAmount = payAmount;
		this.payStatus = payStatus;
		this.pname = pname;
		this.paddress = paddress;
	}
	
	


	public PayRecord(int mno, int preqno) {
		super();
		this.mno = mno;
		this.preqno = preqno;
	}


	public PayRecord(int payno, int mno, int preqno) {
		super();
		this.payno = payno;
		this.mno = mno;
		this.preqno = preqno;
	}


	@Override
	public String toString() {
		return "PayRecord [payno=" + payno + ", mno=" + mno + ", preqno=" + preqno + ", payDate=" + payDate
				+ ", payMethod=" + payMethod + ", payAmount=" + payAmount + ", payStatus=" + payStatus + ", pname="
				+ pname + ", paddress=" + paddress + "]";
	}


	public int getPayno() {
		return payno;
	}


	public void setPayno(int payno) {
		this.payno = payno;
	}


	public int getMno() {
		return mno;
	}


	public void setMno(int mno) {
		this.mno = mno;
	}


	public int getPreqno() {
		return preqno;
	}


	public void setPreqno(int preqno) {
		this.preqno = preqno;
	}


	public Date getPayDate() {
		return payDate;
	}


	public void setPayDate(Date payDate) {
		this.payDate = payDate;
	}


	public String getPayMethod() {
		return payMethod;
	}


	public void setPayMethod(String payMethod) {
		this.payMethod = payMethod;
	}


	public int getPayAmount() {
		return payAmount;
	}


	public void setPayAmount(int payAmount) {
		this.payAmount = payAmount;
	}


	public char getPayStatus() {
		return payStatus;
	}


	public void setPayStatus(char payStatus) {
		this.payStatus = payStatus;
	}


	public String getGname() {
		return pname;
	}


	public void setGname(String gname) {
		this.pname = gname;
	}


	public String getPname() {
		return pname;
	}


	public void setPname(String pname) {
		this.pname = pname;
	}


	public String getPaddress() {
		return paddress;
	}


	public void setPaddress(String paddress) {
		this.paddress = paddress;
	}
	

}
