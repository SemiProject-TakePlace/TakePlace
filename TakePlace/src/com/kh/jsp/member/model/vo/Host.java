package com.kh.jsp.member.model.vo;

import java.sql.Date;

public class Host extends Member {

	/**
	 * 
	 */
	private static final long serialVersionUID = 828L;
	
	private String bsNum;		// 사업자 번호
	private String bsName;		// 대표명
	private double hRating; 	// 평점
	private String hisok;	    // 호스트 가입 승인여부
	
	public Host() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Host(int mno, String id, String mName, String pwd, Date joinDate, Date chdate, String mType, String email) {
		super(mno, id, mName, pwd, joinDate, chdate, mType, email);
		// TODO Auto-generated constructor stub
	}
	
	public Host(String bsNum, String bsName) {
		super();
		this.bsNum = bsNum;
		this.bsName = bsName;
	}
	
	@Override
	public String toString() {
		return "Host [bsNum=" + bsNum + ", bsName=" + bsName + ", hRating=" + hRating + ", hisok=" + hisok + "]";
	}
	
	public String getBsNum() {
		return bsNum;
	}
	public void setBsNum(String bsNum) {
		this.bsNum = bsNum;
	}
	public String getBsName() {
		return bsName;
	}
	public void setBsName(String bsName) {
		this.bsName = bsName;
	}
	public double gethRating() {
		return hRating;
	}
	public void sethRating(double hRating) {
		this.hRating = hRating;
	}
	public String getHisok() {
		return hisok;
	}
	public void setHisok(String hisok) {
		this.hisok = hisok;
	}
		

}
