package com.kh.jsp.productReview.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class ProductReview implements Serializable{

	private static final long serialVersionUID = 920303L;
	
	private int rno; // 리뷰 번호
	private int pno; // 공간 고유 번호
	private int mno; // 회원 번호
	private String mname; // 회원 닉네임
	private String rcontent; // 후기 내용
	private int refrno; // 참조 후기 번호
	private int rrating; // 평점
	private Date rdate; // 후기 등록 날짜
	private int rlevel; // 후기 레벨
	
	public ProductReview() {
		super();
	}

	public ProductReview(int rno, int pno, int mno, String mname, String rcontent, int refrno, int rrating,
			Date rdate, int rlevel) {
		super();
		this.rno = rno;
		this.pno = pno;
		this.mno = mno;
		this.mname = mname;
		this.rcontent = rcontent;
		this.refrno = refrno;
		this.rrating = rrating;
		this.rdate = rdate;
		this.rlevel = rlevel;
	}
	

	public ProductReview(int pno, int mno, String mname, String rcontent, int refrno, int rrating, int rlevel) {
		super();
		this.pno = pno;
		this.mno = mno;
		this.mname = mname;
		this.rcontent = rcontent;
		this.refrno = refrno;
		this.rrating = rrating;
		this.rlevel = rlevel;
	}

	@Override
	public String toString() {
		return "ProductReview [rno=" + rno + ", pno=" + pno + ", mno=" + mno + ", mname=" + mname + ", rcontent="
				+ rcontent + ", refrno=" + refrno + ", rrating=" + rrating + ", rdate=" + rdate + ", rlevel=" + rlevel
				+ "]";
	}

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public String getRcontent() {
		return rcontent;
	}

	public void setRcontent(String rcontent) {
		this.rcontent = rcontent;
	}

	public int getRefrno() {
		return refrno;
	}

	public void setRefrno(int refrno) {
		this.refrno = refrno;
	}

	public int getRrating() {
		return rrating;
	}

	public void setRrating(int rrating) {
		this.rrating = rrating;
	}

	public Date getRdate() {
		return rdate;
	}

	public void setRdate(Date rdate) {
		this.rdate = rdate;
	}

	public int getRlevel() {
		return rlevel;
	}

	public void setRlevel(int rlevel) {
		this.rlevel = rlevel;
	}

}
