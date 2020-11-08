package com.kh.jsp.products.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class ProductImages implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 486486L;
	
	private int pimgno;
	private int pno;
	private String originName;
	private String changeName;
	private String imgPath;
	private int imgLevel;
	private Date uploadDate;
	private String isDelete;
	
	public ProductImages() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ProductImages(String originName, String changeName, String imgPath) {
		super();
		this.originName = originName;
		this.changeName = changeName;
		this.imgPath = imgPath;
	}

	public ProductImages(int pimgno, int pno, String originName, String changeName, String imgPath, int imgLevel,
			Date uploadDate, String isDelete) {
		super();
		this.pimgno = pimgno;
		this.pno = pno;
		this.originName = originName;
		this.changeName = changeName;
		this.imgPath = imgPath;
		this.imgLevel = imgLevel;
		this.uploadDate = uploadDate;
		this.isDelete = isDelete;
	}

	@Override
	public String toString() {
		return "ProductImages [pimgno=" + pimgno + ", pno=" + pno + ", origiNname=" + originName + ", changeName="
				+ changeName + ", imgPath=" + imgPath + ", imgLevle=" + imgLevel + ", uploadDate=" + uploadDate
				+ ", isDelete=" + isDelete + "]";
	}

	public int getPimgno() {
		return pimgno;
	}

	public void setPimgno(int pimgno) {
		this.pimgno = pimgno;
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	public String getImgPath() {
		return imgPath;
	}

	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}

	public int getImgLevel() {
		return imgLevel;
	}

	public void setImgLevel(int imgLevel) {
		this.imgLevel = imgLevel;
	}

	public Date getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}

	public String getIsDelete() {
		return isDelete;
	}

	public void setIsDelete(String isDelete) {
		this.isDelete = isDelete;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}


}
