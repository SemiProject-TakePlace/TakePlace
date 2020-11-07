package com.kh.jsp.products.model.service;

import static com.kh.jsp.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.jsp.products.model.dao.ProductDAO;
import com.kh.jsp.products.model.vo.Product;
import com.kh.jsp.products.model.vo.ProductImages;

public class ProductService {
	
	private Connection con;
	private ProductDAO pDAO = new ProductDAO();
	
	public ArrayList<Product> selectList() {
		con = getConnection();
		
		ArrayList<Product> list = pDAO.selectList(con);
		
		close(con);
		
		return list;
	}
	
	public ArrayList<Product> selectProductList(String type) {
		con = getConnection();
		
		ArrayList<Product> list = null;
		
		if(type.length() > 0) {
			list = pDAO.selectProductList(con, type);
		} else {
			list = pDAO.selectList(con);
		}
		
		close(con);
		
		return list;
	}
	
	public ArrayList<Product> searchProduct(String condition, String keyword) {
		con = getConnection();
		
		ArrayList<Product> list = null;
		
		if(condition.length() > 0) {
			list = pDAO.searchProduct(con, condition, keyword);
		} else {
			// list = pDAO.searchAll(con, keyword);
			list = pDAO.selectList(con);
		}
		
		close(con);
		
		return list;
	}

	public int insertProduct(Product p, ArrayList<ProductImages> list) {
		con = getConnection();
		
		int result = 0;
		
		int insertProduct = pDAO.insertProduct(con, p);
		
		if(insertProduct > 0) {
			int pno = pDAO.getCurrentPno(con);
			
			for(int i = 0; i <list.size(); i++) {
				list.get(i).setPno(pno);
			}
		}
		
		int insertImages = 0;
		
		for(int i = 0; i <list.size(); i++) {
			// 첫번째 이미지는 대표 이미지 (imgLevel = 0)
			// 나머지는 서브이미지 (imgLevel = 1)
			list.get(i).setImgLevel(i == 0 ? 0 : 1);
			insertImages = pDAO.insertProductImages(con, list.get(i));
			
			if(insertImages == 0) break;
		}
		
		
		if(insertProduct > 0 && insertImages > 0) {
			commit(con);
			result = 1;
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}


}