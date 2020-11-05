package com.kh.jsp.products.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Product implements Serializable {
                    
	private static final long serialVersionUID = 1001L;
	
	private int pno;
    private String bsNum;
    private String pType;
    private String pCity;
    private String pName;
    private int pPrice;
    private Date pAbleDate;
    private String pAddress;
    private String pGuide;
    private String pWarn;
    private char pIsOk;
    private int pRating;
    private Date pReqDate;
    private Date pOkDate;
    private char isDelete;
    private int pBookCnt;
   
    
	public Product() {
		super();
	}


	public Product(int pno, String bsNum, String pType, String pCity, String pName, int pPrice, Date pAbleDate,
			String pAddress, String pGuide, String pWarn, char pIsOk, int pRating, Date pReqDate, Date pOkDate,
			char isDelete, int pBookCnt) {
		super();
		this.pno = pno;
		this.bsNum = bsNum;
		this.pType = pType;
		this.pCity = pCity;
		this.pName = pName;
		this.pPrice = pPrice;
		this.pAbleDate = pAbleDate;
		this.pAddress = pAddress;
		this.pGuide = pGuide;
		this.pWarn = pWarn;
		this.pIsOk = pIsOk;
		this.pRating = pRating;
		this.pReqDate = pReqDate;
		this.pOkDate = pOkDate;
		this.isDelete = isDelete;
		this.pBookCnt = pBookCnt;
	}


	@Override
	public String toString() {
		return "Product [pno=" + pno + ", bsNum=" + bsNum + ", pType=" + pType + ", pCity=" + pCity + ", pName=" + pName
				+ ", pPrice=" + pPrice + ", pAbleDate=" + pAbleDate + ", pAddress=" + pAddress + ", pGuide=" + pGuide
				+ ", pWarn=" + pWarn + ", pIsOk=" + pIsOk + ", pRating=" + pRating + ", pReqDate=" + pReqDate
				+ ", pOkDate=" + pOkDate + ", isDelete=" + isDelete + ", pBookCnt=" + pBookCnt + "]";
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


	public String getpType() {
		return pType;
	}


	public void setpType(String pType) {
		this.pType = pType;
	}


	public String getpCity() {
		return pCity;
	}


	public void setpCity(String pCity) {
		this.pCity = pCity;
	}


	public String getpName() {
		return pName;
	}


	public void setpName(String pName) {
		this.pName = pName;
	}


	public int getpPrice() {
		return pPrice;
	}


	public void setpPrice(int pPrice) {
		this.pPrice = pPrice;
	}


	public Date getpAbleDate() {
		return pAbleDate;
	}


	public void setpAbleDate(Date pAbleDate) {
		this.pAbleDate = pAbleDate;
	}


	public String getpAddress() {
		return pAddress;
	}


	public void setpAddress(String pAddress) {
		this.pAddress = pAddress;
	}


	public String getpGuide() {
		return pGuide;
	}


	public void setpGuide(String pGuide) {
		this.pGuide = pGuide;
	}


	public String getpWarn() {
		return pWarn;
	}


	public void setpWarn(String pWarn) {
		this.pWarn = pWarn;
	}


	public char getpIsOk() {
		return pIsOk;
	}


	public void setpIsOk(char pIsOk) {
		this.pIsOk = pIsOk;
	}


	public int getpRating() {
		return pRating;
	}


	public void setpRating(int pRating) {
		this.pRating = pRating;
	}


	public Date getpReqDate() {
		return pReqDate;
	}


	public void setpReqDate(Date pReqDate) {
		this.pReqDate = pReqDate;
	}


	public Date getpOkDate() {
		return pOkDate;
	}


	public void setpOkDate(Date pOkDate) {
		this.pOkDate = pOkDate;
	}


	public char getIsDelete() {
		return isDelete;
	}


	public void setIsDelete(char isDelete) {
		this.isDelete = isDelete;
	}


	public int getpBookCnt() {
		return pBookCnt;
	}


	public void setpBookCnt(int pBookCnt) {
		this.pBookCnt = pBookCnt;
	}
	
	
	
	
	
}


