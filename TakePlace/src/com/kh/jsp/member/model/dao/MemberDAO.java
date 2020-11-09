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

import com.kh.jsp.common.exception.MemberException;
import com.kh.jsp.member.model.vo.Host;
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
				
				result.setMno(rset.getInt("mno"));
				result.setId(m.getId());
				result.setPwd(m.getPwd());
				result.setMtype(rset.getString("mtype"));
				result.setMname(rset.getString("mname"));
				result.setEmail(rset.getString("email"));
				result.setJoinDate(rset.getDate("joindate"));
				result.setChdate(rset.getDate("chdate"));
			
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
	

	public int insertGuest(Connection con, Member joinMember) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertGuest");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, joinMember.getId());
			pstmt.setString(2, joinMember.getMname());
			pstmt.setString(3, joinMember.getPwd());
			pstmt.setString(4, joinMember.getEmail());
			
			result = pstmt.executeUpdate();
			
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
	      System.out.println(sql);
	      
	      try {
	         pstmt = con.prepareStatement(sql);
	         
	         pstmt.setString(1, m.getEmail());
	      
	         rset = pstmt.executeQuery();
	         
	         if(rset.next()) { 	
	        	 
	            result = new Member();
	            
				result.setId(rset.getString("id"));
				result.setEmail(rset.getString("email"));
				result.setMtype(rset.getString("mtype"));
				result.setJoinDate(rset.getDate("joindate"));
	            
	            System.out.println(result);
	            
	         }
	         
	         
	      } catch (SQLException e) {
	      
	         e.printStackTrace();
	         
	      } finally {
	         close(rset);
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


	public String duplicationNick(Connection con, String userNick) {
		  String result = null;     
	      PreparedStatement pstmt = null; 
	      ResultSet rset = null;  
	      
	      String sql = prop.getProperty("duplicationNick");
	      
	      try {
	         pstmt = con.prepareStatement(sql);
	         
	         pstmt.setString(1, userNick);
	         
	         rset = pstmt.executeQuery();
	            
	         if(rset.next()){
	            
	            result = rset.getString(1);
	            
	         }
	         
	         // System.out.println("조회 결과 확인 : " + result);

	      } catch (SQLException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      } finally{
	         close(rset);
	         close(pstmt);
	      }
	 
	      return result;
	   }


	public String duplicationEmail(Connection con, String email) {
		  String result = null;     
	      PreparedStatement pstmt = null; 
	      ResultSet rset = null;  
	      
	      String sql = prop.getProperty("duplicationEmail");
	      
	      try {
	         pstmt = con.prepareStatement(sql);
	         
	         pstmt.setString(1, email);
	         
	         rset = pstmt.executeQuery();
	            
	         if(rset.next()){
	            
	            result = rset.getString(1);
	            
	         }
	         
	         // System.out.println("조회 결과 확인 : " + result);

	      } catch (SQLException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      } finally{
	         close(rset);
	         close(pstmt);
	      }
	 
	      return result;
	   }

	public int insertMember(Connection con, Member m) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertMember");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, m.getId());
			pstmt.setString(2, m.getMname());
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


	public int insertHost(Connection con, Host h) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertHost");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, h.getBsNum());
			pstmt.setInt(2, h.getMno());
			pstmt.setString(3, h.getBsName());
			
			result = pstmt.executeUpdate();
	
		} catch (SQLException e) {
			
			e.printStackTrace();
			
			
		} finally {
			
			close(pstmt);
		}
		
		return result;
	}


	public Member selectOneHost(Connection con, Member m) {
		Member result = null;     
		PreparedStatement pstmt = null; 
		ResultSet rset = null;  
		
		String sql = prop.getProperty("selectOneHost");
		
		// 쿼리 확인용
		// System.out.println(sql);
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, m.getId());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) { 
				
				result = new Member();
				result.setMno(rset.getInt("mno"));
				result.setId(rset.getString("id"));
				result.setMname(rset.getString("pwd"));
				result.setJoinDate(rset.getDate("joindate"));
				result.setJoinDate(rset.getDate("chdate"));
				result.setMtype(rset.getString("mtype"));
				result.setEmail((rset.getString("email")));
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




	public int insertHost(Connection con, Member m, Host h) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertHost");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, h.getBsNum());
			pstmt.setInt(2, m.getMno());
			pstmt.setString(3, h.getBsName());
			
			result = pstmt.executeUpdate();
			
			System.out.println("호스트 조회 결과 확인 : " + result);
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}


	public Host selectHost(Connection con, Host h, Member m) {
		Host result = null;     
		PreparedStatement pstmt = null; 
		ResultSet rset = null;  
		
		String sql = prop.getProperty("selectHost");
		
		// 쿼리 확인용
		// System.out.println(sql);
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, m.getMno());
//			pstmt.setString(2, h.getPwd());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) { 
				
				result = new Host();
				
				result.setBsNum(rset.getString("bsnum"));
				result.setMno(rset.getInt("mno"));
				result.setMtype(rset.getString("mtype"));
				result.setBsName(rset.getString("bsname"));
				result.setHtating(rset.getDouble("hrating"));
				result.setHisok(rset.getString("hisok"));
				
				System.out.println("select : " + result);
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


	public int updateMember(Connection con, Member m) throws MemberException {
		int result = 0;
		PreparedStatement pstmt = null;
		
		// 닉네임 비번 이메일
		String sql = prop.getProperty("updateGuest");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, m.getMname());
			pstmt.setString(2, m.getPwd());
			pstmt.setString(3, m.getEmail());
			pstmt.setString(4, m.getId());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			throw new MemberException("[DAO] : " + e.getMessage());
			
		} finally {
			
			close(pstmt);
		}
		
		return result;
	}


	public int updateHost(Connection con, Member m) throws MemberException {
		int result = 0;
		PreparedStatement pstmt = null;
		
		// 닉네임 비번 이메일
		String sql = prop.getProperty("updateHost");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, m.getPwd());
			pstmt.setString(2, m.getEmail());
			pstmt.setString(3, m.getId());
			
			result = pstmt.executeUpdate();
			
			System.out.println(result);
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			throw new MemberException("[DAO] : " + e.getMessage());
			
		} finally {
			
			close(pstmt);
		}
		
		return result;
	}


	public int deleteMember(Connection con, String id) throws MemberException {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteMember");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			throw new MemberException("[DAO] : " + e.getMessage());
			
		} finally {
			
			close(pstmt);
		}
				
		return result;
	}


	public int deleteHost(Connection con, String id) throws MemberException {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteHost");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
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
