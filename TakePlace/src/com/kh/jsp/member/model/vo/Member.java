package com.kh.jsp.member.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Member implements Serializable{

	private static final long serialVersionUID = 123L;
	
	private int mno;			// 회원번호
	private String id;			// 아이디
	private String mName;		// 멤버 이름 (게스트 : 닉네임, 호스트 : 회사명)
	private String pwd;			// 비밀번호
	private Date joinDate;		// 가입일
	private Date chdate;		// 변경일
	private String mType;		// 멤버 타입 (1: 관리자 2: 호스트 3:게스트)
	private String email;		// 이메일
	
	private String bsNum;		// 사업자 번호
	private String bsName;		// 대표명
	private double hRating; 	// 평점
	
	public Member() {
		
	}
	
	public Member(int mno, String id, String mName, String pwd, Date joinDate, Date chdate, String mType, String email,
			String bsNum, String bsName, double hRating) {
		super();
		this.mno = mno;
		this.id = id;
		this.mName = mName;
		this.pwd = pwd;
		this.joinDate = joinDate;
		this.chdate = chdate;
		this.mType = mType;
		this.email = email;
		this.bsNum = bsNum;
		this.bsName = bsName;
		this.hRating = hRating;
	}

	public Member(String id, String mName, String pwd, String mType, String email) {
		super();
		this.id = id;
		this.mName = mName;
		this.pwd = pwd;
		this.mType = mType;
		this.email = email;
	}
	
	public Member(String id, String pwd) {
		super();
		this.id = id;
		this.pwd = pwd;
	}

	public Member(String email) {
		super();
		this.email = email;
	}

	public Member(String id, String mName, String pwd, String mType, String email, String bsNum, String bsName) {
		super();
		this.id = id;
		this.mName = mName;
		this.pwd = pwd;
		this.mType = mType;
		this.email = email;
		this.bsNum = bsNum;
		this.bsName = bsName;
	}

	@Override
	public String toString() {
		return "Member [mno=" + mno + ", id=" + id + ", mName=" + mName + ", pwd=" + pwd + ", joinDate=" + joinDate
				+ ", chdate=" + chdate + ", mType=" + mType + ", email=" + email + ", bsNum=" + bsNum + ", bsName="
				+ bsName + ", hRating=" + hRating + "]";
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

	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public Date getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}

	public Date getChdate() {
		return chdate;
	}

	public void setChdate(Date chdate) {
		this.chdate = chdate;
	}

	public String getmType() {
		return mType;
	}

	public void setmType(String mType) {
		this.mType = mType;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
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

	
	


}	
