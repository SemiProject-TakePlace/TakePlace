package com.kh.jsp.management.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class ManageMember implements Serializable {

	private static final long serialVersionUID = 1818L;
	
	/* 테이블 정보 */
	private int mno;			// 회원번호
	private String id;			// 아이디
	private String mname;		// 멤버 이름
	private String mtype;		// 멤버 타입 
	private String email;		// 이메일
	
	
	/* GUEST / HOST 디테일 정보 */
	private Date joindate;		// 가입일
	private Date chdate;		// 변경일
	/* HOST 추가 정보 */
	private String bsnum;		// 사업자 번호
	private String bsname;		// 대표명
	private double hrating; 	// 평점
	private String hisok;	    // 호스트 가입 승인여부
	
	
	public ManageMember() {
		super();
	}

	public ManageMember(int mno, String id, String mname, String mtype, String email, Date joindate, Date chdate,
			String bsnum, String bsname, double hrating, String hisok) {
		super();
		this.mno = mno;
		this.id = id;
		this.mname = mname;
		this.mtype = mtype;
		this.email = email;
		this.joindate = joindate;
		this.chdate = chdate;
		this.bsnum = bsnum;
		this.bsname = bsname;
		this.hrating = hrating;
		this.hisok = hisok;
	}

	public ManageMember(int mno, String hisok) {
		super();
		this.mno = mno;
		this.hisok = hisok;
	}

	@Override
	public String toString() {
		return "ManageMember [mno=" + mno + ", id=" + id + ", mname=" + mname + ", email=" + email + ", joindate="
				+ joindate + ", chdate=" + chdate + ", bsnum=" + bsnum + ", bsname=" + bsname + ", hrating=" + hrating
				+ ", hisok=" + hisok + "]";
	}


	public int getMno() {
		return mno;
	}


	public void setMno(int mno) {
		this.mno = mno;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}

	public String getMtype() {
		return mtype;
	}


	public void setMtype(String mtype) {
		this.mtype = mtype;
	}


	public String getMname() {
		return mname;
	}


	public void setMname(String mname) {
		this.mname = mname;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public Date getJoindate() {
		return joindate;
	}


	public void setJoindate(Date joindate) {
		this.joindate = joindate;
	}


	public Date getChdate() {
		return chdate;
	}


	public void setChdate(Date chdate) {
		this.chdate = chdate;
	}


	public String getBsnum() {
		return bsnum;
	}


	public void setBsnum(String bsnum) {
		this.bsnum = bsnum;
	}


	public String getBsname() {
		return bsname;
	}


	public void setBsname(String bsname) {
		this.bsname = bsname;
	}


	public double getHrating() {
		return hrating;
	}


	public void setHrating(double hrating) {
		this.hrating = hrating;
	}


	public String getHisok() {
		return hisok;
	}


	public void setHisok(String hisok) {
		this.hisok = hisok;
	}

}
