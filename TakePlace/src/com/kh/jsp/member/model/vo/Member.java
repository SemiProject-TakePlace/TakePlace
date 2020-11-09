package com.kh.jsp.member.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Member implements Serializable{

	private static final long serialVersionUID = 1253L;
	
	private int mno;			// 회원번호
	private String id;			// 아이디
	private String mName;		// 멤버 이름 (게스트 : 닉네임, 호스트 : 회사명)
	private String pwd;			// 비밀번호
	private Date joinDate;		// 가입일
	private Date chDate;		// 변경일
	private String mType;		// 멤버 타입 (1: 관리자 2: 호스트 3:게스트)
	private String email;		// 이메일
	
	
	public Member() {
		
	}
	
	public Member(int mno, String id, String mName, String pwd, Date joinDate, Date chDate, String mType, String email) {
		super();
		this.mno = mno;
		this.id = id;
		this.mName = mName;
		this.pwd = pwd;
		this.joinDate = joinDate;
		this.chDate = chDate;
		this.mType = mType;
		this.email = email;
		
	}

	public Member(String id, String mName, String pwd, String mType, String email) {
		super();
		this.id = id;
		this.mName = mName;
		this.pwd = pwd;
		this.mType = mType;
		this.email = email;
	}
	
	
	public Member(String id, Date joinDate, String mType, String email) {
		super();
		this.id = id;
		this.joinDate = joinDate;
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
	
	@Override
	public String toString() {
		return "Member [mno=" + mno + ", id=" + id + ", mName=" + mName + ", pwd=" + pwd + ", joinDate=" + joinDate
				+ ", chDate=" + chDate + ", mType=" + mType + ", email=" + email + "]";
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

	public String getMname() {
		return mName;
	}

	public void setMname(String mName) {
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
		return chDate;
	}

	public void setChdate(Date chdate) {
		this.chDate = chdate;
	}

	public String getMtype() {
		return mType;
	}

	public void setMtype(String mType) {
		this.mType = mType;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	
}	
