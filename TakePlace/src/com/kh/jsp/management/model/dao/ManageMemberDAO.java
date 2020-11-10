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

import com.kh.jsp.management.model.vo.ManageMember;
import com.kh.jsp.products.model.dao.ProductDAO;

public class ManageMemberDAO {
	
	private Properties prop = null;
	

	public ManageMemberDAO() {
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


	public ArrayList<ManageMember> selectMemberList(Connection con, String type) {
		ArrayList<ManageMember> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = null;
		
		switch(type) {
			case "guest" :
				sql = prop.getProperty("selectGuestList");
				break;
			case "host" :
				sql = prop.getProperty("selectHostList");
				break;
		}
		
		try {
			pstmt = con.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				ManageMember mm = new ManageMember();
				
				mm.setMno(rset.getInt("mno"));
				mm.setId(rset.getString("id"));
				mm.setMname(rset.getString("mname"));
				mm.setEmail(rset.getString("email"));
				mm.setJoindate(rset.getDate("joindate"));
				// mm.setChdate(rset.getDate("chdate"));
				// mm.setBsnum(rset.getString("bsnum"));
				// mm.setBsname(rset.getString("bsname"));
				// mm.setHrating(rset.getInt("hrating"));
				// mm.setHisok(rset.getString("hisok"));
				
				list.add(mm);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}


	public ManageMember selectOne(Connection con, String type, int mno) {
		ManageMember mm = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = null;
		
		switch(type) {
			case "guest" :
				sql = prop.getProperty("selectGuestOne");
				break;
			case "host" :
				sql = prop.getProperty("selectHostOne");
				break;
		}
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, mno);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				mm = new ManageMember();
				
				mm.setMtype(rset.getString("mtype"));
				mm.setMno(rset.getInt("mno"));
				mm.setId(rset.getString("id"));
				mm.setMname(rset.getString("mname"));
				mm.setEmail(rset.getString("email"));
				mm.setJoindate(rset.getDate("joindate"));
				mm.setChdate(rset.getDate("chdate"));
				mm.setBsnum(rset.getString("bsnum"));
				mm.setBsname(rset.getString("bsname"));
				mm.setHrating(rset.getInt("hrating"));
				mm.setHisok(rset.getString("hisok"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return mm;
	}

	public int confirmHost(Connection con, ManageMember mm) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("confirmHost");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, mm.getMno());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<ManageMember> searchMember(Connection con, String condition, String keyword) {
		ArrayList<ManageMember> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = null;
		
		switch(condition) {
			case "id":
				sql = prop.getProperty("searchId");
				break;
			case "mname" :
				sql = prop.getProperty("searchMname");
				break;
			case "email" :
				sql = prop.getProperty("searchEmail");
				break;
		}
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, keyword);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				ManageMember mm = new ManageMember();
				
				mm.setMno(rset.getInt("mno"));
				mm.setId(rset.getString("id"));
				mm.setMname(rset.getString("mname"));
				mm.setEmail(rset.getString("email"));
				mm.setJoindate(rset.getDate("joindate"));
				
				list.add(mm);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	
	}

	public ArrayList<ManageMember> searchAll(Connection con, String keyword) {
		ArrayList<ManageMember> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("searchAll");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, keyword);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				ManageMember mm = new ManageMember();
				
				mm.setMno(rset.getInt("mno"));
				mm.setId(rset.getString("id"));
				mm.setMname(rset.getString("mname"));
				mm.setEmail(rset.getString("email"));
				mm.setJoindate(rset.getDate("joindate"));
				
				list.add(mm);
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
