package com.kh.jsp.management.model.dao;

import static com.kh.jsp.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.jsp.management.model.vo.ManageProduct;
import com.kh.jsp.products.model.dao.ProductDAO;

public class ManageProductDAO {
	
	private Properties prop = null;

	public ManageProductDAO() {
		prop = new Properties();
		
		String filePath = ProductDAO.class
						.getResource("/config/manager-sql.properties")
						.getPath();
		
		try {
			prop.load(new FileReader(filePath));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<ManageProduct> selectNonApprovalList(Connection con) {
		ArrayList<ManageProduct> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectNonApprovalList");
		
		try {
			pstmt = con.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				ManageProduct mp = new ManageProduct();
				
				mp.setPno(rset.getInt("pno"));
				mp.setMname(rset.getString("mname"));
				mp.setPtype(rset.getString("ptype"));
				mp.setPcity(rset.getString("pcity"));
				mp.setPname(rset.getString("pname"));
				
				list.add(mp);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public ArrayList<ManageProduct> selectApprovalList(Connection con) {
		ArrayList<ManageProduct> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectApprovalList");
		
		try {
			pstmt = con.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				ManageProduct mp = new ManageProduct();
				
				mp.setPno(rset.getInt("pno"));
				mp.setMname(rset.getString("mname"));
				mp.setPtype(rset.getString("ptype"));
				mp.setPcity(rset.getString("pcity"));
				mp.setPname(rset.getString("pname"));
				
				list.add(mp);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public int approvalProduct(Connection con, ManageProduct mp) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("approvalProduct");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, mp.getPno());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int nonApprovalImages(Connection con, ManageProduct mp) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("nonApprovalImages");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, mp.getPno());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int nonApprovalProduct(Connection con, ManageProduct mp) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("nonApprovalProduct");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, mp.getPno());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int getListCount(Connection con) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("approvalListCount");
		
		try {
			pstmt = con.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}

}
