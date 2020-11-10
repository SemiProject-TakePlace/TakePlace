package com.kh.jsp.member.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class AllMember implements Serializable{

	private static final long serialVersionUID = 77777L;
	
	/* 공통 (MANAGER / HOST / GUEST */
	private int mno;			// 회원번호
	private String id;			// 아이디
	private String mname;		// 멤버 이름 (GUEST, MANAGER : 닉네임 / HOST : 회사명)
	private String pwd;			// 비밀번호
	private Date joindate;		// 가입일
	private Date chdate;		// 변경일
	private String mtype;		// 멤버 타입 (MANAGER / HOST / GUEST)
	private String email;		// 이메일
	
	/* HOST 추가 정보 */
	private String bsnum;		// 사업자 번호
	private String bsname;		// 대표명
	private double hrating; 	// 평점
	private String hisok;	    // 호스트 가입 승인여부
	
	
	/* 기본 생성자 */
	public AllMember() {
		super();
	}

	/* 공통 생성자 (MANAGER / HOST / GUEST) */
	public AllMember(int mno, String id, String mname, String pwd, Date joindate, Date chdate, String mtype,
			String email) {
		super();
		this.mno = mno;
		this.id = id;
		this.mname = mname;
		this.pwd = pwd;
		this.joindate = joindate;
		this.chdate = chdate;
		this.mtype = mtype;
		this.email = email;
	}
	
	/* HOST 생성자 */
	
	public AllMember(String bsnum, String bsname, double hrating, String hisok) {
		super();
		this.bsnum = bsnum;
		this.bsname = bsname;
		this.hrating = hrating;
		this.hisok = hisok;
	}
	
	/* MANAGER + HOST + GUEST 생성자 */
	
	public AllMember(int mno, String id, String mname, String pwd, Date joindate, Date chdate, String mtype,
			String email, String bsnum, String bsname, double hrating, String hisok) {
		super();
		this.mno = mno;
		this.id = id;
		this.mname = mname;
		this.pwd = pwd;
		this.joindate = joindate;
		this.chdate = chdate;
		this.mtype = mtype;
		this.email = email;
		this.bsnum = bsnum;
		this.bsname = bsname;
		this.hrating = hrating;
		this.hisok = hisok;
	}
	
	/* GUEST용 회원가입 생성자 */
	
	public AllMember(String id, String mname, String pwd, String mtype, String email) {
		super();
		this.id = id;
		this.mname = mname;
		this.pwd = pwd;
		this.mtype = mtype;
		this.email = email;
	}
	
	/* HOST용 회원가입 생성자 */
	public AllMember(String id, String mname, String pwd, String mtype, String email, String bsnum, String bsname) {
		super();
		this.id = id;
		this.mname = mname;
		this.pwd = pwd;
		this.mtype = mtype;
		this.email = email;
		this.bsnum = bsnum;
		this.bsname = bsname;
	}

	/* */
	public AllMember(String id, Date joindate, String mtype, String email) {
		super();
		this.id = id;
		this.joindate = joindate;
		this.mtype = mtype;
		this.email = email;
	}

	/* 로그인 */
	public AllMember(String id, String pwd) {
		super();
		this.id = id;
		this.pwd = pwd;
	}

	/* */
	public AllMember(String email) {
		super();
		this.email = email;
	}

	
	/* toString() */
	@Override
	public String toString() {
		return "AllMember [mno=" + mno + ", id=" + id + ", mname=" + mname + ", pwd=" + pwd + ", joindate=" + joindate
				+ ", chdate=" + chdate + ", mtype=" + mtype + ", email=" + email + ", bsnum=" + bsnum + ", bsname="
				+ bsname + ", hrating=" + hrating + ", hisok=" + hisok + "]";
	}
	
	/* getter / setter */

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
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
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

	public String getMtype() {
		return mtype;
	}

	public void setMtype(String mtype) {
		this.mtype = mtype;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
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
