package com.kh.jsp.member.model.service;

import static com.kh.jsp.common.JDBCTemplate.*;
import java.sql.Connection;

import com.kh.jsp.common.exception.MemberException;
import com.kh.jsp.member.model.dao.MemberDAO;
import com.kh.jsp.member.model.vo.AllMember;
import com.kh.jsp.member.model.vo.Host;
import com.kh.jsp.member.model.vo.Member;

public class MemberService {
	
	private Connection con;
	private MemberDAO mDAO = new MemberDAO();
	
	public AllMember selectMember(AllMember m) {
		con = getConnection();
		
		AllMember result = mDAO.selectMember(con, m);
		
		close(con);
		
		return result;
	}
	
	public Member findId(Member m) {
		
		con = getConnection();
		
		Member result = mDAO.findId(con, m);
		
		close(con);
		
		return result;
	}

	public String duplicationId(String id) {
	      // TODO Auto-generated method stub
	      con = getConnection();
	      
	      String res = mDAO.duplicationId(con, id);
	      
	      close(con);
	      
	      return res;
	   }
	
	 public String duplicationNick(String userNick) {
		  con = getConnection();
	      
	      String res = mDAO.duplicationNick(con, userNick);
	      
	      close(con);
	      
	      return res;
	   }
	
	 public String duplicationEmail(String email) {
		   con = getConnection();
		      
		   String res = mDAO.duplicationEmail(con, email);
		      
		   close(con);
		      
		  return res;
		}

	public int insertGuest(AllMember joinMember) throws MemberException {
		con = getConnection();
		int result = mDAO.insertGuest(con, joinMember);
		
		if( result > 0 ) { // 회원 가입 성공!
			commit(con);
		} else {           // 회원 가입 실패...
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public int insertHost(AllMember m) {

		con = getConnection();
		
		int result = mDAO.insertHost(con, m);
		
		
		if(result > 0) { // 회원 가입 성공!
			commit(con);
		} else {           // 회원 가입 실패...
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public AllMember selectOneHost(AllMember m) {
		// 호스트 추가 정보를 넣기 위해 mno 조회
		con = getConnection();
		AllMember result = mDAO.selectOneHost(con, m);
		
		close(con);
		
		System.out.println("selectOneHost:" + result);
		
		return result;
	}

	public int insertHostInfo(AllMember m, AllMember hostInfo) {
		con = getConnection();
		int result = mDAO.insertHostInfo(con, m, hostInfo);
		
		if( result > 0 ) { // 회원 가입 성공!
			commit(con);
		} else {           // 회원 가입 실패...
			rollback(con);
		}
		
		close(con);
		
		return result;
		
	}

	public int updateGuest(AllMember m) throws MemberException {
		con = getConnection(); 
		
		int result = mDAO.updateGuest(con, m); 
		
		if(result > 0) { 
			commit(con);
		} else {
			rollback(con);
		} 
		
		close(con);
		
		return result;
		
	}

	public int updateHost(AllMember m) throws MemberException {
		con = getConnection(); 
		
		int result = mDAO.updateHost(con, m); 
		
		if(result > 0) { 
			commit(con);
		} else {
			rollback(con);
		} 
		
		close(con);
		
		return result;
		
	}

	public int deleteGuest(String id) throws MemberException {
        con = getConnection();
		
		int result = mDAO.deleteGuest(con, id);
		
		if( result > 0 ) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;	
	}
	
	public int deleteHost(String id) throws MemberException {
		con = getConnection();
		
		int result = mDAO.deleteHost(con, id);
		
		if( result > 0 ) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

}
	


