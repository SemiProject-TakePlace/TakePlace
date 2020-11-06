package com.kh.jsp.products.model.dao;

import static com.kh.jsp.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.kh.jsp.products.model.vo.Product;
import com.kh.jsp.products.model.vo.ProductImages;

public class ProductDAO {
	
	private Properties prop = null;
	
	public ProductDAO() {
		prop = new Properties();
		
		String filePath = ProductDAO.class
						.getResource("/config/product-sql.properties")
						.getPath();
		
		try {
			prop.load(new FileReader(filePath));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

	public int insertProduct(Connection con, Product p) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		System.out.println(p);
		
		String sql = null;
		
		switch(p.getPtype()) {
			case "study" :
				sql = prop.getProperty("insertStudyProduct");
				break;
			case "studio" :
				sql = prop.getProperty("insertStudioProduct");
				break;
			case "seminar" :
				sql = prop.getProperty("insertSeminarProduct");
				break;
			case "party" :
				sql = prop.getProperty("insertPartyProduct");
				break;
			case "office" :
				sql = prop.getProperty("insertOfficeProduct");
				break;
		}
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, p.getBsNum());
			pstmt.setString(2, p.getPcity());
			pstmt.setString(3, p.getPname());
			pstmt.setInt(4, p.getPprice());
			pstmt.setString(5, p.getPableDate());
			pstmt.setString(6, p.getPaddress());
			pstmt.setString(7, p.getPguide());
			pstmt.setString(8, p.getPwarn());
			
			System.out.println(sql);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	

	public int getCurrentPno(Connection con) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("currentPno");
	      
	      try {
	         pstmt = con.prepareStatement(sql);
	         rset = pstmt.executeQuery();
	         
	         if (rset.next()) {
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

	public int insertProductImages(Connection con, ProductImages productImages) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertProductImages");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, productImages.getPno());
			pstmt.setString(2, productImages.getOriginName());
			pstmt.setString(3, productImages.getChangeName());
			pstmt.setString(4, productImages.getImgPath());
			pstmt.setInt(5, productImages.getImgLevel());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

}
