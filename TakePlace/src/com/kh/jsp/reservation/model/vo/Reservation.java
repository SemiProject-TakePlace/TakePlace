package com.kh.jsp.reservation.model.vo;

import java.io.Serializable;

public class Reservation implements Serializable{

   private static final long serialVersionUID = 1002L;
   
   private int preqno;        // 예약 고유 번호
   private int pno;           // 공간 고유 번호
   private String gname;      // 게스트 이름
   private String gtel;       // 게스트 연락처
   private String resDate;    // 예약 날짜시간
   private String gdemand;    // 요구 사항
   private char pisOk;        // 승인 여부
   private char pisPaid;      // 결제 여부
   private char pisCncld;     // 예약 취소 여부
   private int payAmount;     // 총 결제금액
   
   private String pname; 
   private String bsnum;
   private int mno;
   
   public Reservation() {
      super();
   }

   public Reservation(int preqno, int pno, String gname, String gtel, String resDate, String gdemand, char pisOk,
         char pisPaid, char pisCncld, int payAmount, String pname, String bsnum, int mno) {
      super();
      this.preqno = preqno;
      this.pno = pno;
      this.gname = gname;
      this.gtel = gtel;
      this.resDate = resDate;
      this.gdemand = gdemand;
      this.pisOk = pisOk;
      this.pisPaid = pisPaid;
      this.pisCncld = pisCncld;
      this.payAmount = payAmount;
      this.pname = pname;
      this.bsnum = bsnum;
      this.mno = mno;
   }

   public Reservation(int pno, String gname, String gtel, String resDate, String gdemand) {
      super();
      this.pno = pno;
      this.gname = gname;
      this.gtel = gtel;
      this.resDate = resDate;
      this.gdemand = gdemand;
   }

@Override
public String toString() {
	return "Reservation [preqno=" + preqno + ", pno=" + pno + ", gname=" + gname + ", gtel=" + gtel + ", resDate="
			+ resDate + ", gdemand=" + gdemand + ", pisOk=" + pisOk + ", pisPaid=" + pisPaid + ", pisCncld=" + pisCncld
			+ ", payAmount=" + payAmount + ", pname=" + pname + ", bsnum=" + bsnum + ", mno=" + mno + "]";
}


public int getPreqno() {
      return preqno;
   }

   public void setPreqno(int preqno) {
      this.preqno = preqno;
   }

   public int getPno() {
      return pno;
   }

   public void setPno(int pno) {
      this.pno = pno;
   }

   public String getGname() {
      return gname;
   }

   public void setGname(String gname) {
      this.gname = gname;
   }

   public String getGtel() {
      return gtel;
   }

   public void setGtel(String gtel) {
      this.gtel = gtel;
   }

   public String getResDate() {
      return resDate;
   }

   public void setResDate(String resDate) {
      this.resDate = resDate;
   }

   public String getGdemand() {
      return gdemand;
   }

   public void setGdemand(String gdemand) {
      this.gdemand = gdemand;
   }

   public char getPisOk() {
      return pisOk;
   }

   public void setPisOk(char pisOk) {
      this.pisOk = pisOk;
   }

   public char getPisPaid() {
      return pisPaid;
   }

   public void setPisPaid(char pisPaid) {
      this.pisPaid = pisPaid;
   }

   public char getPisCncld() {
      return pisCncld;
   }

   public void setPisCncld(char pisCncld) {
      this.pisCncld = pisCncld;
   }

   public int getPayAmount() {
      return payAmount;
   }

   public void setPayAmount(int payAmount) {
      this.payAmount = payAmount;
   }

   public String getPname() {
      return pname;
   }

   public void setPname(String pname) {
      this.pname = pname;
   }

   public String getBsnum() {
	   return bsnum;
   }

   public void setBsnum(String bsnum) {
	   this.bsnum = bsnum;
   }

   public int getMno() {
	   return mno;
   }

   public void setMno(int mno) {
	   this.mno = mno;
   }
   
   	
   
   

}