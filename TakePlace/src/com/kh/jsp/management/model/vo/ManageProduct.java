package com.kh.jsp.management.model.vo;

import java.io.Serializable;

public class ManageProduct implements Serializable{

	private static final long serialVersionUID = 12345L;
	
	private int pno;
	private String mname;
	private String ptype;
	private String pcity;
	private String pname;
	private String pisok;
	
	public ManageProduct() {
		super();
	}

	public ManageProduct(int pno) {
		super();
		this.pno = pno;
	}

	public ManageProduct(int pno, String pisok) {
		super();
		this.pno = pno;
		this.pisok = pisok;
	}

	public ManageProduct(int pno, String mname, String ptype, String pcity, String pname, String pisok) {
		super();
		this.pno = pno;
		this.mname = mname;
		this.ptype = ptype;
		this.pcity = pcity;
		this.pname = pname;
		this.pisok = pisok;
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public String getPtype() {
		return ptype;
	}

	public void setPtype(String ptype) {
		this.ptype = ptype;
	}

	public String getPcity() {
		return pcity;
	}

	public void setPcity(String pcity) {
		this.pcity = pcity;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getPisok() {
		return pisok;
	}

	public void setPisok(String pisok) {
		this.pisok = pisok;
	}
	
}
