package com.kh.jsp.member.model.dao;

import static com.kh.jsp.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.kh.jsp.member.model.vo.Member;

public class MemberDAO {
	private Properties prop;
	
	public MemberDAO() {
		prop = new Properties();
		
		String filePath = MemberDAO.class
				          .getResource("/config/member-sql.properties")
				          .getPath();
		
		try {
			prop.load(new FileReader(filePath));
			
		} catch (FileNotFoundException e) {

			e.printStackTrace();
		} catch (IOException e) {

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
				result.setmName(rset.getString("mname"));
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

	public int insertMember(Connection con, Member joinMember) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertGuest");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, joinMember.getId());
			pstmt.setString(2, joinMember.getmName());
			pstmt.setString(3, joinMember.getPwd());
			pstmt.setString(4, joinMember.getEmail());
			
			result = pstmt.executeUpdate();
			
			// System.out.println(sql);
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			
			
		} finally {
			
			close(pstmt);
		}
		
		return result;
	
	}


	public Member findId(Connection con, Member m) {
		Member result = null;     
		PreparedStatement pstmt = null; 
		ResultSet rset = null;  
		
		String sql = prop.getProperty("findId");
		
		// 쿼리 확인용
		// System.out.println(sql);
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, m.getEmail());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) { 
				
				result = new Member();
				
				result.setId(m.getId());
				result.setPwd(m.getPwd());
				result.setmName(rset.getString("mname"));
				result.setEmail(rset.getString("email"));
			
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}


	public int insertHost(Connection con, Member m) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertHost");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, m.getId());
			pstmt.setString(2, m.getmName());
			pstmt.setString(3, m.getPwd());
			pstmt.setString(4, m.getEmail());
			
			result = pstmt.executeUpdate();
			
			// System.out.println(sql);
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			
			
		} finally {
			
			close(pstmt);
		}
		
		return result;
	
	}
	
	   public String duplicationId(Connection con, String id) {
		      // TODO Auto-generated method stub
		      String result = null;     
		      PreparedStatement pstmt = null; 
		      ResultSet rset = null;  
		      
		      String sql = prop.getProperty("duplicationId");
		      
		      try {
		         pstmt = con.prepareStatement(sql);
		         
		         pstmt.setString(1,  id);
		         
		         rset = pstmt.executeQuery();
		            
		         if(rset.next()){
		            
		            result = rset.getString(1);
		            
		         }
		         
		         System.out.println("조회 결과 확인 : " + result);

		      } catch (SQLException e) {
		         // TODO Auto-generated catch block
		         e.printStackTrace();
		      } finally{
		         close(rset);
		         close(pstmt);
		      }
		 
		      return result;
		   }

}
