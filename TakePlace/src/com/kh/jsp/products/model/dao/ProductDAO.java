package com.kh.jsp.products.model.dao;

import static com.kh.jsp.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
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
	
	public ArrayList<Product> selectList(Connection con) {
		ArrayList<Product> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null; 
		
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = con.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Product p = new Product();
				
				p.setMno(rset.getInt("mno"));
				p.setPno(rset.getInt("pno"));
				p.setProductFile(rset.getString("changename"));
				p.setPtype(rset.getString("ptype"));
				p.setPcity(rset.getString("pcity"));
				p.setPname(rset.getString("pname"));
				p.setPprice(rset.getInt("pprice"));
				p.setPrating(rset.getInt("prating"));
				
				list.add(p);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	public ArrayList<Product> selectProductList(Connection con, String type) {
		ArrayList<Product> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = null;

		
		switch(type) {
			case "all":
				sql = prop.getProperty("selectList");
				break;
			case "study":
				sql = prop.getProperty("selectStudyList");
				break;
			case "studio":
				sql = prop.getProperty("selectStudioList");
				break;
			case "seminar":
				sql = prop.getProperty("selectSeminarList");
				break;
			case "party":
				sql = prop.getProperty("selectPartyList");
				break;
			case "office":
				sql = prop.getProperty("selectOfficeList");
				break;
		}
		
		try {
			pstmt = con.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Product p = new Product();
				
				p.setMno(rset.getInt("mno"));
				p.setPno(rset.getInt("pno"));
				p.setProductFile(rset.getString("changename"));
				p.setPtype(rset.getString("ptype"));
				p.setPcity(rset.getString("pcity"));
				p.setPname(rset.getString("pname"));
				p.setPprice(rset.getInt("pprice"));
				p.setPrating(rset.getInt("prating"));
				
				list.add(p);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
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

	public ArrayList<Product> searchProduct(Connection con, String condition, String keyword) {
		ArrayList<Product> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = null;
		
		switch(condition) {
			case "pname" :
				sql = prop.getProperty("searchPname");
				break;
			case "mname" :
				sql = prop.getProperty("searchMname");
				break;
			case "pcity" :
				sql = prop.getProperty("searchPcity");
				break;
		}
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, keyword);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Product p = new Product();
				
				p.setMno(rset.getInt("mno"));
				p.setPno(rset.getInt("pno"));
				p.setProductFile(rset.getString("changename"));
				p.setPtype(rset.getString("ptype"));
				p.setPcity(rset.getString("pcity"));
				p.setPname(rset.getString("pname"));
				p.setPprice(rset.getInt("pprice"));
				p.setPrating(rset.getInt("prating"));
				
				list.add(p);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public HashMap<String, Object> selectOne(Connection con, int pno) {
		HashMap<String, Object> hmap = new HashMap<>();
		ArrayList<ProductImages> list = new ArrayList<>();
		Product p = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectOne");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pno);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				p = new Product();
				p.setPno(pno);
				p.setBsNum(rset.getString("bsnum"));
				p.setMno(rset.getInt("mno"));
				p.setPtype(rset.getString("ptype"));
				p.setPname(rset.getString("pname"));
				p.setPcity(rset.getString("pcity"));
				p.setPrating(rset.getInt("prating"));
				p.setMname(rset.getString("mname"));
				p.setPprice(rset.getInt("pprice"));
				p.setPableDate(rset.getString("pabledate"));
				p.setPaddress(rset.getString("paddress"));
				p.setPguide(rset.getString("pguide"));
				p.setPwarn(rset.getString("pwarn"));
				
				ProductImages pi = new ProductImages();
				
				pi.setPimgno(rset.getInt("pimgno"));
				pi.setPno(pno);
				pi.setOriginName(rset.getString("originname"));
				pi.setChangeName(rset.getString("changename"));
				pi.setImgPath(rset.getString("imgpath"));
				pi.setUploadDate(rset.getDate("uploaddate"));
				pi.setImgLevel(rset.getInt("imglevel"));
				
				list.add(pi);

			}
			
			hmap.put("product", p);
			hmap.put("productImages", list);
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return hmap;
	}

	public ArrayList<Product> productsTop(Connection con) {
		ArrayList<Product> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("productsTop");
		
		try {
			pstmt = con.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Product p = new Product();
				
				p.setMno(rset.getInt("mno"));
				p.setPno(rset.getInt("pno"));
				p.setProductFile(rset.getString("changename"));
				p.setPtype(rset.getString("ptype"));
				p.setPcity(rset.getString("pcity"));
				p.setPname(rset.getString("pname"));
				p.setPprice(rset.getInt("pprice"));
				p.setPrating(rset.getInt("prating"));
				
				list.add(p);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public int updateProduct(Connection con, Product p) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateProduct");

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, p.getPname());
			pstmt.setInt(2, p.getPprice());
			pstmt.setString(3, p.getPableDate());
			pstmt.setString(4, p.getPguide());
			pstmt.setString(5, p.getPwarn());
			pstmt.setInt(6, p.getPno());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int updateProductImages(Connection con, ProductImages productImages) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateProductImages");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,  productImages.getOriginName());
			pstmt.setString(2, productImages.getChangeName());
			pstmt.setInt(3, productImages.getPimgno());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	
	}

	public ArrayList<Product> selectRecent8(Connection con) {
		ArrayList<Product> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null; 
		
		String sql = prop.getProperty("selectRecent8");
		
		try {
			pstmt = con.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Product p = new Product();
				
				p.setMno(rset.getInt("mno"));
				p.setPno(rset.getInt("pno"));
				p.setProductFile(rset.getString("changename"));
				p.setPtype(rset.getString("ptype"));
				p.setPcity(rset.getString("pcity"));
				p.setPname(rset.getString("pname"));
				p.setPprice(rset.getInt("pprice"));
				p.setPrating(rset.getInt("prating"));
				
				list.add(p);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

}