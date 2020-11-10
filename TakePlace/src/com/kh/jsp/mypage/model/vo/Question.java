package com.kh.jsp.mypage.model.vo;

import java.io.Serializable;

public class Question implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 980L;
	
	private int inqNo;			// 문의 고유 번호
	private int mNo;			// 회원 번호
	private String inqType;		// 문의 유형
	private String inqTitle;	// 문의 제목
	private String inqContent;	// 문의 내용
	private String inqEmail;	// 문의 이메일
	private String inqTel;		// 문의 연락처
	private String inqIsdone;	// 문의 완료 여부
	
	public Question() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Question(int inqNo, int mNo, String inqType, String inqTitle, String inqContent, String inqEmail,
			String inqTel, String inqIsdone) {
		super();
		this.inqNo = inqNo;
		this.mNo = mNo;
		this.inqType = inqType;
		this.inqTitle = inqTitle;
		this.inqContent = inqContent;
		this.inqEmail = inqEmail;
		this.inqTel = inqTel;
		this.inqIsdone = inqIsdone;
	}
	

	public Question(int mNo, String inqType, String inqTitle, String inqContent, String inqEmail, String inqTel) {
		super();
		this.mNo = mNo;
		this.inqType = inqType;
		this.inqTitle = inqTitle;
		this.inqContent = inqContent;
		this.inqEmail = inqEmail;
		this.inqTel = inqTel;
	}
	
	public Question(String inqType, String inqTitle, String inqContent, String inqEmail, String inqTel) {
		super();
		this.inqType = inqType;
		this.inqTitle = inqTitle;
		this.inqContent = inqContent;
		this.inqEmail = inqEmail;
		this.inqTel = inqTel;
	}

	@Override
	public String toString() {
		return "Question [inqNo=" + inqNo + ", mNo=" + mNo + ", inqType=" + inqType + ", inqTitle=" + inqTitle
				+ ", inqContent=" + inqContent + ", inqEmail=" + inqEmail + ", inqTel=" + inqTel + ", inqIsdone="
				+ inqIsdone + "]";
	}

	public int getInqNo() {
		return inqNo;
	}

	public void setInqNo(int inqNo) {
		this.inqNo = inqNo;
	}

	public int getmNo() {
		return mNo;
	}

	public void setmNo(int mNo) {
		this.mNo = mNo;
	}

	public String getInqType() {
		return inqType;
	}

	public void setInqType(String inqType) {
		this.inqType = inqType;
	}

	public String getInqTitle() {
		return inqTitle;
	}

	public void setInqTitle(String inqTitle) {
		this.inqTitle = inqTitle;
	}

	public String getInqContent() {
		return inqContent;
	}

	public void setInqContent(String inqContent) {
		this.inqContent = inqContent;
	}

	public String getInqEmail() {
		return inqEmail;
	}

	public void setInqEmail(String inqEmail) {
		this.inqEmail = inqEmail;
	}

	public String getInqTel() {
		return inqTel;
	}

	public void setInqTel(String inqTel) {
		this.inqTel = inqTel;
	}

	public String getInqIsdone() {
		return inqIsdone;
	}

	public void setInqIsdone(String inqIsdone) {
		this.inqIsdone = inqIsdone;
	}

}
