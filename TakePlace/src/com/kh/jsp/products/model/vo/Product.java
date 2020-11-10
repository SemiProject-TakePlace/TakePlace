package com.kh.jsp.products.model.vo;

import java.io.Serializable;
import java.sql.Date;
import java.util.ArrayList;

public class Product implements Serializable {
                    
	private static final long serialVersionUID = 1001L;
	
	private ArrayList<ProductImages> ProductImages;
	
	private int pno;      // 공간 고유 번호
    private String bsNum; // 사업자 번호
    private String ptype; // 공간 유형
    private String pcity; // 도시
    private String pname; // 공간 이름
    private int pprice;   // 공간 가격
    private String pableDate; // 예약 가능 날짜
    private String paddress; // 상세 주소
    private String pguide; // 시설 소개
    private String pwarn;  // 유의 사항
    private char pisOk;   // 승인 여부
    private int prating;  // 공간 평점
    private Date preqDate; // 승인 요청 날짜
    private Date pokDate;  // 승인 날짜
    private char isDelete; // 삭제여부
    private int pbookCnt;  // 예약수
    private String productFile; // 사진
    private int mno; // 회원 번호
    private String mname;
   
    
	public Product() {
		super();
	}


	public Product(int pno, String bsNum, String ptype, String pcity, String pname, int pprice, String pableDate,
			String paddress, String pguide, String pwarn, char pisOk, int prating, Date preqDate, Date pokDate,
			char isDelete, int pbookCnt, String productFile, int mno, String mname) {
		super();
		this.pno = pno;
		this.bsNum = bsNum;
		this.ptype = ptype;
		this.pcity = pcity;
		this.pname = pname;
		this.pprice = pprice;
		this.pableDate = pableDate;
		this.paddress = paddress;
		this.pguide = pguide;
		this.pwarn = pwarn;
		this.pisOk = pisOk;
		this.prating = prating;
		this.preqDate = preqDate;
		this.pokDate = pokDate;
		this.isDelete = isDelete;
		this.pbookCnt = pbookCnt;
		this.productFile = productFile;
		this.mno = mno;
		this.mname = mname;
	}


	@Override
	public String toString() {
		return "Product [pno=" + pno + ", bsNum=" + bsNum + ", ptype=" + ptype + ", pcity=" + pcity + ", pname=" + pname
				+ ", pprice=" + pprice + ", pableDate=" + pableDate + ", paddress=" + paddress + ", pguide=" + pguide
				+ ", pwarn=" + pwarn + ", pisOk=" + pisOk + ", prating=" + prating + ", preqDate=" + preqDate
				+ ", pokDate=" + pokDate + ", isDelete=" + isDelete + ", pbookCnt=" + pbookCnt +
				",productFile=" + productFile + ", mno=" + mno + ", mname=" + mname + "]";
	}


	public ArrayList<ProductImages> getProductImages() {
		return ProductImages;
	}


	public void setProductImages(ArrayList<ProductImages> productImages) {
		ProductImages = productImages;
	}


	public int getPno() {
		return pno;
	}


	public void setPno(int pno) {
		this.pno = pno;
	}


	public String getBsNum() {
		return bsNum;
	}


	public void setBsNum(String bsNum) {
		this.bsNum = bsNum;
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


	public int getPprice() {
		return pprice;
	}


	public void setPprice(int pprice) {
		this.pprice = pprice;
	}


	public String getPableDate() {
		return pableDate;
	}


	public void setPableDate(String pableDate) {
		this.pableDate = pableDate;
	}


	public String getPaddress() {
		return paddress;
	}


	public void setPaddress(String paddress) {
		this.paddress = paddress;
	}


	public String getPguide() {
		return pguide;
	}


	public void setPguide(String pguide) {
		this.pguide = pguide;
	}


	public String getPwarn() {
		return pwarn;
	}


	public void setPwarn(String pwarn) {
		this.pwarn = pwarn;
	}


	public char getPisOk() {
		return pisOk;
	}


	public void setPisOk(char pisOk) {
		this.pisOk = pisOk;
	}


	public int getPrating() {
		return prating;
	}


	public void setPrating(int prating) {
		this.prating = prating;
	}


	public Date getPreqDate() {
		return preqDate;
	}


	public void setPreqDate(Date preqDate) {
		this.preqDate = preqDate;
	}


	public Date getPokDate() {
		return pokDate;
	}


	public void setPokDate(Date pokDate) {
		this.pokDate = pokDate;
	}


	public char getIsDelete() {
		return isDelete;
	}


	public void setIsDelete(char isDelete) {
		this.isDelete = isDelete;
	}


	public int getPbookCnt() {
		return pbookCnt;
	}


	public void setPbookCnt(int pbookCnt) {
		this.pbookCnt = pbookCnt;
	}


	public String getProductFile() {
		return productFile;
	}


	public void setProductFile(String productFile) {
		this.productFile = productFile;
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
	
}