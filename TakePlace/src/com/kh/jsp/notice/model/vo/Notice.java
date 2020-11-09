package com.kh.jsp.notice.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Notice implements Serializable {

	private static final long serialVersionUID = 175L;
	
	// 1. 필드변수
	private int nno;           // 공지 번호
	private String ntitle;   // 공지 제목
	private String nwriter;    // 공지 작성자
	private String ncontent;        // 공지 내용
	private Date credate;        // 작성일 (java.sql.Date 임포트)
	
	public Notice() {
		super();
	}

	public Notice(int nno, String ntitle, String nwriter, String ncontent, Date credate) {
		super();
		this.nno = nno;
		this.ntitle = ntitle;
		this.nwriter = nwriter;
		this.ncontent = ncontent;
		this.credate = credate;
	}

	@Override
	public String toString() {
		return "Notice [nno=" + nno +  ", ntitle=" + ntitle + ", nwriter=" + nwriter + ", ncontent="
				+ ncontent + ", credate=" + credate + "]";
	}

	public int getNno() {
		return nno;
	}

	public void setNno(int nno) {
		this.nno = nno;
	}


	public String getNtitle() {
		return ntitle;
	}

	public void setNtitle(String ntitle) {
		this.ntitle = ntitle;
	}

	public String getNwriter() {
		return nwriter;
	}

	public void setNwriter(String nwriter) {
		this.nwriter = nwriter;
	}

	public String getNcontent() {
		return ncontent;
	}

	public void setNcontent(String ncontent) {
		this.ncontent = ncontent;
	}

	public Date getCredate() {
		return credate;
	}

	public void setCredate(Date credate) {
		this.credate = credate;
	}
	
	
}