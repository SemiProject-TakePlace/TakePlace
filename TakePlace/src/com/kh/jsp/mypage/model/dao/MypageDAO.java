package com.kh.jsp.mypage.model.dao;

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

import com.kh.jsp.common.exception.MemberException;
import com.kh.jsp.member.controller.mypage;
import com.kh.jsp.member.model.vo.Member;

public class MypageDAO {
	private Properties prop;

	public MypageDAO() {
		prop = new Properties();
		
		String filePath = MypageDAO.class
								.getResource("/config/member-sql.properties")
								.getPath();
		try{
			prop.load(new FileReader(filePath));
			
		} catch (FileNotFoundException e) {
			
			e.printStackTrace();
		
		} catch(IOException e) {
			
			e.printStackTrace();
		
		}
	}

	public Member selectMember(Connection con, Member m) {
		Member result = null;     
		PreparedStatement pstmt = null; 
		ResultSet rset = null;  
			
		String sql = prop.getProperty("selectMember");
			
		// 쿼리 확인용
		// System.out.println(sql);
			
		try {
			pstmt = con.prepareStatement(sql);
				
			pstmt.setString(1, m.getId());
			pstmt.setString(2, m.getPwd());
				
			rset = pstmt.executeQuery();
				
			if(rset.next()) { 
					
				result = new Member();
					
				result.setId(m.getId());
				result.setPwd(m.getPwd());
				result.setMname(rset.getString("mname"));
				result.setEmail(rset.getString("email"));
				
			}
				
			System.out.println("조회 결과 확인 : " + result);
				
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
				
		} finally {
			close(rset);
			close(pstmt);
		}
			
		return result;
	}

	public int updateMember(Connection con, Member m) throws MemberException {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateHost");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString( 1, m.getPwd());
			pstmt.setString( 2, m.getEmail());
			pstmt.setString( 3, m.getId());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			throw new MemberException("[DAO] : " + e.getMessage());
			
		} finally {
			
			close(pstmt);
			
		}
		
		return result;
	
	}

	public int deleteMember(Connection con, String userId) throws MemberException {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteMember");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			throw new MemberException("[DAO] : " + e.getMessage());
			
		} finally {
			
			close(pstmt);
		}
				
		return result;
	}

	
}





































