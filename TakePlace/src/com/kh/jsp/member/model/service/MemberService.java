package com.kh.jsp.member.model.service;

import static com.kh.jsp.common.JDBCTemplate.*;
import java.sql.Connection;

import com.kh.jsp.common.exception.MemberException;
import com.kh.jsp.member.model.dao.MemberDAO;
import com.kh.jsp.member.model.vo.Member;

public class MemberService {
	
	private Connection con;
	private MemberDAO mDAO = new MemberDAO();
	

	public Member selectMember(Member m) {
		con = getConnection();
		
		Member result = mDAO.selectMember(con, m);
		
		close(con);
		
		return result;
	}
	
	public int insertMember(Member joinMember) throws MemberException {
		
		con = getConnection();
		int result = mDAO.insertMember(con, joinMember);
		
		if( result > 0 ) { // 회원 가입 성공!
			commit(con);
		} else {           // 회원 가입 실패...
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public Member findId(Member m) {
		
		con = getConnection();
		
		Member result = mDAO.findId(con, m);
		
		close(con);
		
		return result;
	}

	public int insertHost(Member m) throws MemberException {
		con = getConnection();
		int result = mDAO.insertHost(con, m);
		
		if( result > 0 ) { // 회원 가입 성공!
			commit(con);
		} else {           // 회원 가입 실패...
			rollback(con);
		}
		
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

}
