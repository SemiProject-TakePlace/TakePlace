package com.kh.jsp.management.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import static com.kh.jsp.common.JDBCTemplate.*;

import com.kh.jsp.management.model.dao.ManageProductDAO;
import com.kh.jsp.management.model.vo.ManageProduct;

public class ManageProductService {
	
	private Connection con;
	private ManageProductDAO mpDAO = new ManageProductDAO();
	
	public ArrayList<ManageProduct> selectNonApprovalList() {
		con = getConnection();
		
		ArrayList<ManageProduct> list = mpDAO.selectNonApprovalList(con);
		
		close(con);
		
		return list;
	}
	
	public ArrayList<ManageProduct> selectApprovalList() {
		con = getConnection();
		
		ArrayList<ManageProduct> list = mpDAO.selectApprovalList(con);
		
		close(con);
		
		return list;
	}


	public int approvalProduct(ManageProduct mp) {
		con = getConnection();
		
		int result = mpDAO.approvalProduct(con, mp);
		
		if(result > 0) { 
			commit(con);
		} else {
			rollback(con);
		} 
		
		close(con);
		
		return result;
	}

	public int nonApprovalProduct(ManageProduct mp) {
		con = getConnection();
		
		int result = 0;
		
		int deleteImages = mpDAO.nonApprovalImages(con, mp);
		
		int deleteProduct = 0;
		
		if(deleteImages > 0) {
			deleteProduct = mpDAO.nonApprovalProduct(con, mp);
			if(deleteProduct > 0) {
				commit(con);
				result = 1;
			} else {
				rollback(con);
			}
		}
	
		close(con);
		
		return result;
	}

	public int getListCount() {
		con = getConnection();
		
		int result = mpDAO.getListCount(con);
		
		close(con);
		
		return result;
	}

}
