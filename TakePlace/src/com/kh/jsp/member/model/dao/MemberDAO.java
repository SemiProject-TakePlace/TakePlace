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
import com.kh.jsp.member.model.vo.AllMember;
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
	
	public AllMember selectMember(Connection con, AllMember m) {
		AllMember result = null;     
		PreparedStatement pstmt = null; 
		ResultSet rset = null;  
		
		String sql = prop.getProperty("selectMember");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, m.getId());
			pstmt.setString(2, m.getPwd());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) { 
				
				result = new AllMember();
				
				result.setMno(rset.getInt("mno"));
				result.setId(m.getId());
				result.setPwd(m.getPwd());
				result.setMtype(rset.getString("mtype"));
				result.setMname(rset.getString("mname"));
				result.setEmail(rset.getString("email"));
				result.setJoindate(rset.getDate("joindate"));
				result.setChdate(rset.getDate("chdate"));
				result.setEmail(rset.getString("email"));
				result.setBsnum(rset.getString("bsnum"));
				result.setBsname(rset.getString("bsname"));
				result.setHrating(rset.getDouble("hrating"));
				result.setHisok(rset.getString("hisok"));
			}
			
			System.out.println("Login 조회 결과 확인 : " + result);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
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
	

	   public Member selectPwd(Connection con, String id, String email) {
	      // 비밀번호 찾기위해 아이디, 이메일 조회
	      Member result = null;
	      Member m = new Member();
	      PreparedStatement pstmt = null; 
	      ResultSet rset = null;  
	      
	      String sql = prop.getProperty("selectPwd");
	      
	      System.out.println("sql : " + sql);
	      
	      try {
	         pstmt = con.prepareStatement(sql);
	         
	         pstmt.setString(1, id);
	         pstmt.setString(2, email);
	         
	         rset = pstmt.executeQuery();
	         
	         rset.next();
	         
	         result = new Member();

	         result.setId(rset.getString("id"));
	         result.setEmail(rset.getString("email"));

	         System.out.println(result.toString());

	         
	      } catch (SQLException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      }  finally {
	         close(rset);
	         close(pstmt);
	      }
	      
	      return result;
	   }

		   public int updatePwd(Connection con, String newPwd, String id) {
		      // TODO Auto-generated method stub
		      int res = 0;
		      PreparedStatement pstmt = null;
		      int rset = 0;
		      
		      String sql = prop.getProperty("updatePwd");
		      
		      System.out.println(sql);
		      
		      try {
		         pstmt = con.prepareStatement(sql);
		         
		         pstmt.setString(1, newPwd);
		         pstmt.setString(2, id);
		         
		         rset = pstmt.executeUpdate();
		         
		         if(rset > 0 ){
		            System.out.println("업데이트 성공");
		            res = rset;
		         } 
		         
		         
		      } catch (SQLException e) {
		         // TODO Auto-generated catch block
		         e.printStackTrace();
		      }

		      return res;
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

	public int insertGuest(Connection con, AllMember joinMember) {
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
			
			System.out.println("Guest 회원가입 결과 확인 : " + result);
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			
			
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int insertHost(Connection con, AllMember m) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertHost");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, m.getId());
			pstmt.setString(2, m.getMname());
			pstmt.setString(3, m.getPwd());
			pstmt.setString(4, m.getEmail());
			
			result = pstmt.executeUpdate();
			
			System.out.println("Host 회원가입 결과 확인 : " + result);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public AllMember selectOneHost(Connection con, AllMember m) {
		AllMember result = null;     
		PreparedStatement pstmt = null; 
		ResultSet rset = null;  
		
		String sql = prop.getProperty("selectOneHost");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, m.getId());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) { 
				
				result = new AllMember();
				
				result.setMno(rset.getInt("mno"));
				result.setId(rset.getString("id"));
				result.setMname(rset.getString("pwd"));
				result.setJoindate(rset.getDate("joindate"));
				result.setJoindate(rset.getDate("chdate"));
				result.setMtype(rset.getString("mtype"));
				result.setEmail(rset.getString("email"));
				// result.setBsnum(rset.getString("bsnum"));
				// result.setBsname(rset.getString("bsname"));
				// result.setHrating(rset.getDouble("hrating"));
				// result.setHisok(rset.getString("hisok"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}

	public int insertHostInfo(Connection con, AllMember m, AllMember hostInfo) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertHostInfo");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, hostInfo.getBsnum());
			pstmt.setInt(2, hostInfo.getMno());
			pstmt.setString(3, hostInfo.getBsname());
			
			result = pstmt.executeUpdate();
	
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateGuest(Connection con, AllMember m) throws MemberException {
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

	public int updateHost(Connection con, AllMember m) throws MemberException {
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
	
	public int deleteGuest(Connection con, String id) throws MemberException {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteGuest");
		
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
	

	public int deleteHostT(Connection con, int mno) throws MemberException {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteHostT");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, mno);
			
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
